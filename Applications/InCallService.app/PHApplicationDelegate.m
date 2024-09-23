@implementation PHApplicationDelegate

- (PHApplicationDelegate)init
{
  PHApplicationDelegate *v2;
  TUFeatureFlags *v3;
  TUFeatureFlags *featureFlags;
  uint64_t v5;
  CNKFeatures *features;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHApplicationDelegate;
  v2 = -[PHApplicationDelegate init](&v8, "init");
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    features = v2->_features;
    v2->_features = (CNKFeatures *)v5;

  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@, %@", (uint8_t *)&v10, 0x16u);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002866E8);
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@, %@ %@", (uint8_t *)&v15, 0x20u);
  }

  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring unknown URL format.", (uint8_t *)&v15, 2u);
  }

  return 0;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
