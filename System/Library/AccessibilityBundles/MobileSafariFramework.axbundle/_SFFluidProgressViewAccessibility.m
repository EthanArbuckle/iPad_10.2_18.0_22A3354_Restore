@implementation _SFFluidProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFFluidProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("fluidProgressController:setProgressToCurrentPosition:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("fluidProgressControllerFinishProgressBar:animateFillFade:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("fluidProgressController:startFluidProgressBar:animateFillFade:"), "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("_finishProgressBarWithDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("fluidProgressController:updateFluidProgressBar:completion:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WBSFluidProgressState"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFFluidProgressView"), CFSTR("_clippingView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSFluidProgressState"), CFSTR("fluidProgressValue"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSFluidProgressState"), CFSTR("hasCompletedLoad"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFluidProgressView"), CFSTR("_progressBarBoundsForValue:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", 0);

}

- (id)_axProgressTimer
{
  JUMPOUT(0x2349157A0);
}

- (void)_axSetProgressTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (CGRect)_progressBarBoundsForValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  UIAccessibilityNotifications v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;
  CGRect result;

  v23 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility _progressBarBoundsForValue:](&v20, sel__progressBarBoundsForValue_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible")&& vabdd_f64(*(double *)&_progressBarBoundsForValue__LastProgressValue, a3) > 0.05)
  {
    AXLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v22 = a3;
      _os_log_impl(&dword_2327A6000, v13, OS_LOG_TYPE_INFO, "Sending fluid progress notification in progressBar: %f", buf, 0xCu);
    }

    v14 = *MEMORY[0x24BEBB1F8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v14, v15);

    _progressBarBoundsForValue__LastProgressValue = *(_QWORD *)&a3;
  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_finishProgressBarWithDuration:(double)a3
{
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  _SFFluidProgressViewAccessibility *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility _finishProgressBarWithDuration:](&v7, sel__finishProgressBarWithDuration_);
  if (-[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_2327A6000, v5, OS_LOG_TYPE_INFO, "Progress bar done after: %@ %@", buf, 0x16u);

    }
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5
{
  id v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[16];
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility fluidProgressController:updateFluidProgressBar:completion:](&v13, sel_fluidProgressController_updateFluidProgressBar_completion_, a3, v8, a5);
  objc_msgSend(v8, "fluidProgressValue");
  if (v9 > 0.0
    && -[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))
  {
    -[_SFFluidProgressViewAccessibility _axHandleProgressStart:](self, "_axHandleProgressStart:", v8);
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2327A6000, v10, OS_LOG_TYPE_INFO, "Fluid progress notification posted", buf, 2u);
    }

  }
  else if (objc_msgSend(v8, "safeBoolForKey:", CFSTR("hasCompletedLoad")))
  {
    -[_SFFluidProgressViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("StartedFluidProgress"));
    AXLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2327A6000, v11, OS_LOG_TYPE_INFO, "Completed load, marking started", buf, 2u);
    }

    AXPerformBlockOnMainThreadAfterDelay();
  }

}

- (void)_axCheckProgress
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  int v11;
  NSObject *v12;
  UIAccessibilityNotifications v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  buf[0] = 0;
  -[_SFFluidProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "fluidProgressValue");
    *(_DWORD *)buf = 134217984;
    v18 = v6;
    _os_log_impl(&dword_2327A6000, v5, OS_LOG_TYPE_INFO, "Check progress in axtimer: %f", buf, 0xCu);
  }

  objc_msgSend(v4, "fluidProgressValue");
  if (!v4)
    goto LABEL_8;
  v8 = v7;
  -[_SFFluidProgressViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_clippingView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "_accessibilityViewIsVisible")
    || (objc_msgSend(v4, "fluidProgressValue"), v10 == 1.0)
    || objc_msgSend(v4, "hasCompletedLoad"))
  {

LABEL_8:
    -[_SFFluidProgressViewAccessibility _axHandleProgressComplete](self, "_axHandleProgressComplete");
    goto LABEL_9;
  }
  v11 = objc_msgSend(v4, "hasCanceledLoad");

  if (v11)
    goto LABEL_8;
  if (v8 > 0.0)
  {
    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v8;
      _os_log_impl(&dword_2327A6000, v12, OS_LOG_TYPE_INFO, "Sending fluid progress notification in setProgress: %f", buf, 0xCu);
    }

    -[_SFFluidProgressViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("StartedFluidProgress"));
    v13 = *MEMORY[0x24BEBB1F8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v13, v14);

    -[_SFFluidProgressViewAccessibility _axProgressTimer](self, "_axProgressTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53___SFFluidProgressViewAccessibility__axCheckProgress__block_invoke;
    v16[3] = &unk_2502969E8;
    v16[4] = self;
    objc_msgSend(v15, "afterDelay:processBlock:", v16, 0.1);

  }
