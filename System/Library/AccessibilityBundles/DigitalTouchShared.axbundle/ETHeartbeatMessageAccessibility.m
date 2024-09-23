@implementation ETHeartbeatMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETHeartbeatMessage");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETHeartbeatMessage"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETHeartbeatMessage"), CFSTR("ETMessage"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETHeartbeatMessage"), CFSTR("_displayInScene: useDuration: fastStart:"), "v", "@", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETHeartbeatMessage"), CFSTR("stopPlaying"), "v", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("heartbeat.label"));
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(CFSTR("heartbeat"));
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  ETHeartbeatMessageAccessibility *v15;
  BOOL v16;
  BOOL v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityPostNotification(0x418u, 0);
    _axSetIsWaitingOnETMessageStart(1);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __73__ETHeartbeatMessageAccessibility__displayInScene_useDuration_fastStart___block_invoke;
    v13 = &unk_2501F5F50;
    v16 = v6;
    v17 = v5;
    v14 = v8;
    v15 = self;
    AXPerformBlockOnMainThreadAfterDelay();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ETHeartbeatMessageAccessibility;
    -[ETHeartbeatMessageAccessibility _displayInScene:useDuration:fastStart:](&v9, sel__displayInScene_useDuration_fastStart_, v8, v6, v5);
  }

}

uint64_t __73__ETHeartbeatMessageAccessibility__displayInScene_useDuration_fastStart___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 49);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)ETHeartbeatMessageAccessibility;
  objc_msgSendSuper2(&v5, sel__displayInScene_useDuration_fastStart_, v1, v2, v3);
  return _axSetIsWaitingOnETMessageStart(0);
}

- (void)stopPlaying
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ETHeartbeatMessageAccessibility;
  -[ETHeartbeatMessageAccessibility stopPlaying](&v2, sel_stopPlaying);
  UIAccessibilityPostNotification(0x419u, 0);
}

@end
