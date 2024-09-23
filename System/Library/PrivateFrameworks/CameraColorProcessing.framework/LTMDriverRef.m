@implementation LTMDriverRef

- (LTMDriverRef)init
{
  LTMDriverRef *v2;
  LTMDriver *v3;
  LTMDriverRef *v4;
  NSObject *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)LTMDriverRef;
  v2 = -[LTMDriverRef init](&v7, sel_init);
  if (v2)
  {
    v3 = (LTMDriver *)operator new();
    LTMDriver::LTMDriver(v3);
    v2->_ltmDriver = v3;
    v4 = v2;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  return v2;
}

- (void)dealloc
{
  LTMDriver *ltmDriver;
  objc_super v4;

  ltmDriver = self->_ltmDriver;
  if (ltmDriver)
    (*((void (**)(LTMDriver *, SEL))ltmDriver->var0 + 1))(ltmDriver, a2);
  v4.receiver = self;
  v4.super_class = (Class)LTMDriverRef;
  -[LTMDriverRef dealloc](&v4, sel_dealloc);
}

- (int)computeLtmComputeInput:(const sCLRProcHITHStat *)a3 withMetadata:(const sRefDriverInputs *)a4 to:(sLtmComputeInput *)a5 computeInputMetadata:(sLtmComputeMeta *)a6
{
  NSObject *v9;

  if (LTMDriver::Process(self->_ltmDriver, a3, (sRefDriverInputs *)a4, a5))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  else
  {
    memcpy(a6, &self->_ltmDriver->var2, sizeof(sLtmComputeMeta));
    return 0;
  }
}

@end
