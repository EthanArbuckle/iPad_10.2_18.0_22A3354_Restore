@implementation ANSTInferencePostprocessor

- (ANSTInferencePostprocessor)init
{
  ANSTInferencePostprocessor *result;

  result = (ANSTInferencePostprocessor *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTInferencePostprocessor)initWithInferenceInputDescriptors:(id)a3 inferenceOutputDescriptors:(id)a4 processedOutputDescriptors:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  ANSTInferencePostprocessor *v14;
  uint64_t v15;
  NSArray *inferenceInputDescriptors;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *inferenceOutputDescriptors;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *processedOutputDescriptors;
  NSMutableDictionary *v25;
  NSMutableDictionary *inputTensorData;
  NSMutableDictionary *v27;
  NSMutableDictionary *inputPixelBuffers;
  NSMutableDictionary *v29;
  NSMutableDictionary *outputTensorData;
  NSMutableDictionary *v31;
  NSMutableDictionary *outputPixelBuffers;
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)ANSTInferencePostprocessor;
  v14 = -[ANSTInferencePostprocessor init](&v34, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v9, v12, v13);
    inferenceInputDescriptors = v14->_inferenceInputDescriptors;
    v14->_inferenceInputDescriptors = (NSArray *)v15;

    v19 = objc_msgSend_copy(v10, v17, v18);
    inferenceOutputDescriptors = v14->_inferenceOutputDescriptors;
    v14->_inferenceOutputDescriptors = (NSArray *)v19;

    v23 = objc_msgSend_copy(v11, v21, v22);
    processedOutputDescriptors = v14->_processedOutputDescriptors;
    v14->_processedOutputDescriptors = (NSArray *)v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    inputTensorData = v14->_inputTensorData;
    v14->_inputTensorData = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    inputPixelBuffers = v14->_inputPixelBuffers;
    v14->_inputPixelBuffers = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outputTensorData = v14->_outputTensorData;
    v14->_outputTensorData = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    outputPixelBuffers = v14->_outputPixelBuffers;
    v14->_outputPixelBuffers = v31;

  }
  return v14;
}

- (BOOL)_validateDescriptor:(id)a3 usingAllowedDescriptors:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend_name(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (!v11 || !objc_msgSend_length(v11, v12, v13))
  {
    if (!a5)
      goto LABEL_10;
    v16 = (void *)MEMORY[0x24BDD1540];
    v22[0] = *MEMORY[0x24BDD0BA0];
    v22[1] = CFSTR("ANSTDescriptor");
    v23[0] = CFSTR("Descriptor name should not be empty.");
    v23[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v23, v22, 2);
LABEL_9:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v18, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend_containsObject_(v8, v12, (uint64_t)v7) & 1) == 0)
  {
    if (!a5)
      goto LABEL_10;
    v16 = (void *)MEMORY[0x24BDD1540];
    v20[0] = *MEMORY[0x24BDD0BA0];
    v20[1] = CFSTR("ANSTDescriptor");
    v21[0] = CFSTR("Unrecognized descriptor is not allowed.");
    v21[1] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v21, v20, 2);
    goto LABEL_9;
  }
  LOBYTE(a5) = 1;
LABEL_10:

  return (char)a5;
}

- (BOOL)_validateTensorData:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isEqual;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!objc_msgSend__validateDescriptor_usingAllowedDescriptors_withError_(self, v12, (uint64_t)v11, a5, a6))goto LABEL_7;
  if (v10)
  {
    objc_msgSend_tensorDescriptor(v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v15, v16, (uint64_t)v11);

    if ((isEqual & 1) == 0)
    {
      if (!a6)
        goto LABEL_8;
      v19 = (void *)MEMORY[0x24BDD1540];
      v23[0] = *MEMORY[0x24BDD0BA0];
      v23[1] = CFSTR("ANSTDescriptor");
      v24[0] = CFSTR("Tensor does not match its designated descriptor.");
      v24[1] = v11;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v24, v23, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("ANSTErrorDomain"), 11, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a6) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a6) = 1;
LABEL_8:

  return (char)a6;
}

