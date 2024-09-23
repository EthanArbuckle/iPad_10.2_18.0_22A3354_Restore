@implementation MLPConvolutionLayer

- (MLPConvolutionLayer)initWithName:(id)a3 previousLayer:(id)a4 kernelWidth:(unint64_t)a5 kernelHeight:(unint64_t)a6 kernelStride:(unint64_t)a7 outputChannels:(unint64_t)a8 neuronType:(int)a9 neuronParams:(id)a10
{
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  MLPConvolutionLayer *v28;

  v16 = a3;
  v17 = a4;
  v18 = a10;
  v22 = objc_msgSend_outputLength(v17, v19, v20, v21);
  v26 = objc_msgSend_outputChannels(v17, v23, v24, v25);
  v28 = (MLPConvolutionLayer *)objc_msgSend_initWithName_inputLength_inputChannels_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(self, v27, (uint64_t)v16, v22, v26, a5, a6, a7, a8, a9, v18);

  return v28;
}

- (MLPConvolutionLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 kernelWidth:(unint64_t)a6 kernelHeight:(unint64_t)a7 kernelStride:(unint64_t)a8 outputChannels:(unint64_t)a9 neuronType:(int)a10 neuronParams:(id)a11
{
  id v17;
  id v18;
  MLPConvolutionLayer *v19;
  const char *v20;
  uint64_t v21;
  MLPConvolutionLayer *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
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
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  objc_super v50;

  v17 = a3;
  v18 = a11;
  v50.receiver = self;
  v50.super_class = (Class)MLPConvolutionLayer;
  v19 = -[MLPImageLayer initWithLayerType:name:neuronType:neuronParams:](&v50, sel_initWithLayerType_name_neuronType_neuronParams_, 3, v17, a10, v18);
  v22 = v19;
  if (v19)
  {
    objc_msgSend_setInputLength_(v19, v20, a4, v21);
    objc_msgSend_setInputChannels_(v22, v23, a5, v24);
    objc_msgSend_setKernelWidth_(v22, v25, a6, v26);
    objc_msgSend_setKernelHeight_(v22, v27, a7, v28);
    objc_msgSend_setKernelStride_(v22, v29, a8, v30);
    objc_msgSend_setOutputChannels_(v22, v31, a9, v32);
    v36 = objc_msgSend_inputLength(v22, v33, v34, v35);
    v40 = objc_msgSend_kernelWidth(v22, v37, v38, v39);
    v44 = objc_msgSend_kernelStride(v22, v41, v42, v43);
    v46 = objc_msgSend_computeOutputLengthWithInputLength_kernelWidth_kernelStride_(v22, v45, v36, v40, v44);
    objc_msgSend_setOutputLength_(v22, v47, v46, v48);
  }

  return v22;
}

- (MLPConvolutionLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6;
  MLPConvolutionLayer *v7;
  const char *v8;
  uint64_t v9;
  MLPConvolutionLayer *v10;
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
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;

  v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)MLPConvolutionLayer;
  v7 = -[MLPImageLayer initWithLayerType:name:parameters:](&v42, sel_initWithLayerType_name_parameters_, 3, v6, a4);
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
    objc_msgSend_setInitialWeights_(v10, v37, (uint64_t)a4->var13[0], v38);
    objc_msgSend_setInitialBias_(v10, v39, (uint64_t)a4->var14[0], v40);
  }

  return v10;
}