LABEL_9:

}

- (void)_axHandleProgressStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  UIAccessibilityNotifications v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))
  {
    -[_SFFluidProgressViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("StartedFluidProgress"));
    v18[0] = CFSTR("progress");
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "fluidProgressValue");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("url");
    v19[0] = v6;
    objc_msgSend(v4, "loadURL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_250296D50;
    if (v7)
      v9 = (const __CFString *)v7;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(0x430u, v10);

    v11 = *MEMORY[0x24BEBB1F8];
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "fluidProgressValue");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v11, v13);

    AXLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "fluidProgressValue");
      v16 = 134217984;
      v17 = v15;
      _os_log_impl(&dword_2327A6000, v14, OS_LOG_TYPE_INFO, "Marking fluid progress in start: %f", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];
  objc_super v17;

  v5 = a5;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility fluidProgressController:startFluidProgressBar:animateFillFade:](&v17, sel_fluidProgressController_startFluidProgressBar_animateFillFade_, a3, v8, v5);
  if (-[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))
  {
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2327A6000, v9, OS_LOG_TYPE_INFO, "Start fluid progress", buf, 2u);
    }

    -[_SFFluidProgressViewAccessibility _axProgressTimer](self, "_axProgressTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x24BE005F0]);
      v12 = (void *)objc_msgSend(v11, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
      -[_SFFluidProgressViewAccessibility _axSetProgressTimer:](self, "_axSetProgressTimer:", v12);

    }
    objc_msgSend(v8, "fluidProgressValue");
    if (v13 > 0.0)
      -[_SFFluidProgressViewAccessibility _axHandleProgressStart:](self, "_axHandleProgressStart:", v8);
    -[_SFFluidProgressViewAccessibility _axProgressTimer](self, "_axProgressTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __99___SFFluidProgressViewAccessibility_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke;
    v15[3] = &unk_2502969E8;
    v15[4] = self;
    objc_msgSend(v14, "afterDelay:processBlock:", v15, 0.1);

  }
}

- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4
{
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFFluidProgressViewAccessibility;
  -[_SFFluidProgressViewAccessibility fluidProgressControllerFinishProgressBar:animateFillFade:](&v7, sel_fluidProgressControllerFinishProgressBar_animateFillFade_, a3, a4);
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2327A6000, v5, OS_LOG_TYPE_INFO, "Fluid progress finish", v6, 2u);
  }

  -[_SFFluidProgressViewAccessibility _axHandleProgressComplete](self, "_axHandleProgressComplete");
}

- (void)_axHandleProgressComplete
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[_SFFluidProgressViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("StartedFluidProgress")))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], &unk_25029DDD8);
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2327A6000, v3, OS_LOG_TYPE_INFO, "Posting finish notification during finish progress", v4, 2u);
    }

  }
  -[_SFFluidProgressViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("StartedFluidProgress"));
}

- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4
{
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  UIAccessibilityNotifications v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)_SFFluidProgressViewAccessibility;
  v6 = a4;
  -[_SFFluidProgressViewAccessibility fluidProgressController:setProgressToCurrentPosition:](&v13, sel_fluidProgressController_setProgressToCurrentPosition_, a3, v6);
  objc_msgSend(v6, "fluidProgressValue", v13.receiver, v13.super_class);
  v8 = v7;

  AXLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2327A6000, v9, OS_LOG_TYPE_INFO, "Fluid progress updated position", buf, 2u);
  }

  if (-[_SFFluidProgressViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible")&& v8 > 0.0)
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v8;
      _os_log_impl(&dword_2327A6000, v10, OS_LOG_TYPE_INFO, "Sending fluid progress notification in setProgress: %f", buf, 0xCu);
    }

    -[_SFFluidProgressViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("StartedFluidProgress"));
    v11 = *MEMORY[0x24BEBB1F8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v11, v12);

  }
}

@end
