@implementation PKTextInputAnalyticsController

+ (void)beginObservingSessionAnalytics
{
  id v2;

  v2 = (id)objc_msgSend(a1, "sharedInstance");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PKTextInputAnalyticsController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEE6368 != -1)
    dispatch_once(&qword_1ECEE6368, block);
  return (id)_MergedGlobals_144;
}

void __48__PKTextInputAnalyticsController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_144;
  _MergedGlobals_144 = (uint64_t)v1;

}

- (PKTextInputAnalyticsController)init
{
  PKTextInputAnalyticsController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKTextInputAnalyticsController;
  v2 = -[PKTextInputAnalyticsController init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.TextInputAnalyticsController", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0DC3DF8], "addEndingObserver:", v2);
    v2->_lastEventSource = 0;
    v2->_lastEventSourceChangeTimestamp = mach_absolute_time();
    *(_OWORD *)v2->_eventSourceUsage = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[2] = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[4] = 0u;
    *(_OWORD *)&v2->_eventSourceUsage[6] = 0u;
    v2->_eventSourceUsage[8] = 0;
    if (PK_UIApplicationIsSystemShell_onceToken != -1)
      dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
    if (PK_UIApplicationIsSystemShell___result)
    {
      -[PKTextInputAnalyticsController _setupAnalyticsTimer](v2, "_setupAnalyticsTimer");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_eventSourceDidChange_, *MEMORY[0x1E0DC5580], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_activePencilUsage_, CFSTR("com.apple.pencilkit.pkactivepencilusage"), 0);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5580], 0);

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputAnalyticsController;
  -[PKTextInputAnalyticsController dealloc](&v4, sel_dealloc);
}

- (void)didBeginSession
{
  void (**v2)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKTextInputAnalyticsController_didBeginSession__block_invoke;
  aBlock[3] = &unk_1E7778020;
  aBlock[4] = self;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __49__PKTextInputAnalyticsController_didBeginSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKTextInputAnalyticsController_didBeginSession__block_invoke_2;
  block[3] = &unk_1E7778020;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __49__PKTextInputAnalyticsController_didBeginSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_didBeginSession");
}

- (void)q_didBeginSession
{
  -[PKTextInputAnalyticsController messageHandwritingAnalyticsWithProxyBlock:](self, "messageHandwritingAnalyticsWithProxyBlock:", &__block_literal_global_62);
}

void __51__PKTextInputAnalyticsController_q_didBeginSession__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didBeginInputSession");

}

- (id)matchingAccumulatorNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC5568], *MEMORY[0x1E0DC5570], 0);
}

- (void)didEndMatchingAccumulatorName:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PKTextInputAnalyticsController *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke;
  v10 = &unk_1E7777C20;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, v8, v9, v10, v11))
    v6[2](v6);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognitionLocaleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke_2;
  block[3] = &unk_1E777BD10;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __64__PKTextInputAnalyticsController_didEndMatchingAccumulatorName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "q_didEndMatchingAccumulatorName:inputMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)q_didEndMatchingAccumulatorName:(id)a3 inputMode:(id)a4
{
  id v6;
  uint64_t (*v7)(uint64_t, void *);
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC5568]))
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke;
    v8 = &v11;
LABEL_5:
    v8[1] = 3221225472;
    v8[2] = (uint64_t)v7;
    v8[3] = (uint64_t)&unk_1E777BD38;
    v8[4] = (uint64_t)v6;
    -[PKTextInputAnalyticsController messageHandwritingAnalyticsWithProxyBlock:](self, "messageHandwritingAnalyticsWithProxyBlock:", v8);

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC5570]))
  {
    v10 = MEMORY[0x1E0C809B0];
    v7 = __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke_2;
    v8 = &v10;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndInputSessionWithInputMode:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__PKTextInputAnalyticsController_q_didEndMatchingAccumulatorName_inputMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndInputSessionUsingScribbleWithInputMode:", *(_QWORD *)(a1 + 32));
}

