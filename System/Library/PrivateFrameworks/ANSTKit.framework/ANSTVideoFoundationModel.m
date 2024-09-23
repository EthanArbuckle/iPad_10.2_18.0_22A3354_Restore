@implementation ANSTVideoFoundationModel

- (ANSTVideoFoundationModel)initWithConfiguration:(id)a3
{
  id v5;
  ANSTVideoFoundationModel *v6;
  ANSTVideoFoundationModel *v7;
  ANSTPixelBufferDescriptor *v8;
  const char *v9;
  uint64_t v10;
  ANSTPixelBufferDescriptor *inputImageDescriptor;
  ANSTTensorDescriptor *v12;
  const char *v13;
  uint64_t v14;
  ANSTTensorDescriptor *outputFeatureDescriptor;
  objc_super v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ANSTVideoFoundationModel;
  v6 = -[ANSTAlgorithm initWithConfiguration:](&v17, sel_initWithConfiguration_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = [ANSTPixelBufferDescriptor alloc];
    v10 = objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v8, v9, (uint64_t)CFSTR("input_image"), 256, 256, 1111970369, 0, 0);
    inputImageDescriptor = v7->_inputImageDescriptor;
    v7->_inputImageDescriptor = (ANSTPixelBufferDescriptor *)v10;

    v18 = xmmword_235914E50;
    v12 = [ANSTTensorDescriptor alloc];
    v14 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v12, v13, (uint64_t)CFSTR("image_feature"), 102, 2, &v18, 64, 0);
    outputFeatureDescriptor = v7->_outputFeatureDescriptor;
    v7->_outputFeatureDescriptor = (ANSTTensorDescriptor *)v14;

    v7->_prepared = 0;
  }

  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  BOOL result;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t last_error_message;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  const char *v53;
  uint64_t iosurface;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  const char *v59;
  void *v60;
  const char *v61;
  int precompiled_compute_operation_with_options;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x24BDAC8D0];
  if (self->_prepared)
    return 1;
  if (!self->_stream)
  {
    v22 = e5rt_execution_stream_create();
    if ((_DWORD)v22)
    {
      v23 = v22;
      last_error_message = e5rt_get_last_error_message();
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_23590F994();

      if (!a3)
        return 0;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v26, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_create(&_stream)", v23, last_error_message);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD1540];
      v75 = *MEMORY[0x24BDD0BA0];
      v76[0] = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v76, &v75, 1);
      goto LABEL_52;
    }
  }
  if (!self->_operation)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("/AppleInternal/Library/Application Support/com.apple.ANSTKit/vfm.mlmodelc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v6, v7, (uint64_t)CFSTR("model.mil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!e5rt_e5_compiler_create() && !e5rt_e5_compiler_options_create())
    {
      objc_msgSend_relativePath(v8, v9, v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_UTF8String(v11, v12, v13);
      if (e5rt_e5_compiler_compile()
        || e5rt_program_library_retain_program_function()
        || e5rt_precompiled_compute_op_create_options_create_with_program_function())
      {

      }
      else
      {
        precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();

        if (!precompiled_compute_operation_with_options)
        {
LABEL_15:
          if (a3 && *a3)
          {

            return 0;
          }

          goto LABEL_24;
        }
      }
    }
    v14 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_23590F90C(v14, v15);

    if (a3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("MIL compilation failed due to E5 error (%s)"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1540];
      v73 = *MEMORY[0x24BDD0BA0];
      v74 = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v74, &v73, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v21, (uint64_t)CFSTR("ANSTErrorDomain"), 5, v20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
LABEL_24:
  if (!self->_outputPort_imageFeature)
  {
    v36 = e5rt_execution_stream_operation_retain_output_port();
    if ((_DWORD)v36)
    {
      v37 = v36;
      v38 = e5rt_get_last_error_message();
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_23590F898();

      if (!a3)
        return 0;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v40, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_operation_retain_output_port(_operation, \"image_feature\", &_outputPort_imageFeature)", v37, v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD0BA0];
      v72 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v41, (uint64_t)&v72, &v71, 1);
      goto LABEL_52;
    }
  }
  if (!self->_outputTensorDesc_imageFeature)
  {
    v42 = e5rt_io_port_retain_tensor_desc();
    if ((_DWORD)v42)
    {
      v43 = v42;
      v44 = e5rt_get_last_error_message();
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_23590F824();

      if (!a3)
        return 0;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v46, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_io_port_retain_tensor_desc(_outputPort_imageFeature, &_outputTensorDesc_imageFeature)", v43, v44);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD1540];
      v69 = *MEMORY[0x24BDD0BA0];
      v70 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v47, (uint64_t)&v70, &v69, 1);
      goto LABEL_52;
    }
  }
  if (!self->_outputBufferObject_imageFeature)
  {
    v48 = e5rt_tensor_desc_alloc_buffer_object();
    if ((_DWORD)v48)
    {
      v49 = v48;
      v50 = e5rt_get_last_error_message();
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_23590F7B0();

      if (!a3)
        return 0;
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v52, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_tensor_desc_alloc_buffer_object(_outputTensorDesc_imageFeature, E5RT_BUFFER_OBJECT_TYPE_IOSURFACE, 64, &_outputBufferObject_imageFeature)", v49, v50);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BDD1540];
      v67 = *MEMORY[0x24BDD0BA0];
      v68 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v53, (uint64_t)&v68, &v67, 1);
      goto LABEL_52;
    }
  }
  v30 = e5rt_io_port_bind_buffer_object();
  if ((_DWORD)v30)
  {
    v31 = v30;
    v32 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_23590F73C();

    if (!a3)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_io_port_bind_buffer_object(_outputPort_imageFeature, _outputBufferObject_imageFeature)", v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1540];
    v65 = *MEMORY[0x24BDD0BA0];
    v66 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v66, &v65, 1);
    goto LABEL_52;
  }
  iosurface = e5rt_buffer_object_get_iosurface();
  if ((_DWORD)iosurface)
  {
    v55 = iosurface;
    v56 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_23590F6C8();

    if (!a3)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v58, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_buffer_object_get_iosurface(_outputBufferObject_imageFeature, &_outputFeatureSurface)", v55, v56);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BDD0BA0];
    v64 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)&v64, &v63, 1);
