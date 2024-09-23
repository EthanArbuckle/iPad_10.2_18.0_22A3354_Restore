@implementation SoundDetectionSendNotificationForCustomDetector

void ___SoundDetectionSendNotificationForCustomDetector_block_invoke(uint64_t a1, void *a2)
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

void ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Unable to send notification: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
