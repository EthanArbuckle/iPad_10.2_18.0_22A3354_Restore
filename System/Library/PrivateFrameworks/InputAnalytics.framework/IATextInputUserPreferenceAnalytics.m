@implementation IATextInputUserPreferenceAnalytics

- (IATextInputUserPreferenceAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IATextInputUserPreferenceAnalytics;
  return -[IATextInputUserPreferenceAnalytics init](&v3, sel_init);
}

- (IATextInputUserPreferenceAnalytics)initWithEventHandler:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IATextInputUserPreferenceAnalytics;
  return -[IATextInputUserPreferenceAnalytics init](&v4, sel_init, a3);
}

- (void)reportStateForUserPreference:(int64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23F0976AC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_23F0A0494(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)reportStateForUserPreferences:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23F0976AC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_23F0A04C8(v3, v4, v5, v6, v7, v8, v9, v10);

}

@end
