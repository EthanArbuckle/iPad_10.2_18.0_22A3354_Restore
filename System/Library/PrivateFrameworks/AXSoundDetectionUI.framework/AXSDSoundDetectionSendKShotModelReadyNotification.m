@implementation AXSDSoundDetectionSendKShotModelReadyNotification

void __AXSDSoundDetectionSendKShotModelReadyNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();

  }
}

@end
