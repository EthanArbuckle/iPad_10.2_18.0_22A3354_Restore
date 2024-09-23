@implementation CMIInferenceDeviceEspressoV1

- (CMIInferenceDeviceEspressoV1)init
{
  CMIInferenceDeviceEspressoV1 *v2;
  uint64_t context;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSMutableArray *networks;
  CMIInferenceDeviceEspressoV1 *v8;
  NSObject *v9;
  CMIInferenceDeviceEspressoV1 *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CMIInferenceDeviceEspressoV1;
  v2 = -[CMIInferenceDeviceEspressoV1 init](&v12, sel_init);
  if (!v2)
    goto LABEL_6;
  context = espresso_create_context();
  v2->_context = (void *)context;
  if (!context)
    goto LABEL_6;
  v4 = dispatch_queue_create("CMIInferenceDeviceEspressoV1DispatchQueue", 0);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  if (!v2->_dispatchQueue
    || (v6 = objc_opt_new(),
        networks = v2->_networks,
        v2->_networks = (NSMutableArray *)v6,
        networks,
        v8 = v2,
        !v2->_networks))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_6:
    v8 = 0;
  }
  v10 = v8;

  return v10;
}

- (void)dealloc
{
  NSMutableArray *networks;
  NSObject *v4;
  objc_super v5;
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  networks = self->_networks;
  self->_networks = 0;

  if (self->_context && espresso_context_destroy())
  {
    v7 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v5.receiver = self;
  v5.super_class = (Class)CMIInferenceDeviceEspressoV1;
  -[CMIInferenceDeviceEspressoV1 dealloc](&v5, sel_dealloc);
}

- (id)loadNetworkWithPath:(id)a3
{
  id v4;
  CMIInferenceNetworkEspressoV1 *v5;
  CMIInferenceNetworkEspressoV1 *v6;
  CMIInferenceNetworkEspressoV1 *v7;
  NSObject *v9;

  v4 = a3;
  v5 = -[CMIInferenceNetworkEspressoV1 initWithDispatchQueue:]([CMIInferenceNetworkEspressoV1 alloc], "initWithDispatchQueue:", self->_dispatchQueue);
  if (-[CMIInferenceNetworkEspressoV1 loadNetworkWithPath:context:](v5, "loadNetworkWithPath:context:", v4, self->_context))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = 0;
  }
  else
  {
    -[NSMutableArray addObject:](self->_networks, "addObject:", v5);
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)createExecutionStream
{
  return (id)objc_opt_new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
