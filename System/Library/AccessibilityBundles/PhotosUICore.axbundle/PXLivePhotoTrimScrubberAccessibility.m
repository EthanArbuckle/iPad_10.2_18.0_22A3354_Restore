@implementation PXLivePhotoTrimScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXLivePhotoTrimScrubber");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_PXLivePhotoTrimScrubber_commonInit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("keyTime"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("trimStartTime"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("trimEndTime"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("setKeyTime:"), "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("setTrimStartTime:"), "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("setTrimEndTime:"), "v", "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("handleEndTracking:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_trimEndHandle"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_trimStartHandle"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_photoLoupe"), "PXLivePhotoTrimScrubberLoupeView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_trimControlHiddenHelper"), "PXLivePhotoTrimScrubberHiddenAnimationHelper");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubberHiddenAnimationHelper"), CFSTR("hidden"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXLivePhotoTrimScrubber"), CFSTR("_trackingElement"), "q", 0);

}

- (id)_accessibilityTimeForCMTime:(id *)a3
{
  CMTime v4;

  v4 = *(CMTime *)a3;
  CMTimeGetSeconds(&v4);
  UIAXTimeStringForDuration();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_loadStartTrimAX
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id from;
  _QWORD v18[4];
  id v19;
  id location;

  -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_trimStartHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityPULocalizedString(CFSTR("start.trim.handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0] | v5);
  objc_msgSend(v3, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_24FF14700);
  objc_initWeak(&location, v3);
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke;
  v18[3] = &unk_24FF06D40;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "_setAccessibilityActivationPointBlock:", v18);
  objc_initWeak(&from, self);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_2;
  v15[3] = &unk_24FF06D90;
  objc_copyWeak(&v16, &from);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v15);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_4;
  v12[3] = &unk_24FF06DE0;
  objc_copyWeak(&v14, &from);
  v12[4] = self;
  v7 = v3;
  v13 = v7;
  objc_msgSend(v7, "_accessibilitySetActionBlock:withValue:forKey:", v12, 0, *MEMORY[0x24BEBAFD8]);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_8;
  v9[3] = &unk_24FF06DE0;
  objc_copyWeak(&v11, &from);
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  objc_msgSend(v8, "_accessibilitySetActionBlock:withValue:forKey:", v9, 0, *MEMORY[0x24BEBAF80]);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

double __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double v3;
  double v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "frame");
  v4 = v3;
  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "center");

  return v4;
}

