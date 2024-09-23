@implementation MLPMatrixLayer

- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  MLPMatrixLayer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  MLPMatrixLayer *v16;
  objc_super v18;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MLPMatrixLayer;
  v12 = -[MLPLayer initWithLayerType:name:neuronType:neuronParams:](&v18, sel_initWithLayerType_name_neuronType_neuronParams_, a3, v10, v7, v11);
  v16 = v12;
  if (v12)
    objc_msgSend_allocateInputDictionaries(v12, v13, v14, v15);

  return v16;
}

- (MLPMatrixLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8;
  MLPMatrixLayer *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  MLPMatrixLayer *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MLPMatrixLayer;
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
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputMatrixToSecondKernel_(self, v5, (uint64_t)v12, v6);

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputMatrixToFirstKernel_(self, v10, (uint64_t)v13, v11);

}

- (void)updateInputMatrixToFirstKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  if (!a5)
  {
    objc_msgSend_incrementReadCount(v17, v8, v9, v10);
    objc_msgSend_inputMatrixToFirstKernel(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v17, (uint64_t)v11);

  }
}

- (void)updateInputMatrixToSecondKernel:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  if (!a5)
  {
    objc_msgSend_incrementReadCount(v17, v8, v9, v10);
    objc_msgSend_inputMatrixToSecondKernel(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v17, (uint64_t)v11);

  }
}

- (unint64_t)numInputs
{
  return self->_numInputs;
}

- (void)setNumInputs:(unint64_t)a3
{
  self->_numInputs = a3;
}

- (unint64_t)numOutputs
{
  return self->_numOutputs;
}

- (void)setNumOutputs:(unint64_t)a3
{
  self->_numOutputs = a3;
}

- (NSMutableDictionary)inputMatrixToSecondKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputMatrixToSecondKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableDictionary)inputMatrixToFirstKernel
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputMatrixToFirstKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMatrixToFirstKernel, 0);
  objc_storeStrong((id *)&self->_inputMatrixToSecondKernel, 0);
}

@end
