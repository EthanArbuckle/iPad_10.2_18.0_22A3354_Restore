@implementation ACActivityAuthorization

- (ACActivityAuthorization)init
{
  ACActivityAuthorization *v2;
  _TtC11ActivityKit21ActivityAuthorization *v3;
  _TtC11ActivityKit21ActivityAuthorization *activityAuthorization;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACActivityAuthorization;
  v2 = -[ACActivityAuthorization init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit21ActivityAuthorization);
    activityAuthorization = v2->_activityAuthorization;
    v2->_activityAuthorization = v3;

  }
  return v2;
}

- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  -[ActivityAuthorization setActivitiesWithEnabled:forBundleId:error:](self->_activityAuthorization, "setActivitiesWithEnabled:forBundleId:error:", a3, a4, 0);
}

- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4 source:(int64_t)a5
{
  -[ActivityAuthorization setActivitiesWithEnabled:for:source:error:](self->_activityAuthorization, "setActivitiesWithEnabled:for:source:error:", a3, a4, a5, 0);
}

- (BOOL)areActivitiesEnabledForBundleId:(id)a3
{
  return -[ActivityAuthorization areActivitiesEnabledForBundleId:](self->_activityAuthorization, "areActivitiesEnabledForBundleId:", a3);
}

- (BOOL)areFrequentPushesEnabledForBundleId:(id)a3
{
  return -[ActivityAuthorization areFrequentPushesEnabledFor:](self->_activityAuthorization, "areFrequentPushesEnabledFor:", a3);
}

- (void)setFrequentPushesEnabled:(BOOL)a3 forBundleId:(id)a4
{
  -[ActivityAuthorization setFrequentPushesWithEnabled:for:error:](self->_activityAuthorization, "setFrequentPushesWithEnabled:for:error:", a3, a4, 0);
}

- (_TtC11ActivityKit21ActivityAuthorization)activityAuthorization
{
  return self->_activityAuthorization;
}

- (void)setActivityAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_activityAuthorization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAuthorization, 0);
}

@end