- (BOOL)_validatePixelBuffer:(id)a3 forDescriptor:(id)a4 usingAllowedDescriptors:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isEqual;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!objc_msgSend__validateDescriptor_usingAllowedDescriptors_withError_(self, v12, (uint64_t)v11, a5, a6))goto LABEL_7;
  if (v10)
  {
    objc_msgSend_pixelBufferDescriptor(v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v15, v16, (uint64_t)v11);

    if ((isEqual & 1) == 0)
    {
      if (!a6)
        goto LABEL_8;
      v19 = (void *)MEMORY[0x24BDD1540];
      v23[0] = *MEMORY[0x24BDD0BA0];
      v23[1] = CFSTR("ANSTDescriptor");
      v24[0] = CFSTR("Pixel buffer does not match its designated descriptor.");
      v24[1] = v11;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v24, v23, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("ANSTErrorDomain"), 13, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
      LOBYTE(a6) = 0;
      goto LABEL_8;
    }
  }
  LOBYTE(a6) = 1;
LABEL_8:

  return (char)a6;
}

- (BOOL)setInputTensorData:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *inputTensorData;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_inferenceInputTensorDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputTensorData = self->_inputTensorData;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(inputTensorData, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)setInputPixelBuffer:(id)a3 forInferenceInputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *inputPixelBuffers;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_inferenceInputPixelBufferDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputPixelBuffers = self->_inputPixelBuffers;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(inputPixelBuffers, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)setInputTensorData:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *inputTensorData;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_inferenceOutputTensorDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputTensorData = self->_inputTensorData;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(inputTensorData, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)setInputPixelBuffer:(id)a3 forInferenceOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *inputPixelBuffers;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_inferenceOutputPixelBufferDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    inputPixelBuffers = self->_inputPixelBuffers;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(inputPixelBuffers, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)setOutputTensorData:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *outputTensorData;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_processedOutputTensorDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validateTensorData_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    outputTensorData = self->_outputTensorData;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(outputTensorData, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)setOutputPixelBuffer:(id)a3 forProcessedOutputDescriptor:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSMutableDictionary *outputPixelBuffers;
  void *v18;
  const char *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend_processedOutputPixelBufferDescriptors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend__validatePixelBuffer_forDescriptor_usingAllowedDescriptors_withError_(self, v13, (uint64_t)v8, v9, v12, a5);

  if (v14)
  {
    outputPixelBuffers = self->_outputPixelBuffers;
    objc_msgSend_name(v9, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(outputPixelBuffers, v19, (uint64_t)v8, v18);

  }
  return v14;
}

- (BOOL)processWithError:(id *)a3
{
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of -processWithError: is required."), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)inputTensorDataForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_inputTensorData, a2, (uint64_t)a3);
}

- (id)inputPixelBufferForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_inputPixelBuffers, a2, (uint64_t)a3);
}

- (id)outputTensorDataForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_outputTensorData, a2, (uint64_t)a3);
}

- (id)outputPixelBufferForDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_outputPixelBuffers, a2, (uint64_t)a3);
}

- (NSArray)inferenceInputDescriptors
{
  return self->_inferenceInputDescriptors;
}

- (NSArray)inferenceOutputDescriptors
{
  return self->_inferenceOutputDescriptors;
}

- (NSArray)processedOutputDescriptors
{
  return self->_processedOutputDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_inferenceOutputDescriptors, 0);
  objc_storeStrong((id *)&self->_inferenceInputDescriptors, 0);
  objc_storeStrong((id *)&self->_outputPixelBuffers, 0);
  objc_storeStrong((id *)&self->_outputTensorData, 0);
  objc_storeStrong((id *)&self->_inputPixelBuffers, 0);
  objc_storeStrong((id *)&self->_inputTensorData, 0);
}

- (NSArray)inferenceInputTensorDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_inferenceInputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3AA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)inferenceInputPixelBufferDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_inferenceInputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3D40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)inferenceOutputTensorDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_inferenceOutputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3D60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)inferenceOutputPixelBufferDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_inferenceOutputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3D80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)processedOutputTensorDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_processedOutputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3DA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)processedOutputPixelBufferDescriptors
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_processedOutputDescriptors(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithBlock_(MEMORY[0x24BDD1758], v4, (uint64_t)&unk_2506E3DC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v3, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

@end
