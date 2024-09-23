@implementation CSUVisualGenerationTextEncoderV1NetworkOutput

- (CSUVisualGenerationTextEncoderV1NetworkOutput)initWithLastHiddenLayer:(const void *)a3 PooledCLIPEmbedding:(const void *)a4 MaskIndices:(const void *)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CSUVisualGenerationTextEncoderV1NetworkOutput *v11;
  uint64_t v12;
  MLMultiArray *lastHiddenLayerEmbedding;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MLMultiArray *pooledCLIPLayerEmbedding;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *maskIndices;
  CSUVisualGenerationTextEncoderV1NetworkOutput *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CSUVisualGenerationTextEncoderV1NetworkOutput;
  v11 = -[CSUVisualGenerationTextEncoderV1NetworkOutput init](&v34, sel_init);
  if (v11)
  {
    objc_msgSend_deepCopyFromTensor_(CSUMLMultiArrayUtilities, v8, (uint64_t)a3, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    lastHiddenLayerEmbedding = v11->_lastHiddenLayerEmbedding;
    v11->_lastHiddenLayerEmbedding = (MLMultiArray *)v12;

    objc_msgSend_deepCopyFromTensor_(CSUMLMultiArrayUtilities, v14, (uint64_t)a4, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    pooledCLIPLayerEmbedding = v11->_pooledCLIPLayerEmbedding;
    v11->_pooledCLIPLayerEmbedding = (MLMultiArray *)v17;

    v23 = (void *)objc_opt_new();
    v25 = *(_QWORD *)a5;
    for (i = *((_QWORD *)a5 + 1); v25 != i; v25 += 16)
    {
      objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v19, *(_QWORD *)v25, (int)(*(_DWORD *)(v25 + 8) - *(_QWORD *)v25), v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v23, v27, (uint64_t)v26, v28, v29);

    }
    v30 = objc_msgSend_copy(v23, v19, v20, v21, v22);
    maskIndices = v11->_maskIndices;
    v11->_maskIndices = (NSArray *)v30;

    v32 = v11;
  }

  return v11;
}

- (MLMultiArray)lastHiddenLayerEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (MLMultiArray)pooledCLIPLayerEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)maskIndices
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskIndices, 0);
  objc_storeStrong((id *)&self->_pooledCLIPLayerEmbedding, 0);
  objc_storeStrong((id *)&self->_lastHiddenLayerEmbedding, 0);
}

@end
