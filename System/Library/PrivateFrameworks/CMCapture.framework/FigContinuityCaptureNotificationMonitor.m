@implementation FigContinuityCaptureNotificationMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken != -1)
    dispatch_once(&sharedInstance_sOnceToken, &__block_literal_global_39);
  return (id)sharedInstance_sSharedContinuityCaptureNotificationMonitor;
}

FigContinuityCaptureNotificationMonitor *__57__FigContinuityCaptureNotificationMonitor_sharedInstance__block_invoke()
{
  FigContinuityCaptureNotificationMonitor *result;

  result = objc_alloc_init(FigContinuityCaptureNotificationMonitor);
  sharedInstance_sSharedContinuityCaptureNotificationMonitor = (uint64_t)result;
  return result;
}

- (void)_handleContinuityCaptureNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "name");
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(a3, "object");
    if (dword_1ECFE97B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("ContinuityCaptureNotificationOnBoardingComplete"), v10, v11)&& objc_msgSend(v6, "isEqualToString:", CFSTR("YES")))
    {
      v8 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "now");
      if (dword_1ECFE97B0)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CFPreferencesSetValue(CFSTR("ContinuityCaptureLastUsedDate"), v8, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    }
  }
}

- (FigContinuityCaptureNotificationMonitor)init
{
  FigContinuityCaptureNotificationMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigContinuityCaptureNotificationMonitor;
  v2 = -[FigContinuityCaptureNotificationMonitor init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__handleContinuityCaptureNotification_, CFSTR("ContinuityCaptureNotificationOnBoardingComplete"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("ContinuityCaptureNotificationOnBoardingComplete"), 0);
  v3.receiver = self;
  v3.super_class = (Class)FigContinuityCaptureNotificationMonitor;
  -[FigContinuityCaptureNotificationMonitor dealloc](&v3, sel_dealloc);
}

@end
