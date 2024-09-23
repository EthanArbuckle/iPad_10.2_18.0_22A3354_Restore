@implementation HTHangsAnalytics

+ (void)sendActivationEvent:(BOOL)a3 developerAppCount:(unint64_t)a4
{
  _QWORD v6[5];
  BOOL v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_250E62F98;
    v9 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__HTHangsAnalytics_sendActivationEvent_developerAppCount___block_invoke;
    v6[3] = &__block_descriptor_41_e19___NSDictionary_8__0l;
    v7 = a3;
    v6[4] = a4;
    HTAnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.thirdpartyhangdetection.enablement.v1"), v6);
  }
}

id __58__HTHangsAnalytics_sendActivationEvent_developerAppCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("isEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("developerAppCount");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)sendHangThresholdChangedEvent:(unint64_t)a3
{
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v5 = xmmword_250E62F98;
    v6 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __50__HTHangsAnalytics_sendHangThresholdChangedEvent___block_invoke;
    v4[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v4[4] = a3;
    HTAnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.thirdpartyhangdetection.hangthreshold.v1"), v4);
  }
}

id __50__HTHangsAnalytics_sendHangThresholdChangedEvent___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("hangThresholdMS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)sendLogSharedEvent
{
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (CoreAnalyticsLibraryCore_frameworkLibrary)
    HTAnalyticsSendEventLazy(CFSTR("com.apple.hangtracer.thirdpartyhangdetection.logshared.v1"), &__block_literal_global_0);
}

uint64_t __38__HTHangsAnalytics_sendLogSharedEvent__block_invoke()
{
  return MEMORY[0x24BDBD1B8];
}

@end
