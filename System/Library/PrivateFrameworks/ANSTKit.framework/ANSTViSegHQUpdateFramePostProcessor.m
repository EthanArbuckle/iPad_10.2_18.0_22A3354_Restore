@implementation ANSTViSegHQUpdateFramePostProcessor

- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  ANSTViSegHQUpdateFramePostProcessor *result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  result = (ANSTViSegHQUpdateFramePostProcessor *)objc_msgSend_doesNotRecognizeSelector_(self, v13, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQUpdateFramePostProcessor)initWithInferenceDescriptor:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  ANSTViSegHQUpdateFramePostProcessor *v8;

  objc_msgSend_configuration(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (ANSTViSegHQUpdateFramePostProcessor *)objc_msgSend_initWithConfiguration_error_(self, v7, (uint64_t)v6, a4);

  return v8;
}

- (ANSTViSegHQUpdateFramePostProcessor)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  ANSTViSegHQUpdateFramePostProcessor *v16;
  const char *v17;
  unint64_t v18;
  const char *v19;
  size_t v20;
  const char *v21;
  unint64_t v22;
  const char *v23;
  size_t v24;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend_makeKeyTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v8, (uint64_t)v7, CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeValueTensorDescriptorForConfiguration_name_(_ANSTViSegHQUtility, v10, (uint64_t)v7, CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v27[1] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v14, (uint64_t)v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)ANSTViSegHQUpdateFramePostProcessor;
  v16 = -[ANSTInferencePostprocessor initWithInferenceInputDescriptors:inferenceOutputDescriptors:processedOutputDescriptors:error:](&v26, sel_initWithInferenceInputDescriptors_inferenceOutputDescriptors_processedOutputDescriptors_error_, MEMORY[0x24BDBD1A8], v13, v15, a4);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v16->_key, v9);
    objc_storeStrong((id *)&v16->_value, v11);
    v18 = (unint64_t)((double)(unint64_t)objc_msgSend_lengthOfDimensionAt_(v16->_key, v17, 1) * 0.5);
    v20 = objc_msgSend_strideOfDimensionAt_(v16->_key, v19, 1) * v18;
    v16->_keyTensorSwapSpaceSize = v20;
    v16->_keyTensorSwapSpace = malloc_type_malloc(v20, 0xA4E66C8DuLL);
    v22 = (unint64_t)((double)(unint64_t)objc_msgSend_lengthOfDimensionAt_(v16->_value, v21, 3) * 0.5);
    v24 = objc_msgSend_strideOfDimensionAt_(v16->_value, v23, 3) * v22;
    v16->_valueTensorSwapSpaceSize = v24;
    v16->_valueTensorSwapSpace = malloc_type_malloc(v24, 0x1BB3CC56uLL);
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_keyTensorSwapSpace);
  self->_keyTensorSwapSpace = 0;
  free(self->_valueTensorSwapSpace);
  self->_valueTensorSwapSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)ANSTViSegHQUpdateFramePostProcessor;
  -[ANSTViSegHQUpdateFramePostProcessor dealloc](&v3, sel_dealloc);
}

- (BOOL)processWithError:(id *)a3
{
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  char v14;

  objc_msgSend__inputTensorDataForDescriptor_error_(self, a2, (uint64_t)self->_key, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend__outputTensorDataForDescriptor_error_(self, v5, (uint64_t)self->_key, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend__inputTensorDataForDescriptor_error_(self, v7, (uint64_t)self->_value, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend__outputTensorDataForDescriptor_error_(self, v9, (uint64_t)self->_value, a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend__processKeyTensorWithInput_output_error_(self, v11, (uint64_t)v6, v8, a3))
          v14 = objc_msgSend__processValueTensorWithInput_output_error_(self, v13, (uint64_t)v10, v12, a3);
        else
          v14 = 0;

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_inputTensorDataForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_name(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputTensorDataForDescriptorNamed_(self, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13 = v11;
  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v18[0] = *MEMORY[0x24BDD0BA0];
    v18[1] = CFSTR("ANSTDescriptor");
    v19[0] = CFSTR("Input tensor data not found.");
    v19[1] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v19, v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_outputTensorDataForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_name(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputTensorDataForDescriptorNamed_(self, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13 = v11;
  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v18[0] = *MEMORY[0x24BDD0BA0];
    v18[1] = CFSTR("ANSTDescriptor");
    v19[0] = CFSTR("Output tensor data not found.");
    v19[1] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v19, v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)_processKeyTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8;
  ANSTTensorDescriptor *key;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  char v17;
  _QWORD v19[4];
  id v20;
  ANSTViSegHQUpdateFramePostProcessor *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  char v26;

  v8 = a4;
  key = self->_key;
  v10 = a3;
  v12 = objc_msgSend_lengthOfDimensionAt_(key, v11, 0);
  v14 = objc_msgSend_strideOfDimensionAt_(self->_key, v13, 0);
  v26 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_2358DA944;
  v19[3] = &unk_2506E3C70;
  v22 = &v26;
  v23 = v12;
  v20 = v8;
  v21 = self;
  v24 = v14;
  v25 = a5;
  v15 = v8;
  v17 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v10, v16, 0, v19, a5);

  if (!v26)
    v17 = 0;

  return v17;
}

- (BOOL)_processValueTensorWithInput:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8;
  ANSTTensorDescriptor *value;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  char v25;
  _QWORD v27[4];
  id v28;
  ANSTViSegHQUpdateFramePostProcessor *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  char v38;

  v8 = a4;
  value = self->_value;
  v10 = a3;
  v12 = objc_msgSend_lengthOfDimensionAt_(value, v11, 0);
  v14 = objc_msgSend_strideOfDimensionAt_(self->_value, v13, 0);
  v16 = objc_msgSend_lengthOfDimensionAt_(self->_value, v15, 1);
  v18 = objc_msgSend_strideOfDimensionAt_(self->_value, v17, 1);
  v20 = objc_msgSend_lengthOfDimensionAt_(self->_value, v19, 2);
  v22 = objc_msgSend_strideOfDimensionAt_(self->_value, v21, 2);
  v38 = 0;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = sub_2358DABC0;
  v27[3] = &unk_2506E3CC0;
  v30 = &v38;
  v31 = v12;
  v32 = v16;
  v33 = v20;
  v34 = v14;
  v35 = v18;
  v28 = v8;
  v29 = self;
  v36 = v22;
  v37 = a5;
  v23 = v8;
  v25 = objc_msgSend_performDataAccessWithOptions_usingBlock_error_(v10, v24, 0, v27, a5);

  if (!v38)
    v25 = 0;

  return v25;
}

- (ANSTViSegHQInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
