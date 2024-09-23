@implementation AMSUserNotificationMetricsEvent

+ (id)_propertyValueClassesForKnownProperties
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("errorDescription");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("postedSuccessfully");
  v9[1] = objc_opt_class();
  v8[2] = CFSTR("displayScheduledTime");
  v9[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSUserNotificationMetricsEvent;
  objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4 account:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  +[AMSUserNotificationMetricsEvent eventFromNotificationCenterSettings:centerBundleId:](AMSUserNotificationMetricsEvent, "eventFromNotificationCenterSettings:centerBundleId:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forBodyKey:", CFSTR("Settings"), CFSTR("pageType"));
  objc_msgSend(v8, "setProperty:forBodyKey:", CFSTR("Notifications"), CFSTR("pageContext"));
  objc_msgSend(v8, "setEventType:", CFSTR("click"));
  if (v7)
  {
    if ((objc_msgSend(v7, "ams_isLocalAccount") & 1) == 0)
    {
      objc_msgSend(v7, "ams_DSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v7, "ams_DSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setProperty:forBodyKey:", v10, CFSTR("dsId"));

      }
    }
  }

  return v8;
}

+ (id)eventFromNotificationCenterSettings:(id)a3 centerBundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  AMSUserNotificationMetricsEvent *v9;

  v5 = a4;
  v6 = a3;
  +[AMSUserNotificationMetricsEvent _centerForBundleId:](AMSUserNotificationMetricsEvent, "_centerForBundleId:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationSettingsForTopics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUserNotificationMetricsEvent initWithTopic:settings:notificationSettingsForTopic:centerBundleId:]([AMSUserNotificationMetricsEvent alloc], "initWithTopic:settings:notificationSettingsForTopic:centerBundleId:", CFSTR("xp_amp_notifications"), v6, v8, v5);

  return v9;
}

+ (id)_centerForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v5);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v3);
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AMSUserNotificationMetricsEvent)initWithTopic:(id)a3 settings:(id)a4 notificationSettingsForTopic:(id)a5 centerBundleId:(id)a6
{
  id v10;
  id v11;
  id v12;
  AMSUserNotificationMetricsEvent *v13;
  AMSUserNotificationMetricsEvent *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  int64_t v26;
  const __CFString *v27;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)AMSUserNotificationMetricsEvent;
  v13 = -[AMSMetricsEvent initWithTopic:](&v36, sel_initWithTopic_, a3);
  v14 = v13;
  if (v13)
  {
    if (v12)
      -[AMSMetricsEvent setProperty:forBodyKey:](v13, "setProperty:forBodyKey:", v12, CFSTR("app"));
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v10)
    {
      -[AMSMetricsEvent setEventVersion:](v14, "setEventVersion:", &unk_1E25AFBC0);
      -[AMSUserNotificationMetricsEvent _createDisplayCriteriaFromSettings:](v14, "_createDisplayCriteriaFromSettings:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v16);

      if (v11)
      {
        if (objc_msgSend(v11, "count"))
        {
          v29 = v15;
          v30 = v12;
          v31 = v10;
          v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v11, "keyEnumerator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v33 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v11, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[AMSUserNotificationMetricsEvent _createDisplayCriteriaFromSettings:](v14, "_createDisplayCriteriaFromSettings:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            }
            while (v20);
          }

          v15 = v29;
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, CFSTR("subsections"));

          v12 = v30;
          v10 = v31;
        }
      }
    }
    v26 = +[AMSRestrictions explicitContentSettingForBundleID:](AMSRestrictions, "explicitContentSettingForBundleID:", v12);
    if (v26 != -1)
    {
      if (v26 == 1)
        v27 = CFSTR("explicit");
      else
        v27 = CFSTR("clean");
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("explicitEnabled"));
    }
    -[AMSMetricsEvent setProperty:forBodyKey:](v14, "setProperty:forBodyKey:", v15, CFSTR("displayCriteria"));

  }
  return v14;
}