id __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)&v7 = 0;
  *((_QWORD *)&v7 + 1) = &v7;
  v8 = 0x3810000000;
  v9 = "";
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5 = MEMORY[0x24BDAC760];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  v13 = *(_OWORD *)(*((_QWORD *)&v7 + 1) + 32);
  v14 = *(_QWORD *)(*((_QWORD *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  WeakRetained = objc_loadWeakRetained(v1);
  v7 = v13;
  v8 = v14;
  objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_3, &unk_24FF06D68, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimStartTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

uint64_t __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CMTimeValue v5;
  CMTimeScale v6;
  double v7;
  Float64 Seconds;
  id v10;
  id v11;
  CMTime v12;
  CMTime v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CMTime *p_time;
  id v19[6];
  id v20;
  CMTime time;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CMTime v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v22 = "";
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v4 = MEMORY[0x24BDAC760];
  v19[1] = (id)MEMORY[0x24BDAC760];
  v19[2] = (id)3221225472;
  v19[3] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_5;
  v19[4] = &unk_24FF06D68;
  v19[5] = &time;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v26 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v20);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v22 = "";
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v14 = v4;
  v15 = 3221225472;
  v16 = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_6;
  v17 = &unk_24FF06D68;
  p_time = &time;
  objc_copyWeak(v19, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v5 = *(_QWORD *)(*(_QWORD *)&time.timescale + 32);
  v6 = *(_DWORD *)(*(_QWORD *)&time.timescale + 40);
  v27 = *(_QWORD *)(*(_QWORD *)&time.timescale + 44);
  v28 = *(_DWORD *)(*(_QWORD *)&time.timescale + 52);
  objc_destroyWeak(v19);
  _Block_object_dispose(&time, 8);
  time.value = v5;
  *(_QWORD *)&time.flags = v27;
  time.timescale = v6;
  HIDWORD(time.epoch) = v28;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v7 = 0.1;
  else
    v7 = 1.0;
  memset(&time, 0, sizeof(time));
  v13 = v26;
  Seconds = CMTimeGetSeconds(&v13);
  CMTimeMakeWithSeconds(&time, v7 + Seconds, v6);
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v12 = time;
  v10 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v11);
  return 1;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimStartTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_7(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "setTrimStartTime:", &v9);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "trimScrubber:didEndInteractivelyEditingElement:successful:", v6, 1, 1);

  v7 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v7, "_accessibilityTimeForCMTime:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

uint64_t __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CMTimeValue v5;
  CMTimeScale v6;
  double v7;
  Float64 Seconds;
  id v10;
  id v11;
  CMTime v12;
  CMTime time2;
  CMTime time1;
  CMTime v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  CMTime *p_time;
  id v21[6];
  id v22;
  CMTime time;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CMTime v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v24 = "";
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v4 = MEMORY[0x24BDAC760];
  v21[1] = (id)MEMORY[0x24BDAC760];
  v21[2] = (id)3221225472;
  v21[4] = &unk_24FF06D68;
  v21[5] = &time;
  v21[3] = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_9;
  objc_copyWeak(&v22, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v28 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v22);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v24 = "";
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v16 = v4;
  v17 = 3221225472;
  v18 = __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_10;
  v19 = &unk_24FF06D68;
  p_time = &time;
  objc_copyWeak(v21, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v5 = *(_QWORD *)(*(_QWORD *)&time.timescale + 32);
  v6 = *(_DWORD *)(*(_QWORD *)&time.timescale + 40);
  v29 = *(_QWORD *)(*(_QWORD *)&time.timescale + 44);
  v30 = *(_DWORD *)(*(_QWORD *)&time.timescale + 52);
  objc_destroyWeak(v21);
  _Block_object_dispose(&time, 8);
  time.value = v5;
  time.timescale = v6;
  *(_QWORD *)&time.flags = v29;
  HIDWORD(time.epoch) = v30;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v7 = 0.1;
  else
    v7 = 1.0;
  memset(&time, 0, sizeof(time));
  v15 = v28;
  Seconds = CMTimeGetSeconds(&v15);
  CMTimeMakeWithSeconds(&time, Seconds - v7, v6);
  memset(&v15, 0, sizeof(v15));
  CMTimeMakeWithSeconds(&v15, 0.0, v6);
  time1 = time;
  time2 = v15;
  if (CMTimeCompare(&time1, &time2) < 0)
    time = v15;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v12 = time;
  v10 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v11);
  return 1;
}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimStartTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __56__PXLivePhotoTrimScrubberAccessibility__loadStartTrimAX__block_invoke_11(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "setTrimStartTime:", &v9);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "trimScrubber:didEndInteractivelyEditingElement:successful:", v6, 1, 1);

  v7 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v7, "_accessibilityTimeForCMTime:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

- (void)_loadEndTrimAX
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id from;
  _QWORD v18[4];
  id v19;
  id location;

  -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_trimEndHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityPULocalizedString(CFSTR("end.trim.handle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0] | v5);
  objc_msgSend(v3, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_24FF14700);
  objc_initWeak(&location, v3);
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke;
  v18[3] = &unk_24FF06D40;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "_setAccessibilityActivationPointBlock:", v18);
  objc_initWeak(&from, self);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_2;
  v15[3] = &unk_24FF06D90;
  objc_copyWeak(&v16, &from);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v15);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_4;
  v12[3] = &unk_24FF06DE0;
  objc_copyWeak(&v14, &from);
  v12[4] = self;
  v7 = v3;
  v13 = v7;
  objc_msgSend(v7, "_accessibilitySetActionBlock:withValue:forKey:", v12, 0, *MEMORY[0x24BEBAFD8]);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_8;
  v9[3] = &unk_24FF06DE0;
  objc_copyWeak(&v11, &from);
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  objc_msgSend(v8, "_accessibilitySetActionBlock:withValue:forKey:", v9, 0, *MEMORY[0x24BEBAF80]);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

double __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  double MaxX;
  id v4;
  CGRect v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "frame");
  MaxX = CGRectGetMaxX(v6);
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "center");

  return MaxX;
}

