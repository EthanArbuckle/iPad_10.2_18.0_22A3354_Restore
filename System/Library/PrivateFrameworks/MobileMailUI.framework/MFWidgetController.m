@implementation MFWidgetController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MFWidgetController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (OS_os_log *)(id)log_log_7;
}

void __25__MFWidgetController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MFWidgetController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_1 != -1)
    dispatch_once(&signpostLog_onceToken_1, block);
  return (OS_os_log *)(id)signpostLog_log_1;
}

void __33__MFWidgetController_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_1;
  signpostLog_log_1 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (MFWidgetController)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_10);
  return (MFWidgetController *)(id)sharedController_controller;
}

void __38__MFWidgetController_sharedController__block_invoke()
{
  MFWidgetController *v0;
  void *v1;

  v0 = objc_alloc_init(MFWidgetController);
  v1 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v0;

}

+ (EFScheduler)scheduler
{
  if (scheduler_onceToken != -1)
    dispatch_once(&scheduler_onceToken, &__block_literal_global_10);
  return (EFScheduler *)(id)scheduler_scheduler;
}

void __31__MFWidgetController_scheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.reload-timeline"), 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)scheduler_scheduler;
  scheduler_scheduler = v0;

}

- (MFWidgetController)init
{
  MFWidgetController *v2;
  id v3;
  uint64_t v4;
  CHSTimelineController *timelineController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFWidgetController;
  v2 = -[MFWidgetController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D10110]);
    v4 = objc_msgSend(v3, "initWithExtensionBundleIdentifier:kind:", *MEMORY[0x1E0D4D838], *MEMORY[0x1E0D4D860]);
    timelineController = v2->_timelineController;
    v2->_timelineController = (CHSTimelineController *)v4;

  }
  return v2;
}

- (void)reloadTimelinesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  MFWidgetController *v14;
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[16];

  v4 = a3;
  +[MFWidgetController signpostLog](MFWidgetController, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D56AF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RELOAD WIDGET TIMELINE", "Perform block", buf, 2u);
  }

  +[MFWidgetController scheduler](MFWidgetController, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__MFWidgetController_reloadTimelinesWithReason___block_invoke;
  v12[3] = &unk_1E9A03160;
  v10 = v8;
  v16 = v6;
  v13 = v10;
  v14 = self;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v9, "performBlock:", v12);

}

void __48__MFWidgetController_reloadTimelinesWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v11[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D56AF000, v3, OS_SIGNPOST_EVENT, v4, "RELOAD WIDGET TIMELINE", "Reload timelines", (uint8_t *)v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "timelineController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadTimelineWithReason:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[MFWidgetController log](MFWidgetController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__MFWidgetController_reloadTimelinesWithReason___block_invoke_cold_1((uint64_t)v6, v7);
  }
  else
  {
    +[MFWidgetController log](MFWidgetController, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1D56AF000, v7, OS_LOG_TYPE_DEFAULT, "Reload timelines", (uint8_t *)v11, 2u);
    }
  }

  v8 = *(id *)(a1 + 32);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11[0] = 67109120;
    v11[1] = v6 == 0;
    _os_signpost_emit_with_name_impl(&dword_1D56AF000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RELOAD WIDGET TIMELINE", "Reload timelines completed (success=%{BOOL}d) enableTelemetry=YES ", (uint8_t *)v11, 8u);
  }

}

- (CHSTimelineController)timelineController
{
  return self->_timelineController;
}

- (void)setTimelineController:(id)a3
{
  objc_storeStrong((id *)&self->_timelineController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineController, 0);
}

void __48__MFWidgetController_reloadTimelinesWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D56AF000, a2, OS_LOG_TYPE_ERROR, "Reload timelines failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
