@implementation MLPLossLayer

- (MLPLossLayer)initWithName:(id)a3 previousLayer:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  MLPLossLayer *v22;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16 = objc_msgSend_outputLength(v11, v13, v14, v15);
  v20 = objc_msgSend_outputChannels(v11, v17, v18, v19);
  v22 = (MLPLossLayer *)objc_msgSend_initWithName_inputLength_inputChannels_neuronType_neuronParams_(self, v21, (uint64_t)v10, v16, v20, v7, v12);

  return v22;
}

- (MLPLossLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 inputChannels:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  MLPLossLayer *v14;
  const char *v15;
  uint64_t v16;
  MLPLossLayer *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MLPLossLayer;
  v14 = -[MLPImageLayer initWithLayerType:name:neuronType:neuronParams:](&v25, sel_initWithLayerType_name_neuronType_neuronParams_, 2, v12, v8, v13);
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setInputLength_(v14, v15, a4, v16);
    objc_msgSend_setOutputLength_(v17, v18, a4, v19);
    objc_msgSend_setInputChannels_(v17, v20, a5, v21);
    objc_msgSend_setOutputChannels_(v17, v22, a5, v23);
  }

  return v17;
}

- (MLPLossLayer)initWithName:(id)a3 parameters:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLPLossLayer;
  return -[MLPImageLayer initWithLayerType:name:parameters:](&v5, sel_initWithLayerType_name_parameters_, 2, a3, a4);
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
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  objc_super v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)MLPLossLayer;
  -[MLPLayer updatePreviousLayer:nextLayer:network:](&v51, sel_updatePreviousLayer_nextLayer_network_, v8, v9, v10);
  objc_msgSend_previousLayer(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_outputLength(v14, v15, v16, v17);
  objc_msgSend_setInputLength_(self, v19, v18, v20);

  objc_msgSend_previousLayer(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_outputLength(v24, v25, v26, v27);
  objc_msgSend_setOutputLength_(self, v29, v28, v30);

  objc_msgSend_previousLayer(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_outputChannels(v34, v35, v36, v37);
  objc_msgSend_setInputChannels_(self, v39, v38, v40);

  objc_msgSend_previousLayer(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_outputChannels(v44, v45, v46, v47);
  objc_msgSend_setOutputChannels_(self, v49, v48, v50);

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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  id v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  const char *v91;
  uint64_t v92;
  id v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  id v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  id v118;

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v118 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_networkType(v16, v17, v18, v19);

  if (v20 == 1)
  {
    objc_msgSend_cnnLossDescriptorWithType_reductionType_(MEMORY[0x1E0CC6D20], v21, 2, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v30 = 1.0 / (float)(unint64_t)objc_msgSend_batchSize(v26, v27, v28, v29);
    objc_msgSend_setWeight_(v22, v31, v32, v33, v30);

    v34 = objc_alloc(MEMORY[0x1E0CC6D10]);
    v36 = (void *)objc_msgSend_initWithDevice_lossDescriptor_(v34, v35, (uint64_t)v118, (uint64_t)v22);
    objc_msgSend_setForwardKernel_(self, v37, (uint64_t)v36, v38);
    v39 = objc_alloc(MEMORY[0x1E0CC6DC0]);
    v42 = (void *)objc_msgSend_initWithDevice_(v39, v40, (uint64_t)v118, v41);
    objc_msgSend_setSecondaryForwardKernel_(self, v43, (uint64_t)v42, v44);

  }
  else
  {
    v45 = objc_alloc(MEMORY[0x1E0CC6F38]);
    v48 = (void *)objc_msgSend_initWithDevice_(v45, v46, (uint64_t)v118, v47);
    objc_msgSend_setMatrixSoftMax_(self, v49, (uint64_t)v48, v50);

    v51 = objc_alloc(MEMORY[0x1E0CC6F18]);
    v54 = (void *)objc_msgSend_initWithDevice_(v51, v52, (uint64_t)v118, v53);
    objc_msgSend_setMatrixLogSoftMax_(self, v55, (uint64_t)v54, v56);

    v57 = objc_alloc(MEMORY[0x1E0CC70A0]);
    v60 = (void *)objc_msgSend_initWithDevice_(v57, v58, (uint64_t)v118, v59);
    objc_msgSend_setMultiplication_(self, v61, (uint64_t)v60, v62);

    v63 = objc_alloc(MEMORY[0x1E0CC7130]);
    v65 = (void *)objc_msgSend_initWithDevice_axis_(v63, v64, (uint64_t)v118, 0);
    objc_msgSend_setReductionSum_(self, v66, (uint64_t)v65, v67);

    objc_msgSend_defaultAllocator(MEMORY[0x1E0CC6F50], v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reductionSum(self, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDestinationArrayAllocator_(v75, v76, (uint64_t)v71, v77);

    v78 = objc_alloc(MEMORY[0x1E0CC6F28]);
    v81 = (void *)objc_msgSend_initWithDevice_(v78, v79, (uint64_t)v118, v80);
    objc_msgSend_setNegativeNeuron_(self, v82, (uint64_t)v81, v83);

    objc_msgSend_negativeNeuron(self, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = -1.0;
    LODWORD(v89) = 0;
    LODWORD(v90) = 0;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v87, v91, 2, v92, v88, v89, v90);

    v93 = objc_alloc(MEMORY[0x1E0CC6EE0]);
    objc_msgSend_network(self, v94, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend_lossBatchSize(v97, v98, v99, v100);
    v105 = objc_msgSend_inputChannels(self, v102, v103, v104);
    v107 = (void *)objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v93, v106, (uint64_t)v118, v101, v105, 0, 0);
    objc_msgSend_setMatrixLargeCopyFilter_(self, v108, (uint64_t)v107, v109);

    v110 = objc_alloc(MEMORY[0x1E0CC6EE0]);
    v114 = objc_msgSend_inputChannels(self, v111, v112, v113);
    v22 = (void *)objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v110, v115, (uint64_t)v118, 1, v114, 0, 0);
    objc_msgSend_setMatrixSingleCopyFilter_(self, v116, (uint64_t)v22, v117);
  }

}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  if (v6)
    objc_msgSend_imageInferenceForward_input_lossLabels_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  else
    objc_msgSend_imageTrainingForward_input_lossLabels_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)imageTrainingForward:(id)a3 input:(id)a4 lossLabels:(id)a5
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
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_network(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v9;
  objc_msgSend_forwardKernel(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_labels_(v27, v28, (uint64_t)v8, (uint64_t)v23, v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)imageInferenceForward:(id)a3 input:(id)a4 lossLabels:(id)a5
{
  id v8;
  MPSImageBatch *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  const char *v23;
  id v24;
  MPSImageBatch *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;

  v8 = a3;
  v9 = (MPSImageBatch *)a4;
  v10 = a5;
  objc_msgSend_network(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_computeLossOnInference(v14, v15, v16, v17);

  if (v18)
  {
    objc_msgSend_objectAtIndex_(v9, v19, 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      MPSImageBatchIncrementReadCount(v9, 1);
    v24 = (id)objc_msgSend_imageTrainingForward_input_lossLabels_(self, v23, (uint64_t)v8, (uint64_t)v9, v10);
  }
  v25 = v9;
  objc_msgSend_secondaryForwardKernel(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_(v29, v30, (uint64_t)v8, (uint64_t)v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)seqForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v13 = a5;
  if (v6)
    objc_msgSend_seqInferenceForward_inputMatrix_dataBatch_(self, v12, (uint64_t)v10, (uint64_t)v11, v13);
  else
    objc_msgSend_seqTrainingForward_inputMatrix_dataBatch_computeLossGradient_(self, v12, (uint64_t)v10, (uint64_t)v11, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)seqTrainingForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5 computeLossGradient:(BOOL)a6
{
  _BOOL4 v6;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  id v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  float *__p;
  void *v121;
  id v122;
  void (**v123)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129;
  MLPLossLayer *v130;
  id v131;
  id v132;
  id v133;
  uint64_t *v134;
  unint64_t v135;
  BOOL v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  int v140;

  v6 = a6;
  v119 = a3;
  v122 = a4;
  v116 = a5;
  objc_msgSend_network(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v17, v18, v19, v20);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_data(v122, v21, v22, v23);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend_rows(v122, v24, v25, v26);
  objc_msgSend_combinedLossLabels(v116, v27, v28, v29);
  v137 = 0;
  v138 = &v137;
  v140 = 0;
  v139 = 0x2020000000;
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_labels(v121, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_count(v33, v34, v35, v36);
  objc_msgSend_labels(v121, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_count(v41, v42, v43, v44);
  v46 = (float *)operator new(8uLL);
  *v46 = 1.0 / (float)(unint64_t)v37;
  v46[1] = -1.0 / (float)(unint64_t)v45;
  __p = v46;

  objc_msgSend_network(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = 0;
  objc_msgSend_biasVectorWithLength_stdDev_values_(v54, v56, 2, (uint64_t)__p, v55);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_network(self, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_inputChannels(self, v65, v66, v67);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v64, v69, v124, v68, v119);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = 0;
  }
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = sub_19C245B3C;
  v125[3] = &unk_1E3D25950;
  v113 = v118;
  v126 = v113;
  v71 = v122;
  v127 = v71;
  v134 = &v137;
  v135 = v124;
  v111 = v117;
  v128 = v111;
  v72 = v121;
  v129 = v72;
  v130 = self;
  v112 = v119;
  v131 = v112;
  v110 = v115;
  v132 = v110;
  v136 = v6;
  v114 = v70;
  v133 = v114;
  v123 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AD22D4](v125);
  objc_msgSend_network(self, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_lossBatchSize(v76, v77, v78, v79);
  objc_msgSend_network(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_lossBatchSize(v84, v85, v86, v87);
  objc_msgSend_matrixLargeCopyFilter(self, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v72;
  objc_msgSend_largeReductionSumResult(v72, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, unint64_t, void *, void *))v123)[2](v123, v80, v124 / v88, v92, v97);

  v101 = *((unsigned int *)v138 + 6);
  v102 = v124 - v101;
  if (v124 != v101)
  {
    objc_msgSend_matrixSingleCopyFilter(self, v98, v99, v100);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_smallReductionSumResult(v93, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, void *, void *))v123)[2](v123, 1, v102, v103, v107);

  }
  objc_msgSend_decrementReadCount(v71, v98, v99, v100);
  v108 = v114;

  operator delete(__p);
  _Block_object_dispose(&v137, 8);

  return v108;
}

- (id)seqTrainingForward:(id)a3 subMatrix:(id)a4 reductionSumResults:(id)a5 alphaVec:(id)a6 labels:(id)a7 rowOffset:(unint64_t)a8 computeNRows:(unint64_t)a9 computeLossGradient:(BOOL)a10
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
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
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  _DWORD *v129;
  uint64_t i;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  const char *v148;
  id v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  void *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  id v220;
  _QWORD v221[3];
  _QWORD v222[3];
  _QWORD v223[2];
  _QWORD v224[4];

  v224[2] = *MEMORY[0x1E0C80C00];
  v220 = a3;
  v16 = a4;
  v214 = a5;
  v210 = a6;
  v17 = a7;
  v218 = v16;
  v208 = objc_msgSend_columns(v16, v18, v19, v20);
  v205 = objc_msgSend_rowBytes(v16, v21, v22, v23);
  objc_msgSend_network(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v31, v32, v33, v34);
  v215 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc(MEMORY[0x1E0CC6F48]);
  v39 = objc_msgSend_outputChannels(self, v36, v37, v38);
  v211 = (void *)objc_msgSend_initWithDevice_count_rows_columns_transpose_(v35, v40, (uint64_t)v215, 2, a9, v39, 0);
  objc_msgSend_network(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_outputChannels(self, v49, v50, v51);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v48, v53, a9, v52, v220);
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_outputChannels(self, v62, v63, v64);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v61, v66, a9, v65, v220);
  v217 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_outputChannels(self, v75, v76, v77);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v74, v79, a9, v78, v220);
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_incrementReadCount(v16, v80, v81, v82);
  objc_msgSend_matrixSoftMax(self, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = 0;
  v222[2] = 0;
  v222[0] = a8;
  objc_msgSend_setSourceMatrixOrigin_(v86, v87, (uint64_t)v222, v88);

  objc_msgSend_matrixLogSoftMax(self, v89, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v221[1] = 0;
  v221[2] = 0;
  v221[0] = a8;
  objc_msgSend_setSourceMatrixOrigin_(v92, v93, (uint64_t)v221, v94);

  objc_msgSend_matrixSoftMax(self, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceRows_(v98, v99, a9, v100);

  objc_msgSend_matrixLogSoftMax(self, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceRows_(v104, v105, a9, v106);

  objc_msgSend_matrixSoftMax(self, v107, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v110, v111, (uint64_t)v220, (uint64_t)v16, v216);

  objc_msgSend_matrixLogSoftMax(self, v112, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v115, v116, (uint64_t)v220, (uint64_t)v16, v217);

  objc_msgSend_negativeNeuron(self, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v120, v121, (uint64_t)v220, (uint64_t)v217, 0, v219);

  v128 = objc_msgSend_outputChannels(self, v122, v123, v124) * a9;
  if (!v128)
  {
    v129 = 0;
    if (!a9)
      goto LABEL_8;
LABEL_6:
    for (i = 0; i != a9; ++i)
    {
      v131 = objc_msgSend_outputChannels(self, v125, v126, v127);
      objc_msgSend_objectAtIndexedSubscript_(v17, v132, i, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v129[objc_msgSend_unsignedIntegerValue(v134, v135, v136, v137) + v131 * i] = 1065353216;

    }
    goto LABEL_8;
  }
  if (v128 >> 62)
    sub_19C07DA0C();
  v129 = operator new(4 * v128);
  bzero(v129, 4 * v128);
  if (a9)
    goto LABEL_6;
LABEL_8:
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v125, a9, v127);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = v138;
  v139 = (void *)MEMORY[0x1E0CB37E8];
  v143 = objc_msgSend_outputChannels(self, v140, v141, v142);
  objc_msgSend_numberWithUnsignedInteger_(v139, v144, v143, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v224[1] = v146;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v147, (uint64_t)v224, 2);
  v213 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_descriptorWithDataType_shape_(MEMORY[0x1E0CC6FE0], v148, 268435488, (uint64_t)v213);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = objc_alloc(MEMORY[0x1E0CC6F50]);
  v151 = (void *)objc_msgSend_initWithDevice_descriptor_(v149, v150, (uint64_t)v215, (uint64_t)v207);
  objc_msgSend_writeBytes_strideBytes_(v151, v152, (uint64_t)v129, 0);
  v153 = (void *)MEMORY[0x1E0CC6FE0];
  v157 = objc_msgSend_columns(v219, v154, v155, v156);
  v161 = objc_msgSend_rows(v219, v158, v159, v160);
  objc_msgSend_descriptorWithDataType_dimensionSizes_(v153, v162, 268435488, v157, v161, 0);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ndArrayWithCommandBuffer_descriptor_aliasing_(v219, v163, (uint64_t)v220, (uint64_t)v206, 2);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiplication(self, v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_primarySourceArray_secondarySourceArray_(v167, v168, (uint64_t)v220, (uint64_t)v212, v151);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_reductionSum(self, v170, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_sourceArray_(v173, v174, (uint64_t)v220, (uint64_t)v169);
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v214, v176, (uint64_t)v175, v177);
  if (a10)
  {
    objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E0CC6F00], v178, a9, v208, v205, 268435488);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_matrixWithCommandBuffer_descriptor_aliasing_(v151, v181, (uint64_t)v220, (uint64_t)v209, 0);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v183, v184, v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v186, v187, v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v190, v191, a9, v208, v220);
    v192 = (void *)objc_claimAutoreleasedReturnValue();

    v223[0] = v216;
    v223[1] = v182;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v193, (uint64_t)v223, 2);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeToCommandBuffer_sourceMatrices_resultMatrix_scaleVector_offsetVector_biasVector_startIndex_(v211, v195, (uint64_t)v220, (uint64_t)v194, v192, v210, 0, 0, 0);

  }
  else
  {
    v192 = 0;
  }
  objc_msgSend_resetReadCount(v216, v178, v179, v180);
  objc_msgSend_resetReadCount(v217, v196, v197, v198);
  objc_msgSend_resetReadCount(v219, v199, v200, v201);
  objc_msgSend_setReadCount_(v169, v202, 0, v203);

  if (v129)
    operator delete(v129);

  return v192;
}

- (id)seqInferenceForward:(id)a3 inputMatrix:(id)a4 dataBatch:(id)a5
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
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  _QWORD v69[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_network(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_computeLossOnInference(v14, v15, v16, v17);

  if (v18)
  {
    objc_msgSend_incrementReadCount(v9, v19, v20, v21);
    v23 = (id)objc_msgSend_seqTrainingForward_inputMatrix_dataBatch_computeLossGradient_(self, v22, (uint64_t)v8, (uint64_t)v9, v10, 0);
  }
  objc_msgSend_matrixSoftMax(self, v19, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v69, 0, sizeof(v69));
  objc_msgSend_setSourceMatrixOrigin_(v24, v25, (uint64_t)v69, v26);

  objc_msgSend_matrixSoftMax(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSourceRows_(v30, v31, -1, v32);

  objc_msgSend_network(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_rows(v9, v53, v54, v55);
  v60 = objc_msgSend_columns(v9, v57, v58, v59);
  objc_msgSend_matrixWithRows_columns_cmdBuf_(v52, v61, v56, v60, v8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_matrixSoftMax(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_resultMatrix_(v66, v67, (uint64_t)v8, (uint64_t)v9, v62);

  return v62;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v11, v17, 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_seqForward_inputMatrix_dataBatch_runInference_(self, v20, (uint64_t)v10, (uint64_t)v19, v12, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v16, v22, (uint64_t)v21, v23);
  return v16;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  return a4;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  return a5;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  const char *v9;
  _QWORD v11[88];

  bzero(v11, 0x2C0uLL);
  v11[4] = 0;
  v11[5] = 0;
  v11[0] = 2;
  v11[7] = 4;
  objc_msgSend_generateNode_model_weightIter_params_(self, v9, (uint64_t)a3, (uint64_t)a4, a5, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MPSNDArrayMultiplication)multiplication
{
  return (MPSNDArrayMultiplication *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMultiplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (MPSNDArrayReductionSum)reductionSum
{
  return (MPSNDArrayReductionSum *)objc_getProperty(self, a2, 176, 1);
}

- (void)setReductionSum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (MPSMatrixSoftMax)matrixSoftMax
{
  return (MPSMatrixSoftMax *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMatrixSoftMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (MPSMatrixLogSoftMax)matrixLogSoftMax
{
  return (MPSMatrixLogSoftMax *)objc_getProperty(self, a2, 192, 1);
}

- (void)setMatrixLogSoftMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (MPSMatrixNeuron)negativeNeuron
{
  return (MPSMatrixNeuron *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNegativeNeuron:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (MPSMatrixCopy)matrixLargeCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMatrixLargeCopyFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (MPSMatrixCopy)matrixSingleCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMatrixSingleCopyFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matrixSingleCopyFilter, 0);
  objc_storeStrong((id *)&self->_matrixLargeCopyFilter, 0);
  objc_storeStrong((id *)&self->_negativeNeuron, 0);
  objc_storeStrong((id *)&self->_matrixLogSoftMax, 0);
  objc_storeStrong((id *)&self->_matrixSoftMax, 0);
  objc_storeStrong((id *)&self->_reductionSum, 0);
  objc_storeStrong((id *)&self->_multiplication, 0);
}

@end
