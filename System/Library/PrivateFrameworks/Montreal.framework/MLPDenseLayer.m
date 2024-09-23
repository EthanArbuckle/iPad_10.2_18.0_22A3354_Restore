@implementation MLPDenseLayer

- (MLPDenseLayer)initWithName:(id)a3 previousLayer:(id)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  MLPDenseLayer *v28;
  id v30;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v13;
    v19 = objc_msgSend_outputChannels(v15, v16, v17, v18);
    v23 = objc_msgSend_outputLength(v15, v20, v21, v22) * v19;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v25, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Could not extract info from previous layer"), 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v30);
    }
    v23 = objc_msgSend_numOutputs(v13, v25, v26, v27);
  }
  v28 = (MLPDenseLayer *)objc_msgSend_initWithName_numInputs_numOutputs_neuronType_neuronParams_(self, v24, (uint64_t)v12, v23, a5, v8, v14);

  return v28;
}

- (MLPDenseLayer)initWithName:(id)a3 numInputs:(unint64_t)a4 numOutputs:(unint64_t)a5 neuronType:(int)a6 neuronParams:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  MLPDenseLayer *v14;
  const char *v15;
  uint64_t v16;
  MLPDenseLayer *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  objc_super v29;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MLPDenseLayer;
  v14 = -[MLPMatrixLayer initWithLayerType:name:neuronType:neuronParams:](&v29, sel_initWithLayerType_name_neuronType_neuronParams_, 6, v12, v8, v13);
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setNumInputs_(v14, v15, a4, v16);
    objc_msgSend_setNumOutputs_(v17, v18, a5, v19);
    objc_msgSend_setInputLength_(v17, v20, 1, v21);
    objc_msgSend_setInputChannels_(v17, v22, a4, v23);
    objc_msgSend_setOutputLength_(v17, v24, 1, v25);
    objc_msgSend_setOutputChannels_(v17, v26, a5, v27);
  }

  return v17;
}

- (MLPDenseLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6;
  MLPDenseLayer *v7;
  const char *v8;
  uint64_t v9;
  MLPDenseLayer *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  objc_super v34;

  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MLPDenseLayer;
  v7 = -[MLPMatrixLayer initWithLayerType:name:parameters:](&v34, sel_initWithLayerType_name_parameters_, 6, v6, a4);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setNumInputs_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setNumOutputs_(v10, v11, a4->var10[0][0], v12);
    objc_msgSend_setInputLength_(v10, v13, 1, v14);
    v18 = objc_msgSend_numInputs(v10, v15, v16, v17);
    objc_msgSend_setInputChannels_(v10, v19, v18, v20);
    objc_msgSend_setOutputLength_(v10, v21, 1, v22);
    v26 = objc_msgSend_numOutputs(v10, v23, v24, v25);
    objc_msgSend_setOutputChannels_(v10, v27, v26, v28);
    objc_msgSend_setInitialWeights_(v10, v29, (uint64_t)a4->var13[0], v30);
    objc_msgSend_setInitialBias_(v10, v31, (uint64_t)a4->var14[0], v32);
  }

  return v10;
}

