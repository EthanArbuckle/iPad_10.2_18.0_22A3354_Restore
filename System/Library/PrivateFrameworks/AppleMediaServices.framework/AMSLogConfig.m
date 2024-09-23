@implementation AMSLogConfig

+ (id)sharedBagConfig
{
  if (qword_1ECEAD410 != -1)
    dispatch_once(&qword_1ECEAD410, &__block_literal_global_20_0);
  return (id)qword_1ECEAD418;
}

+ (id)sharedPromiseConfig
{
  if (qword_1ECEAD4D0 != -1)
    dispatch_once(&qword_1ECEAD4D0, &__block_literal_global_32_1);
  return (id)qword_1ECEAD4D8;
}

+ (id)sharedConfig
{
  if (_MergedGlobals_117 != -1)
    dispatch_once(&_MergedGlobals_117, &__block_literal_global_68);
  return (id)qword_1ECEAD2E8;
}

- (BOOL)debugLogsEnabled
{
  void *v2;
  BOOL v3;

  -[AMSLogConfig OSLogObject](self, "OSLogObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[AMSLogConfig _debugLogsEnabled:](AMSLogConfig, "_debugLogsEnabled:", v2);

  return v3;
}

- (OS_os_log)OSLogObject
{
  return self->_OSLogObject;
}

+ (BOOL)_debugLogsEnabled:(id)a3
{
  return os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG);
}

- (AMSLogConfig)initWithCategory:(id)a3 backingLog:(id)a4
{
  id v6;
  id v7;
  AMSLogConfig *v8;
  AMSLogConfig *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSLogConfig;
  v8 = -[AMSLogConfig init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AMSLogConfig setSubsystem:](v8, "setSubsystem:", CFSTR("com.apple.AppleMediaServices"));
    -[AMSLogConfig setCategory:](v9, "setCategory:", v6);
    -[AMSLogConfig setOSLogObject:](v9, "setOSLogObject:", v7);
  }

  return v9;
}

- (void)setSubsystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setOSLogObject:(id)a3
{
  objc_storeStrong((id *)&self->_OSLogObject, a3);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (id)sharedMetricsConfig
{
  if (qword_1ECEAD4B0 != -1)
    dispatch_once(&qword_1ECEAD4B0, &__block_literal_global_30_0);
  return (id)qword_1ECEAD4B8;
}

+ (id)sharedAccountsConfig
{
  if (qword_1ECEAD320 != -1)
    dispatch_once(&qword_1ECEAD320, &__block_literal_global_5);
  return (id)qword_1ECEAD328;
}

+ (id)sharedTreatmentsConfig
{
  if (qword_1ECEAD530 != -1)
    dispatch_once(&qword_1ECEAD530, &__block_literal_global_38_0);
  return (id)qword_1ECEAD538;
}

+ (id)sharedURLLoadingConfig
{
  if (qword_1ECEAD540 != -1)
    dispatch_once(&qword_1ECEAD540, &__block_literal_global_39_0);
  return (id)qword_1ECEAD548;
}

+ (id)sharedPrivacyConfig
{
  if (qword_1ECEAD4C0 != -1)
    dispatch_once(&qword_1ECEAD4C0, &__block_literal_global_31);
  return (id)qword_1ECEAD4C8;
}

+ (id)sharedEngagementConfig
{
  if (qword_1ECEAD440 != -1)
    dispatch_once(&qword_1ECEAD440, &__block_literal_global_23_1);
  return (id)qword_1ECEAD448;
}

+ (id)sharedAccountsDaemonConfig
{
  if (qword_1ECEAD310 != -1)
    dispatch_once(&qword_1ECEAD310, &__block_literal_global_4_0);
  return (id)qword_1ECEAD318;
}

+ (id)sharedConfigOversize
{
  if (qword_1ECEAD2F0 != -1)
    dispatch_once(&qword_1ECEAD2F0, &__block_literal_global_2_3);
  return (id)qword_1ECEAD2F8;
}

+ (id)sharedPushNotificationConfig
{
  if (qword_1ECEAD4F0 != -1)
    dispatch_once(&qword_1ECEAD4F0, &__block_literal_global_34_0);
  return (id)qword_1ECEAD4F8;
}

+ (id)sharedAccountsMultiUserConfig
{
  if (qword_1ECEAD390 != -1)
    dispatch_once(&qword_1ECEAD390, &__block_literal_global_12_3);
  return (id)qword_1ECEAD398;
}

void __56__AMSLogConfig_sharedAccountsAuthenticationPluginConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD308;
  qword_1ECEAD308 = v0;

}

void __44__AMSLogConfig_sharedPushNotificationConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 39);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4F8;
  qword_1ECEAD4F8 = v0;

}

