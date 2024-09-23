@implementation ICSPreferences

+ (id)sharedPreferences
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002272C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC6B0 != -1)
    dispatch_once(&qword_1002DC6B0, block);
  return (id)qword_1002DC6A8;
}

- (ICSPreferences)init
{
  ICSPreferences *v2;
  TUFeatureFlags *v3;
  TUFeatureFlags *featureFlags;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSPreferences;
  v2 = -[ICSPreferences init](&v6, "init");
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;

  }
  return v2;
}

- (id)domain
{
  NSString *domain;

  domain = self->_domain;
  if (!domain)
  {
    self->_domain = (NSString *)CFSTR("com.apple.InCallService");

    domain = self->_domain;
  }
  return domain;
}

- (BOOL)hasBannersEnabled
{
  int v3;

  v3 = _os_feature_enabled_impl("InCallService", "CleethorpesEnabled");
  if (v3)
    LOBYTE(v3) = -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("CleethorpesEnabled"), 1);
  return v3;
}

- (void)setHasBannersEnabled:(BOOL)a3
{
  -[PHPreferences setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("CleethorpesEnabled"));
}

- (BOOL)hasAdoptedModernInCallAPI
{
  return _os_feature_enabled_impl("InCallService", "hasAdoptedModernInCallAPI");
}

- (BOOL)automaticDrawerHidingDisabled
{
  return -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("disableAutomaticDrawerHiding"), 0);
}

- (BOOL)hasUserScoreFeedbackViewHidden
{
  if (_TUIsInternalInstall(self, a2))
    return -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("UserScoreFeedbackViewHidden"), 0);
  else
    return 1;
}

- (void)setHasUserScoreFeedbackViewHidden:(BOOL)a3
{
  -[PHPreferences setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("UserScoreFeedbackViewHidden"));
}

- (int64_t)moments
{
  NSString *v3;
  void *v4;
  int64_t v5;

  v3 = NSStringFromSelector("moments");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[PHPreferences unsignedIntegerForKey:defaultValue:](self, "unsignedIntegerForKey:defaultValue:", v4, 0);

  return v5;
}

- (BOOL)forceBlurCurrentPoster
{
  int v3;

  v3 = _TUIsInternalInstall(self, a2);
  if (v3)
    LOBYTE(v3) = -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("BlurCurrentPoster"), 0);
  return v3;
}

- (BOOL)forceBlurNewPoster
{
  int v3;

  v3 = _TUIsInternalInstall(self, a2);
  if (v3)
    LOBYTE(v3) = -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("BlurNewPoster"), 0);
  return v3;
}

- (BOOL)shouldMakeFakeSOSCall
{
  int v3;

  v3 = _TUIsInternalInstall(self, a2);
  if (v3)
    LOBYTE(v3) = -[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("ShouldMakeFakeSOSCall"), 0);
  return v3;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  id v11;
  id v12;

  v10.receiver = self;
  v10.super_class = (Class)ICSPreferences;
  v6 = a4;
  v7 = a3;
  -[PHPreferences setPreferencesValue:forKey:](&v10, "setPreferencesValue:forKey:", v7, v6);
  v11 = v6;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));

  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ICSPreferencesDidChangeNotification"), self, v8);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setForceBlurCurrentPoster:(BOOL)a3
{
  self->_forceBlurCurrentPoster = a3;
}

- (void)setForceBlurNewPoster:(BOOL)a3
{
  self->_forceBlurNewPoster = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (NSString)pptOutgoingCallHandleValue
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = NSStringFromSelector("pptOutgoingCallHandleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences stringForKey:defaultValue:](self, "stringForKey:defaultValue:", v4, CFSTR("+14089619342")));

  return (NSString *)v5;
}

- (NSString)pptOutgoingFaceTimeCallHandleValue
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = NSStringFromSelector("pptOutgoingFaceTimeCallHandleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHPreferences stringForKey:defaultValue:](self, "stringForKey:defaultValue:", v4, CFSTR("+14089619342")));

  return (NSString *)v5;
}

@end