- (NSArray)mlpOptimizers
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_optimizerWeights(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend_optimizerBiases(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
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
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
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
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  int v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  double v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  id v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  double v147;
  double v148;
  double v149;
  const char *v150;
  uint64_t v151;
  _QWORD v152[5];
  _QWORD v153[5];

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CC6F08]);
  v17 = (void *)objc_msgSend_initWithDevice_(v14, v15, (uint64_t)v13, v16);
  objc_msgSend_setForwardKernel_(self, v18, (uint64_t)v17, v19);

  v20 = objc_alloc(MEMORY[0x1E0CC6F10]);
  v23 = (void *)objc_msgSend_initWithDevice_(v20, v21, (uint64_t)v13, v22);
  objc_msgSend_setPrimaryGradientKernel_(self, v24, (uint64_t)v23, v25);

  objc_msgSend_network(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_numInputs(self, v34, v35, v36);
  v41 = objc_msgSend_numOutputs(self, v38, v39, v40);
  v45 = objc_msgSend_initialWeights(self, v42, v43, v44);
  LODWORD(v46) = 1017370378;
  objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v33, v47, v37, v41, v45, 1, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeights_(self, v49, (uint64_t)v48, v50);

  objc_msgSend_network(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend_numOutputs(self, v59, v60, v61);
  v66 = objc_msgSend_initialBias(self, v63, v64, v65);
  LODWORD(v67) = 0;
  objc_msgSend_biasVectorWithLength_stdDev_values_(v58, v68, v62, v66, v67);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBiasVector_(self, v70, (uint64_t)v69, v71);

  v72 = MEMORY[0x1E0C809B0];
  v153[0] = MEMORY[0x1E0C809B0];
  v153[1] = 3221225472;
  v153[2] = sub_19C2538F4;
  v153[3] = &unk_1E3D25650;
  v153[4] = self;
  v73 = (void *)MEMORY[0x1A1AD22D4](v153);
  objc_msgSend_network(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v78, (uint64_t)v77, (uint64_t)v73, v73);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptimizerWeights_(self, v80, (uint64_t)v79, v81);

  v152[0] = v72;
  v152[1] = 3221225472;
  v152[2] = sub_19C253A00;
  v152[3] = &unk_1E3D25650;
  v152[4] = self;
  v82 = (void *)MEMORY[0x1A1AD22D4](v152);
  objc_msgSend_network(self, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v87, (uint64_t)v86, (uint64_t)v82, v82);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptimizerBiases_(self, v89, (uint64_t)v88, v90);

  if (objc_msgSend_neuronType(self, v91, v92, v93))
  {
    v94 = objc_alloc(MEMORY[0x1E0CC6F28]);
    v97 = (void *)objc_msgSend_initWithDevice_(v94, v95, (uint64_t)v13, v96);
    objc_msgSend_setSecondaryForwardKernel_(self, v98, (uint64_t)v97, v99);
    v103 = objc_msgSend_neuronType(self, v100, v101, v102);
    objc_msgSend_neuronA(self, v104, v105, v106);
    v108 = v107;
    objc_msgSend_neuronB(self, v109, v110, v111);
    v113 = v112;
    objc_msgSend_neuronC(self, v114, v115, v116);
    LODWORD(v118) = v117;
    LODWORD(v119) = v108;
    LODWORD(v120) = v113;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v97, v121, v103, v122, v119, v120, v118);
    v123 = objc_alloc(MEMORY[0x1E0CC6F30]);
    v126 = (void *)objc_msgSend_initWithDevice_(v123, v124, (uint64_t)v13, v125);
    objc_msgSend_setSecondaryGradientKernel_(self, v127, (uint64_t)v126, v128);
    v132 = objc_msgSend_neuronType(self, v129, v130, v131);
    objc_msgSend_neuronA(self, v133, v134, v135);
    v137 = v136;
    objc_msgSend_neuronB(self, v138, v139, v140);
    v142 = v141;
    objc_msgSend_neuronC(self, v143, v144, v145);
    LODWORD(v147) = v146;
    LODWORD(v148) = v137;
    LODWORD(v149) = v142;
    objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v126, v150, v132, v151, v148, v149, v147);

  }
}

