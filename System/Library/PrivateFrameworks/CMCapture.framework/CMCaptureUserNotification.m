@implementation CMCaptureUserNotification

- (id)initForSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCaptureUserNotification;
  return -[CMCaptureUserNotification init](&v3, sel_init);
}

+ (CMCaptureUserNotification)notificationWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5 error:(id *)a6
{
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v10 = *MEMORY[0x1E0C9B800];
  if (objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B800]))
    v11 = (__CFString *)objc_msgSend(&stru_1E4928818, "stringByAppendingFormat:", CFSTR("\n%@"), objc_msgSend(a5, "objectForKeyedSubscript:", v10));
  else
    v11 = &stru_1E4928818;
  v12 = *MEMORY[0x1E0C9B810];
  if (objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B810]))
    v11 = (__CFString *)-[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("\n%@"), objc_msgSend(a5, "objectForKeyedSubscript:", v12));
  if (-[__CFString length](v11, "length"))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (CMCaptureUserNotification *)-[DirectUserNotification initNotificationWithTimeout:flags:dictionary:error:]([DirectUserNotification alloc], "initNotificationWithTimeout:flags:dictionary:error:", a4, a5, a6, a3);
}

- (unint64_t)receiveResponseWithTimeout:(double)a3 error:(id *)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMCaptureUserNotification.m"), 616, CFSTR("Subclasses need to overwrite this method"));
  abort();
}

- (id)updateWithTimeout:(double)a3 flags:(unint64_t)a4 dictionary:(id)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a5, a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMCaptureUserNotification.m"), 622, CFSTR("Subclasses need to overwrite this method"));
  abort();
}

- (void)asyncResponse:(id)a3 block:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMCaptureUserNotification.m"), 628, CFSTR("Subclasses need to overwrite this method"));
  abort();
}

- (id)cancel
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CMCaptureUserNotification.m"), 634, CFSTR("Subclasses need to overwrite this method"));
  abort();
}

@end
