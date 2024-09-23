@implementation PHCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHCountdownView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAnnouncementTimer
{
  JUMPOUT(0x234912040);
}

- (void)_axSetAnnouncementTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownView"), CFSTR("pauseTimer"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownView"), CFSTR("startCountdown"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownView"), CFSTR("countdownViewModel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownView"), CFSTR("stop"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownView"), CFSTR("pause"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHCountdownViewModel"), CFSTR("playsSound"), "B", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PHCountdownViewModel"), CFSTR("countdown"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PHCountdownViewModel"), CFSTR("countdownString:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PHCountdownViewModel"), CFSTR("countdownTickDuration"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PHSOSDialCountdownViewModel"), CFSTR("PHCountdownViewModel"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("PHSOSNotifyCountdownViewModel"), CFSTR("PHCountdownViewModel"));

}

- (void)pause
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHCountdownViewAccessibility;
  -[PHCountdownViewAccessibility pause](&v2, sel_pause);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
}

- (void)stop
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHCountdownViewAccessibility;
  -[PHCountdownViewAccessibility stop](&v2, sel_stop);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHCountdownViewAccessibility;
  -[PHCountdownViewAccessibility dealloc](&v3, sel_dealloc);
}

- (void)startCountdown
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  __int128 *p_buf;
  objc_super v16;
  objc_super v17;
  __int128 buf;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[PHCountdownViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("countdownViewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning())
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("playsSound")) ^ 1;
  else
    v4 = 0;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2326BB000, v5, OS_LOG_TYPE_DEFAULT, "Are we quiet: %@", (uint8_t *)&buf, 0xCu);

  }
  if ((_DWORD)v4)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2326BB000, v7, OS_LOG_TYPE_DEFAULT, "Marking VO to be quiet since we're in quiet mode", (uint8_t *)&buf, 2u);
    }

    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetIsDictationListeningOverride:", MEMORY[0x24BDBD1C8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], &stru_250245590);
    v17.receiver = self;
    v17.super_class = (Class)PHCountdownViewAccessibility;
    -[PHCountdownViewAccessibility startCountdown](&v17, sel_startCountdown);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    v20 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("countdown"));
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_axAnnouncementString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    v16.receiver = self;
    v16.super_class = (Class)PHCountdownViewAccessibility;
    -[PHCountdownViewAccessibility startCountdown](&v16, sel_startCountdown);
    objc_msgSend(v3, "safeTimeIntervalForKey:", CFSTR("countdownTickDuration"));
    v10 = v9;
    v11 = (void *)MEMORY[0x24BDBCF40];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__PHCountdownViewAccessibility_startCountdown__block_invoke;
    v13[3] = &unk_250244FE0;
    v13[4] = self;
    p_buf = &buf;
    v14 = v3;
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v13, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCountdownViewAccessibility _axSetAnnouncementTimer:](self, "_axSetAnnouncementTimer:", v12);

    _Block_object_dispose(&buf, 8);
  }

}

void __46__PHCountdownViewAccessibility_startCountdown__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("pauseTimer")) & 1) == 0)
  {
    if (--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v3 = *(id *)(a1 + 40);
      AXPerformSafeBlock();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_axAnnouncementTimer");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "invalidate");
      objc_msgSend(*(id *)(a1 + 32), "_axSetAnnouncementTimer:", 0);

    }
  }
}

void __46__PHCountdownViewAccessibility_startCountdown__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "countdownString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
