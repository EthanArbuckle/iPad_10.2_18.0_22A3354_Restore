@implementation Localizations

+ (id)stringWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](AMSBag, "sharedBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringWithKey:bag:", v4, v5));

  return v6;
}

+ (id)stringWithKey:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "countryCode"));
  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueWithError:", &v27));
  v10 = v27;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v11)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OSLogObject"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2114;
      v31 = v10;
      v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive country code bag key. Error: %{public}@", buf, 0x16u);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localeIdentifier"));
  v26 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueWithError:", &v26));
  v17 = v26;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v18)
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "OSLogObject"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2114;
      v31 = v17;
      v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive language bag key. Error: %{public}@", buf, 0x16u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localeIdentifier"));

    v16 = (void *)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringWithKey:countryCode:localeIdentifier:", v6, v9, v16));

  return v24;
}

+ (id)stringWithKey:(id)a3 countryCode:(id)a4 localeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v20;
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("_ROW")));
  v12 = objc_msgSend(a1, "_useROWKeyForCountryCode:", v10);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringWithKey:localeIdentifier:", v11, v9));
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      if (!objc_msgSend(v13, "isEqualToString:", v11))
      {
LABEL_7:
        if (!objc_msgSend(v15, "isEqualToString:", v8))
          goto LABEL_13;
        goto LABEL_8;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringWithKey:localeIdentifier:", v8, v9));

  if (v15)
    goto LABEL_7;
LABEL_8:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  if (!v16)
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v20 = 138543362;
    v21 = (id)objc_opt_class(a1);
    v18 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive localized string", (uint8_t *)&v20, 0xCu);

  }
LABEL_13:

  return v15;
}

+ (id)_countryCodes
{
  if (qword_10001BC18 != -1)
    dispatch_once(&qword_10001BC18, &stru_1000146B8);
  return (id)qword_10001BC20;
}

+ (id)_stringWithKey:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  int v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(APRequestHandler));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizations"));
  v25 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v10, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  if (!v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v19)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "OSLogObject"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class(a1);
      v21 = v24;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retreive language from bundle", (uint8_t *)&v23, 0xCu);

    }
    v20 = 0;
    goto LABEL_14;
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:localization:", v6, 0, CFSTR("Localizable"), v13));
  v15 = v14;
  if (!v14 || -[NSObject isEqualToString:](v14, "isEqualToString:", v6))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v16)
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class(a1);
      v18 = v24;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find localized string in bundle.", (uint8_t *)&v23, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v6, &stru_1000150A0, CFSTR("Localizable")));
LABEL_14:

    v15 = v20;
  }

  return v15;
}

+ (BOOL)_useROWKeyForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_countryCodes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uppercaseString"));

    v7 = objc_msgSend(v5, "containsObject:", v6) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

@end