- (void)updatePrimaryCurrentState:(id)a3 index:(id)a4 inference:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  MPSStateBatch *batch;

  batch = (MPSStateBatch *)a3;
  v8 = a4;
  if (a5)
  {
    MPSStateBatchIncrementReadCount(batch, -1);
  }
  else
  {
    MPSStateBatchIncrementReadCount(batch, 1);
    objc_msgSend_primaryCurrentStates(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)batch, (uint64_t)v8);

  }
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
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  id v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  int v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  double v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  id v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  id v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  objc_class *v130;
  MLPModelConvolutionDataSource *v131;
  objc_class *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  int v136;
  int v137;

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_layerType(self, v13, v14, v15);
  v132 = (objc_class *)objc_opt_class();
  objc_msgSend_layerType(self, v16, v17, v18);
  v130 = (objc_class *)objc_opt_class();
  objc_msgSend_paddingWithMethod_(MEMORY[0x1E0CC71B8], v19, 0, v20);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optimizerParams(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_learningRate(v28, v29, v30, v31);
  v33 = v32;

  v131 = [MLPModelConvolutionDataSource alloc];
  v129 = objc_msgSend_kernelWidth(self, v34, v35, v36);
  v40 = objc_msgSend_kernelHeight(self, v37, v38, v39);
  v44 = objc_msgSend_inputChannels(self, v41, v42, v43);
  v48 = objc_msgSend_outputChannels(self, v45, v46, v47);
  v52 = objc_msgSend_kernelStride(self, v49, v50, v51);
  objc_msgSend_name(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_initialWeights(self, v57, v58, v59);
  v64 = objc_msgSend_initialBias(self, v61, v62, v63);
  objc_msgSend_network(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 841731191;
  v135 = 0x3F7FBE773F666666;
  v137 = v33;
  v74 = (void *)objc_msgSend_initWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_stride_kernelParamsBinaryName_initialWeights_initialBias_deviceHandler_optimizerOptions_(v131, v73, v129, v40, v44, v48, v52, v56, v60, v64, v72, &v135);

  objc_msgSend_setDataSource_(self, v75, (uint64_t)v74, v76);
  v77 = [v132 alloc];
  v79 = (void *)objc_msgSend_initWithDevice_weights_(v77, v78, (uint64_t)v134, (uint64_t)v74);
  objc_msgSend_setPadding_(v79, v80, (uint64_t)v133, v81);
  objc_msgSend_setForwardKernel_(self, v82, (uint64_t)v79, v83);
  v84 = [v130 alloc];
  v86 = (void *)objc_msgSend_initWithDevice_weights_(v84, v85, (uint64_t)v134, (uint64_t)v74);
  objc_msgSend_setPadding_(v86, v87, (uint64_t)v133, v88);
  objc_msgSend_setPrimaryGradientKernel_(self, v89, (uint64_t)v86, v90);
  if (objc_msgSend_neuronType(self, v91, v92, v93))
  {
    v97 = (void *)MEMORY[0x1E0CC71E8];
    v98 = objc_msgSend_neuronType(self, v94, v95, v96);
    objc_msgSend_neuronA(self, v99, v100, v101);
    v103 = v102;
    objc_msgSend_neuronB(self, v104, v105, v106);
    v108 = v107;
    objc_msgSend_neuronC(self, v109, v110, v111);
    LODWORD(v113) = v112;
    LODWORD(v114) = v103;
    LODWORD(v115) = v108;
    objc_msgSend_cnnNeuronDescriptorWithType_a_b_c_(v97, v116, v98, v117, v114, v115, v113);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_alloc(MEMORY[0x1E0CC6D30]);
    v121 = (void *)objc_msgSend_initWithDevice_neuronDescriptor_(v119, v120, (uint64_t)v134, (uint64_t)v118);
    objc_msgSend_setSecondaryForwardKernel_(self, v122, (uint64_t)v121, v123);

    v124 = objc_alloc(MEMORY[0x1E0CC6D40]);
    v126 = (void *)objc_msgSend_initWithDevice_neuronDescriptor_(v124, v125, (uint64_t)v134, (uint64_t)v118);
    objc_msgSend_setSecondaryGradientKernel_(self, v127, (uint64_t)v126, v128);

  }
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  id v28;
  const char *v29;
  void *v31;
  id v32;
  id v33;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  objc_msgSend_forwardKernel(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secondaryForwardKernel(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateInputToFirstKernel_inference_(self, v19, (uint64_t)v10, v6);
  v33 = 0;
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v14, v20, (uint64_t)v9, (uint64_t)v10, &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v33;
  objc_msgSend_updatePrimaryCurrentState_inference_(self, v23, (uint64_t)v22, v6);
  v24 = v21;

  v26 = v24;
  if (v18)
  {
    v31 = v14;
    objc_msgSend_updateInputToSecondKernel_inference_(self, v25, (uint64_t)v24, v6);
    v32 = 0;
    objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationStates_destinationStateIsTemporary_(v18, v27, (uint64_t)v9, (uint64_t)v24, &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    objc_msgSend_updateSecondaryCurrentState_inference_(self, v29, (uint64_t)v28, v6);

    v14 = v31;
  }

  return v26;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  id v68;

  v6 = a3;
  v7 = a4;
  objc_msgSend_secondaryGradientKernel(self, v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  if (v14)
  {
    objc_msgSend_inputToSecondKernel(self, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_secondaryCurrentState(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v14, v21, (uint64_t)v6, (uint64_t)v7, v16, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_forwardKernel(self, v11, v12, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryGradientKernel(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputToFirstKernel(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryCurrentState(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceGradients_sourceImages_gradientStates_(v26, v35, (uint64_t)v6, (uint64_t)v15, v30, v34);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_primaryCurrentState(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v39, v40, 0, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataSource(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)objc_msgSend_updateWithCommandBuffer_gradientState_(v46, v47, (uint64_t)v6, (uint64_t)v42);

  objc_msgSend_dataSource(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_state(v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reloadWeightsAndBiasesWithCommandBuffer_state_(v22, v57, (uint64_t)v6, (uint64_t)v56);

  objc_msgSend_dataSource(self, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_state(v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reloadWeightsAndBiasesWithCommandBuffer_state_(v26, v66, (uint64_t)v6, (uint64_t)v65);

  return v68;
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
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  id v95;
  _QWORD v96[7];
  uint64_t v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  void *v106;
  void *v107;

  v8 = a3;
  v9 = a4;
  bzero(v96, 0x2C0uLL);
  v97 = 0;
  v96[4] = 0;
  v96[5] = 0;
  v96[0] = 11;
  if (objc_msgSend_neuronType(self, v10, v11, v12) == 1)
  {
    v16 = 5;
LABEL_5:
    v97 = v16;
    goto LABEL_6;
  }
  if (objc_msgSend_neuronType(self, v13, v14, v15) == 3)
  {
    v16 = 1;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend_dataSource(self, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightsInWHIOOrder(v17, v18, v19, v20);
  v95 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataSource(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_sizeWeights(v24, v25, v26, v27);
  sub_19C239334(v28);
  v30 = v29;

  v31 = objc_retainAutorelease(v95);
  v35 = (const void *)objc_msgSend_bytes(v31, v32, v33, v34);
  objc_msgSend_dataSource(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_sizeWeights(v39, v40, v41, v42);
  memcpy(v30, v35, 4 * v43);

  v106 = v30;
  objc_msgSend_dataSource(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_sizeBias(v47, v48, v49, v50);
  sub_19C239334(v51);
  v53 = v52;

  objc_msgSend_dataSource(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_biasBuffer(v57, v58, v59, v60);
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v65 = (const void *)objc_msgSend_contents(v61, v62, v63, v64);
  objc_msgSend_dataSource(self, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_sizeBias(v69, v70, v71, v72);
  memcpy(v53, v65, 4 * v73);

  v107 = v53;
  v98 = objc_msgSend_inputLength(self, v74, v75, v76);
  v99 = 1;
  v100 = objc_msgSend_inputChannels(self, v77, v78, v79);
  v101 = objc_msgSend_outputChannels(self, v80, v81, v82);
  v102 = objc_msgSend_kernelWidth(self, v83, v84, v85);
  v103 = objc_msgSend_kernelHeight(self, v86, v87, v88);
  v104 = objc_msgSend_kernelStride(self, v89, v90, v91);
  v105 = 1;
  objc_msgSend_generateNode_model_weightIter_params_(self, v92, (uint64_t)v8, (uint64_t)v9, a5, v96);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  return v93;
}

- (MLPModelConvolutionDataSource)dataSource
{
  return (MLPModelConvolutionDataSource *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (const)initialWeights
{
  return self->_initialWeights;
}

- (void)setInitialWeights:(const void *)a3
{
  self->_initialWeights = a3;
}

- (const)initialBias
{
  return self->_initialBias;
}

- (void)setInitialBias:(const void *)a3
{
  self->_initialBias = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
