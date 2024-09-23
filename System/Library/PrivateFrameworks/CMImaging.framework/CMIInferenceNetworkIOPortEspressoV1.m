@implementation CMIInferenceNetworkIOPortEspressoV1

- (int)_getInfoFromNetwork:(id)a3 portName:(id)a4 isInput:(BOOL)a5
{
  id v7;
  int v8;
  NSObject *v10;

  v7 = objc_retainAutorelease(a4);
  objc_msgSend(v7, "UTF8String");
  if (espresso_network_query_blob_dimensions())
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v10 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = -1;
  }
  else
  {
    objc_storeStrong((id *)&self->_name, v7);
    v8 = 0;
    *(_OWORD *)&self->_width = 0u;
    self->_depth = 0;
    self->_isInput = a5;
  }

  return v8;
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