- (void)messageHandwritingAnalyticsWithProxyBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = (void (**)(id, void *))a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.handwritingd.pkanalytics"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5F3EC0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v5);
    objc_msgSend(v4, "resume");
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PKTextInputAnalyticsController_messageHandwritingAnalyticsWithProxyBlock___block_invoke;
    v7[3] = &unk_1E777BB20;
    v7[4] = &v8;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*((_BYTE *)v9 + 24))
      v3[2](v3, v6);
    objc_msgSend(v4, "invalidate");

    _Block_object_dispose(&v8, 8);
  }

}

void __76__PKTextInputAnalyticsController_messageHandwritingAnalyticsWithProxyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for analytics: %@", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (void)eventSourceDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC5578]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[PKTextInputAnalyticsController didUpdateToEventSource:](self, "didUpdateToEventSource:", v6);
}

- (void)activePencilUsage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.pencilkit.pkactivepencilusage.type"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.pencilkit.pkactivepencilusage.interval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      self->_activePencilUsage = v8 + self->_activePencilUsage;
      self->_lastActivePencilType = objc_msgSend(v9, "integerValue");
    }
  }

}

- (void)didUpdateToEventSource:(int64_t)a3
{
  -[PKTextInputAnalyticsController _updateAnalyticsTracking](self, "_updateAnalyticsTracking");
  self->_lastEventSource = a3;
}

- (void)_updateAnalyticsTracking
{
  int64_t lastEventSource;
  uint64_t v4;

  if (qword_1ECEE6378 != -1)
    dispatch_once(&qword_1ECEE6378, &__block_literal_global_114);
  lastEventSource = self->_lastEventSource;
  v4 = mach_absolute_time();
  self->_eventSourceUsage[lastEventSource] += (v4 - self->_lastEventSourceChangeTimestamp)
                                            * dword_1ECEE6370
                                            / *(unsigned int *)algn_1ECEE6374
                                            / 0xF4240;
  self->_lastEventSourceChangeTimestamp = v4;
}

void __58__PKTextInputAnalyticsController__updateAnalyticsTracking__block_invoke()
{
  kern_return_t v0;
  kern_return_t v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = mach_timebase_info((mach_timebase_info_t)&dword_1ECEE6370);
  if (v0)
  {
    v1 = v0;
    v2 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_error_impl(&dword_1BE213000, v2, OS_LOG_TYPE_ERROR, "Analytics: Unable to get mach timebase info. Error: %d", (uint8_t *)v3, 8u);
    }

  }
}

- (void)_setupAnalyticsTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKTextInputAnalyticsController eventSourceTimer](self, "eventSourceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  self->_eventSourceUsage[8] = 0;
  *(_OWORD *)&self->_eventSourceUsage[4] = 0u;
  *(_OWORD *)&self->_eventSourceUsage[6] = 0u;
  *(_OWORD *)self->_eventSourceUsage = 0u;
  *(_OWORD *)&self->_eventSourceUsage[2] = 0u;
  self->_activePencilUsage = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 64, 30, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, sel__dispatchAnalytics, 0, 0, 1000.0);
  -[PKTextInputAnalyticsController setEventSourceTimer:](self, "setEventSourceTimer:", v8);

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputAnalyticsController eventSourceTimer](self, "eventSourceTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", v10, *MEMORY[0x1E0C99748]);

}

