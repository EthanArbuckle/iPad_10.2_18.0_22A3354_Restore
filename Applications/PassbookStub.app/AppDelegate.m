@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t Object;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsSourceApplicationKey));

  Object = PKLogFacilityTypeGetObject(0);
  v12 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    v30 = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Source Application '%@' sent URL '%@'", (uint8_t *)&v30, 0x16u);

  }
  v14 = (void *)PKLegacyWalletURLScheme;
  v15 = v9;
  v16 = v14;
  if (v15 == v16)
    goto LABEL_14;
  v17 = v16;
  if (v15 && v16)
  {
    v18 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v18 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  v19 = (void *)PKWalletURLScheme;
  v20 = v15;
  v21 = v19;
  if (v20 == v21)
  {
LABEL_14:

LABEL_15:
    if ((PKIsPad() & 1) != 0 || PKIsVision())
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate _componentsForURL:](self, "_componentsForURL:", v7));
      -[AppDelegate _handleURLWithHost:components:path:query:supportedHosts:](self, "_handleURLWithHost:components:path:query:supportedHosts:", v20, v26, v24, v25, 0);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName")));
        v30 = 138412290;
        v31 = v28;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ present on unexpected platform. Please file a radar!", (uint8_t *)&v30, 0xCu);

      }
      v20 = v12;
    }
    goto LABEL_22;
  }
  v22 = v21;
  if (v15 && v21)
  {
    v23 = -[NSObject isEqualToString:](v20, "isEqualToString:", v21);

    if ((v23 & 1) == 0)
      goto LABEL_23;
    goto LABEL_15;
  }

LABEL_22:
LABEL_23:

  return 0;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v8 = objc_msgSend(v7, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v8 && ((PKIsPhone() & 1) != 0 || (PKIsPad() & 1) != 0 || PKIsVision()))
    v9 = -[AppDelegate _handleUniversalLinkWithUserActivity:](self, "_handleUniversalLinkWithUserActivity:", v6);
  else
    v9 = 0;

  return v9;
}

- (id)_componentsForURL:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 1);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_handleUniversalLinkWithUserActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  unsigned __int8 v13;
  __CFString *v14;
  __CFString *v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  unsigned __int8 v35;
  AppDelegate *v36;
  void *v37;
  void *v38;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "webpageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate _componentsForURL:](self, "_componentsForURL:", v4));
  v6 = v5;
  if (!v5)
  {
    v22 = 0;
    goto LABEL_24;
  }
  v36 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathComponents"));

  v10 = (uint64_t)objc_msgSend(v9, "count");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
  v11 = v7;
  v12 = v11;
  if (v11 != CFSTR("http"))
  {
    if (!v11)
      goto LABEL_22;
    v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("http"));

    if ((v13 & 1) == 0)
    {
      v14 = v12;
      if (v14 != CFSTR("https"))
      {
        v15 = v14;
        v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("https"));

        if (!v16)
          goto LABEL_22;
      }
    }
  }
  v17 = (void *)PKWalletUniversalLinkHostName;
  v18 = v38;
  v19 = v17;
  if (v18 != v19)
  {
    v20 = v19;
    if (v18 && v19)
    {
      v21 = objc_msgSend(v18, "isEqualToString:", v19);

      if (!v21 || v10 <= 0)
        goto LABEL_22;
      goto LABEL_15;
    }

LABEL_22:
    -[AppDelegate _openURLInSafari:](v36, "_openURLInSafari:", v4);
    v22 = 0;
    goto LABEL_23;
  }

  if (v10 < 1)
    goto LABEL_22;
LABEL_15:
  v23 = 0;
  while (1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v23));
    if (!objc_msgSend(v24, "isEqualToString:", CFSTR("/")))
      break;

LABEL_19:
    if (v10 == ++v23)
      goto LABEL_22;
  }
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("apple-card"));

  if (v25)
    goto LABEL_19;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v23));
  v28 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v28, "addObject:", CFSTR("/"));
  v29 = v23 + 1;
  if (v23 + 1 < v10)
  {
    do
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v29));
      objc_msgSend(v28, "addObject:", v30);

      ++v29;
    }
    while (v10 != v29);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v28));
  v32 = (void *)v27;
  if ((PKIsPhone() & 1) != 0)
  {
    v33 = objc_alloc((Class)NSSet);
    v34 = objc_msgSend(v33, "initWithObjects:", PKURLActionPaymentOfferActionResult, 0);
  }
  else
  {
    v34 = 0;
  }
  v35 = -[AppDelegate _handleURLWithHost:components:path:query:supportedHosts:](v36, "_handleURLWithHost:components:path:query:supportedHosts:", v32, v6, v31, v37, v34);

  if ((v35 & 1) == 0)
    goto LABEL_22;
  v22 = 1;
LABEL_23:

