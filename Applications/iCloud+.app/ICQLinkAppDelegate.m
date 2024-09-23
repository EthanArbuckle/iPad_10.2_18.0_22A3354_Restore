@implementation ICQLinkAppDelegate

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICQLinkHandler urlFromUserActivity:](ICQLinkHandler, "urlFromUserActivity:", a3));
  v6 = _ICQGetLogSystem(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "handling universal link %@", (uint8_t *)&v11, 0xCu);

  }
  v9 = -[ICQLinkAppDelegate handleICQLinkResult:url:](self, "handleICQLinkResult:url:", +[ICQLinkHandler resultFromURL:](ICQLinkHandler, "resultFromURL:", v4), v4);

  return v9;
}

- (BOOL)handleICQLinkResult:(int64_t)a3 url:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a4;
  v7 = v6;
  if (a3 == 3)
  {
    v10 = -[ICQLinkAppDelegate handleSkipCFUWithURL:](self, "handleSkipCFUWithURL:", v6);
  }
  else
  {
    if (a3 == 2)
    {
      -[ICQLinkAppDelegate launchSettingsDeeplink](self, "launchSettingsDeeplink");
    }
    else
    {
      if (a3 != 1)
      {
        v10 = 0;
        goto LABEL_9;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICQOfferManager sharedOfferManager](ICQOfferManager, "sharedOfferManager"));
      -[ICQLinkAppDelegate handleUniversalLinkResultWithContext:offerManager:](self, "handleUniversalLinkResultWithContext:offerManager:", v8, v9);

    }
    v10 = 1;
  }
LABEL_9:

  return v10;
}

- (void)handleUniversalLinkResultWithContext:(id)a3 offerManager:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004C5C;
  v6[3] = &unk_100008210;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "getDefaultOfferWithCompletion:", v6);

}

- (void)performActionForLink:(id)a3
{
  objc_msgSend(a3, "performAction");
}

- (void)launchFlowWithContext:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = _ICQGetLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000053DC(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)launchSettingsDeeplink
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = _ICQGetLogSystem(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10000544C(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)launchURL:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = _ICQGetLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000054BC(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (BOOL)handleSkipCFUWithURL:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = _ICQGetLogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10000552C(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

@end