- (void)_dispatchAnalytics
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(unsigned __int8 *);
  void *v15;
  uint64_t v16;
  void *v17;

  -[PKTextInputAnalyticsController didUpdateToEventSource:](self, "didUpdateToEventSource:", 0);
  v3 = 0;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    objc_msgSend(MEMORY[0x1E0DC3DF8], "stringValueForSource:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3 == 3 && self->_lastActivePencilType == 1)
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("3rdPartyOrCrayon"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    v17 = v6;
    v8 = v6;
    AnalyticsSendEventLazy();

    ++v3;
  }
  while (v3 != 9);
  if (+[PKHoverSettings isHoverActive](PKHoverSettings, "isHoverActive"))
  {
    v9 = +[PKHoverSettings isHoverEnabled](PKHoverSettings, "isHoverEnabled");
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isScribbleActive");

    v12 = v4;
    v13 = 3221225472;
    v14 = __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke_2;
    v15 = &__block_descriptor_36_e19___NSDictionary_8__0l;
    LOBYTE(v16) = v9;
    BYTE1(v16) = v11;
    BYTE2(v16) = 0;
    BYTE3(v16) = +[PKHoverSettings allowDoubleTapOnlyWithPencilHover](PKHoverSettings, "allowDoubleTapOnlyWithPencilHover");
    AnalyticsSendEventLazy();
  }
  -[PKTextInputAnalyticsController _dispatchPencilSettingsAnalytics](self, "_dispatchPencilSettingsAnalytics", v12, v13, v14, v15, v16, v4, 3221225472, __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke, &unk_1E777BD80);
  -[PKTextInputAnalyticsController _setupAnalyticsTimer](self, "_setupAnalyticsTimer");
}

id __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bundle");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v10[0] = v3;
  v10[1] = v4;
  v9[1] = CFSTR("source");
  v9[2] = CFSTR("minutes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("activepencilminutes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __52__PKTextInputAnalyticsController__dispatchAnalytics__block_invoke_2(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("settingShowEffectsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("settingScribbleEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[33]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("settingSystemShadowEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[34]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("settingDoubleTapInRangeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[35]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)configuredSystemActionBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SBPencilSystemShortcutAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_6;
  v4 = (void *)MEMORY[0x1E0CB3710];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)qword_1ECEE6380;
  v18 = qword_1ECEE6380;
  if (!qword_1ECEE6380)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getWFConfiguredSystemActionClass_block_invoke;
    v14[3] = &unk_1E7777068;
    v14[4] = &v15;
    __getWFConfiguredSystemActionClass_block_invoke((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v13 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v6, v3, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v13)
  {

LABEL_6:
    v8 = 0;
  }
  objc_msgSend(v8, "associatedBundleIdentifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = CFSTR("<unknown>");
  v11 = v9;

  return v11;
}

- (void)_dispatchPencilSettingsAnalytics
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
  objc_msgSend(v3, "objectForKey:", CFSTR("effects-pencil-haptic"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AAB0];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredTapAction");
  +[PKPencilDevice activePencil]();

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolShadowActive");

  -[PKTextInputAnalyticsController configuredSystemActionBundleIdentifier](self, "configuredSystemActionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
  objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
  +[PKPencilSqueezeAnalyticsController currentSqueezeThresholdIndex]();
  objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
  v12 = v7;
  v10 = v9;
  v11 = v7;
  AnalyticsSendEventLazy();

}

id __66__PKTextInputAnalyticsController__dispatchPencilSettingsAnalytics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[10];
  _QWORD v15[11];

  v15[10] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("barrelRollEnablement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = CFSTR("doubleTapState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v15[1] = v3;
  v15[2] = v4;
  v14[2] = CFSTR("hapticsEnablement");
  v14[3] = CFSTR("pencilVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = CFSTR("shadowEnablement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 89));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v15[4] = v6;
  v15[5] = v7;
  v14[5] = CFSTR("shortcutIntentIdentifier");
  v14[6] = CFSTR("squeezeSettingStateCanvas");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v8;
  v14[7] = CFSTR("squeezeSettingStateSystem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v9;
  v14[8] = CFSTR("squeezeThresholdState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v10;
  v14[9] = CFSTR("wasShortcutEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 90));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSTimer)eventSourceTimer
{
  return self->_eventSourceTimer;
}

- (void)setEventSourceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_eventSourceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSourceTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
