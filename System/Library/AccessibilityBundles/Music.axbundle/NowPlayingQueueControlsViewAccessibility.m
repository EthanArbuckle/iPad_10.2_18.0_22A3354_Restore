@implementation NowPlayingQueueControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingQueueControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("autoPlayState"), "Optional<Bool>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("autoPlayButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("shuffleButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("repeatButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("accessibilityShuffleType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.NowPlayingQueueControlsView"), CFSTR("accessibilityRepeatType"), "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  -[NowPlayingQueueControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[NowPlayingQueueControlsViewAccessibility _setupAutoPlayButton](self, "_setupAutoPlayButton");
  -[NowPlayingQueueControlsViewAccessibility _setupShuffleButton](self, "_setupShuffleButton");
  -[NowPlayingQueueControlsViewAccessibility _setupRepeatButton](self, "_setupRepeatButton");
}

- (void)_setupAutoPlayButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[NowPlayingQueueControlsViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("autoPlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityMusicLocalizedString(CFSTR("autoplay.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke;
  v7[3] = &unk_2502C2548;
  v7[4] = self;
  objc_msgSend(v3, "setAccessibilityTraitsBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke_2;
  v6[3] = &unk_2502C2520;
  v6[4] = self;
  objc_msgSend(v3, "setAccessibilityValueBlock:", v6);

}

unint64_t __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  v2 = (*MEMORY[0x24BDF73B0] | (unint64_t)objc_msgSendSuper2(&v7, sel_accessibilityTraits) | *MEMORY[0x24BDF7430]) & ~*MEMORY[0x24BDF7400];
  objc_msgSend(*(id *)(a1 + 32), "safeSwiftOptionalBoolForKey:", CFSTR("autoPlayState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  v5 = v4 | v2;

  return v5;
}

id __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "safeSwiftOptionalBoolForKey:", CFSTR("autoPlayState"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "BOOLValue"))
      v3 = CFSTR("autoplay.on");
    else
      v3 = CFSTR("autoplay.off");
    accessibilityMusicLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setupShuffleButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[NowPlayingQueueControlsViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("shuffleButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityMusicLocalizedString(CFSTR("shuffle.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke;
  v7[3] = &unk_2502C2548;
  v7[4] = self;
  objc_msgSend(v3, "setAccessibilityTraitsBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke_2;
  v6[3] = &unk_2502C2520;
  v6[4] = self;
  objc_msgSend(v3, "setAccessibilityValueBlock:", v6);

}

unint64_t __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  return (*MEMORY[0x24BDF73B0] | (unint64_t)objc_msgSendSuper2(&v2, sel_accessibilityTraits) | *MEMORY[0x24BDF7430]) & ~*MEMORY[0x24BDF7400];
}

id __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke_2(uint64_t a1)
{
  unint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("accessibilityShuffleType"));
  if (v1 > 2)
  {
    v2 = 0;
  }
  else
  {
    accessibilityMusicLocalizedString(off_2502C2568[v1]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_setupRepeatButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[NowPlayingQueueControlsViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("repeatButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityMusicLocalizedString(CFSTR("repeat.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke;
  v7[3] = &unk_2502C2548;
  v7[4] = self;
  objc_msgSend(v3, "setAccessibilityTraitsBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke_2;
  v6[3] = &unk_2502C2520;
  v6[4] = self;
  objc_msgSend(v3, "setAccessibilityValueBlock:", v6);

}

unint64_t __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  return (*MEMORY[0x24BDF73B0] | (unint64_t)objc_msgSendSuper2(&v2, sel_accessibilityTraits) | *MEMORY[0x24BDF7430]) & ~*MEMORY[0x24BDF7400];
}

id __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  __CFString *v3;

  v1 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("accessibilityRepeatType"));
  v2 = CFSTR("repeat.off");
  if (v1 == 1)
    v2 = CFSTR("repeat.one");
  if (v1 == 2)
    v3 = CFSTR("repeat.all");
  else
    v3 = (__CFString *)v2;
  accessibilityMusicLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
