@implementation CPSMetrics

+ (void)sendAppSignInSessionActivatedEvent:(id)a3
{
  _QWORD v3[4];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__CPSMetrics_sendAppSignInSessionActivatedEvent___block_invoke;
  v3[3] = &__block_descriptor_33_e26___NSMutableDictionary_8__0l;
  v4 = (char)a3;
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.app-sign-in.activated"), v3);
}

id __49__CPSMetrics_sendAppSignInSessionActivatedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(_BYTE *)(a1 + 32) & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("reqAppleID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(unsigned __int8 *)(a1 + 32) >> 1) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("reqPassword"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(unsigned __int8 *)(a1 + 32) >> 2) & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("custOther"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(unsigned __int8 *)(a1 + 32) >> 3) & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("custRestorePurchase"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(unsigned __int8 *)(a1 + 32) >> 4) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("custVideoSubscriber"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(unsigned __int8 *)(a1 + 32) >> 5) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("trusAssocDomains"));

  return v2;
}

+ (void)sendAppSignInSessionCompletedEvent:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__CPSMetrics_sendAppSignInSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  v3[4] = a3.var0;
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.app-sign-in.completed"), v3);
}

id __49__CPSMetrics_sendAppSignInSessionCompletedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32) - 1;
  if (v4 > 0xB)
    v5 = 0;
  else
    v5 = (uint64_t)*(&off_250A119F8 + v4);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("result"));
  return v3;
}

+ (void)sendLearnMorePressedEvent
{
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.ui.learn-more"), 0);
}

+ (void)sendProviderDeviceUsageEvent:(id)a3
{
  id v4;
  _QWORD v5[4];
  $71100933E073B1738DE2D0F5F21910C1 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3254779904;
  v5[2] = __43__CPSMetrics_sendProviderDeviceUsageEvent___block_invoke;
  v5[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w8_e19___NSDictionary_8__0l;
  v6 = a3;
  v4 = a3.var0;
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.provider-device-usage"), v5);

}

id __43__CPSMetrics_sendProviderDeviceUsageEvent___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = GestaltProductTypeStringToDeviceClass();
  if (v3 == 1)
  {
    v4 = CFSTR("phone");
    goto LABEL_5;
  }
  if (v3 == 3)
  {
    v4 = CFSTR("pad");
LABEL_5:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("deviceClass"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(_QWORD *)(a1 + 40) >> 19) & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("flagsOwner"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(_QWORD *)(a1 + 40) >> 13) & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("flagsHome"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(_QWORD *)(a1 + 40) >> 14) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("flagsFamily"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (*(_QWORD *)(a1 + 40) >> 15) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("flagsPaired"));

  return v2;
}

+ (void)sendStorePurchaseSessionCompletedEvent:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__CPSMetrics_sendStorePurchaseSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e26___NSMutableDictionary_8__0l;
  v3[4] = a3.var0;
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.store-purchase.completed"), v3);
}

id __53__CPSMetrics_sendStorePurchaseSessionCompletedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32) - 1;
  if (v4 > 0xB)
    v5 = 0;
  else
    v5 = (uint64_t)*(&off_250A119F8 + v4);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("result"));
  return v3;
}

+ (void)sendSystemSessionCompletedEvent:(id)a3
{
  _QWORD v3[4];
  $0AC6E346AE4835514AAA8AC86D8F4844 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__CPSMetrics_sendSystemSessionCompletedEvent___block_invoke;
  v3[3] = &__block_descriptor_48_e26___NSMutableDictionary_8__0l;
  v4 = a3;
  objc_msgSend(a1, "_sendEvent:withPayloadBuilder:", CFSTR("com.apple.appletv.comp-auth.system-auth.completed"), v3);
}

id __46__CPSMetrics_sendSystemSessionCompletedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32) - 1;
  if (v3 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %ld)"), *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *(&off_250A119D8 + v3);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("service"));

  v5 = *(_QWORD *)(a1 + 40) - 1;
  if (v5 > 0xB)
    v6 = 0;
  else
    v6 = (uint64_t)*(&off_250A119F8 + v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("result"));
  return v2;
}

+ (void)_sendEvent:(id)a3 withPayloadBuilder:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (MetricsLog_token != -1)
    dispatch_once(&MetricsLog_token, &__block_literal_global_2);
  v7 = MetricsLog_log;
  if (os_log_type_enabled((os_log_t)MetricsLog_log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2383E3000, v7, OS_LOG_TYPE_DEFAULT, "Send event: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  if (v6)
    AnalyticsSendEventLazy();
  else
    AnalyticsSendEvent();

}

@end
