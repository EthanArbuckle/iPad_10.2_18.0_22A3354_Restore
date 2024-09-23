@implementation AAFAnalyticsEvent(CDP)

+ (id)analyticsEventWithContext:()CDP eventName:category:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = (objc_class *)MEMORY[0x24BDFC2A0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithEventName:eventCategory:initData:", v9, v8, 0);

  objc_msgSend(v10, "telemetryFlowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDFC340]);

  objc_msgSend(v10, "telemetryDeviceSessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDFC318]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("contextType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "walrusStatus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("advancedDataProtectionState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "securityLevel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("securityLevel"));

  objc_msgSend(v10, "followUpType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("cfuType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "keychainSyncSystem"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("keychainSyncSystemType"));

  objc_msgSend(v10, "accountType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("accountType"));

  objc_msgSend(v10, "adpCohort");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("telemetryVersion"));
  return v11;
}

+ (id)analyticsEventWithFollowUpContext:()CDP eventName:category:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x24BDFC2A0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithEventName:eventCategory:initData:", v9, v8, 0);

  objc_msgSend(v10, "telemetryFlowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDFC340]);

  objc_msgSend(v10, "telemetryDeviceSessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDFC318]);
  return v11;
}

@end
