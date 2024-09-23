@implementation ANSTViSegHQRegularFramePostProcessor

- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  ANSTViSegHQRegularFramePostProcessor *result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  result = (ANSTViSegHQRegularFramePostProcessor *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQRegularFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  ANSTViSegHQRegularFramePostProcessor *v8;

  objc_msgSend_configuration(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (ANSTViSegHQRegularFramePostProcessor *)objc_msgSend_initWithConfiguration_error_(self, v7, (uint64_t)v6, a4);

  return v8;
}

- (ANSTViSegHQRegularFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  ANSTViSegHQRegularFramePostProcessor *v16;
  ANSTViSegHQRegularFramePostProcessor *v17;
  void *v18;
  const char *v19;
  objc_super v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend_makeMaskPixelBufferDescriptorForConfiguration_name_error_(_ANSTViSegHQUtility, v8, (uint64_t)v7, CFSTR("output_mask"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_makeMattingTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v9, (uint64_t)v7, CFSTR("output_matting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v11;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)&v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, (uint64_t)&v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21.receiver = self;
    v21.super_class = (Class)ANSTViSegHQRegularFramePostProcessor;
    v16 = -[ANSTInferencePostprocessor initWithInferenceInputDescriptors:inferenceOutputDescriptors:processedOutputDescriptors:error:](&v21, sel_initWithInferenceInputDescriptors_inferenceOutputDescriptors_processedOutputDescriptors_error_, MEMORY[0x24BDBD1A8], v13, v15, a4);

    if (v16)
    {
      objc_storeStrong((id *)&v16->_configuration, a3);
      objc_storeStrong((id *)&v16->_outputMatting, v11);
      objc_storeStrong((id *)&v16->_outputMask, v10);
    }
    self = v16;
    v17 = self;
  }
  else
  {
    if (!a4)
    {
      v17 = 0;
      goto LABEL_8;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0BA0];
    v25[0] = CFSTR("Error creating output pixel buffer descriptor.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v19, (uint64_t)CFSTR("ANSTErrorDomain"), 13, v11);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v17;
}

- (BOOL)processWithError:(id *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  __CVBuffer *v15;
  size_t Width;
  size_t Height;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *BaseAddress;
  const char *v26;
  char v27;
  void *v28;
  ANSTTensorDescriptor *outputMatting;
  const char *v30;
  void *v31;
  ANSTPixelBufferDescriptor *outputMask;
  void *v33;
  const char *v34;
  _QWORD v36[7];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_name(self->_outputMatting, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputTensorDataForDescriptorNamed_(self, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_name(self->_outputMask, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputPixelBufferForDescriptorNamed_(self, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v15 = (__CVBuffer *)objc_msgSend_pixelBuffer(v12, v13, v14);
      CVPixelBufferLockBaseAddress(v15, 0);
      Width = CVPixelBufferGetWidth(v15);
      Height = CVPixelBufferGetHeight(v15);
      objc_msgSend_tensorDescriptor(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_dataType(v20, v21, v22);
      v24 = ANSTTensorDataTypeGetSize(v23) * Width;

      CVPixelBufferGetBytesPerRow(v15);
      BaseAddress = CVPixelBufferGetBaseAddress(v15);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = sub_2358D5F88;
      v36[3] = &unk_2506E3BE8;
      v36[4] = BaseAddress;
      v36[5] = Height;
      v36[6] = v24;
      v27 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v7, v26, 0, v36, a3);
      CVPixelBufferUnlockBaseAddress(v15, 0);
    }
    else
    {
      if (a3)
      {
        v31 = (void *)MEMORY[0x24BDD1540];
        v37[0] = *MEMORY[0x24BDD0BA0];
        v37[1] = CFSTR("ANSTDescriptor");
        outputMask = self->_outputMask;
        v38[0] = CFSTR("Output pixel buffer not found.");
        v38[1] = outputMask;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v38, v37, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, (uint64_t)CFSTR("ANSTErrorDomain"), 13, v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v27 = 0;
    }
  }
  else
  {
    if (!a3)
    {
      v27 = 0;
      goto LABEL_10;
    }
    v28 = (void *)MEMORY[0x24BDD1540];
    v39[0] = *MEMORY[0x24BDD0BA0];
    v39[1] = CFSTR("ANSTDescriptor");
    outputMatting = self->_outputMatting;
    v40[0] = CFSTR("Input tensor data not found.");
    v40[1] = outputMatting;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v40, v39, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v12);
    v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v27;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputMask, 0);
  objc_storeStrong((id *)&self->_outputMatting, 0);
}

@end
