@implementation CSSiriDebugConnection

+ (void)launchSiriDebugAppWithMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (CSIsInternalBuild() && CSIsIPhone())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA78]), "initWithAppBundleIdentifier:", CFSTR("com.apple.siri.SiriDebug"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE9F8]), "initWithTaskDeliverer:", v4);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE9D8]), "initWithMessage:makeAppFrontmost:", v3, 0);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__CSSiriDebugConnection_launchSiriDebugAppWithMessage___block_invoke;
    v10[3] = &unk_1E7C292C8;
    v11 = v3;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __55__CSSiriDebugConnection_launchSiriDebugAppWithMessage___block_invoke_20;
    v8[3] = &unk_1E7C23CB8;
    v9 = v11;
    objc_msgSend(v5, "handleSiriRequest:deliveryHandler:completionHandler:", v6, v10, v8);

  }
}

+ (void)launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  id v4;

  +[CSSiriDebugConnection _getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:](CSSiriDebugConnection, "_getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:", *(_QWORD *)&a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CSSiriDebugConnection launchSiriDebugAppWithMessage:](CSSiriDebugConnection, "launchSiriDebugAppWithMessage:", v4);

}

+ (id)_getFalseRejectBannerCommandWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.siri.SiriDebug.FeedbackBanner.NearMiss.Notify?triggeredPhraseId={TRIGGERED_PHRASE_ID}&triggerScore={TRIGGER_SCORE}"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{TRIGGERED_PHRASE_ID}"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{TRIGGER_SCORE}"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __55__CSSiriDebugConnection_launchSiriDebugAppWithMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "+[CSSiriDebugConnection launchSiriDebugAppWithMessage:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s %@ task delivered.", (uint8_t *)&v4, 0x16u);
  }
}

void __55__CSSiriDebugConnection_launchSiriDebugAppWithMessage___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315906;
    v10 = "+[CSSiriDebugConnection launchSiriDebugAppWithMessage:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ completed with response %@ and error %@.", (uint8_t *)&v9, 0x2Au);
  }

}

@end
