@implementation PUTrimToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUTrimToolController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("_handlePlayPauseButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("playerWrapper"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXTrimToolPlayerWrapper"), CFSTR("isPlaying"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("focusTimeline:presentAction:locationInTimeline:"), "v", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("_handleScrubberTimelineOverlayButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("keyTime"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("trimScrubberTimelineOverlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("trimScrubberTimelineOverlayButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTrimToolController"), CFSTR("focusTimelineAction"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFocusTimelineAction"), CFSTR("kind"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUTrimToolController"), CFSTR("_trimScrubber"), "PXLivePhotoTrimScrubber");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PUTrimToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_handlePlayPauseButton:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility _handlePlayPauseButton:](&v8, sel__handlePlayPauseButton_, a3);
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trimScrubber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73E8] & v5) != 0)
    v6 = ~*MEMORY[0x24BDF73E8];
  else
    v6 = -1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__PUTrimToolControllerAccessibility__handlePlayPauseButton___block_invoke;
  v7[3] = &__block_descriptor_40_e5_Q8__0l;
  v7[4] = v6 & v5;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v7);
  -[PUTrimToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");

}

uint64_t __60__PUTrimToolControllerAccessibility__handlePlayPauseButton___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __79__PUTrimToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10 = &unk_24FF15050;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &v7);
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trimScrubberTimelineOverlayView"), v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trimScrubberTimelineOverlayButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", objc_msgSend(v5, "_accessibilityViewIsVisible"));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __79__PUTrimToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("playerWrapper"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isPlaying")))
    v3 = CFSTR("pause.button");
  else
    v3 = CFSTR("play.button");
  accessibilityPULocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)focusTimeline:(id)a3 presentAction:(id)a4 locationInTimeline:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  double (*v24)(uint64_t);
  void *v25;
  id v26;
  CMTime *p_time;
  CMTime time;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMTime v33;
  objc_super v34;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility focusTimeline:presentAction:locationInTimeline:](&v34, sel_focusTimeline_presentAction_locationInTimeline_, v9, v10, x, y);
  -[PUTrimToolControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trimScrubber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "accessibilityTraits");
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trimScrubberTimelineOverlayButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("kind"));
  v15 = *MEMORY[0x24BDF73E8];
  v16 = MEMORY[0x24BDAC760];
  if (v14)
  {
    v17 = v12 & ~v15;
  }
  else
  {
    time.value = 0;
    *(_QWORD *)&time.timescale = &time;
    time.epoch = 0x3810000000;
    v29 = &unk_230BF71E9;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke;
    v25 = &unk_24FF14FC8;
    p_time = &time;
    v26 = v11;
    AXPerformSafeBlock();
    v17 = v15 | v12;
    v33 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);

    _Block_object_dispose(&time, 8);
    time = v33;
    CMTimeGetSeconds(&time);
    UIAXTimeStringForDuration();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_2;
    v20[3] = &unk_24FF15280;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    objc_msgSend(v13, "_setAccessibilityLabelBlock:", v20);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v13);

  }
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_3;
  v19[3] = &__block_descriptor_40_e5_Q8__0l;
  v19[4] = v17;
  objc_msgSend(v11, "_setAccessibilityTraitsBlock:", v19);

}

double __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "keyTime");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

id __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_2()
{
  void *v0;
  void *v1;

  accessibilityPULocalizedString(CFSTR("delete.focus"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __84__PUTrimToolControllerAccessibility_focusTimeline_presentAction_locationInTimeline___block_invoke_3(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (void)_handleScrubberTimelineOverlayButton:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUTrimToolControllerAccessibility;
  -[PUTrimToolControllerAccessibility _handleScrubberTimelineOverlayButton:](&v10, sel__handleScrubberTimelineOverlayButton_, a3);
  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("focusTimelineAction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("kind"));

  -[PUTrimToolControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trimScrubber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityTraits");
  if (!v5)
  {
    accessibilityPULocalizedString(CFSTR("deleted.focus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    v7 &= ~*MEMORY[0x24BDF73E8];
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__PUTrimToolControllerAccessibility__handleScrubberTimelineOverlayButton___block_invoke;
  v9[3] = &__block_descriptor_40_e5_Q8__0l;
  v9[4] = v7;
  objc_msgSend(v6, "_setAccessibilityTraitsBlock:", v9);

}

uint64_t __74__PUTrimToolControllerAccessibility__handleScrubberTimelineOverlayButton___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

@end
