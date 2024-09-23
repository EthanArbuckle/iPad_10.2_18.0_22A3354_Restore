@implementation VCPEspressoV2IOPort

- (int)retainAndBindToPort:(e5rt_execution_stream_operation *)a3 name:(id)a4 isInput:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  int64_t v14;
  uint8_t buf[4];
  uint64_t last_error_message;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a4);
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "UTF8String");
    if (e5rt_execution_stream_operation_retain_input_port())
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  else
  {
    objc_msgSend(v7, "UTF8String");
    if (e5rt_execution_stream_operation_retain_output_port())
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_17;
  }
  if (e5rt_tensor_desc_alloc_buffer_object())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_17;
  }
  v14 = -[VCPEspressoV2IOPort getTensorType:](self, "getTensorType:", 0);
  self->_tensorType = v14;
  if (v14 == 3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "UnSupported Tensor Type - (only Int32, FP16, FP32 are supported)";
    v11 = 2;
    goto LABEL_18;
  }
  if (e5rt_io_port_bind_buffer_object())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    goto LABEL_17;
  }
  if (!e5rt_tensor_desc_release())
  {
    v12 = 0;
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
LABEL_17:
    *(_DWORD *)buf = 136315138;
    last_error_message = e5rt_get_last_error_message();
    v9 = MEMORY[0x1E0C81028];
    v10 = "E5RT op failed: %s";
    v11 = 12;
LABEL_18:
    _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
  }
LABEL_19:
  v12 = -18;
LABEL_20:

  return v12;
}

- (int64_t)getTensorType:(e5rt_tensor_desc *)a3
{
  uint8_t buf[4];
  uint64_t last_error_message;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  e5rt_tensor_desc_retain_dtype();
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 3;
    goto LABEL_12;
  }
  if (e5rt_tensor_desc_dtype_get_element_size())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 3;
    goto LABEL_12;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 3;
LABEL_12:
    *(_DWORD *)buf = 136315138;
    last_error_message = e5rt_get_last_error_message();
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
    return 3;
  }
  return 3;
}

- (int)prepareInput:(void *)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  int64_t tensorType;
  size_t v12;
  uint8_t buf[4];
  uint64_t last_error_message;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[VCPEspressoV2IOPort getTensorShape](self, "getTensorShape");
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -18;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "Invalid input size";
    v9 = 2;
    goto LABEL_9;
  }
  v6 = v5;
  if (e5rt_buffer_object_get_data_ptr())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return -18;
    *(_DWORD *)buf = 136315138;
    last_error_message = e5rt_get_last_error_message();
    v7 = MEMORY[0x1E0C81028];
    v8 = "E5RT op failed: %s";
    v9 = 12;
LABEL_9:
    _os_log_impl(&dword_1B6C4A000, v7, OS_LOG_TYPE_ERROR, v8, buf, v9);
    return -18;
  }
  tensorType = self->_tensorType;
  switch(tensorType)
  {
    case 2:
      goto LABEL_14;
    case 1:
      v12 = 2 * v6;
      goto LABEL_16;
    case 0:
LABEL_14:
      v12 = 4 * v6;
LABEL_16:
      memcpy(0, a3, v12);
      break;
  }
  return 0;
}

- (unint64_t)getOutput:(void *)a3
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  int v9;
  uint64_t last_error_message;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[VCPEspressoV2IOPort getTensorShape](self, "getTensorShape");
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(v9) = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "Invalid output size";
    v7 = 2;
    goto LABEL_9;
  }
  v4 = v3;
  if (e5rt_buffer_object_get_data_ptr())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    v9 = 136315138;
    last_error_message = e5rt_get_last_error_message();
    v5 = MEMORY[0x1E0C81028];
    v6 = "E5RT op failed: %s";
    v7 = 12;
LABEL_9:
    _os_log_impl(&dword_1B6C4A000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, v7);
    return 0;
  }
  return v4;
}

- (unint64_t)getTensorShape
{
  unint64_t v2;
  uint8_t buf[4];
  uint64_t last_error_message;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (e5rt_io_port_retain_tensor_desc())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    goto LABEL_12;
  }
  if (e5rt_tensor_desc_get_shape())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
    goto LABEL_12;
  }
  v2 = 1;
  if (e5rt_tensor_desc_release())
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return 0;
LABEL_12:
    *(_DWORD *)buf = 136315138;
    last_error_message = e5rt_get_last_error_message();
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
    return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  e5rt_io_port_release();
  e5rt_buffer_object_release();
  v3.receiver = self;
  v3.super_class = (Class)VCPEspressoV2IOPort;
  -[VCPEspressoV2IOPort dealloc](&v3, sel_dealloc);
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (e5rt_buffer_object)bufferHandle
{
  return self->_bufferHandle;
}

- (int64_t)tensorType
{
  return self->_tensorType;
}

@end