void __45__AMSLogConfig_sharedAccountsMultiUserConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD398;
  qword_1ECEAD398 = v0;

}

void __35__AMSLogConfig_sharedPromiseConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 37);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4D8;
  qword_1ECEAD4D8 = v0;

}

void __33__AMSLogConfig_sharedMediaConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD488;
  qword_1ECEAD488 = v0;

}

void __35__AMSLogConfig_sharedPrivacyConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 36);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4C8;
  qword_1ECEAD4C8 = v0;

}

void __35__AMSLogConfig_sharedMetricsConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 34);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4B8;
  qword_1ECEAD4B8 = v0;

}

void __38__AMSLogConfig_sharedEngagementConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD448;
  qword_1ECEAD448 = v0;

}

void __38__AMSLogConfig_sharedTreatmentsConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 46);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD538;
  qword_1ECEAD538 = v0;

}

void __43__AMSLogConfig_sharedAccountsCookiesConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD338;
  qword_1ECEAD338 = v0;

}

void __38__AMSLogConfig_sharedURLLoadingConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 47);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD548;
  qword_1ECEAD548 = v0;

}

void __31__AMSLogConfig_sharedBagConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD418;
  qword_1ECEAD418 = v0;

}

void __42__AMSLogConfig_sharedAccountsDaemonConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD318;
  qword_1ECEAD318 = v0;

}

void __34__AMSLogConfig_sharedActionConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3E8;
  qword_1ECEAD3E8 = v0;

}

void __36__AMSLogConfig_sharedConfigOversize__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 35);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD2F8;
  qword_1ECEAD2F8 = v0;

}

void __36__AMSLogConfig_sharedAccountsConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD328;
  qword_1ECEAD328 = v0;

}

void __28__AMSLogConfig_sharedConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 27);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD2E8;
  qword_1ECEAD2E8 = v0;

}

+ (id)sharedActionConfig
{
  if (qword_1ECEAD3E0 != -1)
    dispatch_once(&qword_1ECEAD3E0, &__block_literal_global_17_0);
  return (id)qword_1ECEAD3E8;
}

+ (id)sharedAccountsCookiesConfig
{
  if (qword_1ECEAD330 != -1)
    dispatch_once(&qword_1ECEAD330, &__block_literal_global_6);
  return (id)qword_1ECEAD338;
}

+ (id)sharedMediaConfig
{
  if (qword_1ECEAD480 != -1)
    dispatch_once(&qword_1ECEAD480, &__block_literal_global_27);
  return (id)qword_1ECEAD488;
}

+ (id)sharedAccountsAuthenticationPluginConfig
{
  if (qword_1ECEAD300 != -1)
    dispatch_once(&qword_1ECEAD300, &__block_literal_global_3_0);
  return (id)qword_1ECEAD308;
}

+ (id)sharedDataMigrationConfig
{
  if (qword_1ECEAD340 != -1)
    dispatch_once(&qword_1ECEAD340, &__block_literal_global_7);
  return (id)qword_1ECEAD348;
}

void __41__AMSLogConfig_sharedDataMigrationConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD348;
  qword_1ECEAD348 = v0;

}

+ (id)sharedDeviceOffersConfig
{
  if (qword_1ECEAD350 != -1)
    dispatch_once(&qword_1ECEAD350, &__block_literal_global_8);
  return (id)qword_1ECEAD358;
}

void __40__AMSLogConfig_sharedDeviceOffersConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 24);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD358;
  qword_1ECEAD358 = v0;

}

+ (id)sharedAccountsLogoutConfig
{
  if (qword_1ECEAD360 != -1)
    dispatch_once(&qword_1ECEAD360, &__block_literal_global_9_2);
  return (id)qword_1ECEAD368;
}

void __42__AMSLogConfig_sharedAccountsLogoutConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD368;
  qword_1ECEAD368 = v0;

}

+ (id)sharedAccountsMigrationConfig
{
  if (qword_1ECEAD370 != -1)
    dispatch_once(&qword_1ECEAD370, &__block_literal_global_10_1);
  return (id)qword_1ECEAD378;
}

void __45__AMSLogConfig_sharedAccountsMigrationConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD378;
  qword_1ECEAD378 = v0;

}

+ (id)sharedAccountsMigrationConfigOversize
{
  if (qword_1ECEAD380 != -1)
    dispatch_once(&qword_1ECEAD380, &__block_literal_global_11_2);
  return (id)qword_1ECEAD388;
}

void __53__AMSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD388;
  qword_1ECEAD388 = v0;

}

+ (id)sharedAccountsNotificationPluginConfig
{
  if (qword_1ECEAD3A0 != -1)
    dispatch_once(&qword_1ECEAD3A0, &__block_literal_global_13_1);
  return (id)qword_1ECEAD3A8;
}

