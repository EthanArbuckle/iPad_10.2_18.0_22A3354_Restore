@implementation SoundDetectionSendNotification

id ___SoundDetectionSendNotification_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("NotifiedDetector");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void ___SoundDetectionSendNotification_block_invoke_130(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  double Current;
  void *v8;
  void *v9;

  v2 = a2;
  if (v2)
  {
    AXLogUltron();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0CDB0], "soundDetection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BE0CD80]);
    Current = CFAbsoluteTimeGetCurrent();
    bmTypeForSoundDetectionType();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithAbsoluteTimestamp:type:customName:", v8, 0, Current);

    objc_msgSend(v5, "sendEvent:", v9);
  }

}

@end
