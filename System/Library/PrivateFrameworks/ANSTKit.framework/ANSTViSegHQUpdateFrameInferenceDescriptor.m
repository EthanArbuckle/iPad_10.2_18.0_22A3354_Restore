@implementation ANSTViSegHQUpdateFrameInferenceDescriptor

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  ANSTViSegHQUpdateFrameInferenceDescriptor *result;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  result = (ANSTViSegHQUpdateFrameInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithName:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const __CFString *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  id v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  ANSTViSegHQUpdateFrameInferenceDescriptor *v39;
  ANSTViSegHQUpdateFrameInferenceDescriptor *v40;
  id obj;
  void *v43;
  uint64_t v44;
  ANSTViSegHQUpdateFrameInferenceDescriptor *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD v55[5];
  _QWORD v56[8];

  v56[6] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_useE5(v9, v10, v11))
    v13 = CFSTR("main");
  else
    v13 = 0;
  objc_msgSend_makeInputImagePixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v12, (uint64_t)v9, CFSTR("input_image"), a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v14, (uint64_t)v9, CFSTR("input_matting"), a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      obj = a4;
      objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v16, (uint64_t)v9, CFSTR("input_prob"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v18, (uint64_t)v9, CFSTR("hidden_state"));
      v48 = v13;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v19, (uint64_t)v9, CFSTR("prev_key"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v20, (uint64_t)v9, CFSTR("prev_value"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v22, (uint64_t)v9, CFSTR("output_matting"), a5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeHiddenTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v23, (uint64_t)v9, CFSTR("hidden"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v25, (uint64_t)v9, CFSTR("key"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v26, (uint64_t)v9, CFSTR("value"));
      v45 = self;
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeProbTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v28, (uint64_t)v9, CFSTR("output"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_version(v9, v30, v31);
      objc_msgSend_assetURLForConfiguration_(ANSTViSegHQUpdateFrameInferenceDescriptor, v32, (uint64_t)v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v15;
      v56[1] = v17;
      v49 = (void *)v21;
      v50 = v17;
      v56[2] = v53;
      v56[3] = v52;
      v56[4] = v51;
      v56[5] = v21;
      v34 = v8;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v35, (uint64_t)v56, 6);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v24;
      v55[1] = v43;
      v55[2] = v27;
      v47 = (void *)v27;
      v55[3] = v46;
      v55[4] = v29;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v37, (uint64_t)v55, 5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54.receiver = v45;
      v54.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
      v39 = -[ANSTInferenceDescriptor initWithName:version:assetURL:assetType:e5FunctionName:inputDescriptors:outputDescriptors:error:](&v54, sel_initWithName_version_assetURL_assetType_e5FunctionName_inputDescriptors_outputDescriptors_error_, v34, v44, v33, 2, v48, v36, v38, a5);

      if (v39)
        objc_storeStrong((id *)&v39->_configuration, obj);
      self = v39;

      v40 = self;
      v8 = v34;
      v17 = v50;
    }
    else
    {
      v40 = 0;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
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
  objc_msgSend_URLForResource_withExtension_subdirectory_(v6, v7, (uint64_t)CFSTR("visegHQ_mask_memory_shared"), CFSTR("mlmodelc"), CFSTR("Models"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend_version(v4, v9, v10) == 0x20000 && (v13 = objc_msgSend_resolution(v4, v11, v12), v13 <= 3))
    {
      objc_msgSend_URLByAppendingPathComponent_(v8, v14, (uint64_t)off_2506E3E58[v13]);
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
      v19 = "+[ANSTViSegHQUpdateFrameInferenceDescriptor assetURLForConfiguration:]";
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

- (ANSTPixelBufferDescriptor)inputMattingDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x24BEDD108](self, sel_inputPixelBufferDescriptorNamed_, CFSTR("input_matting"));
}

- (ANSTTensorDescriptor)inputMattingTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, CFSTR("input_matting"));
}

- (ANSTTensorDescriptor)inputProbTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("input_prob"));
}

- (ANSTTensorDescriptor)inputHiddenTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("hidden_state"));
}

- (ANSTTensorDescriptor)inputKeyTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("prev_key"));
}

- (ANSTTensorDescriptor)inputValueTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_inputTensorDescriptorNamed_, CFSTR("prev_value"));
}

- (ANSTPixelBufferDescriptor)outputMattingDescriptor
{
  return (ANSTPixelBufferDescriptor *)MEMORY[0x24BEDD108](self, sel_outputPixelBufferDescriptorNamed_, CFSTR("output_matting"));
}

- (ANSTTensorDescriptor)outputMattingTensorDescriptor
{
  return (ANSTTensorDescriptor *)objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, a2, (uint64_t)self->_configuration, CFSTR("output_matting"));
}

- (ANSTTensorDescriptor)outputProbTensorDescriptor
{
  return (ANSTTensorDescriptor *)MEMORY[0x24BEDD108](self, sel_outputTensorDescriptorNamed_, CFSTR("output"));
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
  v10.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
  v4 = a3;
  -[ANSTInferenceDescriptor encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);

}

- (ANSTViSegHQUpdateFrameInferenceDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSTViSegHQUpdateFrameInferenceDescriptor *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  ANSTViSegHQInferenceConfiguration *configuration;
  ANSTViSegHQUpdateFrameInferenceDescriptor *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTViSegHQUpdateFrameInferenceDescriptor;
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

- (BOOL)isE5
{
  return self->_isE5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (BOOL)requiresPostprocessing
{
  return 1;
}

- (id)newPostprocessorWithError:(id *)a3
{
  ANSTViSegHQUpdateFramePostProcessor *v5;
  const char *v6;

  v5 = [ANSTViSegHQUpdateFramePostProcessor alloc];
  return (id)objc_msgSend_initWithConfiguration_error_(v5, v6, (uint64_t)self->_configuration, a3);
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
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v8, v9, (uint64_t)CFSTR("ViSegHQUpdateFrameInferenceDescriptor"), v7, a4);
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
    a4 = (id *)objc_msgSend_initWithName_configuration_error_(v12, v13, (uint64_t)CFSTR("ViSegHQUpdateFrameInferenceDescriptor"), v10, a4);

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
