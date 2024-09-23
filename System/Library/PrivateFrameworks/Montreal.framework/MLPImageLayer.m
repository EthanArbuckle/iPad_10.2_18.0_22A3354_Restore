@implementation MLPImageLayer

- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  MLPImageLayer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  MLPImageLayer *v16;
  objc_super v18;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MLPImageLayer;
  v12 = -[MLPLayer initWithLayerType:name:neuronType:neuronParams:](&v18, sel_initWithLayerType_name_neuronType_neuronParams_, a3, v10, v7, v11);
  v16 = v12;
  if (v12)
    objc_msgSend_allocateInputDictionaries(v12, v13, v14, v15);

  return v16;
}

- (MLPImageLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8;
  MLPImageLayer *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  MLPImageLayer *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLPImageLayer;
  v9 = -[MLPLayer initWithLayerType:name:parameters:](&v15, sel_initWithLayerType_name_parameters_, a3, v8, a5);
  v13 = v9;
  if (v9)
    objc_msgSend_allocateInputDictionaries(v9, v10, v11, v12);

  return v13;
}

- (void)allocateInputDictionaries
{
  uint64_t v2;
  uint64_t v3;
  NSMutableDictionary *v5;
  NSMutableDictionary *inputImagesToSecondKernel;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *inputImagesToFirstKernel;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *primaryCurrentStates;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *secondaryCurrentStates;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputImagesToSecondKernel = self->_inputImagesToSecondKernel;
  self->_inputImagesToSecondKernel = v5;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputImagesToFirstKernel = self->_inputImagesToFirstKernel;
  self->_inputImagesToFirstKernel = v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v12, v13, v14);
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  primaryCurrentStates = self->_primaryCurrentStates;
  self->_primaryCurrentStates = v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19);
  v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  secondaryCurrentStates = self->_secondaryCurrentStates;
  self->_secondaryCurrentStates = v20;

}

- (NSArray)inputToSecondKernel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_inputImagesToSecondKernel(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1E3D2E600, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)inputToFirstKernel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_inputImagesToFirstKernel(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1E3D2E600, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)primaryCurrentState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_primaryCurrentStates(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1E3D2E600, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)secondaryCurrentState
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_secondaryCurrentStates(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)&unk_1E3D2E600, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)updateInputToFirstKernel:(id)a3 inference:(BOOL)a4
{
  objc_msgSend_updateInputToFirstKernel_index_inference_(self, a2, (uint64_t)a3, (uint64_t)&unk_1E3D2E600, a4);
}

- (void)updateInputToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  char isKindOfClass;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  MPSImageBatch *batch;

  batch = (MPSImageBatch *)a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend_objectAtIndex_(batch, v8, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      MPSImageBatchIncrementReadCount(batch, 1);
    objc_msgSend_inputImagesToFirstKernel(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)batch, (uint64_t)v10);

  }
}

- (void)updateInputToSecondKernel:(id)a3 inference:(BOOL)a4
{
  MEMORY[0x1E0DE7D20](self, sel_updateInputToSecondKernel_index_inference_, a3, &unk_1E3D2E600);
}

- (void)updateInputToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  char isKindOfClass;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  MPSImageBatch *batch;

  batch = (MPSImageBatch *)a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend_objectAtIndex_(batch, v8, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      MPSImageBatchIncrementReadCount(batch, 1);
    objc_msgSend_inputImagesToSecondKernel(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)batch, (uint64_t)v10);

  }
}

- (void)updatePrimaryCurrentState:(id)a3 inference:(BOOL)a4
{
  objc_msgSend_updatePrimaryCurrentState_index_inference_(self, a2, (uint64_t)a3, (uint64_t)&unk_1E3D2E600, a4);
}

- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  MPSStateBatch *batch;

  batch = (MPSStateBatch *)a3;
  v11 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    objc_msgSend_primaryCurrentStates(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v11);

  }
}

- (void)updateSecondaryCurrentState:(id)a3 inference:(BOOL)a4
{
  MEMORY[0x1E0DE7D20](self, sel_updateSecondaryCurrentState_index_inference_, a3, &unk_1E3D2E600);
}

- (void)updateSecondaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  MPSStateBatch *batch;

  batch = (MPSStateBatch *)a3;
  v11 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    objc_msgSend_secondaryCurrentStates(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v11);

  }
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6
{
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  id v53;
  id v54;
  _QWORD v55[3];
  void *v56;
  _QWORD v57[3];
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v54 = a4;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_inputLength(self, v11, v12, v13);
  objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v17;
  v57[1] = &unk_1E3D2E618;
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_inputChannels(self, v19, v20, v21);
  objc_msgSend_numberWithUnsignedInteger_(v18, v23, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v25;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v57, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v27;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)v58, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0CB37E8];
  v34 = objc_msgSend_outputLength(self, v31, v32, v33);
  objc_msgSend_numberWithUnsignedInteger_(v30, v35, v34, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v37;
  v55[1] = &unk_1E3D2E618;
  v38 = (void *)MEMORY[0x1E0CB37E8];
  v42 = objc_msgSend_outputChannels(self, v39, v40, v41);
  objc_msgSend_numberWithUnsignedInteger_(v38, v43, v42, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v45;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v46, (uint64_t)v55, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v47;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)&v56, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v50, (uint64_t)v53, (uint64_t)v54, a5, a6, v29, v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (NSMutableDictionary)inputImagesToSecondKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (NSMutableDictionary)inputImagesToFirstKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSMutableDictionary)primaryCurrentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (NSMutableDictionary)secondaryCurrentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCurrentStates, 0);
  objc_storeStrong((id *)&self->_primaryCurrentStates, 0);
  objc_storeStrong((id *)&self->_inputImagesToFirstKernel, 0);
  objc_storeStrong((id *)&self->_inputImagesToSecondKernel, 0);
}

@end
