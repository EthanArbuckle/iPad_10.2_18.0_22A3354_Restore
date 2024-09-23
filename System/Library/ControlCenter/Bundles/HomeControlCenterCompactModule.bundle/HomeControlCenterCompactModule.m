void sub_230FD516C()
{
  void *v0;
  id v1;

  v1 = objc_alloc_init(MEMORY[0x24BE4F498]);
  objc_msgSend(MEMORY[0x24BE4F410], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setStatusBarVisibilityHandler:", v1);

}

void sub_230FD5B48(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "expandedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    objc_msgSend(v4, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentModuleContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestExpandModule");

  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "buttonView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);
  }

}

uint64_t sub_230FD5E88(uint64_t a1)
{
  _QWORD v2[5];
  _QWORD v3[4];
  uint64_t v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_230FD5F18;
  v3[3] = &unk_24FFD57F0;
  v4 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FD61AC;
  v2[3] = &unk_24FFD57C8;
  v2[4] = v4;
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v3, v2, 0.0, 0.0);
}

uint64_t sub_230FD5F18(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  v2 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230FD6008;
  v6[3] = &unk_24FFD57F0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6F90], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.0, 0.0);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = sub_230FD60B4;
  v5[3] = &unk_24FFD57F0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6F90], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.05, 0.95);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = sub_230FD6128;
  v4[3] = &unk_24FFD57F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.65, 0.35);
}

void sub_230FD6008(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "_iconViewInHomeGridCellFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

}

void sub_230FD60B4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_iconViewInNavigationHeaderViewFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

void sub_230FD6128(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  v2 = 1.0;
  if ((objc_msgSend(*(id *)(a1 + 32), "accessAllowedForCurrentLockState") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isDeviceUnlockedForModuleContentViewController:", *(_QWORD *)(a1 + 32)))
      v2 = 1.0;
    else
      v2 = 0.0;

  }
  objc_msgSend(*(id *)(a1 + 32), "expandedView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

}

void sub_230FD61AC(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dashboardContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  objc_msgSend(*(id *)(a1 + 32), "transitionIconView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

uint64_t sub_230FD6218(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  uint64_t v8;

  v2 = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FD62E0;
  v7[3] = &unk_24FFD57F0;
  v8 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230FD637C;
  v6[3] = &unk_24FFD57C8;
  v6[4] = v8;
  v7[0] = MEMORY[0x24BDAC760];
  objc_msgSend(MEMORY[0x24BDF6F90], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v7, v6, 0.0, 0.0);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = sub_230FD63E8;
  v5[3] = &unk_24FFD57F0;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v3, "addAnimations:", v5);
}

uint64_t sub_230FD62E0(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FD6348;
  v2[3] = &unk_24FFD57F0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.0, 0.5);
}

void sub_230FD6348(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "expandedView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_230FD637C(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dashboardContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void sub_230FD63E8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "buttonView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t sub_230FD641C(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "dashboardContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willFinishTransition:forCompactModule:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"), 1);

  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 40), sel_startAnimation);
}

void sub_230FD6934(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "launchHomeAppForModuleContentViewController:", WeakRetained);

}

uint64_t sub_230FD6B04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230FD7144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FD7160(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_230FD4000, v2, OS_LOG_TYPE_DEFAULT, "Lock state has changed, checking access.", v3, 2u);
  }

  objc_msgSend(WeakRetained, "_updateAccessAllowedForLockState");
}

void sub_230FD77A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_230FD77BC(uint64_t a1, int a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    HFLogForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_230FD85B4(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  return 0;
}

void sub_230FD7808(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(WeakRetained, "_configureAndAddRemoteViewController:forHome:", v3, *(_QWORD *)(a1 + 32));
  }
  else
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230FD85E8(v5, v6, v7, v8, v9, v10, v11, v12);

  }
}

void sub_230FD7A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FD7A40(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setTransitionSubviewFrames:", v3);

}

void sub_230FD7E08(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "serviceViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockAuthenticationCompleted:", a2);

}

void sub_230FD7F90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void HUCCPerformCommonInitialization()
{
  if (qword_255EB09F0 != -1)
    dispatch_once(&qword_255EB09F0, &unk_24FFD5968);
}

void sub_230FD7FC8()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE4D0B0], "configuration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "setAdaptive:", 1);
  objc_msgSend(MEMORY[0x24BE4D0B0], "setConfiguration:", v3);
  objc_msgSend(MEMORY[0x24BE4D0B0], "sharedDispatcher");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "warmup");

  objc_msgSend(MEMORY[0x24BE4D098], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRunningState:", 1);

}

void HUCCUpdateRunningState(int a1)
{
  HUCCUpdateRunningStateWithAppleMediaAccessories(a1, 0);
}

void HUCCUpdateRunningStateWithAppleMediaAccessories(int a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE4D098], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "runningState");

  if (v5 != (a1 ^ 1))
  {
    if (a1)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE4D060], "sharedManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "enableNotificationsForSelectedHomeWithReason:numberOfAppleMediaAccessories:", *MEMORY[0x24BE4CFE8], a2);

      }
      objc_msgSend(MEMORY[0x24BE4D098], "sharedInstance");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "executionEnvironmentWillEnterForeground");
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x24BE4D098], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executionEnvironmentDidEnterBackground");

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE4D060], "sharedManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "disableNotificationsForSelectedHomeWithReason:", *MEMORY[0x24BE4CFE0]);
LABEL_9:

    }
  }
}

void launchHomeAppForModuleViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (a2)
  {
    v4 = a2;
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_230FD4000, v5, OS_LOG_TYPE_DEFAULT, "Launching Home app for moduleViewController %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("com.apple.home://"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:completionHandler:", v6, 0);

  }
}

const __CFString *HUCCStringForOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return *(&off_24FFD5988 + a1 - 1);
}

void sub_230FD8504(uint64_t a1, SEL aSelector, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(aSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_230FD4000, a3, OS_LOG_TYPE_ERROR, "%@ Asked for %@ before transition subview frames were set!", (uint8_t *)&v6, 0x16u);

}

void sub_230FD85B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FD7F90(&dword_230FD4000, a1, a3, "Timeout trying to load Remote Dashboard View Controller", a5, a6, a7, a8, 0);
}

void sub_230FD85E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FD7F90(&dword_230FD4000, a1, a3, "Unable to load Remote Dashboard View Controller", a5, a6, a7, a8, 0);
}

void sub_230FD861C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230FD4000, a2, OS_LOG_TYPE_ERROR, "Remote Dashboard View Controller View Service terminated  (error: %@)", (uint8_t *)&v2, 0xCu);
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return MEMORY[0x24BE19A58]();
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return MEMORY[0x24BE19A60]();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return MEMORY[0x24BE19A68]();
}

uint64_t CCUIExpandedModuleEdgeInsets()
{
  return MEMORY[0x24BE19A70]();
}

uint64_t CCUIMaximumExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AB0]();
}

uint64_t CCUIScreenBounds()
{
  return MEMORY[0x24BE19AD0]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HFLogForCategory()
{
  return MEMORY[0x24BE4CF30]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

