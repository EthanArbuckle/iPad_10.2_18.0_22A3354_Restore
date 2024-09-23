@implementation CMIInferenceExecutionStreamEspressoV2

- (CMIInferenceExecutionStreamEspressoV2)init
{
  CMIInferenceExecutionStreamEspressoV2 *v2;
  CMIInferenceExecutionStreamEspressoV2 *v3;
  NSObject *v4;
  CMIInferenceExecutionStreamEspressoV2 *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CMIInferenceExecutionStreamEspressoV2;
  v2 = -[CMIInferenceExecutionStreamEspressoV2 init](&v7, sel_init);
  if (!v2)
    goto LABEL_9;
  if (e5rt_execution_stream_create()
    || e5rt_execution_stream_config_options_create()
    || e5rt_execution_stream_config_options_set_skip_io_fences()
    || e5rt_execution_stream_config_options_set_enable_low_latency_async_events()
    || e5rt_execution_stream_set_config_options())
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  v3 = v2;
LABEL_10:
  v5 = v3;

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  os_log_type_t type;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_stream && e5rt_execution_stream_release())
  {
    v6 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v4.receiver = self;
  v4.super_class = (Class)CMIInferenceExecutionStreamEspressoV2;
  -[CMIInferenceExecutionStreamEspressoV2 dealloc](&v4, sel_dealloc);
}

- (int)enqueueNetworkInstance:(id)a3
{
  int result;
  NSObject *v4;

  objc_msgSend(a3, "esop");
  result = e5rt_execution_stream_encode_operation();
  if (result)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  return result;
}

- (int)submitAsyncWithCompletionHandler:(id)a3
{
  id v3;
  int v4;
  NSObject *v6;

  v3 = a3;
  if (e5rt_execution_stream_submit_async())
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v4 = -1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __74__CMIInferenceExecutionStreamEspressoV2_submitAsyncWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v6;
  uint64_t result;
  uint64_t v8;

  if (a4)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a4)
      v8 = 0xFFFFFFFFLL;
    else
      v8 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v8);
  }
  return result;
}

- (e5rt_execution_stream)stream
{
  return self->_stream;
}

- (void)setStream:(e5rt_execution_stream *)a3
{
  self->_stream = a3;
}

@end