void __54__AMSLogConfig_sharedAccountsNotificationPluginConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3A8;
  qword_1ECEAD3A8 = v0;

}

+ (id)sharedAccountsOversizeConfig
{
  if (qword_1ECEAD3B0 != -1)
    dispatch_once(&qword_1ECEAD3B0, &__block_literal_global_14_1);
  return (id)qword_1ECEAD3B8;
}

void __44__AMSLogConfig_sharedAccountsOversizeConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3B8;
  qword_1ECEAD3B8 = v0;

}

+ (id)sharedAccountsStorefrontConfig
{
  if (qword_1ECEAD3C0 != -1)
    dispatch_once(&qword_1ECEAD3C0, &__block_literal_global_15);
  return (id)qword_1ECEAD3C8;
}

void __46__AMSLogConfig_sharedAccountsStorefrontConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3C8;
  qword_1ECEAD3C8 = v0;

}

+ (id)sharedAccountsSyncPluginConfig
{
  if (qword_1ECEAD3D0 != -1)
    dispatch_once(&qword_1ECEAD3D0, &__block_literal_global_16_1);
  return (id)qword_1ECEAD3D8;
}

void __46__AMSLogConfig_sharedAccountsSyncPluginConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3D8;
  qword_1ECEAD3D8 = v0;

}

+ (id)sharedAnisetteConfig
{
  if (qword_1ECEAD3F0 != -1)
    dispatch_once(&qword_1ECEAD3F0, &__block_literal_global_18_0);
  return (id)qword_1ECEAD3F8;
}

void __36__AMSLogConfig_sharedAnisetteConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD3F8;
  qword_1ECEAD3F8 = v0;

}

+ (id)sharedAttestationConfig
{
  if (qword_1ECEAD400 != -1)
    dispatch_once(&qword_1ECEAD400, &__block_literal_global_19_0);
  return (id)qword_1ECEAD408;
}

void __39__AMSLogConfig_sharedAttestationConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD408;
  qword_1ECEAD408 = v0;

}

+ (id)sharedBagCacheConfig
{
  if (qword_1ECEAD420 != -1)
    dispatch_once(&qword_1ECEAD420, &__block_literal_global_21);
  return (id)qword_1ECEAD428;
}

void __36__AMSLogConfig_sharedBagCacheConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD428;
  qword_1ECEAD428 = v0;

}

+ (id)sharedBiometricsConfig
{
  if (qword_1ECEAD430 != -1)
    dispatch_once(&qword_1ECEAD430, &__block_literal_global_22_1);
  return (id)qword_1ECEAD438;
}

void __38__AMSLogConfig_sharedBiometricsConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD438;
  qword_1ECEAD438 = v0;

}

+ (id)sharedFollowUpConfig
{
  if (qword_1ECEAD450 != -1)
    dispatch_once(&qword_1ECEAD450, &__block_literal_global_24_1);
  return (id)qword_1ECEAD458;
}

void __36__AMSLogConfig_sharedFollowUpConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 26);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD458;
  qword_1ECEAD458 = v0;

}

+ (id)sharedKeychainConfig
{
  if (qword_1ECEAD460 != -1)
    dispatch_once(&qword_1ECEAD460, &__block_literal_global_25);
  return (id)qword_1ECEAD468;
}

void __36__AMSLogConfig_sharedKeychainConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 28);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD468;
  qword_1ECEAD468 = v0;

}

+ (id)sharedMarketingItemConfig
{
  if (qword_1ECEAD470 != -1)
    dispatch_once(&qword_1ECEAD470, &__block_literal_global_26);
  return (id)qword_1ECEAD478;
}

void __41__AMSLogConfig_sharedMarketingItemConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 29);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD478;
  qword_1ECEAD478 = v0;

}

+ (id)sharedMediaServiceOwnerConfig
{
  if (qword_1ECEAD490 != -1)
    dispatch_once(&qword_1ECEAD490, &__block_literal_global_28_0);
  return (id)qword_1ECEAD498;
}

void __45__AMSLogConfig_sharedMediaServiceOwnerConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 32);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD498;
  qword_1ECEAD498 = v0;

}

+ (id)sharedMessagingUIConfig
{
  if (qword_1ECEAD4A0 != -1)
    dispatch_once(&qword_1ECEAD4A0, &__block_literal_global_29_0);
  return (id)qword_1ECEAD4A8;
}

void __39__AMSLogConfig_sharedMessagingUIConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 33);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4A8;
  qword_1ECEAD4A8 = v0;

}

+ (id)sharedPurchaseConfig
{
  if (qword_1ECEAD4E0 != -1)
    dispatch_once(&qword_1ECEAD4E0, &__block_literal_global_33_0);
  return (id)qword_1ECEAD4E8;
}