LABEL_52:
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v61, (uint64_t)CFSTR("ANSTErrorDomain"), 5, v60);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  result = 1;
  self->_prepared = 1;
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23590FC4C((uint64_t)self, v3);

  if (self->_outputBufferObject_imageFeature && e5rt_buffer_object_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_23590FBD8();

  }
  if (self->_outputTensorDesc_imageFeature && e5rt_tensor_desc_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_23590FB64();

  }
  if (self->_outputPort_imageFeature && e5rt_io_port_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_23590FAF0();

  }
  if (self->_operation && e5rt_execution_stream_operation_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_23590FA7C();

  }
  if (self->_stream && e5rt_execution_stream_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_23590FA08();

  }
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFoundationModel;
  -[ANSTVideoFoundationModel dealloc](&v4, sel_dealloc);
}

- (BOOL)bindInputFrameBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t last_error_message;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v6 = e5rt_execution_stream_reset();
  if ((_DWORD)v6)
  {
    v7 = v6;
    last_error_message = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_23590FF78();

    if (!a4)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_reset(_stream)", v7, last_error_message);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v54 = *MEMORY[0x24BDD0BA0];
    v55[0] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v55, &v54, 1);
    goto LABEL_11;
  }
  CVPixelBufferGetIOSurface(a3);
  v14 = e5rt_surface_object_create_from_iosurface();
  if ((_DWORD)v14)
  {
    v15 = v14;
    v16 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_23590FF04();

    if (!a4)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_surface_object_create_from_iosurface(&input_image_surface_object, input_surface)", v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0BA0];
    v53 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v53, &v52, 1);
LABEL_11:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v21, (uint64_t)CFSTR("ANSTErrorDomain"), 5, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    return 0;
  }
  v23 = e5rt_execution_stream_operation_retain_input_port();
  if ((_DWORD)v23)
  {
    v24 = v23;
    v25 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_23590FE90();

    if (!a4)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_operation_retain_input_port(_operation, \"input_image\", &input_port)", v24, v25, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0BA0];
    v51 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)&v51, &v50, 1);
    goto LABEL_37;
  }
  v30 = e5rt_io_port_bind_surface_object();
  if ((_DWORD)v30)
  {
    v31 = v30;
    v32 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_23590FE1C();

    if (!a4)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_io_port_bind_surface_object(input_port, input_image_surface_object)", v31, v32, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0BA0];
    v49 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v49, &v48, 1);
    goto LABEL_37;
  }
  if (e5rt_io_port_release())
  {
    e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_23590FDA8();

  }
  if (e5rt_surface_object_release())
  {
    e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_23590FD34();

  }
  v38 = e5rt_execution_stream_encode_operation();
  if ((_DWORD)v38)
  {
    v39 = v38;
    v40 = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_23590FCC0();

    if (!a4)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v42, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_encode_operation(_stream, _operation)", v39, v40, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0BA0];
    v47 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v43, (uint64_t)&v47, &v46, 1);
LABEL_37:
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v45, (uint64_t)CFSTR("ANSTErrorDomain"), 5, v44);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  return 1;
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t last_error_message;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_prepared)
  {
    if (!a3)
      return 0;
    v14 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0BA0];
    v20[0] = CFSTR("Model was not prepared.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v15, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return 0;
  }
  v4 = e5rt_execution_stream_execute_sync();
  if ((_DWORD)v4)
  {
    v5 = v4;
    last_error_message = e5rt_get_last_error_message();
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_23590FFEC();

    if (!a3)
      return 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("%s failed with error code %d (%s)"), "e5rt_execution_stream_execute_sync(_stream)", v5, last_error_message);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0BA0];
    v18 = v9;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v13, (uint64_t)CFSTR("ANSTErrorDomain"), 5, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  return 1;
}

- (ANSTPixelBufferDescriptor)inputImageDescriptor
{
  return self->_inputImageDescriptor;
}

- (ANSTTensorDescriptor)outputFeatureDescriptor
{
  return self->_outputFeatureDescriptor;
}

- (__IOSurface)outputFeatureSurfaceRef
{
  return self->_outputFeatureSurface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFeatureDescriptor, 0);
  objc_storeStrong((id *)&self->_inputImageDescriptor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