id __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)&v7 = 0;
  *((_QWORD *)&v7 + 1) = &v7;
  v8 = 0x3810000000;
  v9 = "";
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5 = MEMORY[0x24BDAC760];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  v13 = *(_OWORD *)(*((_QWORD *)&v7 + 1) + 32);
  v14 = *(_QWORD *)(*((_QWORD *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  WeakRetained = objc_loadWeakRetained(v1);
  v7 = v13;
  v8 = v14;
  objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_3, &unk_24FF06D68, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

uint64_t __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CMTimeValue v5;
  CMTimeScale v6;
  double v7;
  Float64 Seconds;
  id v10;
  id v11;
  CMTime v12;
  CMTime time2;
  CMTime time1;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  CMTime *v19;
  id v20;
  CMTime v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  CMTime *p_time;
  id v27;
  CMTime time;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v29 = "";
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v4 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v25 = &unk_24FF06D68;
  p_time = &time;
  v24 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_5;
  objc_copyWeak(&v27, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v5 = *(_QWORD *)(*(_QWORD *)&time.timescale + 32);
  v6 = *(_DWORD *)(*(_QWORD *)&time.timescale + 40);
  v33 = *(_QWORD *)(*(_QWORD *)&time.timescale + 44);
  v34 = *(_DWORD *)(*(_QWORD *)&time.timescale + 52);
  objc_destroyWeak(&v27);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v29 = "";
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v15 = v4;
  v16 = 3221225472;
  v17 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_6;
  v18 = &unk_24FF06D68;
  v19 = &time;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v21 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v20);
  _Block_object_dispose(&time, 8);
  time.value = v5;
  time.timescale = v6;
  *(_QWORD *)&time.flags = v33;
  HIDWORD(time.epoch) = v34;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v7 = 0.1;
  else
    v7 = 1.0;
  memset(&time, 0, sizeof(time));
  time1.value = v5;
  time1.timescale = v6;
  *(_QWORD *)&time1.flags = v33;
  HIDWORD(time1.epoch) = v34;
  Seconds = CMTimeGetSeconds(&time1);
  CMTimeMakeWithSeconds(&time, v7 + Seconds, v6);
  time1 = time;
  time2 = v21;
  if (CMTimeCompare(&time1, &time2) >= 1)
    time = v21;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v12 = time;
  v10 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v11);
  return 1;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "untrimmedDuration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_7(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "setTrimEndTime:", &v9);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "trimScrubber:didEndInteractivelyEditingElement:successful:", v6, 2, 1);

  v7 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v7, "_accessibilityTimeForCMTime:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

uint64_t __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  CMTimeValue v4;
  CMTimeScale v5;
  double v6;
  Float64 Seconds;
  id v9;
  id v10;
  CMTime v11;
  CMTime v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CMTime *p_time;
  id v18;
  CMTime time;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v20 = "";
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_9;
  v16 = &unk_24FF06D68;
  p_time = &time;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v4 = *(_QWORD *)(*(_QWORD *)&time.timescale + 32);
  v5 = *(_DWORD *)(*(_QWORD *)&time.timescale + 40);
  v24 = *(_QWORD *)(*(_QWORD *)&time.timescale + 44);
  v25 = *(_DWORD *)(*(_QWORD *)&time.timescale + 52);
  objc_destroyWeak(&v18);
  _Block_object_dispose(&time, 8);
  time.value = v4;
  *(_QWORD *)&time.flags = v24;
  time.timescale = v5;
  HIDWORD(time.epoch) = v25;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v6 = 0.1;
  else
    v6 = 1.0;
  memset(&time, 0, sizeof(time));
  v12.value = v4;
  v12.timescale = v5;
  *(_QWORD *)&v12.flags = v24;
  HIDWORD(v12.epoch) = v25;
  Seconds = CMTimeGetSeconds(&v12);
  CMTimeMakeWithSeconds(&time, Seconds - v6, v5);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v11 = time;
  v9 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  return 1;
}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __54__PXLivePhotoTrimScrubberAccessibility__loadEndTrimAX__block_invoke_10(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "setTrimEndTime:", &v9);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "trimScrubber:didEndInteractivelyEditingElement:successful:", v6, 2, 1);

  v7 = *(void **)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v7, "_accessibilityTimeForCMTime:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

- (void)_loadKeyFrameAX
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_photoLoupe"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  accessibilityPULocalizedString(CFSTR("live.photo.keytime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0] | v5);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke;
  v15[3] = &unk_24FF06D90;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v15);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_3;
  v12[3] = &unk_24FF06DE0;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  v7 = v3;
  v13 = v7;
  objc_msgSend(v7, "_accessibilitySetActionBlock:withValue:forKey:", v12, 0, *MEMORY[0x24BEBAFD8]);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_7;
  v9[3] = &unk_24FF06DE0;
  objc_copyWeak(&v11, &location);
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  objc_msgSend(v8, "_accessibilitySetActionBlock:withValue:forKey:", v9, 0, *MEMORY[0x24BEBAF80]);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

