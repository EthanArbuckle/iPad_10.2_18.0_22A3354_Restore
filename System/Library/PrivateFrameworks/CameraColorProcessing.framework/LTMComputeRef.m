@implementation LTMComputeRef

- (LTMComputeRef)init
{
  LTMComputeRef *v2;
  LTMComputeRef *v3;
  LTMComputeRef *v4;
  NSObject *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)LTMComputeRef;
  v2 = -[LTMComputeRef init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  return v3;
}

- (int)computeLTM:(const sLtmComputeInput *)a3 withMetadata:(const sLtmComputeMeta *)a4 to:(sLtmComputeOutput *)a5
{
  LTMCompute *v9;
  int v10;
  LTMCompute *ltmCompute;
  NSObject *v13;

  v9 = (LTMCompute *)operator new();
  LTMCompute::LTMCompute(v9, a4->channel);
  self->_ltmCompute = v9;
  if (LTMCompute::Process(v9, a3, a4, a5))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = -1;
  }
  else
  {
    v10 = 0;
  }
  ltmCompute = self->_ltmCompute;
  if (ltmCompute)
    (*((void (**)(LTMCompute *))ltmCompute->var0 + 1))(ltmCompute);
  return v10;
}

@end
