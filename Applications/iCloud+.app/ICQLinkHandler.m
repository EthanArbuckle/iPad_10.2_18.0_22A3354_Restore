@implementation ICQLinkHandler

+ (id)urlFromUserActivity:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v5 = objc_msgSend(v4, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if ((v5 & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webpageURL"));
    v10 = v8;
    if (v8)
    {
      v10 = v8;
      v11 = v10;
    }
    else
    {
      v13 = _ICQGetLogSystem(0, v9);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No url found exiting", v16, 2u);
      }

      v11 = 0;
    }
  }
  else
  {
    v12 = _ICQGetLogSystem(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "url activity of type NSUserActivityTypeBrowsingWeb exiting", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (int64_t)resultFromURL:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v6 = objc_msgSend(a1, "resultFromURL:store:", v4, v5);

  return (int64_t)v6;
}

+ (int64_t)resultFromURL:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  int v34;
  NSObject *v35;

  v5 = a3;
  v6 = a4;
  v8 = v6;
  if (v5)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v5, 1);
    v11 = v9;
    if (!v9)
    {
      v26 = _ICQGetLogSystem(0, v10);
      v12 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "missing urlComponents", (uint8_t *)&v34, 2u);
      }
      goto LABEL_19;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[NSObject queryItems](v9, "queryItems"));
    v14 = _ICQGetLogSystem(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 138412290;
      v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "queryItems = %@", (uint8_t *)&v34, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v12, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("context")) & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject host](v11, "host"));
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("icq.icloud.com")) & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject scheme](v11, "scheme"));
        if (objc_msgSend(v19, "caseInsensitiveCompare:", CFSTR("icq")))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject host](v11, "host"));
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("launch"));

          if ((v21 & 1) != 0)
          {
LABEL_24:
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v12, "firstObject"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "value"));
            v32 = objc_msgSend(v31, "isEqualToString:", ICQActionParameterSkipCFUKey);

            if ((v32 & 1) != 0)
            {
              v25 = 3;
            }
            else
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_primaryAppleAccount"));

              if (v33)
                v25 = 1;
              else
                v25 = 2;
            }
            goto LABEL_20;
          }
          goto LABEL_16;
        }

      }
      goto LABEL_24;
    }

LABEL_16:
    v27 = _ICQGetLogSystem(v22, v23);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "url format not valid exiting", (uint8_t *)&v34, 2u);
    }

LABEL_19:
    v25 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v24 = _ICQGetLogSystem(v6, v7);
  v11 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "missing url", (uint8_t *)&v34, 2u);
  }
  v25 = 0;
LABEL_21:

  return v25;
}

@end
