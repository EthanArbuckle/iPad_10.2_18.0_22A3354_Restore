@implementation AVPlayerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlayer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayer"), CFSTR("_advanceCurrentItemAccordingToFigPlaybackItem:"), "v", "^{OpaqueFigPlaybackItem=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayer"), CFSTR("actionAtItemEnd"), "q", 0);

}

- (void)_advanceCurrentItemAccordingToFigPlaybackItem:(OpaqueFigPlaybackItem *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerAccessibility;
  -[AVPlayerAccessibility _advanceCurrentItemAccordingToFigPlaybackItem:](&v3, sel__advanceCurrentItemAccordingToFigPlaybackItem_, a3);
}

- (AVPlayerAccessibility)init
{
  AVPlayerAccessibility *v2;
  AVPlayerAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerAccessibility;
  v2 = -[AVPlayerAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVPlayerAccessibility _accessibilityAsyncObserveAVPlayerIfNeeded](v2, "_accessibilityAsyncObserveAVPlayerIfNeeded");

  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  id v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerAccessibility;
  v4 = a3;
  -[AVPlayerAccessibility willChangeValueForKey:](&v6, sel_willChangeValueForKey_, v4);
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("currentItem"), v6.receiver, v6.super_class);

  if (v5)
    -[AVPlayerAccessibility _accessibilityAsyncObserveAVPlayerIfNeeded](self, "_accessibilityAsyncObserveAVPlayerIfNeeded");
}

- (void)_accessibilityAsyncObserveAVPlayerIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__AVPlayerAccessibility__accessibilityAsyncObserveAVPlayerIfNeeded__block_invoke;
  block[3] = &unk_2501404A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __67__AVPlayerAccessibility__accessibilityAsyncObserveAVPlayerIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL8 IsVoiceOverRunning;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  _BOOL8 v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (UIAccessibilityIsVoiceOverRunning()
    || (+[AXAVFoundationMediaDescriptionManager sharedManager](AXAVFoundationMediaDescriptionManager, "sharedManager"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v3 = objc_msgSend(v2, "isVoiceOverInTheTripleClickMenu"), v2, v3))
  {
    AXRuntimeLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
      +[AXAVFoundationMediaDescriptionManager sharedManager](AXAVFoundationMediaDescriptionManager, "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218496;
      v13 = v5;
      v14 = 2048;
      v15 = IsVoiceOverRunning;
      v16 = 2048;
      v17 = objc_msgSend(v7, "isVoiceOverInTheTripleClickMenu");
      _os_log_impl(&dword_23238A000, v4, OS_LOG_TYPE_DEFAULT, "AX will begin observing player=%p because UIAccessibilityIsVoiceOverRunning=%ld or isVoiceOverInTheTripleClickMenu=%ld", (uint8_t *)&v12, 0x20u);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("AXBeganObservingKey")) & 1) == 0)
    {
      +[AXAVFoundationMediaDescriptionManager sharedManager](AXAVFoundationMediaDescriptionManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "beginObservingPlayer:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", v9, CFSTR("AXBeganObservingKey"));
    }
  }
  else
  {
    AXRuntimeLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_23238A000, v10, OS_LOG_TYPE_DEFAULT, "AX will not begin observing player=%p because UIAccessibilityIsVoiceOverRunning=0 and isVoiceOverInTheTripleClickMenu=0", (uint8_t *)&v12, 0xCu);
    }

  }
}

@end