id __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)&v7 = 0;
  *((_QWORD *)&v7 + 1) = &v7;
  v8 = 0x3810000000;
  v9 = "";
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5 = MEMORY[0x24BDAC760];
  v1 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  AXPerformSafeBlock();
  v13 = *(_OWORD *)(*((_QWORD *)&v7 + 1) + 32);
  v14 = *(_QWORD *)(*((_QWORD *)&v7 + 1) + 48);
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  WeakRetained = objc_loadWeakRetained(v1);
  v7 = v13;
  v8 = v14;
  objc_msgSend(WeakRetained, "_accessibilityTimeForCMTime:", &v7, v5, 3221225472, __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_2, &unk_24FF06D68, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "keyTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

BOOL __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  Float64 Seconds;
  int32_t v7;
  id v9;
  id v10;
  CMTime v11;
  CMTime time2;
  CMTime time1;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CMTime *v18;
  id v19;
  CMTime v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CMTime *p_time;
  id v26;
  CMTime time;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CMTime v32;

  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v28 = "";
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v4 = MEMORY[0x24BDAC760];
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v24 = &unk_24FF06D68;
  p_time = &time;
  v23 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_4;
  objc_copyWeak(&v26, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v32 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v26);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v28 = "";
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v14 = v4;
  v15 = 3221225472;
  v16 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_5;
  v17 = &unk_24FF06D68;
  v18 = &time;
  objc_copyWeak(&v19, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v20 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v19);
  _Block_object_dispose(&time, 8);
  time = v20;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v5 = 0.1;
  else
    v5 = 1.0;
  memset(&time, 0, sizeof(time));
  time1 = v32;
  Seconds = CMTimeGetSeconds(&time1);
  CMTimeMake(&time, (uint64_t)((v5 + Seconds) * 1000.0), 1000);
  time1 = time;
  time2 = v20;
  if (CMTimeCompare(&time1, &time2) >= 1)
    time = v20;
  time1 = time;
  time2 = v20;
  v7 = CMTimeCompare(&time1, &time2);
  if (v7 <= 0)
  {
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v11 = time;
    v9 = *(id *)(a1 + 40);
    AXPerformSafeBlock();

    objc_destroyWeak(&v10);
  }

  return v7 < 1;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "keyTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "trimScrubber:didBeginInteractivelyEditingElement:", v5, 3);

  v6 = objc_loadWeakRetained(v2);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v6, "setKeyTime:", &v10);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "handleEndTracking:", 1);

  v8 = *(void **)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v8, "_accessibilityTimeForCMTime:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakIfNotSpeaking();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

BOOL __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  Float64 Seconds;
  int32_t v7;
  id v9;
  id v10;
  CMTime v11;
  CMTime time2;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CMTime *v17;
  id v18;
  CMTime v19;
  CMTime v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CMTime *v25;
  id v26;
  CMTime v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  CMTime *p_time;
  id v33;
  CMTime time;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CMTime v39;

  v3 = a2;
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v35 = "";
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v4 = MEMORY[0x24BDAC760];
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v31 = &unk_24FF06D68;
  p_time = &time;
  v30 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_8;
  objc_copyWeak(&v33, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v39 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v33);
  _Block_object_dispose(&time, 8);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v35 = "";
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v21 = v4;
  v22 = 3221225472;
  v23 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_9;
  v24 = &unk_24FF06D68;
  v25 = &time;
  objc_copyWeak(&v26, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v27 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v26);
  _Block_object_dispose(&time, 8);
  time = v27;
  if (CMTimeGetSeconds(&time) <= 60.0)
    v5 = 0.1;
  else
    v5 = 1.0;
  memset(&v20, 0, sizeof(v20));
  time = v39;
  Seconds = CMTimeGetSeconds(&time);
  CMTimeMake(&v20, (uint64_t)((Seconds - v5) * 1000.0), 1000);
  time.value = 0;
  *(_QWORD *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v35 = "";
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v13 = v4;
  v14 = 3221225472;
  v15 = __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_10;
  v16 = &unk_24FF06D68;
  v17 = &time;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  AXPerformSafeBlock();
  v19 = *(CMTime *)(*(_QWORD *)&time.timescale + 32);
  objc_destroyWeak(&v18);
  _Block_object_dispose(&time, 8);
  time = v20;
  time2 = v19;
  if (CMTimeCompare(&time, &time2) < 0)
    v20 = v19;
  time = v20;
  time2 = v19;
  v7 = CMTimeCompare(&time, &time2);
  if ((v7 & 0x80000000) == 0)
  {
    objc_copyWeak(&v10, (id *)(a1 + 48));
    v11 = v20;
    v9 = *(id *)(a1 + 40);
    AXPerformSafeBlock();

    objc_destroyWeak(&v10);
  }

  return v7 >= 0;
}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "keyTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimEndTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "trimStartTime");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = v5;

}

