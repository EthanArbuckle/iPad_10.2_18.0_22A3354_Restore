@implementation TouchIdViewModel

- (id)alertActionsFromOptions:(id)a3 event:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSBundle *v26;
  void *v27;
  int v29;
  TouchIdViewModel *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  _BOOL4 v36;

  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10007E3F0));
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "BOOLValue");
  else
    v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10007E408));
  v12 = objc_msgSend(v11, "BOOLValue");
  v13 = v12 ^ 1 | v10;
  if (objc_msgSend(v11, "intValue") == 2 || (v16 = a4 == 1, (v13 & 1) == 0))
    v16 = 1;
  v17 = LALogForCategory(1024, v14, v15);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138544130;
    v30 = self;
    v31 = 1024;
    v32 = v13;
    v33 = 1024;
    v34 = v12;
    v35 = 1024;
    v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ buttons - cancel:%d, fallback:%d, show fallback immediately:%d", (uint8_t *)&v29, 0x1Eu);
  }

  if ((v12 & v16) == 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdViewModel fallbackActionFromOptions:](self, "fallbackActionFromOptions:", v6));
    if (objc_msgSend(v19, "length"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, &off_10007E420);

      if ((v13 & 1) == 0)
        goto LABEL_23;
    }
    else
    {

    }
  }
  else if (!v13)
  {
    goto LABEL_23;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", &off_10007E438));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v20, 32));

  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v23));

    if (v24)
    {
      v25 = v24;
      if (objc_msgSend(v24, "length"))
        goto LABEL_22;
    }
  }
  else
  {
    v24 = 0;
  }
  v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v22));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10007CCD0, CFSTR("MobileUI")));

LABEL_22:
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, &off_10007E450);

LABEL_23:
  return v7;
}

- (id)fallbackActionFromOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSBundle *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", &off_10007E468));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v4, 32));

  if (!v5
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7)), v5, v7, !v8))
  {
    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Enter Passcode")))
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSCODE_ONLY"), &stru_10007CCD0, CFSTR("MobileUI")));

    v8 = (void *)v12;
LABEL_6:

  }
  return v8;
}

- (id)alertTintFromOptions:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v37;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", &off_10007E480));
  if (v4)
  {
    v5 = objc_opt_class(NSData, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v8 = v4;
      if (-[NSObject length](v8, "length"))
      {
        v37 = 0;
        v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(UIColor, v9), v8, &v37);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        v15 = v37;
        if (v12)
        {
          v16 = v12;
        }
        else
        {
          v34 = LALogForCategory(1024, v13, v14);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            sub_1000562B0((uint64_t)v15, v35);

        }
        v17 = v12;
      }
      else
      {
        v26 = LALogForCategory(1024, v9, v10);
        v12 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_10005627C(v12, v27, v28, v29, v30, v31, v32, v33);
        v17 = 0;
      }

    }
    else
    {
      v18 = LALogForCategory(1024, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100056324(v8, v19, v20, v21, v22, v23, v24, v25);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
