id sub_100004104(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginFlowWithPresentingViewController:", 0);
}

void sub_100004588(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004C5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  __int16 v55;
  void *v56;

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (v6)
  {
    v9 = _ICQGetLogSystem(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100005348(v8, v10);
LABEL_4:

    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://support.apple.com/HT201318")));
    objc_msgSend(v11, "launchURL:", v12);
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v5, "setContext:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionBasedUniversalLinkSpecification"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "icqLinkForContext:", *(_QWORD *)(a1 + 40)));
  if (v14)
  {
    v12 = (void *)v14;

LABEL_8:
    v18 = _ICQGetLogSystem(v15, v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found action based universal Link", (uint8_t *)&v53, 2u);
    }

    v20 = (char *)objc_msgSend(v12, "action");
    if ((unint64_t)(v20 - 112) <= 6 && ((1 << (v20 - 112)) & 0x4D) != 0)
    {
      v22 = _ICQGetLogSystem(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = _ICQStringForAction(objc_msgSend(v12, "action"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverUIURL"));
        v53 = 138412546;
        v54 = v25;
        v55 = 2112;
        v56 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Detected upsell action %@, URL %@", (uint8_t *)&v53, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "launchFlowWithContext:offer:", *(_QWORD *)(a1 + 40), v5);
      goto LABEL_21;
    }
    if (!v20)
    {
      v27 = _ICQGetLogSystem(0, v21);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(void **)(a1 + 40);
        v53 = 138412290;
        v54 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Potentially unkown action, falling back to KB article. url context: %@", (uint8_t *)&v53, 0xCu);
      }

      v30 = *(void **)(a1 + 32);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://support.apple.com/HT201318")));
      objc_msgSend(v30, "launchURL:", v31);

      goto LABEL_21;
    }
    v32 = *(void **)(a1 + 32);
    goto LABEL_20;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionBasedUniversalLinkSpecification"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultLink"));

  if (v12)
    goto LABEL_8;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverUIURL"));

  if (!v33)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "universalLink"));
    v40 = objc_msgSend(v39, "action");

    v43 = _ICQGetLogSystem(v41, v42);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v10 = v44;
    if (!v40)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_1000052E0(a1 + 40, v10, v47, v48, v49, v50, v51, v52);
      goto LABEL_4;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "universalLink"));
      v53 = 138412290;
      v54 = v45;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing universal link action for link %@", (uint8_t *)&v53, 0xCu);

    }
    v46 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "universalLink"));
    v32 = v46;
LABEL_20:
    objc_msgSend(v32, "performActionForLink:", v12);
    goto LABEL_21;
  }
  v36 = _ICQGetLogSystem(v34, v35);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverUIURL"));
    v53 = 138412290;
    v54 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Launching upsell for URL %@", (uint8_t *)&v53, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "launchFlowWithContext:", *(_QWORD *)(a1 + 40));
LABEL_22:

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(ICQLinkAppDelegate_iOS);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100005210(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a2, a3, "Unable to launch URL %@", a5, a6, a7, a8, 2u);
}

void sub_100005278(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a2, a3, "Upgrade flow failed with error: %@", a5, a6, a7, a8, 2u);
}

void sub_1000052E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a2, a3, "Unable to perform any action for context %@. Falling back to KB article.", a5, a6, a7, a8, 2u);
  sub_100005198();
}

void sub_100005348(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve default offer for universal link due to error %@. Falling back to KB article.", (uint8_t *)&v4, 0xCu);

}

void sub_1000053DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a1, a3, "Subclass must overrise %s", a5, a6, a7, a8, 2u);
  sub_100005198();
}

void sub_10000544C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a1, a3, "Subclass must overrise %s", a5, a6, a7, a8, 2u);
  sub_100005198();
}

void sub_1000054BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a1, a3, "Subclass must overrise %s", a5, a6, a7, a8, 2u);
  sub_100005198();
}

void sub_10000552C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004588((void *)&_mh_execute_header, a1, a3, "Subclass must overrise %s", a5, a6, a7, a8, 2u);
  sub_100005198();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_actionBasedUniversalLinkSpecification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionBasedUniversalLinkSpecification");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultLink");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getDefaultOfferWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultOfferWithCompletion:");
}

id objc_msgSend_handleICQLinkResult_url_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleICQLinkResult:url:");
}

id objc_msgSend_handleSkipCFUWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSkipCFUWithURL:");
}

id objc_msgSend_handleUniversalLinkResultWithContext_offerManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUniversalLinkResultWithContext:offerManager:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_icqLinkForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icqLinkForContext:");
}

id objc_msgSend_icq_URLByAppendingQueryParamName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icq_URLByAppendingQueryParamName:value:");
}

id objc_msgSend_icq_dismissFollowUpWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icq_dismissFollowUpWithIdentifier:");
}

id objc_msgSend_icq_queryItemForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icq_queryItemForName:");
}

id objc_msgSend_initSubclassWithOffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSubclassWithOffer:");
}

id objc_msgSend_initWithServerDictionary_accountAltDSID_notificationID_retrievalDate_callbackInterval_appLaunchLink_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_launchFlowWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchFlowWithContext:");
}

id objc_msgSend_launchFlowWithContext_offer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchFlowWithContext:offer:");
}

id objc_msgSend_launchSettingsDeeplink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchSettingsDeeplink");
}

id objc_msgSend_launchURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchURL:");
}

id objc_msgSend_launchURLWithDeviceUnlockPrompt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchURLWithDeviceUnlockPrompt:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_performActionForLink_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performActionForLink:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_resultFromURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultFromURL:");
}

id objc_msgSend_resultFromURL_store_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultFromURL:store:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_serverUIURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverUIURL");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFlowOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlowOptions:");
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedOfferManager");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_universalLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalLink");
}

id objc_msgSend_urlFromUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlFromUserActivity:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}
