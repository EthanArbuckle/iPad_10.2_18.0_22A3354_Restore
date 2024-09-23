@implementation MLPDropoutLayer

- (MLPDropoutLayer)initWithName:(id)a3 previousLayer:(id)a4 dropoutRatio:(float)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  MLPDropoutLayer *v20;

  v8 = a3;
  v9 = a4;
  v13 = objc_msgSend_outputLength(v9, v10, v11, v12);
  v17 = objc_msgSend_outputChannels(v9, v14, v15, v16);
  *(float *)&v18 = a5;
  v20 = (MLPDropoutLayer *)objc_msgSend_initWithName_inputLength_inputChannels_dropoutRatio_(self, v19, (uint64_t)v8, v13, v17, v18);

  return v20;
}

- (MLPDropoutLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 dropoutRatio:(float)a6
{
  id v10;
  MLPDropoutLayer *v11;
  const char *v12;
  uint64_t v13;
  MLPDropoutLayer *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  objc_super v22;

  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MLPDropoutLayer;
  v11 = -[MLPImageLayer initWithLayerType:name:neuronType:neuronParams:](&v22, sel_initWithLayerType_name_neuronType_neuronParams_, 1, v10, 0, 0);
  v14 = v11;
  if (v11)
  {
    v11->_dropoutRatio = a6;
    objc_msgSend_setInputLength_(v11, v12, a4, v13);
    objc_msgSend_setOutputLength_(v14, v15, a4, v16);
    objc_msgSend_setInputChannels_(v14, v17, a5, v18);
    objc_msgSend_setOutputChannels_(v14, v19, a5, v20);
  }

  return v14;
}

- (MLPDropoutLayer)initWithName:(id)a3 parameters:(id *)a4
{
  MLPDropoutLayer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLPDropoutLayer;
  result = -[MLPImageLayer initWithLayerType:name:parameters:](&v6, sel_initWithLayerType_name_parameters_, 1, a3, a4);
  if (result)
    result->_dropoutRatio = a4->var12[0];
  return result;
}

- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  objc_super v60;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v60.receiver = self;
  v60.super_class = (Class)MLPDropoutLayer;
  -[MLPLayer updatePreviousLayer:nextLayer:network:](&v60, sel_updatePreviousLayer_nextLayer_network_, v8, v9, v10);
  objc_msgSend_previousLayer(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_previousLayer(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_outputLength(v18, v19, v20, v21);
    objc_msgSend_setInputLength_(self, v23, v22, v24);

    objc_msgSend_previousLayer(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_outputChannels(v28, v29, v30, v31);
  }
  else
  {
    objc_msgSend_network(self, v15, v16, v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_inputLength(v35, v36, v37, v38);
    objc_msgSend_setInputLength_(self, v40, v39, v41);

    objc_msgSend_network(self, v42, v43, v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_inputChannels(v28, v45, v46, v47);
  }
  objc_msgSend_setInputChannels_(self, v33, v32, v34);

  v51 = objc_msgSend_inputLength(self, v48, v49, v50);
  objc_msgSend_setOutputLength_(self, v52, v51, v53);
  v57 = objc_msgSend_inputChannels(self, v54, v55, v56);
  objc_msgSend_setOutputChannels_(self, v58, v57, v59);

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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  double v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  double v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  int64x2_t v49;
  uint64_t v50;
  int64x2_t v51;
  uint64_t v52;

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1232348160;
  LODWORD(v23) = 0;
  objc_msgSend_uniformRandWithParamA_paramB_(v21, v24, v25, v26, v23, v22);
  v28 = v27;

  v29 = objc_alloc(MEMORY[0x1E0CC6CF0]);
  objc_msgSend_dropoutRatio(self, v30, v31, v32);
  *(float *)&v34 = 1.0 - v33;
  v51 = vdupq_n_s64(1uLL);
  v52 = 1;
  v36 = (void *)objc_msgSend_initWithDevice_keepProbability_seed_maskStrideInPixels_(v29, v35, (uint64_t)v13, (unint64_t)v28, &v51, v34);
  v37 = objc_alloc(MEMORY[0x1E0CC6CF8]);
  objc_msgSend_dropoutRatio(self, v38, v39, v40);
  *(float *)&v42 = 1.0 - v41;
  v49 = vdupq_n_s64(1uLL);
  v50 = 1;
  v44 = (void *)objc_msgSend_initWithDevice_keepProbability_seed_maskStrideInPixels_(v37, v43, (uint64_t)v13, (unint64_t)v28, &v49, v42);
  objc_msgSend_setForwardKernel_(self, v45, (uint64_t)v36, v46);
  objc_msgSend_setPrimaryGradientKernel_(self, v47, (uint64_t)v44, v48);

}

- (id)forward:(id)a3 input:(id)a4 index:(id)a5 runInference:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  id v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v17 = v13;
  if (v6)
  {
    v18 = v13;
  }
  else
  {
    objc_msgSend_forwardKernel(self, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateInputToFirstKernel_index_inference_(self, v20, (uint64_t)v17, (uint64_t)v12, 0);
    v26 = 0;
    objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v19, v21, (uint64_t)v10, (uint64_t)v17, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v26;
    v18 = v22;

    objc_msgSend_updatePrimaryCurrentState_index_inference_(self, v24, (uint64_t)v23, (uint64_t)v12, 0);
  }

  return v18;
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  objc_msgSend_forward_input_index_runInference_(self, a2, (uint64_t)a3, (uint64_t)a4, &unk_1E3D2E5B8, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t i;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;

  v6 = a6;
  v89 = a3;
  v10 = a4;
  v86 = a5;
  if (v6)
  {
    v14 = v10;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v14;
    objc_msgSend_deviceHandler(v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v22, v23, v24, v25);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    v87 = v10;
    for (i = objc_msgSend_count(v10, v27, v28, v29); v26 < i; i = objc_msgSend_count(v87, v81, v82, v83))
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v31, v26, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_network(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceHandler(v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_network(self, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_m2iKernel(v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_outputChannels(self, v50, v51, v52);
      objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v41, v54, (uint64_t)v33, (uint64_t)v49, v89, 1, 1, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v56, v26, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_forward_input_index_runInference_(self, v59, (uint64_t)v89, (uint64_t)v55, v58, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_network(self, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceHandler(v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_network(self, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_i2mKernel(v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v68, v77, (uint64_t)v60, (uint64_t)v76, v89);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_addObject_(v88, v79, (uint64_t)v78, v80);
      ++v26;
      v10 = v87;
      v14 = v88;
    }

  }
  return v14;
}

- (id)backward:(id)a3 index:(id)a4 inputGradient:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_primaryGradientKernel(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputImagesToFirstKernel(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryCurrentStates(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v9, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v14, v29, (uint64_t)v8, (uint64_t)v10, v21, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  objc_msgSend_backward_index_inputGradient_(self, a2, (uint64_t)a3, (uint64_t)&unk_1E3D2E5B8, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t i;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;

  v79 = a3;
  v75 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v13 = objc_msgSend_count(v8, v10, v11, v12);
  objc_msgSend_arrayWithCapacity_(v9, v14, v13, v15);
  v78 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v77 = v8;
  for (i = objc_msgSend_count(v8, v17, v18, v19, v75); v16 < i; i = objc_msgSend_count(v77, v71, v72, v73, v76))
  {
    objc_msgSend_objectAtIndexedSubscript_(v8, v21, v16, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_m2iKernel(v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_outputChannels(self, v40, v41, v42);
    objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v31, v44, (uint64_t)v23, (uint64_t)v39, v79, 1, 1, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v46, v16, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backward_index_inputGradient_(self, v49, (uint64_t)v79, (uint64_t)v48, v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_network(self, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_i2mKernel(v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v58, v67, (uint64_t)v50, (uint64_t)v66, v79);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v78, v69, (uint64_t)v68, v70);
    ++v16;
    v8 = v77;
  }

  return v78;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  void *v15;
  _QWORD v17[48];
  int v18;

  v8 = a3;
  v9 = a4;
  bzero(v17, 0x2C0uLL);
  v17[4] = 0;
  v17[5] = 0;
  v17[7] = 6;
  objc_msgSend_dropoutRatio(self, v10, v11, v12, 2);
  v18 = v13;
  objc_msgSend_generateNode_model_weightIter_params_(self, v14, (uint64_t)v8, (uint64_t)v9, a5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (float)dropoutRatio
{
  return self->_dropoutRatio;
}

@end