LABEL_24:
  return v22;
}

- (BOOL)_handleURLWithHost:(id)a3 components:(id)a4 path:(id)a5 query:(id)a6 supportedHosts:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t Object;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v12)
  {
    if (v16)
      goto LABEL_29;
    v20 = objc_claimAutoreleasedReturnValue(-[AppDelegate _prefsURL](self, "_prefsURL"));
LABEL_23:
    v19 = (void *)v20;
    if (v20)
    {
LABEL_24:
      Object = PKLogFacilityTypeGetObject(0);
      v38 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "absoluteString"));
        *(_DWORD *)buf = 138412290;
        v45 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Opening URL: %@", buf, 0xCu);

      }
      v30 = objc_alloc_init((Class)_LSOpenConfiguration);
      v34 = 1;
      objc_msgSend(v30, "setSensitive:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100005770;
      v42[3] = &unk_100008200;
      v43 = v19;
      v27 = v19;
      objc_msgSend(v40, "openURL:configuration:completionHandler:", v27, v30, v42);

      goto LABEL_27;
    }
LABEL_29:
    v34 = 0;
    goto LABEL_30;
  }
  if (v16 && !objc_msgSend(v16, "containsObject:", v12))
    goto LABEL_29;
  if (!objc_msgSend(v12, "caseInsensitiveCompare:", PKWalletUniversalLinkHostName)
    && objc_msgSend(v14, "hasPrefix:", CFSTR("/apple-card/")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", objc_msgSend(CFSTR("/apple-card/"), "length"), (_BYTE *)objc_msgSend(v14, "length") - (_BYTE *)objc_msgSend(CFSTR("/apple-card/"), "length")));

    if (!objc_msgSend(v18, "hasPrefix:", PKURLActionSetup))
    {
      v34 = 0;
      v14 = v18;
      goto LABEL_30;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate _prefsURLWithHost:path:query:](self, "_prefsURLWithHost:path:query:", 0, v18, v15));
    v14 = v18;
    if (!v19)
      goto LABEL_29;
    goto LABEL_24;
  }
  v21 = (void *)PKURLActionSecurePassSession;
  v22 = v12;
  v23 = v21;
  if (v23 == v22)
  {

  }
  else
  {
    v24 = v23;
    if (!v23)
    {

LABEL_22:
      v20 = objc_claimAutoreleasedReturnValue(-[AppDelegate _prefsURLWithHost:path:query:](self, "_prefsURLWithHost:path:query:", v22, v14, v15));
      goto LABEL_23;
    }
    v25 = objc_msgSend(v22, "isEqualToString:", v23);

    if (!v25)
      goto LABEL_22;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fragment"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("&")));

  if (objc_msgSend(v27, "count") != (id)2)
  {
    v35 = PKLogFacilityTypeGetObject(42);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Missing required parameter for securePassSession.", buf, 2u);
    }

    v34 = 0;
    goto LABEL_28;
  }
  v28 = objc_alloc((Class)NSData);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 0));
  v30 = objc_msgSend(v28, "initWithBase64EncodedString:options:", v29, 0);

  v31 = objc_alloc((Class)NSData);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", 1));
  v33 = objc_msgSend(v31, "initWithBase64EncodedString:options:", v32, 0);

  v34 = -[AppDelegate _handleIssuerBindingRequestWithIssuerData:signature:](self, "_handleIssuerBindingRequestWithIssuerData:signature:", v30, v33);
LABEL_27:

LABEL_28:
LABEL_30:

  return v34;
}

- (BOOL)_handleIssuerBindingRequestWithIssuerData:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = PKValidateIssuerBindingData(v5, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance"));
    if (PKIsPad())
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windows"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
      v13 = (uint64_t)objc_msgSend(v12, "interfaceOrientation");

    }
    else
    {
      v13 = 1;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
    objc_msgSend(v8, "presentIssuerBindingFlowForIssuerData:signature:orientation:", v5, v6, v14);

  }
  return v7;
}

- (void)_openURLInSafari:(id)a3
{
  id v3;
  uint64_t Object;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = a3;
  Object = PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cannot handle universal link to URL: %@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005A78;
  v8[3] = &unk_100008200;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "openURL:configuration:completionHandler:", v7, 0, v8);

}

- (id)_prefsURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
}

- (id)_prefsURLWithHost:(id)a3 path:(id)a4 query:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate _prefsURL](self, "_prefsURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v13 = objc_msgSend(v12, "mutableCopy");

  if (v8 | v9)
  {
    objc_msgSend(v13, "appendString:", CFSTR("&path="));
    if (v8)
      objc_msgSend(v13, "appendString:", v8);
    if (v9)
      objc_msgSend(v13, "appendString:", v9);
  }
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("&%@"), v10));
    objc_msgSend(v13, "appendString:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));

  return v15;
}

@end
