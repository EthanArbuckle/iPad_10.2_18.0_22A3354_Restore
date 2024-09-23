@implementation CSFVoiceTriggerEventInfoSelfLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_5606 != -1)
    dispatch_once(&sharedLogger_onceToken_5606, &__block_literal_global_5607);
  return (id)sharedLogger_sharedInstance;
}

void __50__CSFVoiceTriggerEventInfoSelfLogger_sharedLogger__block_invoke()
{
  CSFVoiceTriggerEventInfoSelfLoggerEmbedded *v0;
  void *v1;
  CSFVoiceTriggerEventInfoSelfLoggerDarwin *v2;
  void *v3;

  v0 = objc_alloc_init(CSFVoiceTriggerEventInfoSelfLoggerEmbedded);
  v1 = (void *)sharedLogger_sharedInstance;
  sharedLogger_sharedInstance = (uint64_t)v0;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v2 = objc_alloc_init(CSFVoiceTriggerEventInfoSelfLoggerDarwin);
    v3 = (void *)sharedLogger_sharedInstance;
    sharedLogger_sharedInstance = (uint64_t)v2;

  }
}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logStartEventWithFirstPassStartedInfo:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 45, "NO");
}

- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTriggerEventWithVTEI:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 49, "NO");
}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logRejectEventWithVTEI:withMHUUID:withSecondPassResult:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 54, "NO");
}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logCancelledEventWithMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 58, "NO");
}

- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5
{
  id v5;

  v5 = a5;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 62, "NO");
}

- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4
{
  id v4;

  v4 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotStartEventWithPromptType:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 66, "NO");
}

- (void)logTwoShotDetectedWithMHUUID:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotDetectedWithMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 70, "NO");
}

- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logSiriLaunchStartedWithVoiceTriggerEventInfo:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 74, "NO");
}

- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logSiriLaunchCompletedWithVoiceTriggerEventInfo:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 78, "NO");
}

@end
