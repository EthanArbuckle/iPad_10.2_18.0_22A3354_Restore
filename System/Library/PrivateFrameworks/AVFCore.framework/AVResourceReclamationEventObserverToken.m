@implementation AVResourceReclamationEventObserverToken

- (void)dealloc
{
  objc_super v3;

  -[AVResourceReclamationEventObserverToken invalidate](self, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationEventObserverToken;
  -[AVResourceReclamationEventObserverToken dealloc](&v3, sel_dealloc);
}

- (AVResourceReclamationEventObserverToken)initWithDetails:(id)a3
{
  AVResourceReclamationEventObserverToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVResourceReclamationEventObserverToken;
  v4 = -[AVResourceReclamationEventObserverToken init](&v6, sel_init);
  if (v4)
    v4->_details = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)invalidate
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECE58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(+[AVResourceReclamationController defaultController](AVResourceReclamationController, "defaultController", v4, v5), "_removeObserverToken:", self);
}

- (id)details
{
  return self->_details;
}

@end
