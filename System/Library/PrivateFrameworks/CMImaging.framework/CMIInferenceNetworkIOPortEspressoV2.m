@implementation CMIInferenceNetworkIOPortEspressoV2

- (int)_getInfoFromEsop:(e5rt_execution_stream_operation *)a3 portName:(id)a4 isInput:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  int IOPort;
  NSObject *v10;
  _QWORD v11[23];

  v5 = a5;
  v11[22] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v7 = objc_retainAutorelease(a4);
  IOPort = getIOPort(v11, (uint64_t)a3, objc_msgSend(v7, "UTF8String"), v5);
  if (!IOPort)
  {
    e5rt_io_port_is_tensor();
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v10 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  if (v11[0])
    e5rt_io_port_release();

  return IOPort;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (BOOL)isInput
{
  return self->_isInput;
}

- (void)setIsInput:(BOOL)a3
{
  self->_isInput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
