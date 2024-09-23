@implementation ANSTViSegHQInitialFrameInferenceDescriptor

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  ANSTViSegHQInitialFrameInferenceDescriptor *result;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  result = (ANSTViSegHQInitialFrameInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  const __CFString *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  ANSTViSegHQInitialFrameInferenceDescriptor *v33;
  ANSTViSegHQInitialFrameInferenceDescriptor *v34;
  id obj;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  objc_super v42;
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v12 = objc_msgSend_useE5(v9, v10, v11);
  v14 = CFSTR("main");
  if (!v12)
    v14 = 0;
  v41 = v14;
  objc_msgSend_makeInputImagePixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v13, (uint64_t)v9, CFSTR("input_image"), a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v15, (uint64_t)v9, CFSTR("mask"), a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      obj = a4;
      v19 = v17;
      objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v18, (uint64_t)v9, CFSTR("hidden_state"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v21, (uint64_t)v9, CFSTR("hidden"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v23, (uint64_t)v9, CFSTR("key"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v24, (uint64_t)v9, CFSTR("value"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_version(v9, v26, v27);
      objc_msgSend_assetURLForConfiguration_(ANSTViSegHQInitialFrameInferenceDescriptor, v28, (uint64_t)v9);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v16;
      v44[1] = v19;
      v40 = (void *)v20;
      v44[2] = v20;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v29, (uint64_t)v44, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v22;
      v43[1] = v37;
      v43[2] = v25;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v31, (uint64_t)v43, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v42.receiver = self;
      v42.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
      v33 = -[ANSTInferenceDescriptor initWithName:version:assetURL:assetType:e5FunctionName:inputDescriptors:outputDescriptors:error:](&v42, sel_initWithName_version_assetURL_assetType_e5FunctionName_inputDescriptors_outputDescriptors_error_, v8, v39, v38, 2, v41, v30, v32, a5);

      if (v33)
        objc_storeStrong((id *)&v33->_configuration, obj);
      self = v33;

      v34 = self;
      v17 = v19;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)assetURLForConfiguration:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_bundleForClass_(MEMORY[0x24BDD1488], v5, (uint64_t)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_subdirectory_(v6, v7, (uint64_t)CFSTR("visegHQ_memory"), CFSTR("mlmodelc"), CFSTR("Models"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend_version(v4, v9, v10) == 0x20000 && (v13 = objc_msgSend_resolution(v4, v11, v12), v13 <= 3))
    {
      objc_msgSend_URLByAppendingPathComponent_(v8, v14, (uint64_t)off_2506E3CE0[v13]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136446466;
      v19 = "+[ANSTViSegHQInitialFrameInferenceDescriptor assetURLForConfiguration:]";
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_2358CB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: returning %{public}@", (uint8_t *)&v18, 0x16u);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (ANSTPixelBufferDescriptor)inputImageDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x24BEDD108](self, sel_inputPixelBufferDescriptorNamed_, CFSTR("input_image"));
}

- (ANSTPixelBufferDescriptor)inputMaskDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x24BEDD108](self, sel_inputPixelBufferDescriptorNamed_, CFSTR("mask"));
}

- (ANSTTensorDescriptor)inputMaskTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, CFSTR("mask"));
}

- (ANSTTensorDescriptor)inputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("hidden_state"));
}

- (ANSTTensorDescriptor)outputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_outputTensorDescriptorNamed_, CFSTR("hidden"));
}

- (ANSTTensorDescriptor)outputKeyTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_outputTensorDescriptorNamed_, CFSTR("key"));
}

- (ANSTTensorDescriptor)outputValueTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_outputTensorDescriptorNamed_, CFSTR("value"));
}

- (BOOL)requiresPostprocessing
{
  return 0;
}

- (id)newPostprocessorWithError:(id *)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
  v4 = a3;
  -[ANSTInferenceDescriptor encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);

}

- (ANSTViSegHQInitialFrameInferenceDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSTViSegHQInitialFrameInferenceDescriptor *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  ANSTViSegHQInferenceConfiguration *configuration;
  ANSTViSegHQInitialFrameInferenceDescriptor *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTViSegHQInitialFrameInferenceDescriptor;
  v5 = -[ANSTInferenceDescriptor initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  configuration = v5->_configuration;
  v5->_configuration = (ANSTViSegHQInferenceConfiguration *)v9;

  if (!v5->_configuration)
    v11 = 0;
  else
LABEL_3:
    v11 = v5;

  return v11;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    v8 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v8, v9, (uint64_t)CFSTR("ViSegHQInitialFrameInferenceDescriptor"), v7, a4);
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("Configuration cannot be nil.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = v6;
  if (v6)
  {
    v10 = (void *)objc_msgSend_copy(v6, v7, v8);
    objc_msgSend_setUseE5_(v10, v11, 1);
    v12 = objc_alloc((Class)a1);
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v12, v13, (uint64_t)CFSTR("ViSegHQInitialFrameInferenceDescriptor"), v10, a4);

  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("Configuration cannot be nil.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end
