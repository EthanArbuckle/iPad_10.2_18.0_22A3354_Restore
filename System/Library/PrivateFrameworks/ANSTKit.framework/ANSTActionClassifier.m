@implementation ANSTActionClassifier

- (int64_t)windowSize
{
  uint64_t v2;

  return objc_msgSend_windowSize(self->_featureExtractor, a2, v2);
}

- (ANSTActionClassifier)initWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  ANSTActionClassifier *v14;

  v4 = a3;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_235911988(v5, v6, v7, v8, v9, v10, v11, v12);

  v14 = (ANSTActionClassifier *)objc_msgSend__initWithConfig_error_(self, v13, (uint64_t)v4, 0);
  return v14;
}

- (ANSTActionClassifier)initWithConfig:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  ANSTActionClassifier *v8;
  id v10;

  v10 = 0;
  v5 = (void *)objc_msgSend__initWithConfig_error_(self, a2, (uint64_t)a3, &v10);
  v6 = v10;
  if (v6)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_2359119F8((uint64_t)v6, v7);

    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)_initWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  ANSTActionClassifier *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t i;
  void *v15;
  const char *v16;
  void *v17;
  ANSTVideoFeatureExtractorConfiguration *v18;
  const char *v19;
  void *v20;
  ANSTVideoFeatureExtractor *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  ANSTTensorDescriptor *v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  ANSTTensorData *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  int v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ANSTActionClassifier;
  v8 = -[ANSTActionClassifier init](&v51, sel_init);
  v9 = (uint64_t)v8;
  if (!v8)
  {
LABEL_13:
    v49 = (id)v9;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v8->_configuration, a3);
  v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v13 = (void *)objc_msgSend_initWithCapacity_(v10, v11, 53);
  for (i = 0; i != 53; ++i)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v12, i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v13, v16, (uint64_t)v15);

  }
  objc_storeStrong((id *)(v9 + 16), v13);
  v17 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  v18 = [ANSTVideoFeatureExtractorConfiguration alloc];
  v20 = (void *)objc_msgSend_initWithVersion_(v18, v19, 0x10000);
  v21 = [ANSTVideoFeatureExtractor alloc];
  v23 = objc_msgSend_initWithConfig_error_(v21, v22, (uint64_t)v20, a4);
  v24 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v23;

  v26 = *(void **)(v9 + 32);
  if (v26)
  {
    objc_msgSend_setDelegate_(v26, v25, v9);
    *(_QWORD *)(v9 + 56) = malloc_type_malloc(0xD4uLL, 0x100004052888210uLL);
    *(_QWORD *)(v9 + 64) = malloc_type_malloc(0xD4uLL, 0x100004052888210uLL);
    v52 = xmmword_235915040;
    v27 = [ANSTTensorDescriptor alloc];
    v30 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v27, v28, (uint64_t)CFSTR("decodingMatrix"), 102, 2, &v52, 1, a4);
    if (v30)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v29, (uint64_t)CFSTR("/AppleInternal/Library/Application Support/com.apple.ANSTKit/action_decoding_matrix.bin"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x24BDBCE50], v32, (uint64_t)v31, 1, a4);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v33;

      if (*(_QWORD *)(v9 + 40))
      {
        v35 = [ANSTTensorData alloc];
        v38 = objc_msgSend_bytes(*(void **)(v9 + 40), v36, v37);
        v41 = objc_msgSend_sizeInBytes(v30, v39, v40);
        v43 = objc_msgSend_initWithDescriptor_dataPointer_length_deallocator_error_(v35, v42, (uint64_t)v30, v38, v41, 0, a4);
        v44 = *(void **)(v9 + 48);
        *(_QWORD *)(v9 + 48) = v43;

        v45 = 0;
      }
      else
      {
        v48 = (id)v9;
        v45 = 1;
      }

    }
    else
    {
      v47 = (id)v9;
      v45 = 1;
    }

    if (!v45)
      goto LABEL_13;
  }
  else
  {
    v46 = (id)v9;

  }
LABEL_14:

  return (id)v9;
}

- (void)dealloc
{
  float *rawScores;
  float *probabilities;
  objc_super v5;

  rawScores = self->_rawScores;
  if (rawScores)
    free(rawScores);
  probabilities = self->_probabilities;
  if (probabilities)
    free(probabilities);
  v5.receiver = self;
  v5.super_class = (Class)ANSTActionClassifier;
  -[ANSTActionClassifier dealloc](&v5, sel_dealloc);
}

- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4
{
  return MEMORY[0x24BEDD108](self->_featureExtractor, sel_digestFrame_error_, a3);
}

- (id)getCurrentActionPredictions
{
  return self->_currentPredictions;
}

- (NSArray)listOfSupportedActions
{
  id v2;
  const char *v3;
  const char *v4;
  void *v5;
  uint64_t i;
  void *v7;
  const char *v8;

  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend_initWithCapacity_(v2, v3, 53);
  for (i = 1; i != 54; ++i)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v4, i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v8, (uint64_t)v7);

  }
  return (NSArray *)v5;
}

- (void)videoFeatureExtractor:(id)a3 didUpdateVideoFeature:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  ANSTTensorData *decodingMatrix;
  NSArray *v10;
  const char *v11;
  NSArray *currentPredictions;
  NSArray *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ANSTActionClassifier *v21;
  NSArray *v22;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v8 = (void *)objc_msgSend_initWithCapacity_(v6, v7, 53);
  decodingMatrix = self->_decodingMatrix;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_2358EB308;
  v19[3] = &unk_2506E3F28;
  v20 = v5;
  v21 = self;
  v10 = v8;
  v22 = v10;
  v18 = v5;
  objc_msgSend_performDataAccessWithOptions_usingBlock_error_(decodingMatrix, v11, 0, v19, 0);
  currentPredictions = self->_currentPredictions;
  self->_currentPredictions = v10;
  v13 = v10;

  objc_msgSend_delegate(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_actionClassifier_didUpdateActionPredictions_(v16, v17, (uint64_t)self, v13);

}

- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4
{
  return objc_msgSend_bindVideoInput_error_(self->_featureExtractor, a2, (uint64_t)a3, a4);
}

- (BOOL)bindAudioInput:(id)a3 error:(id *)a4
{
  return MEMORY[0x24BEDD108](self->_featureExtractor, sel_bindAudioInput_error_, a3);
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  return objc_msgSend_executeInferenceWithError_(self->_featureExtractor, a2, (uint64_t)a3);
}

- (BOOL)commitInputBindingWithError:(id *)a3
{
  return objc_msgSend_commitInputBindingWithError_(self->_featureExtractor, a2, (uint64_t)a3);
}

- (void)resetInputBinding
{
  uint64_t v2;

  objc_msgSend_resetInputBinding(self->_featureExtractor, a2, v2);
}

- (void)resetInferenceState
{
  NSArray *currentPredictions;
  uint64_t v4;

  currentPredictions = self->_currentPredictions;
  self->_currentPredictions = 0;

  MEMORY[0x24BEDD108](self->_featureExtractor, sel_resetInferenceState, v4);
}

- (ANSTActionClassifierConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTActionClassifierDelegate)delegate
{
  return (ANSTActionClassifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_decodingMatrix, 0);
  objc_storeStrong((id *)&self->_decodingMatrixData, 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_supportedActions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