void __36__AMSLogConfig_sharedPurchaseConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD4E8;
  qword_1ECEAD4E8 = v0;

}

+ (id)sharedRatingsProviderConfig
{
  if (qword_1ECEAD500 != -1)
    dispatch_once(&qword_1ECEAD500, &__block_literal_global_35);
  return (id)qword_1ECEAD508;
}

void __43__AMSLogConfig_sharedRatingsProviderConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD508;
  qword_1ECEAD508 = v0;

}

+ (id)sharedRegulatoryEligibilityConfig
{
  if (qword_1ECEAD510 != -1)
    dispatch_once(&qword_1ECEAD510, &__block_literal_global_36);
  return (id)qword_1ECEAD518;
}

void __49__AMSLogConfig_sharedRegulatoryEligibilityConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 41);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD518;
  qword_1ECEAD518 = v0;

}

+ (id)sharedServerDataCacheConfig
{
  if (qword_1ECEAD520 != -1)
    dispatch_once(&qword_1ECEAD520, &__block_literal_global_37_1);
  return (id)qword_1ECEAD528;
}

void __43__AMSLogConfig_sharedServerDataCacheConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 43);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD528;
  qword_1ECEAD528 = v0;

}

+ (id)sharedUserNotificationConfig
{
  if (qword_1ECEAD550 != -1)
    dispatch_once(&qword_1ECEAD550, &__block_literal_global_40_0);
  return (id)qword_1ECEAD558;
}

void __44__AMSLogConfig_sharedUserNotificationConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD558;
  qword_1ECEAD558 = v0;

}

+ (id)sharedWebUIConfig
{
  if (qword_1ECEAD560 != -1)
    dispatch_once(&qword_1ECEAD560, &__block_literal_global_41_1);
  return (id)qword_1ECEAD568;
}

void __33__AMSLogConfig_sharedWebUIConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 49);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD568;
  qword_1ECEAD568 = v0;

}

+ (id)sharedFraudReportConfig
{
  if (qword_1ECEAD570 != -1)
    dispatch_once(&qword_1ECEAD570, &__block_literal_global_42);
  return (id)qword_1ECEAD578;
}

void __39__AMSLogConfig_sharedFraudReportConfig__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSLogBridge amsLogConfigWithCategory:](_TtC18AppleMediaServices12AMSLogBridge, "amsLogConfigWithCategory:", 50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEAD578;
  qword_1ECEAD578 = v0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)AMSLogConfig;
  -[AMSLogConfig description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  category: %@\n"), v6);

  -[AMSLogConfig subsystem](self, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  subsystem: %@\n"), v7);

  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSLogConfig category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSLogConfig subsystem](self, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AMSLogConfig *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v5 = (AMSLogConfig *)a3;
  if (self == v5)
  {
    v7 = 1;
    goto LABEL_18;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    -[AMSLogConfig category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (-[AMSLogConfig category](v5, "category"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSLogConfig category](self, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSLogConfig category](v5, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {

        if (!v11)
          goto LABEL_3;
      }
      else
      {

        if ((v11 & 1) == 0)
          goto LABEL_3;
      }
    }
    -[AMSLogConfig subsystem](self, "subsystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (-[AMSLogConfig subsystem](v5, "subsystem"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSLogConfig subsystem](self, "subsystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSLogConfig subsystem](v5, "subsystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14) ^ 1;

      if (v12)
      {
LABEL_17:

        v7 = v15 ^ 1;
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }

    goto LABEL_17;
  }
LABEL_3:
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSLogConfig *v5;
  void *v6;
  uint64_t v7;
  NSString *category;
  void *v9;
  uint64_t v10;
  NSString *subsystem;
  uint64_t v12;
  OS_os_log *OSLogObject;

  v5 = -[AMSLogConfig init](+[AMSLogConfig allocWithZone:](AMSLogConfig, "allocWithZone:"), "init");
  -[AMSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  category = v5->_category;
  v5->_category = (NSString *)v7;

  -[AMSLogConfig subsystem](self, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  -[AMSLogConfig OSLogObject](self, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  OSLogObject = v5->_OSLogObject;
  v5->_OSLogObject = (OS_os_log *)v12;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AMSMutableLogConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[AMSMutableLogConfig init](+[AMSMutableLogConfig allocWithZone:](AMSMutableLogConfig, "allocWithZone:"), "init");
  -[AMSLogConfig category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[AMSLogConfig setCategory:](v5, "setCategory:", v7);

  -[AMSLogConfig subsystem](self, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[AMSLogConfig setSubsystem:](v5, "setSubsystem:", v9);

  -[AMSLogConfig OSLogObject](self, "OSLogObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSLogConfig setOSLogObject:](v5, "setOSLogObject:", v10);

  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_OSLogObject, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