- (id)forward:(id)a3 inputMatrix:(id)a4 index:(id)a5 runInference:(BOOL)a6
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  id v67;
  const char *v68;
  id v69;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_forwardKernel(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateInputMatrixToFirstKernel_index_inference_(self, v17, (uint64_t)v11, (uint64_t)v12, v6);
  objc_msgSend_network(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_rows(v11, v26, v27, v28);
  v33 = objc_msgSend_numOutputs(self, v30, v31, v32);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v25, v34, v29, v33, v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_weights(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_biasVector(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_weightMatrix_biasVector_resultMatrix_(v16, v44, (uint64_t)v10, (uint64_t)v11, v39, v43, v35);

  objc_msgSend_secondaryForwardKernel(self, v45, v46, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend_updateInputMatrixToSecondKernel_index_inference_(self, v48, (uint64_t)v35, (uint64_t)v12, v6);
    objc_msgSend_network(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_rows(v11, v58, v59, v60);
    v65 = objc_msgSend_numOutputs(self, v62, v63, v64);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v57, v66, v61, v65, v10);
    v67 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v49, v68, (uint64_t)v10, (uint64_t)v35, 0, v67);
  }
  else
  {
    v67 = v35;
  }
  v69 = v67;

  return v69;
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
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  objc_msgSend_network(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_i2mKernel(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v18, v27, (uint64_t)v10, (uint64_t)v26, v9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_forward_inputMatrix_index_runInference_(self, v29, (uint64_t)v9, (uint64_t)v28, &unk_1E3D2E768, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_m2iKernel(v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_numOutputs(self, v47, v48, v49);
  objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v38, v51, (uint64_t)v30, (uint64_t)v46, v9, 1, 1, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v49;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v49 = a5;
  v12 = (void *)MEMORY[0x1E0C99DE8];
  v16 = objc_msgSend_count(v11, v13, v14, v15);
  objc_msgSend_arrayWithCapacity_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputMatrixToSecondKernel(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v23, v24, v25, v26);

  objc_msgSend_inputMatrixToFirstKernel(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v30, v31, v32, v33);

  for (i = 0; i < objc_msgSend_count(v11, v34, v35, v36); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v11, v38, i, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v41, i, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_forward_inputMatrix_index_runInference_(self, v44, (uint64_t)v10, (uint64_t)v40, v43, v6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v19, v46, (uint64_t)v45, v47);
  }

  return v19;
}

- (id)backward:(id)a3 index:(id)a4 inputGradientMatrix:(id)a5
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
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
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  id v123;
  _QWORD v124[2];

  v124[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v123 = a4;
  v9 = a5;
  v13 = objc_msgSend_rows(v9, v10, v11, v12);
  objc_msgSend_secondaryGradientKernel(self, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend_network(self, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_numOutputs(self, v26, v27, v28);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v25, v30, v13, v29, v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputMatrixToSecondKernel(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v123, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeToCommandBuffer_gradientMatrix_inputMatrix_biasVector_resultGradientForDataMatrix_resultGradientForBiasVector_(v20, v39, (uint64_t)v8, (uint64_t)v9, v38, 0, v31, 0);

  }
  else
  {
    v31 = v9;
  }
  v124[0] = v31;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v124, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C239224(v40);

  objc_msgSend_primaryGradientKernel(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_numInputs(self, v53, v54, v55);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v52, v57, v13, v56, v8);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_numInputs(self, v67, v68, v69);
  v74 = objc_msgSend_numOutputs(self, v71, v72, v73);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v66, v75, v70, v74, v8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_numOutputs(self, v85, v86, v87);
  objc_msgSend_vectorWithLength_cmdBuf_(v84, v89, v88, (uint64_t)v8);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_weights(self, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeGradientForDataToCommandBuffer_gradientMatrix_weightMatrix_resultGradientForDataMatrix_(v44, v95, (uint64_t)v8, (uint64_t)v31, v94, v58);

  objc_msgSend_inputMatrixToFirstKernel(self, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v99, v100, (uint64_t)v123, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeGradientForWeightsAndBiasToCommandBuffer_gradientMatrix_inputMatrix_resultGradientForWeightMatrix_resultGradientForBiasVector_(v44, v103, (uint64_t)v8, (uint64_t)v31, v102, v76, v90);

  objc_msgSend_optimizerBiases(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_biasVector(self, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientVector_inputValuesVector_(v107, v112, (uint64_t)v8, (uint64_t)v90, v111);

  objc_msgSend_optimizerWeights(self, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v116, v121, (uint64_t)v8, (uint64_t)v76, v120);

  return v58;
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  const char *v23;
  uint64_t v24;
  const char *v25;
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
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  void *v62;
  id v63;

  v6 = a3;
  v63 = a4;
  objc_msgSend_network(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_i2mKernel(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tempMatrixFromImages_i2mKernel_cmdBuf_(v14, v23, (uint64_t)v63, (uint64_t)v22, v6);
  v24 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v24;
  objc_msgSend_backward_index_inputGradientMatrix_(self, v25, (uint64_t)v6, (uint64_t)&unk_1E3D2E768, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_m2iKernel(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previousLayer(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_outputLength(v46, v47, v48, v49);
  objc_msgSend_previousLayer(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_outputChannels(v54, v55, v56, v57);
  objc_msgSend_imageBatchFromMatrix_m2iKernel_cmdBuf_width_height_channels_(v34, v59, (uint64_t)v26, (uint64_t)v42, v6, v50, 1, v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t i;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v15 = objc_msgSend_count(v10, v12, v13, v14);
  objc_msgSend_arrayWithCapacity_(v11, v16, v15, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v10, v18, v19, v20); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v10, v23, i, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v26, i, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_backward_index_inputGradientMatrix_(self, v29, (uint64_t)v8, (uint64_t)v28, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v21, v31, (uint64_t)v30, v32);
  }

  return v21;
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
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
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  void *v162;
  const char *v163;
  void *v164;
  unint64_t *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  id v170;
  id v171;
  _QWORD v172[10];
  _QWORD v173[16];
  int v174;
  int v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD v178[3];
  void *v179;
  _QWORD v180[3];
  _QWORD v181[3];

  v181[1] = *MEMORY[0x1E0C80C00];
  v170 = a3;
  v171 = a4;
  bzero(v173, 0x2C0uLL);
  v173[4] = 0;
  v173[5] = 0;
  v173[0] = 0;
  v11 = objc_msgSend_neuronType(self, v8, v9, v10);
  v173[7] = objc_msgSend_montrealTypeFromMPSNeuronType_(self, v12, v11, v13);
  objc_msgSend_weights(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_rows(v17, v18, v19, v20);
  objc_msgSend_weights(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_columns(v25, v26, v27, v28);
  sub_19C239334(v29 * v21);
  v31 = v30;

  v35 = objc_msgSend_numOutputs(self, v32, v33, v34);
  sub_19C239334(v35);
  v37 = v36;
  v174 = objc_msgSend_numInputs(self, v38, v39, v40);
  v175 = objc_msgSend_numOutputs(self, v41, v42, v43);
  objc_msgSend_weights(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_rows(v47, v48, v49, v50);

  objc_msgSend_weights(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend_columns(v55, v56, v57, v58);

  objc_msgSend_weights(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_rowBytes(v62, v63, v64, v65);

  objc_msgSend_network(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v74, v75, v76, v77);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = a5;
  objc_msgSend_commandQueue(v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = v89;
  objc_msgSend_commandBuffer(v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    objc_msgSend_network(self, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weights(self, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v109, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_importDataFromGPU_cmdBuf_(v105, v114, (uint64_t)v113, (uint64_t)v93);

  }
  objc_msgSend_biasVector(self, v98, v99, v100);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend_network(self, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v119, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_biasVector(self, v124, v125, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_importDataFromGPU_cmdBuf_(v123, v132, (uint64_t)v131, (uint64_t)v93);

  }
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = sub_19C254FFC;
  v172[3] = &unk_1E3D25B50;
  v172[4] = self;
  v172[5] = v51;
  v172[6] = v169;
  v172[7] = v31;
  v172[8] = v66;
  v172[9] = v37;
  objc_msgSend_addCompletedHandler_(v93, v116, (uint64_t)v172, v118);
  objc_msgSend_commit(v93, v133, v134, v135);
  objc_msgSend_waitUntilCompleted(v93, v136, v137, v138);
  v176 = v31;
  v177 = v37;
  v180[0] = &unk_1E3D2E780;
  v180[1] = &unk_1E3D2E780;
  v139 = (void *)MEMORY[0x1E0CB37E8];
  v143 = objc_msgSend_numInputs(self, v140, v141, v142);
  objc_msgSend_numberWithUnsignedInteger_(v139, v144, v143, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v180[2] = v146;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v147, (uint64_t)v180, 3);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v181[0] = v148;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v149, (uint64_t)v181, 1);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v178[0] = &unk_1E3D2E780;
  v178[1] = &unk_1E3D2E780;
  v151 = (void *)MEMORY[0x1E0CB37E8];
  v155 = objc_msgSend_numOutputs(self, v152, v153, v154);
  objc_msgSend_numberWithUnsignedInteger_(v151, v156, v155, v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v158;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v159, (uint64_t)v178, 3);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v160;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v161, (uint64_t)&v179, 1);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v163, (uint64_t)v170, (uint64_t)v171, v166, v173, v150, v162);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  return v164;
}

- (MPSMatrix)weights
{
  return (MPSMatrix *)objc_getProperty(self, a2, 168, 1);
}

- (void)setWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (MPSVector)biasVector
{
  return (MPSVector *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBiasVector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (MLPOptimizer)optimizerWeights
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOptimizerWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (MLPOptimizer)optimizerBiases
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOptimizerBiases:(id)a3
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
  objc_storeStrong((id *)&self->_optimizerBiases, 0);
  objc_storeStrong((id *)&self->_optimizerWeights, 0);
  objc_storeStrong((id *)&self->_biasVector, 0);
  objc_storeStrong((id *)&self->_weights, 0);
}

@end
