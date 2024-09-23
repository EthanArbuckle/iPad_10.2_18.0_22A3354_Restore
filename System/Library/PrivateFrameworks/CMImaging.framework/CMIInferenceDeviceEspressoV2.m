@implementation CMIInferenceDeviceEspressoV2

- (id)loadNetworkWithPath:(id)a3
{
  id v3;
  CMIInferenceNetworkEspressoV2 *v4;
  int v5;
  CMIInferenceNetworkEspressoV2 *v6;
  CMIInferenceNetworkEspressoV2 *v7;
  NSObject *v9;

  v3 = a3;
  v4 = objc_alloc_init(CMIInferenceNetworkEspressoV2);
  v5 = -[CMIInferenceNetworkEspressoV2 loadNetworkWithPath:](v4, "loadNetworkWithPath:", v3);
  v6 = v4;
  if (v5)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (CMIInferenceDeviceEspressoV2)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIInferenceDeviceEspressoV2;
  return -[CMIInferenceDeviceEspressoV2 init](&v3, sel_init);
}

- (id)createExecutionStream
{
  return (id)objc_opt_new();
}

@end