- (id)_createDisplayCriteriaFromSettings:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  unint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  unint64_t v23;
  const __CFString *v24;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "alertSetting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("alertSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "badgeSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("badgeSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "carPlaySetting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("carPlaySetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "criticalAlertSetting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("criticalAlertSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "directMessagesSetting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("directMessagesSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "lockScreenSetting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("lockScreenSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "notificationCenterSetting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("notificationCenterSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "scheduledDeliverySetting"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("scheduledDeliverySetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "soundSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("soundSetting"));

  -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", objc_msgSend(v4, "timeSensitiveSetting"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("timeSensitiveSetting"));

  v16 = objc_msgSend(v4, "alertStyle");
  if (v16 > 2)
    v17 = &stru_1E2548760;
  else
    v17 = off_1E2547758[v16];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("alertStyle"));
  v18 = objc_msgSend(v4, "authorizationStatus");
  if (v18 > 4)
    v19 = &stru_1E2548760;
  else
    v19 = off_1E2547770[v18];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("authorizationStatus"));
  v20 = objc_msgSend(v4, "groupingSetting");
  if (v20 > 2)
    v21 = &stru_1E2548760;
  else
    v21 = off_1E2547798[v20];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("groupingSetting"));
  if (objc_msgSend(v4, "providesAppNotificationSettings"))
    v22 = CFSTR("yes");
  else
    v22 = CFSTR("no");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("providesAppNotificationSettings"));
  v23 = objc_msgSend(v4, "showPreviewsSetting");
  if (v23 > 2)
    v24 = &stru_1E2548760;
  else
    v24 = off_1E25477B0[v23];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("showPreviewsSetting"));

  return v5;
}

- (id)_stringFromNotificationSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_1E2548760;
  else
    return off_1E25477E0[a3];
}

+ (id)eventForBadgingForMetricsDictionary:(id)a3 bundleID:(id)a4
{
  void *v4;

  objc_msgSend(a1, "eventFromMetricsDictionary:centerBundleId:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCheckDiagnosticsAndUsageSetting:", 1);
  objc_msgSend(v4, "setEventType:", CFSTR("badgeRequest"));
  return v4;
}

+ (id)eventForPostedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "metricsEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventFromMetricsDictionary:centerBundleId:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "interruptionLevel");
  objc_msgSend(a1, "_stringFromInteruptionLevel:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forBodyKey:", v9, CFSTR("interruptionLevel"));

  return v7;
}

+ (id)eventForContentEngagementWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "metricsEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventFromMetricsDictionary:centerBundleId:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("longpress"), CFSTR("gestureType"));
  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("navigate"), CFSTR("actionType"));
  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("notification"), CFSTR("targetType"));
  v8 = objc_msgSend(v4, "interruptionLevel");

  objc_msgSend(a1, "_stringFromInteruptionLevel:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forBodyKey:", v9, CFSTR("interruptionLevel"));

  objc_msgSend(v7, "propertyForBodyKey:", CFSTR("displayCriteria"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;

  objc_msgSend(v7, "setProperty:forBodyKey:", v15, CFSTR("displayCriteria"));
  return v7;
}

+ (id)eventForVideoPlaybackForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "metricsEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "eventFromMetricsDictionary:centerBundleId:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("notification"), CFSTR("actionContext"));
  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("play"), CFSTR("actionType"));
  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("play"), CFSTR("targetId"));
  objc_msgSend(v7, "setProperty:forBodyKey:", CFSTR("button"), CFSTR("targetType"));
  return v7;
}

+ (id)eventFromMetricsDictionary:(id)a3 centerBundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSUserNotificationMetricsEvent *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUserNotificationMetricsEvent _centerForBundleId:](AMSUserNotificationMetricsEvent, "_centerForBundleId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSettingsForTopics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMSUserNotificationMetricsEvent initWithTopic:settings:notificationSettingsForTopic:centerBundleId:]([AMSUserNotificationMetricsEvent alloc], "initWithTopic:settings:notificationSettingsForTopic:centerBundleId:", v7, v9, v10, v6);

  if (v5)
    -[AMSMetricsEvent addPropertiesWithDictionary:](v11, "addPropertiesWithDictionary:", v5);

  return v11;
}

- (NSString)displayScheduledTime
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("displayScheduledTime"));
}

- (NSString)errorDescription
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorDescription"));
}

- (BOOL)postedSuccessfully
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("postedSuccessfully"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDisplayScheduledTime:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("displayScheduledTime"));
}

- (void)setErrorDescription:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("errorDescription"));
}

- (void)setPostedSuccessfully:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("postedSuccessfully"));

}

+ (id)_stringFromInteruptionLevel:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("passive");
  else
    return off_1E25477C8[a3 - 1];
}

+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4
{
  return (id)objc_msgSend(a1, "eventForSettingsChangedWithSettings:bundleID:account:", a3, a4, 0);
}

@end