void __55__PXLivePhotoTrimScrubberAccessibility__loadKeyFrameAX__block_invoke_11(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "trimScrubber:didBeginInteractivelyEditingElement:", v5, 3);

  v6 = objc_loadWeakRetained(v2);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v6, "setKeyTime:", &v10);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "handleEndTracking:", 1);

  v8 = *(void **)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v8, "_accessibilityTimeForCMTime:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakIfNotSpeaking();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberAccessibility;
  -[PXLivePhotoTrimScrubberAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PXLivePhotoTrimScrubberAccessibility _loadStartTrimAX](self, "_loadStartTrimAX");
  -[PXLivePhotoTrimScrubberAccessibility _loadEndTrimAX](self, "_loadEndTrimAX");
  -[PXLivePhotoTrimScrubberAccessibility _loadKeyFrameAX](self, "_loadKeyFrameAX");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPULocalizedString(CFSTR("live.photo.scrubber"));
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  CMTime rhs;
  CMTime v11;
  uint64_t v12;
  uint64_t v13;
  double (*v14)(uint64_t);
  void *v15;
  PXLivePhotoTrimScrubberAccessibility *v16;
  CMTime *v17;
  CMTime v18;
  uint64_t v19;
  uint64_t v20;
  double (*v21)(uint64_t);
  void *v22;
  PXLivePhotoTrimScrubberAccessibility *v23;
  CMTime *p_lhs;
  CMTime lhs;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CMTime v30;

  lhs.value = 0;
  *(_QWORD *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  v26 = "";
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v3 = MEMORY[0x24BDAC760];
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke;
  v22 = &unk_24FF067E0;
  v23 = self;
  p_lhs = &lhs;
  AXPerformSafeBlock();
  v30 = *(CMTime *)(*(_QWORD *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  lhs.value = 0;
  *(_QWORD *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  v26 = "";
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v12 = v3;
  v13 = 3221225472;
  v14 = __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_2;
  v15 = &unk_24FF067E0;
  v16 = self;
  v17 = &lhs;
  AXPerformSafeBlock();
  v18 = *(CMTime *)(*(_QWORD *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  memset(&v11, 0, sizeof(v11));
  lhs = v18;
  rhs = v30;
  CMTimeSubtract(&v11, &lhs, &rhs);
  lhs = v11;
  -[PXLivePhotoTrimScrubberAccessibility _accessibilityTimeForCMTime:](self, "_accessibilityTimeForCMTime:", &lhs);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lhs.value = 0;
  *(_QWORD *)&lhs.timescale = &lhs;
  lhs.epoch = 0x3810000000;
  v26 = "";
  v27 = 0;
  v28 = 0;
  v29 = 0;
  AXPerformSafeBlock();
  rhs = *(CMTime *)(*(_QWORD *)&lhs.timescale + 32);
  _Block_object_dispose(&lhs, 8);
  lhs = rhs;
  -[PXLivePhotoTrimScrubberAccessibility _accessibilityTimeForCMTime:](self, "_accessibilityTimeForCMTime:", &lhs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("live.photo.duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPULocalizedString(CFSTR("live.photo.keytime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "trimStartTime");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "trimEndTime");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

double __58__PXLivePhotoTrimScrubberAccessibility_accessibilityValue__block_invoke_3(uint64_t a1)
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

- (id)accessibilityHint
{
  void *v2;
  int v3;
  void *v4;

  -[PXLivePhotoTrimScrubberAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trimControlHiddenHelper"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hidden"));

  if (v3)
  {
    accessibilityPULocalizedString(CFSTR("scrubber.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[PXLivePhotoTrimScrubberAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73E8] & v4) == 0)
  {
    -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_trimStartHandle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v5);

    -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_photoLoupe"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v6);

    -[PXLivePhotoTrimScrubberAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_trimEndHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v7);

  }
  return v3;
}

- (void)_PXLivePhotoTrimScrubber_commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberAccessibility;
  -[PXLivePhotoTrimScrubberAccessibility _PXLivePhotoTrimScrubber_commonInit](&v3, sel__PXLivePhotoTrimScrubber_commonInit);
  -[PXLivePhotoTrimScrubberAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
