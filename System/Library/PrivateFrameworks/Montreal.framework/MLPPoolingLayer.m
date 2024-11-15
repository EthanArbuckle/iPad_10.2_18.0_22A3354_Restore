@implementation MLPPoolingLayer

- (MLPPoolingLayer)initWithName:(id)a3 previousLayer:(id)a4 kernelWidth:(unint64_t)a5 kernelHeight:(unint64_t)a6 kernelStride:(unint64_t)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  MLPPoolingLayer *v23;

  v12 = a3;
  v13 = a4;
  v17 = objc_msgSend_outputLength(v13, v14, v15, v16);
  v21 = objc_msgSend_outputChannels(v13, v18, v19, v20);
  v23 = (MLPPoolingLayer *)objc_msgSend_initWithName_inputLength_inputChannels_kernelWidth_kernelHeight_kernelStride_(self, v22, (uint64_t)v12, v17, v21, a5, a6, a7);

  return v23;
}

- (MLPPoolingLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 kernelWidth:(unint64_t)a6 kernelHeight:(unint64_t)a7 kernelStride:(unint64_t)a8
{
  id v14;
  MLPPoolingLayer *v15;
  const char *v16;
  uint64_t v17;
  MLPPoolingLayer *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  objc_super v46;

  v14 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MLPPoolingLayer;
  v15 = -[MLPImageLayer initWithLayerType:name:neuronType:neuronParams:](&v46, sel_initWithLayerType_name_neuronType_neuronParams_, 5, v14, 0, 0);
  v18 = v15;
  if (v15)
  {
    objc_msgSend_setInputLength_(v15, v16, a4, v17);
    objc_msgSend_setInputChannels_(v18, v19, a5, v20);
    objc_msgSend_setKernelWidth_(v18, v21, a6, v22);
    objc_msgSend_setKernelHeight_(v18, v23, a7, v24);
    objc_msgSend_setKernelStride_(v18, v25, a8, v26);
    objc_msgSend_setOutputChannels_(v18, v27, a5, v28);
    v32 = objc_msgSend_inputLength(v18, v29, v30, v31);
    v36 = objc_msgSend_kernelWidth(v18, v33, v34, v35);
    v40 = objc_msgSend_kernelStride(v18, v37, v38, v39);
    v42 = objc_msgSend_computeOutputLengthWithInputLength_kernelWidth_kernelStride_(v18, v41, v32, v36, v40);
    objc_msgSend_setOutputLength_(v18, v43, v42, v44);
  }

  return v18;
}

- (MLPPoolingLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6;
  MLPPoolingLayer *v7;
  const char *v8;
  uint64_t v9;
  MLPPoolingLayer *v10;
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
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  objc_super v38;

  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MLPPoolingLayer;
  v7 = -[MLPImageLayer initWithLayerType:name:parameters:](&v38, sel_initWithLayerType_name_parameters_, 5, v6, a4);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setInputLength_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setInputChannels_(v10, v11, a4->var9[0][2], v12);
    objc_msgSend_setKernelWidth_(v10, v13, a4->var11[0], v14);
    objc_msgSend_setKernelHeight_(v10, v15, a4->var11[1], v16);
    objc_msgSend_setKernelStride_(v10, v17, a4->var11[2], v18);
    objc_msgSend_setOutputChannels_(v10, v19, a4->var10[0][0], v20);
    v24 = objc_msgSend_inputLength(v10, v21, v22, v23);
    v28 = objc_msgSend_kernelWidth(v10, v25, v26, v27);
    v32 = objc_msgSend_kernelStride(v10, v29, v30, v31);
    v34 = objc_msgSend_computeOutputLengthWithInputLength_kernelWidth_kernelStride_(v10, v33, v24, v28, v32);
    objc_msgSend_setOutputLength_(v10, v35, v34, v36);
  }

  return v10;
}

- (void)createKernel
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  id v62;

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v62 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_paddingWithMethod_(MEMORY[0x1E0CC71B8], v13, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CC6DB0]);
  v20 = objc_msgSend_kernelWidth(self, v17, v18, v19);
  v24 = objc_msgSend_kernelHeight(self, v21, v22, v23);
  v28 = objc_msgSend_kernelStride(self, v25, v26, v27);
  v32 = objc_msgSend_kernelStride(self, v29, v30, v31);
  v34 = (void *)objc_msgSend_initWithDevice_kernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY_(v16, v33, (uint64_t)v62, v20, v24, v28, v32);
  objc_msgSend_setPadding_(v34, v35, (uint64_t)v15, v36);
  objc_msgSend_setForwardKernel_(self, v37, (uint64_t)v34, v38);
  v39 = objc_alloc(MEMORY[0x1E0CC6DB8]);
  v43 = objc_msgSend_kernelWidth(self, v40, v41, v42);
  v47 = objc_msgSend_kernelHeight(self, v44, v45, v46);
  v51 = objc_msgSend_kernelStride(self, v48, v49, v50);
  v55 = objc_msgSend_kernelStride(self, v52, v53, v54);
  v57 = (void *)objc_msgSend_initWithDevice_kernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY_(v39, v56, (uint64_t)v62, v43, v47, v51, v55);
  objc_msgSend_setPadding_(v57, v58, (uint64_t)v15, v59);
  objc_msgSend_setPrimaryGradientKernel_(self, v60, (uint64_t)v57, v61);

}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  id v21;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  objc_msgSend_forwardKernel(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateInputToFirstKernel_inference_(self, v15, (uint64_t)v10, v6);
  v21 = 0;
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v14, v16, (uint64_t)v9, (uint64_t)v10, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  objc_msgSend_updatePrimaryCurrentState_inference_(self, v19, (uint64_t)v18, v6);

  return v17;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend_primaryGradientKernel(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputToFirstKernel(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryCurrentState(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v11, v20, (uint64_t)v6, (uint64_t)v7, v15, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  _QWORD v31[16];
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;

  v8 = a3;
  v9 = a4;
  bzero(v31, 0x2C0uLL);
  v31[7] = 0;
  v31[4] = 0;
  v31[5] = 0;
  v32 = objc_msgSend_inputLength(self, v10, v11, v12, 12);
  v33 = 1;
  v34 = objc_msgSend_inputChannels(self, v13, v14, v15);
  v35 = objc_msgSend_outputChannels(self, v16, v17, v18);
  v36 = objc_msgSend_kernelWidth(self, v19, v20, v21);
  v37 = objc_msgSend_kernelHeight(self, v22, v23, v24);
  v38 = objc_msgSend_kernelStride(self, v25, v26, v27);
  v39 = 1;
  objc_msgSend_generateNode_model_weightIter_params_(self, v28, (uint64_t)v8, (uint64_t)v9, a5, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

@end
