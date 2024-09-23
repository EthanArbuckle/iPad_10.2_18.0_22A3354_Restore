@implementation MLPModelConvolutionDataSource

- (MLPModelConvolutionDataSource)initWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 stride:(unint64_t)a7 kernelParamsBinaryName:(id)a8 initialWeights:(const void *)a9 initialBias:(const void *)a10 deviceHandler:(id)a11 optimizerOptions:(MLPModelOptimizerOptions)a12
{
  id v19;
  MLPModelConvolutionDataSource *v20;
  MLPModelConvolutionDataSource *v21;
  const char *v22;
  uint64_t v23;
  MPSCNNConvolutionDescriptor *convDesc;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  unint64_t outputFeatureChannels;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  MPSNNOptimizerAdam *optimizer;
  uint64_t sizeWeights;
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
  double v63;
  const char *v64;
  uint64_t sizeBias;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  const char *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  MPSCNNConvolutionWeightsAndBiasesState *state;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  double v88;
  const char *v89;
  uint64_t v90;
  MPSVector *weightMomentumVector;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  double v96;
  const char *v97;
  uint64_t v98;
  MPSVector *weightVelocityVector;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  double v104;
  const char *v105;
  uint64_t v106;
  MPSVector *biasMomentumVector;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  double v112;
  const char *v113;
  uint64_t v114;
  MPSVector *biasVelocityVector;
  MLPModelConvolutionDataSource *v116;
  id v118;
  objc_super v119;
  MLPModelOptimizerOptions *v120;

  v19 = a8;
  v118 = a11;
  v119.receiver = self;
  v119.super_class = (Class)MLPModelConvolutionDataSource;
  v20 = -[MLPModelConvolutionDataSource init](&v119, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceHandler, a11);
    v21->_optimizerOptions = *v120;
    v21->_outputFeatureChannels = a6;
    v21->_inputFeatureChannels = a5;
    v21->_kernelHeight = a4;
    v21->_kernelWidth = a3;
    objc_storeStrong((id *)&v21->_kernelParamsBinaryName, a8);
    v21->_initialWeights = a9;
    v21->_initialBias = a10;
    objc_msgSend_cnnConvolutionDescriptorWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_(MEMORY[0x1E0CC6CB0], v22, a3, a4, a5, a6);
    v23 = objc_claimAutoreleasedReturnValue();
    convDesc = v21->_convDesc;
    v21->_convDesc = (MPSCNNConvolutionDescriptor *)v23;

    objc_msgSend_setStrideInPixelsX_(v21->_convDesc, v25, a7, v26);
    objc_msgSend_setStrideInPixelsY_(v21->_convDesc, v27, 1, v28);
    outputFeatureChannels = v21->_outputFeatureChannels;
    v30 = v21->_inputFeatureChannels * outputFeatureChannels * v21->_kernelHeight * v21->_kernelWidth;
    v21->_sizeBias = outputFeatureChannels;
    v21->_sizeWeights = v30;
    *(float *)&v31 = v21->_optimizerOptions.learningRate;
    LODWORD(v32) = 925353388;
    LODWORD(v33) = 1.0;
    v36 = (id)objc_msgSend_optimizerDescriptorWithLearningRate_gradientRescale_regularizationType_regularizationScale_(MEMORY[0x1E0CC71F8], v34, 0, v35, v31, v33, v32);
    v37 = objc_alloc(MEMORY[0x1E0CC71F0]);
    objc_msgSend_deviceHandler(v21, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v46 = v21->_optimizerOptions.adamEpsilon;
    v48 = objc_msgSend_initWithDevice_beta1_beta2_epsilon_timeStep_optimizerDescriptor_(v37, v47, (uint64_t)v45, 0, v36, v21->_optimizerOptions.adamBeta1, v21->_optimizerOptions.adamBeta2, v46);
    optimizer = v21->_optimizer;
    v21->_optimizer = (MPSNNOptimizerAdam *)v48;

    sizeWeights = v21->_sizeWeights;
    objc_msgSend_deviceHandler(v21, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_initialWeights(v21, v59, v60, v61);
    LODWORD(v63) = 1017370378;
    objc_msgSend_bootstrapWeights_length_device_stdDev_values_(v21, v64, (uint64_t)&v21->_weightBuffer, sizeWeights, v58, v62, v63);

    sizeBias = v21->_sizeBias;
    objc_msgSend_deviceHandler(v21, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_initialBias(v21, v74, v75, v76);
    LODWORD(v78) = 0;
    objc_msgSend_bootstrapBias_length_device_stdDev_values_(v21, v79, (uint64_t)&v21->_biasBuffer, sizeBias, v73, v77, v78);

    v80 = objc_alloc(MEMORY[0x1E0CC6CD8]);
    v82 = objc_msgSend_initWithWeights_biases_(v80, v81, (uint64_t)v21->_weightBuffer, (uint64_t)v21->_biasBuffer);
    state = v21->_state;
    v21->_state = (MPSCNNConvolutionWeightsAndBiasesState *)v82;

    objc_msgSend_deviceHandler(v21, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v88) = 0;
    objc_msgSend_biasVectorWithLength_stdDev_values_(v87, v89, v21->_sizeWeights, 0, v88);
    v90 = objc_claimAutoreleasedReturnValue();
    weightMomentumVector = v21->_weightMomentumVector;
    v21->_weightMomentumVector = (MPSVector *)v90;

    objc_msgSend_deviceHandler(v21, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v96) = 0;
    objc_msgSend_biasVectorWithLength_stdDev_values_(v95, v97, v21->_sizeWeights, 0, v96);
    v98 = objc_claimAutoreleasedReturnValue();
    weightVelocityVector = v21->_weightVelocityVector;
    v21->_weightVelocityVector = (MPSVector *)v98;

    objc_msgSend_deviceHandler(v21, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104) = 0;
    objc_msgSend_biasVectorWithLength_stdDev_values_(v103, v105, v21->_sizeBias, 0, v104);
    v106 = objc_claimAutoreleasedReturnValue();
    biasMomentumVector = v21->_biasMomentumVector;
    v21->_biasMomentumVector = (MPSVector *)v106;

    objc_msgSend_deviceHandler(v21, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v112) = 0;
    objc_msgSend_biasVectorWithLength_stdDev_values_(v111, v113, v21->_sizeBias, 0, v112);
    v114 = objc_claimAutoreleasedReturnValue();
    biasVelocityVector = v21->_biasVelocityVector;
    v21->_biasVelocityVector = (MPSVector *)v114;

    v116 = v21;
  }

  return v21;
}

- (unsigned)dataType
{
  return 268435488;
}

- (id)descriptor
{
  return self->_convDesc;
}

- (void)weights
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_weightBuffer(self, a2, v2, v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (void *)objc_msgSend_contents(v4, v5, v6, v7);

  return v8;
}

- (void)bootstrapBuffer:(id)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  void *v17;
  float v18;
  size_t v19;
  uint64_t v20;
  char i;

  v9 = objc_retainAutorelease(a3);
  v16 = (float *)objc_msgSend_contents(v9, v10, v11, v12);
  if (a6 <= 0.0)
  {
    v19 = objc_msgSend_length(v9, v13, v14, v15);
    bzero(v16, v19);
  }
  else
  {
    LODWORD(v20) = 0;
    *((float *)&v20 + 1) = a6;
    for (i = 0; a4; --a4)
    {
      objc_msgSend_deviceHandler(self, v13, v14, v15, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = sub_19C16E4D0((uint64_t)&v20, (uint64_t)v17 + 8, (float *)&v20);

      *v16++ = v18;
    }
  }

}

- (void)bootstrapWeights:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7
{
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  double v21;
  unint64_t outputFeatureChannels;
  unint64_t kernelHeight;
  unint64_t kernelWidth;
  unint64_t inputFeatureChannels;
  uint64_t i;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  _DWORD *v34;
  unint64_t v35;
  id v36;

  v36 = a5;
  v13 = (void *)objc_msgSend_newBufferWithLength_options_(v36, v12, 4 * a4, 0);
  v14 = *a3;
  *a3 = v13;

  v15 = objc_retainAutorelease(*a3);
  v19 = objc_msgSend_contents(v15, v16, v17, v18);
  if (a7)
  {
    outputFeatureChannels = self->_outputFeatureChannels;
    if (outputFeatureChannels)
    {
      kernelHeight = self->_kernelHeight;
      if (kernelHeight)
      {
        kernelWidth = self->_kernelWidth;
        if (kernelWidth)
        {
          inputFeatureChannels = self->_inputFeatureChannels;
          if (inputFeatureChannels)
          {
            for (i = 0; i != outputFeatureChannels; ++i)
            {
              v27 = 0;
              v28 = (char *)a7;
              v29 = v19;
              do
              {
                v30 = 0;
                v31 = v28;
                v32 = (_DWORD *)v29;
                do
                {
                  v33 = v31;
                  v34 = v32;
                  v35 = inputFeatureChannels;
                  do
                  {
                    *v34++ = *v33;
                    v33 += kernelHeight * kernelWidth;
                    --v35;
                  }
                  while (v35);
                  ++v30;
                  v32 += inputFeatureChannels;
                  ++v31;
                }
                while (v30 != kernelWidth);
                ++v27;
                v29 += 4 * kernelWidth * inputFeatureChannels;
                v28 += 4 * kernelWidth;
              }
              while (v27 != kernelHeight);
              v19 += 4 * kernelHeight * kernelWidth * inputFeatureChannels;
              a7 = (char *)a7 + 4 * inputFeatureChannels * kernelHeight * kernelWidth;
            }
          }
        }
      }
    }
  }
  else
  {
    *(float *)&v21 = a6;
    objc_msgSend_bootstrapBuffer_length_device_stdDev_(self, v20, (uint64_t)*a3, a4, v36, v21);
  }

}

- (void)bootstrapBias:(id *)a3 length:(unint64_t)a4 device:(id)a5 stdDev:(float)a6 values:(const void *)a7
{
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  id v23;
  void *v24;
  size_t v25;
  id v26;

  v26 = a5;
  v13 = (void *)objc_msgSend_newBufferWithLength_options_(v26, v12, 4 * a4, 0);
  v14 = *a3;
  *a3 = v13;

  v15 = objc_retainAutorelease(*a3);
  v19 = objc_msgSend_contents(v15, v16, v17, v18);
  v23 = *a3;
  if (a7)
  {
    v24 = (void *)v19;
    v25 = objc_msgSend_length(*a3, v20, (uint64_t)v23, v21);
    memcpy(v24, a7, v25);
  }
  else
  {
    *(float *)&v22 = a6;
    objc_msgSend_bootstrapBuffer_length_device_stdDev_(self, v20, (uint64_t)v23, a4, v26, v22);
  }

}

- (NSData)weightsInWHIOOrder
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  unint64_t outputFeatureChannels;
  unint64_t kernelHeight;
  unint64_t kernelWidth;
  unint64_t inputFeatureChannels;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  int *v29;
  _DWORD *v30;
  unint64_t v31;
  int v32;
  void *v33;

  v5 = objc_msgSend_sizeWeights(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    if (v5 >> 62)
      sub_19C07DA0C();
    v10 = 4 * v5;
    v11 = (char *)operator new(4 * v5);
    v9 = (unint64_t)&v11[4 * v9];
    bzero(v11, v10);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend_load(self, v6, v7, v8);
  v15 = objc_msgSend_weights(self, v12, v13, v14);
  outputFeatureChannels = self->_outputFeatureChannels;
  if (outputFeatureChannels)
  {
    kernelHeight = self->_kernelHeight;
    if (kernelHeight)
    {
      kernelWidth = self->_kernelWidth;
      if (kernelWidth)
      {
        inputFeatureChannels = self->_inputFeatureChannels;
        if (inputFeatureChannels)
        {
          v21 = 0;
          v16 = (const char *)(4 * inputFeatureChannels);
          v22 = v11;
          do
          {
            v23 = 0;
            v24 = v15;
            v25 = v22;
            do
            {
              v26 = 0;
              v27 = v24;
              v28 = v25;
              do
              {
                v29 = (int *)v27;
                v30 = v28;
                v31 = inputFeatureChannels;
                do
                {
                  v32 = *v29++;
                  *v30 = v32;
                  v30 += kernelHeight * kernelWidth;
                  --v31;
                }
                while (v31);
                ++v26;
                ++v28;
                v27 += (uint64_t)v16;
              }
              while (v26 != kernelWidth);
              ++v23;
              v25 += kernelWidth;
              v24 += 4 * kernelWidth * inputFeatureChannels;
            }
            while (v23 != kernelHeight);
            ++v21;
            v22 += 4 * inputFeatureChannels * kernelHeight * kernelWidth;
            v15 += 4 * kernelHeight * kernelWidth * inputFeatureChannels;
          }
          while (v21 != outputFeatureChannels);
        }
      }
    }
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v16, (uint64_t)v11, v9 - (_QWORD)v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    operator delete(v11);
  return (NSData *)v33;
}

- (float)biasTerms
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;

  objc_msgSend_biasBuffer(self, a2, v2, v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (float *)objc_msgSend_contents(v4, v5, v6, v7);

  return v8;
}

- (BOOL)load
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

  objc_msgSend_deviceHandler(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkpointWithCommandQueue_(self, v10, (uint64_t)v9, v11);

  return 1;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4
{
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
  const char *v22;
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
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a4;
  objc_msgSend_optimizer(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_state(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightMomentumVector(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v17;
  objc_msgSend_biasMomentumVector(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v21;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v47, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightVelocityVector(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v27;
  objc_msgSend_biasVelocityVector(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v31;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v46, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_state(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_convolutionGradientState_convolutionSourceState_inputMomentumVectors_inputVelocityVectors_resultState_(v9, v38, (uint64_t)v44, (uint64_t)v45, v13, v23, v33, v37);

  objc_msgSend_state(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)updateWithCommandBuffer:(id)a3 gradientState:(id)a4 sourceState:(id)a5
{
  objc_msgSend_updateWithCommandBuffer_gradientState_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)label
{
  return (id)((uint64_t (*)(MLPModelConvolutionDataSource *, char *))MEMORY[0x1E0DE7D20])(self, sel_kernelParamsBinaryName);
}

- (unint64_t)outputFeatureChannels
{
  return self->_outputFeatureChannels;
}

- (unint64_t)inputFeatureChannels
{
  return self->_inputFeatureChannels;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (MPSCNNConvolutionDescriptor)convDesc
{
  return (MPSCNNConvolutionDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)kernelParamsBinaryName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)sizeBias
{
  return self->_sizeBias;
}

- (unint64_t)sizeWeights
{
  return self->_sizeWeights;
}

- (unsigned)seed
{
  return self->_seed;
}

- (MLPModelOptimizerOptions)optimizerOptions
{
  void *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  MLPModelOptimizerOptions result;

  objc_copyCppObjectAtomic(v2, &self->_optimizerOptions, (void (__cdecl *)(void *, const void *))sub_19C2383B8);
  result.learningRate = v6;
  result.adamEpsilon = v5;
  result.adamBeta2 = v4;
  result.adamBeta1 = v3;
  return result;
}

- (MTLBuffer)weightBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (MTLBuffer)biasBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 88, 1);
}

- (MLPDeviceHandler)deviceHandler
{
  return (MLPDeviceHandler *)objc_getProperty(self, a2, 96, 1);
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

- (MPSCNNConvolutionWeightsAndBiasesState)state
{
  return self->_state;
}

- (MPSNNOptimizerAdam)optimizer
{
  return self->_optimizer;
}

- (MPSVector)weightMomentumVector
{
  return self->_weightMomentumVector;
}

- (MPSVector)weightVelocityVector
{
  return self->_weightVelocityVector;
}

- (MPSVector)biasMomentumVector
{
  return self->_biasMomentumVector;
}

- (MPSVector)biasVelocityVector
{
  return self->_biasVelocityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasVelocityVector, 0);
  objc_storeStrong((id *)&self->_biasMomentumVector, 0);
  objc_storeStrong((id *)&self->_weightVelocityVector, 0);
  objc_storeStrong((id *)&self->_weightMomentumVector, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_deviceHandler, 0);
  objc_storeStrong((id *)&self->_biasBuffer, 0);
  objc_storeStrong((id *)&self->_weightBuffer, 0);
  objc_storeStrong((id *)&self->_kernelParamsBinaryName, 0);
  objc_storeStrong((id *)&self->_convDesc, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 168) = xmmword_19C27AE20;
  return self;
}

@end
