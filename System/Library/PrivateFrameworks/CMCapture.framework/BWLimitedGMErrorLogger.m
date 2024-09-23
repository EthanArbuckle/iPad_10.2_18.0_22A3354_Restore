@implementation BWLimitedGMErrorLogger

- (void)resetCurrentLoggingCounter
{
  self->_currentLoggingCount = 0;
}

- (BWLimitedGMErrorLogger)initWithName:(id)a3 maxLoggingCount:(int)a4
{
  BWLimitedGMErrorLogger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWLimitedGMErrorLogger;
  v6 = -[BWLimitedGMErrorLogger init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)a3;
    v6->_maxLoggingCount = a4;
    v6->_currentLoggingCount = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLimitedGMErrorLogger;
  -[BWLimitedGMErrorLogger dealloc](&v3, sel_dealloc);
}

- (void)logErrorNumber:(int)a3 errorString:(id)a4
{
  int currentLoggingCount;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  currentLoggingCount = self->_currentLoggingCount;
  if (currentLoggingCount < self->_maxLoggingCount)
  {
    self->_currentLoggingCount = currentLoggingCount + 1;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (NSString)name
{
  return self->_name;
}

- (int)maxLoggingCount
{
  return self->_maxLoggingCount;
}

- (int)currentLoggingCount
{
  return self->_currentLoggingCount;
}

@end
