@implementation MLCDeviceCPU

- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUArithmetic layerWithDevice:operation:](_MLCCPUArithmetic, "layerWithDevice:operation:", self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceOps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v8, "setDeviceOps:", 0);
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v11 = v10;
  v12 = v11;

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(v16, "numberWithUnsignedInteger:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(0, a8, a9, (uint64_t)self, 0, v22, 1, v20, v19, v18, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  objc_msgSend(v18, "numberWithUnsignedInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(0, a9, a10, (uint64_t)self, v23, v25, 1, v22, v21, v20, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(v16, "numberWithUnsignedInteger:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(1u, a8, a9, (uint64_t)self, 0, v22, 1, v20, v19, v18, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)fusedInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  objc_msgSend(v18, "numberWithUnsignedInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(1u, a9, a10, (uint64_t)self, v23, v25, 1, v22, v21, v20, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7
{
  return CPU_CreateNormalizationLayer(2u, a6, 1.0, (uint64_t)self, 0, a3, 1, 0, 0, a4, a5);
}

- (id)fusedLayerNormalizationAndNeuronLayerWithDescriptor:(id)a3 normalizedShape:(id)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  return CPU_CreateNormalizationLayer(2u, a7, 1.0, (uint64_t)self, a3, a4, 1, 0, 0, a5, a6);
}

- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a6;
  v14 = a5;
  objc_msgSend(v12, "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(3u, a7, 1.0, (uint64_t)self, 0, v16, a4, 0, 0, v14, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fusedGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 featureChannelCount:(unint64_t)a4 groupCount:(unint64_t)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a7;
  v16 = a6;
  v17 = a3;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_CreateNormalizationLayer(3u, a8, 1.0, (uint64_t)self, v17, v19, a5, 0, 0, v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUConvolution layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:](_MLCCPUConvolution, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:", self, v9, v10, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceOps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v12, "setDeviceOps:", 0);
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v15 = v14;
  v16 = v15;

  objc_autoreleasePoolPop(v11);
  return v16;
}

- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUConvolution layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:](_MLCCPUConvolution, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:", self, v12, v13, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceOps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v15, "setDeviceOps:", 0);
  v18 = (void *)MEMORY[0x1E0C9AA60];
  if (v17)
    v18 = v17;
  v19 = v18;

  objc_autoreleasePoolPop(v14);
  return v19;
}

- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  void *v30;

  v21 = a12;
  v22 = a11;
  v23 = a10;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = a3;
  if (objc_msgSend(v28, "isConvolutionTranspose"))
    v29 = 7;
  else
    v29 = 6;
  CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a8, a9, (uint64_t)self, v22, v21, v28, v23, v27, v26, v25, v24, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)fusedConvolutionInstanceNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 neuronDescriptor:(id)a8 weights:(id)a9 biasTerms:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unsigned int v24;
  void *v25;

  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  if (objc_msgSend(v23, "isConvolutionTranspose"))
    v24 = 23;
  else
    v24 = 22;
  CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a6, a7, (uint64_t)self, v19, v18, v23, v20, 0, 0, v22, v21, 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)fusedConvolutionGroupNormalizationAndNeuronLayerWithDescriptor:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 momentum:(float)a7 groupCount:(unint64_t)a8 neuronDescriptor:(id)a9 weights:(id)a10 biasTerms:(id)a11
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;
  void *v27;

  v20 = a11;
  v21 = a10;
  v22 = a9;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  if (objc_msgSend(v25, "isConvolutionTranspose"))
    v26 = 36;
  else
    v26 = 35;
  CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(a6, a7, (uint64_t)self, v21, v20, v25, v22, 0, 0, v24, v23, a8, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUConvolution layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:](_MLCCPUConvolution, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:", self, v9, v10, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceOps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v12, "setDeviceOps:", 0);
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v15 = v14;
  v16 = v15;

  objc_autoreleasePoolPop(v11);
  return v16;
}

- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = (void *)MEMORY[0x1D8263D2C](self, a2);
  *(float *)&v8 = a3;
  +[_MLCCPUDropout layerWithDevice:rate:seed:](_MLCCPUDropout, "layerWithDevice:rate:seed:", self, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceOps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v9, "setDeviceOps:", 0);
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v12 = v11;
  v13 = v12;

  objc_autoreleasePoolPop(v7);
  return v13;
}

- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUFullyConnected layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:](_MLCCPUFullyConnected, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:", self, v9, v10, v8, 0, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceOps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v12, "setDeviceOps:", 0);
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v14)
    v15 = v14;
  v16 = v15;

  objc_autoreleasePoolPop(v11);
  return v16;
}

- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUFullyConnected layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:](_MLCCPUFullyConnected, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:", self, v12, v13, v11, v10, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceOps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v15, "setDeviceOps:", 0);
  v18 = (void *)MEMORY[0x1E0C9AA60];
  if (v17)
    v18 = v17;
  v19 = v18;

  objc_autoreleasePoolPop(v14);
  return v19;
}

- (id)fusedFullyConnectedAndSoftmaxLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5 softmaxOp:(int)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D8263D2C]();
  if (a6)
    v14 = 41;
  else
    v14 = 40;
  +[_MLCCPUFullyConnected layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:](_MLCCPUFullyConnected, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:opType:", self, v11, v12, v10, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceOps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v15, "setDeviceOps:", 0);
  v18 = (void *)MEMORY[0x1E0C9AA60];
  if (v17)
    v18 = v17;
  v19 = v18;

  objc_autoreleasePoolPop(v13);
  return v19;
}

- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v34;
  id v36;
  id v37;

  v36 = a3;
  v37 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = (void *)MEMORY[0x1D8263D2C]();
  LODWORD(v34) = 11;
  *(float *)&v26 = a8;
  *(float *)&v27 = a9;
  +[_MLCCPUFullyConnected layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:](_MLCCPUFullyConnected, "layerWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:fusedBatchNormAndNeuronLayers:mean:variance:beta:gamma:varianceEpsilon:momentum:opType:", self, v23, v24, v36, v22, 1, v26, v27, v37, v19, v20, v21, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "deviceOps");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");

  objc_msgSend(v28, "setDeviceOps:", 0);
  v31 = (void *)MEMORY[0x1E0C9AA60];
  if (v30)
    v31 = v30;
  v32 = v31;

  objc_autoreleasePoolPop(v25);
  return v32;
}

- (id)lossLayerWithDescriptor:(id)a3
{
  return CPU_CreateLossLayer((uint64_t)self, a3);
}

- (id)lossYOLOLayerWithDescriptor:(id)a3
{
  return CPU_CreateYOLOLossLayer((uint64_t)self, a3);
}

- (id)neuronLayerWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUNeuron layerWithDevice:descriptor:](_MLCCPUNeuron, "layerWithDevice:descriptor:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setDeviceOps:", 0);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v29;
  id v30;

  v30 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = (void *)MEMORY[0x1D8263D2C]();
  LOBYTE(v29) = a10;
  +[_MLCCPULSTM layerWithDevice:lstmDescriptor:inputWeights:hiddenWeights:peepholeWeights:biasTerms:gateActivations:ouputResultActivation:inferenceOnly:](_MLCCPULSTM, "layerWithDevice:lstmDescriptor:inputWeights:hiddenWeights:peepholeWeights:biasTerms:gateActivations:ouputResultActivation:inferenceOnly:", self, v30, v16, v17, v18, v19, v20, v21, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "deviceOps");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  objc_msgSend(v23, "setDeviceOps:", 0);
  v26 = (void *)MEMORY[0x1E0C9AA60];
  if (v25)
    v26 = v25;
  v27 = v26;

  objc_autoreleasePoolPop(v22);
  return v27;
}

- (id)gramMatrixLayerWithScaleFactor:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1D8263D2C](self, a2);
  *(float *)&v6 = a3;
  +[_MLCCPUGramMatrix layerWithDevice:scale:](_MLCCPUGramMatrix, "layerWithDevice:scale:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceOps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v7, "setDeviceOps:", 0);
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v10 = v9;
  v11 = v10;

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6
{
  return CPU_CreateUpsampleLayer((uint64_t)self, a5, a6);
}

- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5
{
  return CPU_CreateSGDOptimizer(a4, (uint64_t)self, a5, a3);
}

- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9
{
  return CPU_CreateAdamOptimizer(a4, a5, a6, (uint64_t)self, a7, a8, a9, a3);
}

- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  return CPU_CreateRMSPropOptimizer(a4, a5, a6, (uint64_t)self, a7, a3);
}

- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUPooling layerWithDevice:descriptor:](_MLCCPUPooling, "layerWithDevice:descriptor:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceOps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v7, "setDeviceOps:", 0);
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v10 = v9;
  v11 = v10;

  objc_autoreleasePoolPop(v6);
  return v11;
}

- (id)reshapeLayerWithShape:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUReshape layerWithDevice:](_MLCCPUReshape, "layerWithDevice:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setDeviceOps:", 0);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)splitLayerWithDimension:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[_MLCCPUSplit layerWithDevice:dimension:](_MLCCPUSplit, "layerWithDevice:dimension:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setDeviceOps:", 0);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a3;
  v8 = (void *)MEMORY[0x1D8263D2C](self, a2, *(_QWORD *)&a3, a4, a5);
  +[_MLCCPUSoftmax layerWithDevice:operation:dimension:](_MLCCPUSoftmax, "layerWithDevice:operation:dimension:", self, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceOps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_msgSend(v9, "setDeviceOps:", 0);
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v12 = v11;
  v13 = v12;

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUMHAttention layerWithDevice:descriptor:weights:bias:attnBias:inferenceOnly:](_MLCCPUMHAttention, "layerWithDevice:descriptor:weights:bias:attnBias:inferenceOnly:", self, v12, v13, v14, v15, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deviceOps");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  objc_msgSend(v17, "setDeviceOps:", 0);
  v20 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v20 = v19;
  v21 = v20;

  objc_autoreleasePoolPop(v16);
  return v21;
}

- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUMatMul layerWithDevice:descriptor:inferenceOnly:](_MLCCPUMatMul, "layerWithDevice:descriptor:inferenceOnly:", self, v10, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceOps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v14, "setDeviceOps:", 0);
  v17 = (void *)MEMORY[0x1E0C9AA60];
  if (v16)
    v17 = v16;
  v18 = v17;

  objc_autoreleasePoolPop(v13);
  return v18;
}

- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUSlice layerWithDevice:begin:end:stride:](_MLCCPUSlice, "layerWithDevice:begin:end:stride:", self, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceOps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v13, "setDeviceOps:", 0);
  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (v15)
    v16 = v15;
  v17 = v16;

  objc_autoreleasePoolPop(v12);
  return v17;
}

- (id)embeddingLayerWithDescriptor:(id)a3 weights:(id)a4 inferenceOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUEmbedding layerWithDevice:descriptor:weights:inferenceOnly:](_MLCCPUEmbedding, "layerWithDevice:descriptor:weights:inferenceOnly:", self, v8, v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceOps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v11, "setDeviceOps:", 0);
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v14 = v13;
  v15 = v14;

  objc_autoreleasePoolPop(v10);
  return v15;
}

- (id)transposeLayerWithShape:(id)a3
{
  return CPU_CreateTransposeLayer((uint64_t)self, a3);
}

- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9
{
  return CPU_CreatePaddingLayer(a8, (uint64_t)self, a3, a4, a5, a6, a7, a9);
}

- (id)compareLayerWithOperation:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[_MLCCPUCompare layerWithDevice:operation:](_MLCCPUCompare, "layerWithDevice:operation:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setDeviceOps:", 0);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8263D2C]();
  +[_MLCCPUReduction layerWithDevice:reduceType:dimensions:sourceShapeCount:](_MLCCPUReduction, "layerWithDevice:reduceType:dimensions:sourceShapeCount:", self, v6, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceOps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(v10, "setDeviceOps:", 0);
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v13 = v12;
  v14 = v13;

  objc_autoreleasePoolPop(v9);
  return v14;
}

- (id)selectLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[_MLCCPUSelect layerWithDevice:](_MLCCPUSelect, "layerWithDevice:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "setDeviceOps:", 0);
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v7 = v6;
  v8 = v7;

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)gatherLayerWithDimension:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[_MLCCPUGather layerWithDevice:dimension:](_MLCCPUGather, "layerWithDevice:dimension:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceOps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setDeviceOps:", 0);
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)scatterLayerWithDimension:(unint64_t)a3 reduceType:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)MEMORY[0x1D8263D2C](self, a2);
  +[_MLCCPUScatter layerWithDevice:dimension:reduceType:](_MLCCPUScatter, "layerWithDevice:dimension:reduceType:", self, a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceOps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v8, "setDeviceOps:", 0);
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v11 = v10;
  v12 = v11;

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (void)fuseLayersForGraph:(id)a3 stopGradientTensorList:(id)a4 startAtLayerIndex:(unint64_t)a5 forInference:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char isKindOfClass;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  void *v62;
  id v63;

  v6 = a6;
  v63 = a3;
  v9 = a4;
  if (v63)
  {
    if (objc_msgSend(v63, "count") >= a5 + 2)
    {
      +[MLCComputeEngineCommon applyPatternMatcherForGraph:stopGradientTensorList:startAtLayerIndex:forInference:](MLCComputeEngineCommon, "applyPatternMatcherForGraph:stopGradientTensorList:startAtLayerIndex:forInference:", v63, v9, a5, v6);
      if (objc_msgSend(v63, "count") > a5)
      {
        while (1)
        {
          objc_msgSend(v63, "objectAtIndexedSubscript:", a5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isLastLayer") & 1) != 0 || (objc_msgSend(v10, "skipLayer") & 1) != 0)
            goto LABEL_20;
          objc_msgSend(v10, "resultTensors");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v11, "count") > 1)
            goto LABEL_7;
          objc_msgSend(v10, "resultTensors");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "childLayers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (v15 != 1)
            goto LABEL_20;
          objc_msgSend(v10, "resultTensors");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "computeFlags");

          if ((v18 & 1) != 0)
            goto LABEL_20;
          objc_msgSend(v10, "resultTensors");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "childLayers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v11, "skipLayer") & 1) != 0)
            goto LABEL_7;
          v22 = objc_msgSend(v10, "isTrainable");
          if (v22 != objc_msgSend(v11, "isTrainable"))
            goto LABEL_7;
          objc_msgSend(v10, "resultTensors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = +[MLCComputeEngineCommon isResultTensorInStopGradientTensorList:resultTensor:forInference:](MLCComputeEngineCommon, "isResultTensorInStopGradientTensorList:resultTensor:forInference:", v9, v24, v6);

          if (v25)
            goto LABEL_7;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = v10;
              v11 = v11;
              if (!objc_msgSend(v26, "paddingType"))
              {
                objc_msgSend(v11, "descriptor");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "paddingPolicy") == 1
                  && (v28 = objc_msgSend(v26, "paddingTop"), v28 == objc_msgSend(v26, "paddingBottom")))
                {
                  v29 = objc_msgSend(v26, "paddingLeft");
                  v30 = objc_msgSend(v26, "paddingRight");

                  if (v29 == v30)
                    +[MLCComputeEngineCommon updateTensorsForFusedPaddingAndConvolutionLayer:layerNext:](MLCComputeEngineCommon, "updateTensorsForFusedPaddingAndConvolutionLayer:layerNext:", v26, v11);
                }
                else
                {

                }
              }

              goto LABEL_7;
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_7;
            if (+[MLCComputeEngineCommon doesActivationRequireInput:forInference:](MLCComputeEngineCommon, "doesActivationRequireInput:forInference:", v11, v6))
            {
              goto LABEL_7;
            }
            objc_msgSend(v11, "fusedLayers");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "count");

            if (v43)
              goto LABEL_7;
LABEL_61:
            +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:layerNext:](MLCComputeEngineCommon, "updateTensorsForTwoFusedLayers:layerNext:", v10, v11);
            goto LABEL_7;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if ((isKindOfClass & 1) != 0
              && (objc_msgSend(v11, "fusedLayers"),
                  v52 = (void *)objc_claimAutoreleasedReturnValue(),
                  v55 = v52,
                  !objc_msgSend(v52, "count")))
            {

            }
            else
            {
              objc_opt_class();
              v53 = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)

              if ((v53 & 1) == 0)
                goto LABEL_7;
            }
LABEL_60:
            if (!+[MLCComputeEngineCommon doesActivationRequireInput:forInference:](MLCComputeEngineCommon, "doesActivationRequireInput:forInference:", v11, v6))goto LABEL_61;
          }
LABEL_7:

LABEL_20:
          if (++a5 >= objc_msgSend(v63, "count"))
            goto LABEL_64;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v11, "fusedLayers"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = objc_msgSend(v31, "count"),
              v31,
              v32))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_7;
            }
          }
          objc_msgSend(v11, "sourceTensors");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "descriptor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "shape");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v36, "count");

          if (v61 < 3)
            goto LABEL_7;
          objc_msgSend(v11, "resultTensors");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "childLayers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "count"))
          {
            objc_msgSend(v11, "resultTensors");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
            v59 = v38;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "childLayers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            v38 = v59;
          }
          else
          {
            v62 = 0;
          }

          objc_msgSend(v11, "resultTensors");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = +[MLCComputeEngineCommon isResultTensorInStopGradientTensorList:resultTensor:forInference:](MLCComputeEngineCommon, "isResultTensorInStopGradientTensorList:resultTensor:forInference:", v9, v45, v6);

          if (v46)
            goto LABEL_50;
          objc_msgSend(v11, "resultTensors");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "childLayers");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "count") != 1)
            goto LABEL_49;
          objc_msgSend(v11, "resultTensors");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v50, "computeFlags") & 1) == 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (v57 = objc_msgSend(v62, "isTrainable"), v57 == objc_msgSend(v10, "isTrainable"))
            && !+[MLCComputeEngineCommon doesActivationRequireInput:forInference:](MLCComputeEngineCommon, "doesActivationRequireInput:forInference:", v62, v6))
          {
            objc_msgSend(v62, "fusedLayers");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v54, "count");

            if (v58)
              goto LABEL_50;
            +[MLCComputeEngineCommon updateTensorsForThreeFusedLayers:layerNext:layerNext2:](MLCComputeEngineCommon, "updateTensorsForThreeFusedLayers:layerNext:layerNext2:", v10, v11, v62);
          }
          else
          {

LABEL_49:
LABEL_50:
            +[MLCComputeEngineCommon updateTensorsForTwoFusedLayers:layerNext:](MLCComputeEngineCommon, "updateTensorsForTwoFusedLayers:layerNext:", v10, v11);
          }

          goto LABEL_7;
        }
        goto LABEL_60;
      }
    }
  }
LABEL_64:

}

- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4
{
  -[MLCDeviceCPU fuseLayersForGraph:stopGradientTensorList:startAtLayerIndex:forInference:](self, "fuseLayersForGraph:stopGradientTensorList:startAtLayerIndex:forInference:", a3, a4, 0, 0);
}

- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4
{
  -[MLCDeviceCPU fuseLayersForGraph:stopGradientTensorList:startAtLayerIndex:forInference:](self, "fuseLayersForGraph:stopGradientTensorList:startAtLayerIndex:forInference:", a3, 0, a4, 1);
}

- (void)identifySourceAndOrResultTensorsNeededByGradient:(id)a3
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  id v12;
  unsigned int *v13;
  id v14;
  uint64_t v15;
  id v16;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = objc_msgSend(v16, "deviceOpType") - 1;
  v5 = 0;
  switch(v4)
  {
    case 0:
      objc_msgSend(v16, "params", 0);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (unsigned int *)objc_msgSend(v12, "bytes");

      v8 = *v13;
      if (*v13 >= 0x18)
        goto LABEL_11;
      v3 = (0xC20030u >> v8) & 1;
      v9 = 4062732;
      goto LABEL_10;
    case 1:
    case 13:
    case 19:
    case 23:
    case 26:
    case 27:
    case 32:
    case 38:
    case 41:
    case 45:
    case 47:
    case 48:
      break;
    case 2:
    case 15:
    case 20:
    case 28:
    case 33:
      v5 = 0;
      v3 = 1;
      break;
    case 3:
    case 7:
    case 8:
    case 11:
    case 16:
    case 17:
    case 18:
    case 24:
    case 43:
    case 44:
    case 46:
    case 49:
    case 50:
      goto LABEL_11;
    case 4:
    case 5:
    case 6:
    case 9:
    case 10:
    case 21:
    case 22:
    case 25:
    case 29:
    case 30:
    case 31:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
      v3 = 1;
      goto LABEL_12;
    case 12:
      objc_msgSend(v16, "params", 0);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "bytes");

      v8 = *(_DWORD *)(v7 + 352);
      if (v8 < 0x18)
      {
        v3 = (0x84001Eu >> v8) & 1;
        v9 = 8126433;
        goto LABEL_10;
      }
LABEL_11:
      v3 = 0;
LABEL_12:
      v5 = 1;
      break;
    case 14:
      objc_msgSend(v16, "params", 0);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v14, "bytes");

      v3 = *(_DWORD *)(v15 + 576) == 4;
      goto LABEL_15;
    case 42:
      objc_msgSend(v16, "params", 0);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "bytes");

      v8 = *(_DWORD *)(v11 + 528);
      if (v8 >= 0xA)
      {
        v3 = 0;
        v5 = 0;
      }
      else
      {
        v3 = (3u >> v8) & 1;
        v9 = 531;
LABEL_10:
        v5 = (v9 >> v8) & 1;
      }
      break;
    default:
LABEL_15:
      v5 = v3;
      break;
  }
  objc_msgSend(v16, "setSourceOfForwardNeededForGradient:", v5);
  objc_msgSend(v16, "setResultOfForwardNeededForGradient:", v3);

}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceOpType");
  if (v8 == 46)
  {
    objc_msgSend(v7, "setBNNSFilter:", 0);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBatchSize:", objc_msgSend(v12, "unsignedIntegerValue"));

  }
  return v8 == 46;
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char isKindOfClass;
  void *v38;
  void *v39;
  void *v40;
  MLCDeviceCPU *v41;
  void *v43;
  id v44;
  id v45;
  MLCDeviceCPU *v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 1;
  v14 = 1;
  switch(objc_msgSend(v11, "deviceOpType"))
  {
    case 1u:
      if (+[_MLCCPUArithmetic compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUArithmetic, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      goto LABEL_95;
    case 2u:
    case 3u:
      v17 = 0;
      goto LABEL_16;
    case 4u:
    case 5u:
      if (+[_MLCCPUConvolution compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:](_MLCCPUConvolution, "compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:", self, v8, v9, v10, 0))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 6u:
    case 7u:
    case 0x16u:
    case 0x17u:
    case 0x1Eu:
    case 0x1Fu:
    case 0x23u:
    case 0x24u:
      v15 = (uint64_t)CPU_CompileFusedConvolutionNormalizationAndNeuronLayer(v8, v9, v10);
      goto LABEL_17;
    case 8u:
      if (+[_MLCCPUDropout compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUDropout, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 9u:
    case 0xAu:
    case 0x28u:
    case 0x29u:
      if (+[_MLCCPUFullyConnected compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUFullyConnected, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0xBu:
      if (+[_MLCCPUFullyConnected compileWithDevice:deviceOps:sourceTensors:resultTensor:fusedBatchNormAndNeuron:](_MLCCPUFullyConnected, "compileWithDevice:deviceOps:sourceTensors:resultTensor:fusedBatchNormAndNeuron:", self, v8, v9, v10, 1))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0xCu:
      v18 = CPU_CompileLossLayer(v8, v9, v10);
      goto LABEL_42;
    case 0xDu:
      if (+[_MLCCPUNeuron compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUNeuron, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0xEu:
      v15 = CPU_CompilePaddingLayer(v8, v9, v10);
      goto LABEL_17;
    case 0xFu:
      if (+[_MLCCPUPooling compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUPooling, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x10u:
      if (+[_MLCCPUSoftmax compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUSoftmax, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x11u:
      if (+[_MLCCPULSTM compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPULSTM, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_89;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x12u:
      v18 = CPU_CompileYOLOLossLayer(v8, v9, v10);
LABEL_42:
      v12 = v18;
      v13 = 0;
      goto LABEL_59;
    case 0x13u:
      if (+[_MLCCPUGramMatrix compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUGramMatrix, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x14u:
    case 0x15u:
      v17 = 1;
      goto LABEL_16;
    case 0x18u:
      v15 = CPU_CompileUpsampleLayer(v8, v9, v10);
      goto LABEL_17;
    case 0x19u:
    case 0x1Au:
      if (+[_MLCCPUConvolution compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:](_MLCCPUConvolution, "compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:", self, v8, v9, v10, 1))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x1Bu:
      goto LABEL_61;
    case 0x1Cu:
    case 0x1Du:
      v17 = 2;
      goto LABEL_16;
    case 0x21u:
    case 0x22u:
      v17 = 3;
LABEL_16:
      v15 = (uint64_t)CPU_CompileNormalizationLayer(v17, v8, v9, v10);
      goto LABEL_17;
    case 0x27u:
      v15 = CPU_CompileTransposeLayer(v8, v9, v10);
LABEL_17:
      v12 = v15;
      goto LABEL_59;
    case 0x2Au:
      if (+[_MLCCPUCompare compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUCompare, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_89;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x2Bu:
      if (+[_MLCCPUReduction compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUReduction, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_58;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x2Cu:
      if (+[_MLCCPUMHAttention compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUMHAttention, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
LABEL_58:
        objc_msgSend(v11, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v20, "filter");

LABEL_59:
        if (v12)
        {
          v14 = 0;
          goto LABEL_61;
        }
LABEL_64:
        +[MLCLog framework](MLCLog, "framework");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.1();
        goto LABEL_66;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      goto LABEL_95;
    case 0x2Du:
      if (+[_MLCCPUMatMul compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUMatMul, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        objc_msgSend(v11, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v43, "filter");

        goto LABEL_61;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.17();
      goto LABEL_66;
    case 0x30u:
      if (+[_MLCCPUSlice compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUSlice, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_89;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x32u:
      if (+[_MLCCPUGather compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUGather, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
        goto LABEL_89;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_95;
      goto LABEL_66;
    case 0x33u:
      if (+[_MLCCPUScatter compileWithDevice:deviceOps:sourceTensors:resultTensor:](_MLCCPUScatter, "compileWithDevice:deviceOps:sourceTensors:resultTensor:", self, v8, v9, v10))
      {
LABEL_89:
        v12 = 0;
LABEL_61:
        -[MLCDeviceCPU identifySourceAndOrResultTensorsNeededByGradient:](self, "identifySourceAndOrResultTensorsNeededByGradient:", v8);
        objc_msgSend(v11, "setBNNSFilter:", v12);
        v46 = self;
        if (v13)
        {
          objc_msgSend(v10, "descriptor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "shape");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count") == 1)
          {
            objc_msgSend(v11, "setBatchSize:", 1);
LABEL_72:

            objc_msgSend(v11, "layer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v10, "descriptor");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "shape");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setBatchSize:", objc_msgSend(v40, "unsignedIntegerValue"));

              v41 = v46;
            }
            else
            {
              v41 = v46;
              if (objc_msgSend(v11, "deviceOpType") == 39)
                objc_msgSend(v11, "setBatchSize:", 1);
            }
            if ((v14 & 1) == 0)
              -[MLCDeviceCPU updateGradientDescriptorsForDeviceOps:sourceTensors:resultTensor:](v41, "updateGradientDescriptorsForDeviceOps:sourceTensors:resultTensor:", v8, v9, v10);
            v23 = 1;
            goto LABEL_79;
          }
          objc_msgSend(v10, "descriptor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "shape");
          v25 = v8;
          v26 = v9;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
          v28 = v11;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setBatchSize:", objc_msgSend(v29, "unsignedIntegerValue"));

          v11 = v28;
          v9 = v26;
          v8 = v25;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "descriptor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "shape");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count") == 1)
          {
            objc_msgSend(v11, "setBatchSize:", 1);
          }
          else
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
            v44 = v8;
            v45 = v10;
            v30 = v9;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "descriptor");
            v32 = v11;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "shape");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setBatchSize:", objc_msgSend(v35, "unsignedIntegerValue"));

            v11 = v32;
            v9 = v30;
            v8 = v44;
            v10 = v45;
          }
        }

        goto LABEL_72;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
LABEL_95:
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.3();
LABEL_66:

      v23 = 0;
LABEL_79:

      return v23;
    default:
      +[MLCLog framework](MLCLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.2();

      goto LABEL_64;
  }
}

- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5
{
  return CPU_SetOptimizerDataForConvolutionLayer(a3, a4, a5);
}

- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5
{
  return +[_MLCCPUMHAttention setOptimizerDataForDevice:deviceOps:dataForWeights:dataForBias:](_MLCCPUMHAttention, "setOptimizerDataForDevice:deviceOps:dataForWeights:dataForBias:", self, a3, a4, a5);
}

- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5
{
  return CPU_SetOptimizerDataForNormalizationLayer(a3, a4, a5);
}

- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6
{
  return +[_MLCCPULSTM setOptimizerDataForDevice:deviceOps:dataForInputWeights:dataForHiddenWeights:dataForPeepholeWeights:dataForBias:](_MLCCPULSTM, "setOptimizerDataForDevice:deviceOps:dataForInputWeights:dataForHiddenWeights:dataForPeepholeWeights:dataForBias:", self, a3, a4, a5, 0, a6);
}

- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6
{
  return CPU_CreateOptimizerDeviceDataForTensor((uint64_t)self, a3, a5);
}

- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v5 = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_autoreleasePoolPop(v5);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v26, "setOneStepOptimizerBuffers:", v7);

  v8 = malloc_type_malloc(8 * a4, 0x9AAFE5B2uLL);
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, 8 * a4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = malloc_type_malloc(8 * a4, 0x96763E82uLL);
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, 8 * a4, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  v14 = malloc_type_malloc(8 * a4 * objc_msgSend(v26, "numOptimizerDataBuffers"), 0x733717B0uLL);
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v14, 8 * a4 * objc_msgSend(v26, "numOptimizerDataBuffers"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  v17 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *v17 = a4;
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v17, 8, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

  v20 = malloc_type_calloc(8uLL, 1uLL, 0x6E2C2D23uLL);
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v20, 8, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  v23 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *v23 = objc_msgSend(v26, "numOptimizerDataBuffers");
  objc_msgSend(v26, "oneStepOptimizerBuffers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v23, 8, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

}

- (void)updateGradientDescriptorsForDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  unsigned int v120;
  void *v121;
  unint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  _QWORD v147[2];

  v147[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "deviceOpType") == 44 || objc_msgSend(v9, "deviceOpType") == 1)
    goto LABEL_31;
  objc_msgSend(v9, "inDeltaData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v139 = objc_msgSend(v11, "bytes");

  objc_msgSend(v9, "outDeltaData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "bytes");

  v141 = v7;
  v142 = v8;
  v140 = v14;
  if (objc_msgSend(v9, "deviceOpType") != 16 && objc_msgSend(v9, "deviceOpType") != 18)
    goto LABEL_10;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if ((unint64_t)(v18 - 1) < 2)
  {
    v27 = 1;
    goto LABEL_15;
  }
  if (v18 == 3)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "shape");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v31, "unsignedIntegerValue") == 1;

    goto LABEL_15;
  }
  if (v18 != 4)
  {
LABEL_10:
    v27 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue") == 1;

    v8 = v142;
    v7 = v141;

  }
  else
  {
    v27 = 0;
  }

LABEL_15:
  if (objc_msgSend(v9, "deviceOpType") == 9
    || objc_msgSend(v9, "deviceOpType") == 10
    || objc_msgSend(v9, "deviceOpType") == 40
    || (objc_msgSend(v9, "deviceOpType") == 41 ? (v32 = 1) : (v32 = v27), v32 == 1))
  {
    v138 = v9;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "descriptor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "shape");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "shape");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", v36 - 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stride");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v36 - 1;
    objc_msgSend(v44, "objectAtIndexedSubscript:", v36 - 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "unsignedIntegerValue");

    v143 = v46;
    if (v36 == 4)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "descriptor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "shape");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", 3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");
      v52 = v51 == 1;
      if (v51 == 1)
      {
        v135 = v41;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "descriptor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "shape");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
        v56 = v7;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = objc_msgSend(v57, "unsignedIntegerValue");

        if (v136 != 1)
        {
          v52 = 0;
          v7 = v56;
          v46 = v143;
          v41 = v135;
          goto LABEL_28;
        }
        objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "descriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "shape");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v50, "unsignedIntegerValue");
        v7 = v56;
        v46 = v143;
      }

    }
    else
    {
      v52 = 0;
    }
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v147[0] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v46);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "descriptor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptor(v139, v59, v61, 0, objc_msgSend(v63, "dataType"), v52, 0);

    v8 = v142;
    objc_msgSend(v142, "descriptor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "shape");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectAtIndexedSubscript:", v137);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "unsignedIntegerValue");

    if (v52)
    {
      objc_msgSend(v142, "descriptor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "shape");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectAtIndexedSubscript:", 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v70, "unsignedIntegerValue");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v67);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v143);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = v73;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptor(v140, v72, v74, 0, objc_msgSend(v75, "dataType"), v52, 0);

    v7 = v141;
    v9 = v138;
    goto LABEL_31;
  }
  if (objc_msgSend(v9, "deviceOpType") == 19)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "descriptor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "shape");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "descriptor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "stride");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v82 = v7;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "descriptor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptor(v139, v78, v81, 0, objc_msgSend(v84, "dataType"), 1, 0);

    v8 = v142;
    v7 = v82;

    objc_msgSend(v142, "descriptor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "shape");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "stride");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayDescriptor(v140, v86, v88, 0, objc_msgSend(v89, "dataType"), 1, 0);

    goto LABEL_31;
  }
  if (objc_msgSend(v9, "deviceOpType") == 39)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "descriptor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "shape");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "descriptor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "stride");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v96 = v7;
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "descriptor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildPermuteBNNSNDArrayDescriptor(v139, v92, v95, 0, objc_msgSend(v98, "dataType"));

    v8 = v142;
    v7 = v96;

    objc_msgSend(v142, "descriptor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "shape");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "stride");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildPermuteBNNSNDArrayDescriptor(v140, v100, v102, 0, objc_msgSend(v103, "dataType"));
LABEL_39:

    goto LABEL_31;
  }
  v104 = objc_msgSend(v9, "deviceOpType");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "descriptor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "shape");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v104 == 43)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "descriptor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "stride");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v112 = v7;
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "descriptor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayLastMajorDescriptor(v139, v108, v111, 0, objc_msgSend(v114, "dataType"));

    v8 = v142;
    v7 = v112;

    objc_msgSend(v142, "descriptor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "shape");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "stride");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "descriptor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_BuildBNNSNDArrayLastMajorDescriptor(v140, v100, v102, 0, objc_msgSend(v103, "dataType"));
    goto LABEL_39;
  }
  v115 = (void *)objc_msgSend(v107, "mutableCopy");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "descriptor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "stride");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v118, "mutableCopy");

  v120 = objc_msgSend(v9, "deviceOpType");
  if (v120 <= 0x22)
  {
    if (((1 << v120) & 0x60030000CLL) != 0)
    {
      if (objc_msgSend(v115, "count") == 2)
      {
        objc_msgSend(v115, "insertObject:atIndex:", &unk_1E98441B8, 2);
        objc_msgSend(v119, "objectAtIndexedSubscript:", 1);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "insertObject:atIndex:", v121, 2);

      }
    }
    else if (((1 << v120) & 0x30000000) != 0 && objc_msgSend(v115, "count") != 4)
    {
      v122 = 0;
      do
      {
        objc_msgSend(v115, "insertObject:atIndex:", &unk_1E98441B8, 1);
        objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "insertObject:atIndex:", v123, 1);

        ++v122;
      }
      while (v122 < 4 - objc_msgSend(v115, "count"));
    }
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "descriptor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v139, v115, v119, 0, objc_msgSend(v125, "dataType"), 1, 0);

  objc_msgSend(v8, "descriptor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "shape");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)objc_msgSend(v127, "mutableCopy");

  objc_msgSend(v8, "descriptor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "stride");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)objc_msgSend(v130, "mutableCopy");

  if ((objc_msgSend(v9, "deviceOpType") == 28 || objc_msgSend(v9, "deviceOpType") == 29)
    && objc_msgSend(v128, "count") != 4)
  {
    v132 = 0;
    do
    {
      objc_msgSend(v128, "insertObject:atIndex:", &unk_1E98441B8, 1);
      objc_msgSend(v131, "objectAtIndexedSubscript:", 0);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "insertObject:atIndex:", v133, 1);

      ++v132;
    }
    while (v132 < 4 - objc_msgSend(v128, "count"));
  }
  objc_msgSend(v8, "descriptor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_BuildBNNSNDArrayDescriptor(v140, v128, v131, 0, objc_msgSend(v134, "dataType"), 1, 0);

LABEL_31:
}

- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4
{
  return 0;
}

- (void)setConvolutionGradientComputeWeightsAndBiasOnly:(id)a3
{
  id v3;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setComputeWeightsAndBiasOnly:", 1);

}

- (void)setFullyConnectedGradientComputeWeightsAndBiasOnly:(id)a3
{
  id v3;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setComputeWeightsAndBiasOnly:", 1);

}

- (id)weightsGradients:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weightsDeltaData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  v6 = 32;
  if (*(_DWORD *)(v5 + 4) == 0x20000)
    v6 = 16;
  v7 = 96;
  if (*(_DWORD *)(v5 + 4) == 0x20000)
    v7 = 80;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v5 + 136), CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * *(_QWORD *)(v5 + v6) * *(_QWORD *)(v5 + v7), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)biasesGradients:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biasDeltaData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v5 + 136), CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * *(_QWORD *)(v5 + 8), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mhaWeightGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5 > 2)
  {
    objc_msgSend(v7, "outDeltaData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "inDeltaData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = a5;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = *(_QWORD *)(objc_msgSend(v12, "bytes") + 312);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, a4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)mhaBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v7, "hasBias"))
  {
    if (a5 > 2)
    {
      objc_msgSend(v7, "outDeltaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "inDeltaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = a5;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = *(_QWORD *)(objc_msgSend(v12, "bytes") + 488);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, a4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)mhaAttnBiasGradient:(id)a3 withSize:(unint64_t)a4 index:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v7, "hasAttnBias"))
  {
    objc_msgSend(v7, "attnBiasDeltaData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a5);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "bytes");

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v11 + 136), a4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)lstmInputWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  void *v5;
  id v6;
  uint64_t *v7;
  char v8;
  unint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lstmDeltaParams");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (uint64_t *)objc_msgSend(v6, "bytes");

  v8 = objc_msgSend(v5, "biDirectional");
  v9 = objc_msgSend(v5, "numLayers");
  v10 = objc_msgSend(v5, "biDirectional");
  v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if (((v10 ^ 1) & 1) != 0)
      v12 = 0;
    else
      v12 = (a4 - v11) >> 2;
    if (v9 < 2)
      v12 = 0;
  }
  else
  {
    v12 = a4 >> 2;
  }
  v13 = a4 >= v11;
  v14 = a4 & 3;
  v15 = v7 + 276;
  v16 = v7 + 508;
  if ((a4 & 3) == 0)
    v16 = v7 + 160;
  if (v14 != 1)
    v15 = v16;
  if (v14 == 2)
    v17 = v7 + 392;
  else
    v17 = v15;
  v18 = v17[22 * (v12 != 0) + 17];
  if (v12)
  {
    v13 += (v12 - 1) << v8;
    v19 = v7[1];
  }
  else
  {
    v19 = *v7;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v18 + 8 * v13), 4 * v7[1] * v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)lstmHiddenWeightGradient:(id)a3 mlcWeightIndex:(unint64_t)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  void *v20;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lstmDeltaParams");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");

  v8 = objc_msgSend(v5, "biDirectional");
  v9 = objc_msgSend(v5, "numLayers");
  v10 = objc_msgSend(v5, "biDirectional");
  v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if (((v10 ^ 1) & 1) != 0)
      v12 = 0;
    else
      v12 = (a4 - v11) >> 2;
    if (v9 < 2)
      v12 = 0;
  }
  else
  {
    v12 = a4 >> 2;
  }
  v13 = a4 & 3;
  v14 = (uint64_t *)(v7 + 2696);
  v15 = v7 + 4552;
  if ((a4 & 3) == 0)
    v15 = v7 + 1768;
  if (v13 != 1)
    v14 = (uint64_t *)v15;
  if (v13 == 2)
    v16 = (uint64_t *)(v7 + 3624);
  else
    v16 = v14;
  v17 = *v16;
  v18 = a4 >= v11;
  v19 = v12 << v8;
  if (v18)
    ++v19;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v17 + 8 * v19), 4 * *(_QWORD *)(v7 + 8) * *(_QWORD *)(v7 + 8), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)lstmBiasGradient:(id)a3 mlcBiasIndex:(unint64_t)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lstmDeltaParams");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "bytes");

  v8 = objc_msgSend(v5, "biDirectional");
  v9 = objc_msgSend(v5, "numLayers");
  v10 = objc_msgSend(v5, "biDirectional");
  v11 = 4 * v9;
  if (v9 < 2 || (v10 & 1) != 0)
  {
    if (((v10 ^ 1) & 1) != 0)
      v12 = 0;
    else
      v12 = (a4 - v11) >> 2;
    if (v9 < 2)
      v12 = 0;
  }
  else
  {
    v12 = a4 >> 2;
  }
  v13 = a4 & 3;
  v14 = (uint64_t *)(v7 + 3048);
  v15 = v7 + 4904;
  if ((a4 & 3) == 0)
    v15 = v7 + 2120;
  if (v13 != 1)
    v14 = (uint64_t *)v15;
  if (v13 == 2)
    v16 = (uint64_t *)(v7 + 3976);
  else
    v16 = v14;
  v17 = *v16;
  v18 = v12 << v8;
  if (a4 >= v11)
    v19 = *(_QWORD *)(v7 + 8);
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v17 + 4 * (v19 + *(_QWORD *)(v7 + 8) * v18), 4 * *(_QWORD *)(v7 + 8), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)betaGradients:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "betaDeltaData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  v6 = *(_DWORD *)(v5 + 4);
  if (v6 == 196608)
  {
    v7 = *(_QWORD *)(v5 + 16) * *(_QWORD *)(v5 + 8) * *(_QWORD *)(v5 + 24);
  }
  else if (v6 == 0x20000)
  {
    v7 = *(_QWORD *)(v5 + 16) * *(_QWORD *)(v5 + 8);
  }
  else
  {
    v7 = 0;
    if (v6 == 0x10000)
      v7 = *(_QWORD *)(v5 + 8);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v5 + 136), CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)gammaGradients:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gammaDeltaData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");

  v6 = *(_DWORD *)(v5 + 4);
  if (v6 == 196608)
  {
    v7 = *(_QWORD *)(v5 + 16) * *(_QWORD *)(v5 + 8) * *(_QWORD *)(v5 + 24);
  }
  else if (v6 == 0x20000)
  {
    v7 = *(_QWORD *)(v5 + 16) * *(_QWORD *)(v5 + 8);
  }
  else
  {
    v7 = 0;
    if (v6 == 0x10000)
      v7 = *(_QWORD *)(v5 + 8);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(v5 + 136), CPU_BNNSDataTypeSizeInBytes(*(_DWORD *)(v5 + 144)) * v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)embeddingWeightsGradients:(id)a3 embeddingCount:(unint64_t)a4 embeddingDimension:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  NSObject *v27;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;

  v8 = a3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = objc_msgSend(v10, "bytes");
  v11 = objc_msgSend(v10, "length");
  v12 = a5 * a4;
  v13 = (char *)malloc_type_calloc(a5 * a4, 4uLL, 0x100004052888210uLL);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, 4 * v12, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "weightsDeltaDataBytes");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "bytes");

    if (v11 >= 8)
    {
      v31 = v8;
      v29 = v15;
      v30 = v10;
      v18 = 0;
      if (v11 >> 3 <= 1)
        v19 = 1;
      else
        v19 = v11 >> 3;
      do
      {
        objc_msgSend(v9, "paddingIndex");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20
          || (v21 = (void *)v20,
              objc_msgSend(v9, "paddingIndex"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "longLongValue"),
              v24 = *(_QWORD *)(v32 + 8 * v18),
              v22,
              v21,
              v23 != v24))
        {
          if (a5)
          {
            v25 = 0;
            v26 = &v14[4 * *(_QWORD *)(v32 + 8 * v18) * a5];
            do
            {
              *(float *)&v26[4 * v25] = *(float *)(v17 + 4 * v25) + *(float *)&v26[4 * v25];
              ++v25;
            }
            while (a5 != v25);
          }
        }
        ++v18;
        v17 += 4 * a5;
      }
      while (v18 != v19);
      v10 = v30;
      v8 = v31;
      v15 = v29;
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCLayerOperations) embeddingWeightsGradients:embeddingCount:embeddingDimension:].cold.1(a2);

    v15 = 0;
  }

  return v15;
}

- (void)allocateParameterGradientsForDeviceOps:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  _QWORD *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  size_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  size_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  uint64_t i;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  uint64_t v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t j;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  size_t v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  size_t v137;
  void *v138;
  size_t v139;
  void *v140;
  uint64_t v141;
  char v142;
  char v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  size_t v148;
  void *v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  void *v154;
  id v155;
  _QWORD *v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  void *v166;

  v6 = a4;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v7, "deviceOpType"))
  {
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0x16u:
    case 0x17u:
    case 0x19u:
    case 0x1Au:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x28u:
    case 0x29u:
      objc_msgSend(v7, "weightsDeltaDataBytes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = malloc_type_calloc(objc_msgSend(v10, "tensorAllocationSizeInBytes"), 1uLL, 0xE69C1D3FuLL);

        if (!v11)
        {
          +[MLCLog framework](MLCLog, "framework");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:].cold.2(a2);
          goto LABEL_13;
        }
        objc_msgSend(v7, "weightsDeltaData");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_QWORD *)(objc_msgSend(v12, "bytes") + 136) = v11;

        v13 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataWithBytesNoCopy:length:freeWhenDone:", v11, objc_msgSend(v15, "tensorAllocationSizeInBytes"), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setWeightsDeltaDataBytes:", v16);
      }
      if (objc_msgSend(v6, "count") == 2)
      {
        objc_msgSend(v7, "biasDeltaDataBytes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "descriptor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = malloc_type_calloc(objc_msgSend(v19, "tensorAllocationSizeInBytes"), 1uLL, 0x45A00827uLL);

          if (v20)
          {
            objc_msgSend(v7, "biasDeltaData");
            v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *(_QWORD *)(objc_msgSend(v21, "bytes") + 136) = v20;

            v22 = (void *)MEMORY[0x1E0C99D50];
            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "descriptor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dataWithBytesNoCopy:length:freeWhenDone:", v20, objc_msgSend(v24, "tensorAllocationSizeInBytes"), 1);
            v25 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "setBiasDeltaDataBytes:", v25);
            goto LABEL_48;
          }
          +[MLCLog framework](MLCLog, "framework");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:].cold.3(a2);
          goto LABEL_13;
        }
      }
      goto LABEL_75;
    case 0x11u:
      v154 = v7;
      v155 = v6;
      v25 = v7;
      objc_msgSend(v25, "params");
      v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v153, "bytes");
      objc_msgSend(v25, "lstmDeltaParams");
      v152 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156 = (_QWORD *)objc_msgSend(v152, "bytes");
      v28 = *(_DWORD *)(v27 + 44) & 1;
      v165 = *(_QWORD *)(v27 + 24);
      v157 = v165 << v28;
      v158 = *(_QWORD *)(v27 + 8);
      if (v165 << v28)
      {
        v29 = 0;
        v30 = 0;
        v159 = *(_QWORD *)v27;
        do
        {
          v31 = 0;
          v162 = v30;
          v32 = v158;
          if (!(v30 % v165))
            v32 = v159;
          v33 = 4 * v158 * v32;
          do
          {
            v34 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v33, 1uLL, 0x3CFAEAD9uLL), v33, 1);
            objc_msgSend(v25, "inputWeightsDeltaPointers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:atIndexedSubscript:", v34, v29 + v31);

            v36 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(4 * v158 * v158, 1uLL, 0x3CFAEAD9uLL), 4 * v158 * v158, 1);
            objc_msgSend(v25, "hiddenWeightsDeltaPointers");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:atIndexedSubscript:", v36, v29 + v31);

            ++v31;
          }
          while (v31 != 4);
          v30 = v162 + 1;
          v29 += 4;
        }
        while (v162 + 1 != v157);
      }
      v38 = 0;
      if (v28)
        v39 = 16;
      else
        v39 = 8;
      v40 = 4 * v165;
      do
      {
        v41 = malloc_type_malloc(v39, 0x80040B8603338uLL);
        objc_msgSend(v25, "inputWeightsDeltaPointers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", v38);
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *v41 = objc_msgSend(v43, "bytes");

        if (v28)
        {
          objc_msgSend(v25, "inputWeightsDeltaPointers");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", v40 + v38);
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v41[1] = objc_msgSend(v45, "bytes");

        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v41, v39, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:atIndexedSubscript:", v46, v38);

        ++v38;
      }
      while (v38 != 4);
      objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[177] = objc_msgSend(v49, "bytes");

      objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[293] = objc_msgSend(v51, "bytes");

      objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[409] = objc_msgSend(v53, "bytes");

      objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", 3);
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[525] = objc_msgSend(v55, "bytes");

      if (v165 >= 2)
      {
        v56 = 0;
        v57 = 8 * ((v165 - 1) << v28);
        v58 = 4;
        do
        {
          v163 = v56;
          v59 = malloc_type_malloc(v57, 0x80040B8603338uLL);
          v60 = 0;
          v160 = v58;
          do
          {
            objc_msgSend(v25, "inputWeightsDeltaPointers");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectAtIndexedSubscript:", v58);
            v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v59[v60 << v28] = objc_msgSend(v62, "bytes");

            if (v28)
            {
              objc_msgSend(v25, "inputWeightsDeltaPointers");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "objectAtIndexedSubscript:", v40 + v58);
              v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *(_QWORD *)((char *)v59 + ((8 * (v60 << v28)) | 8)) = objc_msgSend(v64, "bytes");

            }
            v58 += 4;
            ++v60;
          }
          while (v165 - 1 != v60);
          v57 = 8 * ((v165 - 1) << v28);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v59, v57, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setObject:atIndexedSubscript:", v65, v163 + 4);

          v56 = v163 + 1;
          v58 = v160 + 1;
        }
        while (v163 != 3);
        objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectAtIndexedSubscript:", 4);
        v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[199] = objc_msgSend(v68, "bytes");

        objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectAtIndexedSubscript:", 5);
        v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[315] = objc_msgSend(v70, "bytes");

        objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 6);
        v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[431] = objc_msgSend(v72, "bytes");

        objc_msgSend(v25, "bnnsInputWeightsDeltaPointers");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", 7);
        v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[547] = objc_msgSend(v74, "bytes");

      }
      v75 = 0;
      v76 = 8 * v157;
      do
      {
        v77 = malloc_type_malloc(v76, 0x80040B8603338uLL);
        if (v165)
        {
          v78 = 0;
          v79 = v75;
          do
          {
            objc_msgSend(v25, "hiddenWeightsDeltaPointers");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "objectAtIndexedSubscript:", v79);
            v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v77[v78 << v28] = objc_msgSend(v81, "bytes");

            if (v28)
            {
              objc_msgSend(v25, "hiddenWeightsDeltaPointers");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "objectAtIndexedSubscript:", v40 + v79);
              v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *(_QWORD *)((char *)v77 + ((8 * (v78 << v28)) | 8)) = objc_msgSend(v83, "bytes");

            }
            ++v78;
            v79 += 4;
          }
          while (v165 != v78);
        }
        v76 = 8 * v157;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v77, 8 * v157, 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bnnsHiddenWeightsDeltaPointers");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:atIndexedSubscript:", v84, v75);

        ++v75;
      }
      while (v75 != 4);
      objc_msgSend(v25, "bnnsHiddenWeightsDeltaPointers");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
      v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[221] = objc_msgSend(v87, "bytes");

      objc_msgSend(v25, "bnnsHiddenWeightsDeltaPointers");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
      v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[337] = objc_msgSend(v89, "bytes");

      objc_msgSend(v25, "bnnsHiddenWeightsDeltaPointers");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 2);
      v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[453] = objc_msgSend(v91, "bytes");

      objc_msgSend(v25, "bnnsHiddenWeightsDeltaPointers");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectAtIndexedSubscript:", 3);
      v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v156[569] = objc_msgSend(v93, "bytes");

      v7 = v154;
      v6 = v155;
      if ((objc_msgSend(v25, "hasBias") & 1) != 0)
      {
        for (i = 0; i != 4; ++i)
        {
          v95 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc((v40 << v28) * v158, 1uLL, 0x3CFAEAD9uLL), (v40 << v28) * v158, 1);
          objc_msgSend(v25, "weightAndBiasGateDeltaBuffers");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:atIndexedSubscript:", v95, i);

        }
        objc_msgSend(v25, "weightAndBiasGateDeltaBuffers");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "objectAtIndexedSubscript:", 0);
        v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[265] = objc_msgSend(v98, "bytes");

        objc_msgSend(v25, "weightAndBiasGateDeltaBuffers");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "objectAtIndexedSubscript:", 1);
        v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[381] = objc_msgSend(v100, "bytes");

        objc_msgSend(v25, "weightAndBiasGateDeltaBuffers");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectAtIndexedSubscript:", 2);
        v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[497] = objc_msgSend(v102, "bytes");

        objc_msgSend(v25, "weightAndBiasGateDeltaBuffers");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectAtIndexedSubscript:", 3);
        v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v156[613] = objc_msgSend(v104, "bytes");

      }
      goto LABEL_48;
    case 0x2Cu:
      objc_msgSend(v7, "biasDeltaDataBytesArray");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v105, "count");

      if (v106)
        goto LABEL_50;
      if (objc_msgSend(v6, "count") == 6)
      {
        v107 = 0;
        v161 = 1;
        v164 = 4;
      }
      else
      {
        if (objc_msgSend(v6, "count") == 8)
        {
          v164 = 0;
          v161 = 0;
        }
        else
        {
          if (objc_msgSend(v6, "count") != 10)
          {
LABEL_50:
            v164 = 0;
            v161 = 0;
            v107 = 0;
            goto LABEL_63;
          }
          v161 = 1;
          v164 = 8;
        }
        v107 = 1;
      }
LABEL_63:
      objc_msgSend(v7, "weightsDeltaDataBytesArray");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "biasDeltaDataBytesArray");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "weightsDeltaDataBytesArray");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "count");

      v166 = v118;
      if (!v121)
      {
        for (j = 0; j != 4; ++j)
        {
          v123 = v7;
          if (j == 3)
          {
            objc_msgSend(v7, "outDeltaData");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v124;
            v126 = 0;
          }
          else
          {
            objc_msgSend(v7, "inDeltaData");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v124;
            v126 = j;
          }
          objc_msgSend(v124, "objectAtIndexedSubscript:", v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectAtIndexedSubscript:", j);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "descriptor");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v129, "tensorAllocationSizeInBytes");

          v131 = malloc_type_malloc(v130, 0x66A9F490uLL);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v131, v130, 1);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "addObject:", v132);
          v133 = objc_retainAutorelease(v127);
          *(_QWORD *)(objc_msgSend(v133, "bytes") + 312) = v131;
          if (v107)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", j + 4);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "descriptor");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = v6;
            v137 = objc_msgSend(v135, "tensorAllocationSizeInBytes");

            v138 = malloc_type_malloc(v137, 0xE62CB0FuLL);
            v139 = v137;
            v6 = v136;
            v118 = v166;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v138, v139, 1);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "addObject:", v140);
            *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v133), "bytes") + 488) = v138;

          }
          v7 = v123;
        }
      }
      if (v161)
      {
        v141 = 0;
        v142 = 1;
        do
        {
          v143 = v142;
          objc_msgSend(v7, "attnBiasDeltaData");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "objectAtIndexedSubscript:", v141);
          v145 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectAtIndexedSubscript:", v141 | v164);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "descriptor");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v148 = objc_msgSend(v147, "tensorAllocationSizeInBytes");

          v149 = malloc_type_malloc(v148, 0x84B0DDC2uLL);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v149, v148, 1);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "addObject:", v150);
          v151 = objc_retainAutorelease(v145);
          *(_QWORD *)(objc_msgSend(v151, "bytes") + 136) = v149;

          v142 = 0;
          v141 = 1;
        }
        while ((v143 & 1) != 0);
      }

LABEL_75:
      return;
    case 0x2Fu:
      objc_msgSend(v7, "weightsDeltaDataBytesArray");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v108, "count");

      if (!v109)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "descriptor");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = malloc_type_calloc(objc_msgSend(v111, "tensorAllocationSizeInBytes"), 1uLL, 0xEFBE7BB1uLL);

        if (v112)
        {
          objc_msgSend(v7, "weightsDeltaData");
          v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_QWORD *)(objc_msgSend(v113, "bytes") + 136) = v112;

          v114 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "descriptor");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "dataWithBytesNoCopy:length:freeWhenDone:", v112, objc_msgSend(v116, "tensorAllocationSizeInBytes"), 1);
          v25 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "weightsDeltaDataBytesArray");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "addObject:", v25);

LABEL_48:
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MLCDeviceCPU(MLCLayerOperations) allocateParameterGradientsForDeviceOps:parameters:].cold.1(a2);
LABEL_13:

        }
      }
      goto LABEL_75;
    default:
      goto LABEL_75;
  }
}

- (void)allocateResultTensor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  char v15;
  size_t v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v5 = a3;
  objc_msgSend(v5, "deviceMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "deviceMemory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      objc_msgSend(v5, "deviceMemory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v5, "deviceMemory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v15 = objc_opt_isKindOfClass();

        if ((v15 & 1) != 0)
        {
          v16 = -[MLCDeviceCPU deviceMemorySizeForTensor:](self, "deviceMemorySizeForTensor:", v5);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(v16, 0x1BF17510uLL), v16, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "deviceMemory");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

          objc_msgSend(v5, "setDeviceIndex:", 1);
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[MLCDeviceCPU(MLCEngineDispatch) allocateResultTensor:].cold.1(a2);

        }
      }
    }
  }
  else
  {
    -[MLCDeviceCPU allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v5);
  }

}

- (void)shareResultTensor:(id)a3 sourceTensor:(id)a4 deviceOps:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v7 = a4;
  objc_msgSend(v16, "deviceMemory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    CPU_GetDeviceMemoryData(v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      CPU_GetDeviceMemoryData(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v16);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (void *)objc_msgSend(v13, "bytes");
      v15 = objc_retainAutorelease(v12);
      memcpy(v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));

    }
  }
  else
  {
    -[MLCDeviceCPU shareDeviceMemoryWithResultTensor:sourceTensor:](self, "shareDeviceMemoryWithResultTensor:sourceTensor:", v16, v7);
  }

}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5 forConcat:(BOOL)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t BNNSConcatLayerTensorDataOffset;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  uint64_t v34;
  BNNSDataLayout v35;
  BNNSDataLayout v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  char v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  SEL v59;
  void *v60;
  _BOOL4 v62;
  void *v63;
  id v64;
  BNNSNDArrayDescriptor dest;
  BNNSNDArrayDescriptor src;

  v62 = a6;
  v59 = a2;
  v64 = a4;
  v8 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&src, 0, sizeof(src));
  memset(&dest, 0, sizeof(dest));
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v60 = v8;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9, v59);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v10);

      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shape");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "descriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stride");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_BuildBNNSNDArrayDescriptor((uint64_t)&src, v13, v15, 0, objc_msgSend(v16, "dataType"), 1, 0);

      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v62)
        BNNSConcatLayerTensorDataOffset = getBNNSConcatLayerTensorDataOffset(v17);
      else
        BNNSConcatLayerTensorDataOffset = getBNNSSplitLayerTensorDataOffset(v17);
      v20 = BNNSConcatLayerTensorDataOffset;

      CPU_GetDeviceMemoryData(v64);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      src.data = (void *)(objc_msgSend(v21, "bytes") + v20);

      v8 = v60;
      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "descriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shape");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "descriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stride");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "descriptor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_BuildBNNSNDArrayDescriptor((uint64_t)&dest, v24, v27, 0, objc_msgSend(v29, "dataType"), 1, 0);

      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v30);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      dest.data = (void *)objc_msgSend(v31, "bytes");

      objc_msgSend(v64, "descriptor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "dataType");

      if (src.layout == BNNSDataLayoutVector)
        v34 = 1;
      else
        v34 = 3;
      if (src.layout == BNNSDataLayoutVector)
        v35 = BNNSDataLayout2DLastMajor;
      else
        v35 = BNNSDataLayout4DLastMajor;
      src.layout = v35;
      if (dest.layout == BNNSDataLayoutVector)
        v36 = BNNSDataLayout2DLastMajor;
      else
        v36 = BNNSDataLayout4DLastMajor;
      dest.layout = v36;
      v37 = objc_msgSend(v63, "batchSize");
      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "descriptor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shape");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "unsignedIntegerValue");

      if (v37 > v42)
      {
        objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "descriptor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "shape");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v46, "unsignedIntegerValue");

      }
      v47 = (char *)&src + 8 * v34;
      *((_QWORD *)v47 + 1) = v37;
      objc_msgSend(v64, "descriptor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stride");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "unsignedIntegerValue");
      v52 = v33 == 1 ? 2 : v33 == 3;
      *((_QWORD *)v47 + 9) = v51 >> v52;

      v53 = (char *)&dest + 8 * v34;
      *((_QWORD *)v53 + 1) = v37;
      objc_msgSend(v60, "objectAtIndexedSubscript:", v9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "descriptor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stride");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v53 + 9) = (unint64_t)objc_msgSend(v57, "unsignedIntegerValue") >> v52;

      if (BNNSCopy(&dest, &src, 0))
        break;
      if (++v9 >= (unint64_t)objc_msgSend(v60, "count"))
        goto LABEL_26;
    }
    +[MLCLog framework](MLCLog, "framework");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:].cold.1();

  }
LABEL_26:

}

- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const BNNSNDArrayDescriptor *v17;
  void *v18;
  id v19;
  BNNSNDArrayDescriptor *v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v9);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "inDeltaData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (const BNNSNDArrayDescriptor *)objc_msgSend(v16, "bytes");

  objc_msgSend(v12, "outDeltaData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (BNNSNDArrayDescriptor *)objc_msgSend(v19, "bytes");

  v21 = objc_msgSend(v12, "beginOffset");
  v22 = objc_retainAutorelease(v13);
  v17->data = (void *)(objc_msgSend(v22, "bytes") + v21);
  v23 = objc_retainAutorelease(v14);
  v20->data = (void *)objc_msgSend(v23, "bytes");
  if (BNNSCopy(v20, v17, 0))
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:].cold.1();

  }
}

- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  -[MLCDeviceCPU dispatchForwardReshapeLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:](self, "dispatchForwardReshapeLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", a3, a4, a5, 1, 0);
}

- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  BNNSNDArrayDescriptor *v17;
  void *v18;
  id v19;
  const BNNSNDArrayDescriptor *v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v8);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  bzero((void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
  objc_msgSend(v11, "inDeltaData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (BNNSNDArrayDescriptor *)objc_msgSend(v16, "bytes");

  objc_msgSend(v11, "outDeltaData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const BNNSNDArrayDescriptor *)objc_msgSend(v19, "bytes");

  v21 = objc_retainAutorelease(v12);
  v20->data = (void *)objc_msgSend(v21, "bytes");
  v22 = objc_msgSend(v11, "beginOffset");
  v23 = objc_retainAutorelease(v14);
  v17->data = (void *)(objc_msgSend(v23, "bytes") + v22);
  if (BNNSCopy(v17, v20, 0))
  {
    +[MLCLog framework](MLCLog, "framework");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSliceLayer:sourceTensor:resultTensor:forTraining:].cold.1();

  }
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5 forConcat:(BOOL)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t BNNSConcatLayerTensorDataOffset;
  uint64_t v34;
  id v35;
  void *v36;
  int v37;
  uint64_t v38;
  BNNSDataLayout v39;
  BNNSDataLayout v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  char *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  char v60;
  char *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  BNNSNDArrayDescriptor dest;
  BNNSNDArrayDescriptor src;

  v66 = a6;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&src, 0, sizeof(src));
  memset(&dest, 0, sizeof(dest));
  v68 = v10;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v10);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceMemory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "descriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shape");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "descriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stride");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptor((uint64_t)&src, v17, v20, 0, objc_msgSend(v22, "dataType"), 1, 0);

        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_GetDeviceMemoryData(v23);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        src.data = (void *)objc_msgSend(v24, "bytes");

        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shape");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "descriptor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stride");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "descriptor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        CPU_BuildBNNSNDArrayDescriptor((uint64_t)&dest, v27, v29, 0, objc_msgSend(v30, "dataType"), 1, 0);

        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v66)
          BNNSConcatLayerTensorDataOffset = getBNNSConcatLayerTensorDataOffset(v31);
        else
          BNNSConcatLayerTensorDataOffset = getBNNSSplitLayerTensorDataOffset(v31);
        v34 = BNNSConcatLayerTensorDataOffset;

        CPU_GetDeviceMemoryData(v68);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        dest.data = (void *)(objc_msgSend(v35, "bytes") + v34);

        objc_msgSend(v68, "descriptor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "dataType");

        if (src.layout == BNNSDataLayoutVector)
          v38 = 1;
        else
          v38 = 3;
        if (src.layout == BNNSDataLayoutVector)
          v39 = BNNSDataLayout2DLastMajor;
        else
          v39 = BNNSDataLayout4DLastMajor;
        src.layout = v39;
        if (dest.layout == BNNSDataLayoutVector)
          v40 = BNNSDataLayout2DLastMajor;
        else
          v40 = BNNSDataLayout4DLastMajor;
        dest.layout = v40;
        v41 = objc_msgSend(v67, "batchSize");
        objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "descriptor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "shape");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "unsignedIntegerValue");

        if (v41 > v46)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "descriptor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "shape");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v50, "unsignedIntegerValue");

        }
        v51 = v41;
        v52 = v9;
        v53 = v38;
        v54 = (char *)&src + 8 * v38;
        *((_QWORD *)v54 + 1) = v51;
        objc_msgSend(v52, "objectAtIndexedSubscript:", v11);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "descriptor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stride");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "unsignedIntegerValue");
        v60 = v37 == 1 ? 2 : v37 == 3;
        *((_QWORD *)v54 + 9) = v59 >> v60;

        v61 = (char *)&dest + 8 * v53;
        v9 = v52;
        *((_QWORD *)v61 + 1) = v51;
        objc_msgSend(v68, "descriptor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stride");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)v61 + 9) = (unint64_t)objc_msgSend(v64, "unsignedIntegerValue") >> v60;

        if (BNNSCopy(&dest, &src, 0))
          break;
      }
      if (++v11 >= (unint64_t)objc_msgSend(v9, "count"))
        goto LABEL_27;
    }
    +[MLCLog framework](MLCLog, "framework");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:].cold.1();

  }
LABEL_27:

}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5
{
  -[MLCDeviceCPU dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:](self, "dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:", a3, a4, a5, 0);
}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5
{
  -[MLCDeviceCPU dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:](self, "dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:", a3, a4, a5, 0);
}

- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "concatDimension");

  if (v12 == 1)
  {
    if (objc_msgSend(v9, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCDeviceCPU dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:](self, "dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:", v8, v15, v10, 1);

        ++v13;
      }
      while (v13 < objc_msgSend(v9, "count"));
    }
  }
  else
  {
    -[MLCDeviceCPU dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:](self, "dispatchGradientSplitLayer:sourceGradientTensors:resultGradientTensor:forConcat:", v8, v9, v10, 1);
  }

}

- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "concatDimension");

  if (v12 == 1)
  {
    if (objc_msgSend(v10, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCDeviceCPU dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:](self, "dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:", v8, v9, v15, 1);

        ++v13;
      }
      while (v13 < objc_msgSend(v10, "count"));
    }
  }
  else
  {
    -[MLCDeviceCPU dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:](self, "dispatchForwardSplitLayer:sourceTensor:resultTensors:forConcat:", v8, v9, v10, 1);
  }

}

- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  BNNSNDArrayDescriptor *v25;
  id v26;
  NSObject *v27;
  id v28;
  const void *v29;
  size_t v30;
  id v31;
  const void *v32;
  size_t v33;
  id v34;
  NSObject *v35;
  void *filter;
  void *v38;
  void *v39;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v9);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v11;
  CPU_GetDeviceMemoryData(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  CPU_GetDeviceMemoryData(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 3)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v19 = objc_retainAutorelease(v18);
    v20 = objc_msgSend(v19, "bytes");
    objc_msgSend(v13, "fusedPrimitiveParams");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)(objc_msgSend(v21, "bytes") + 312) = v20;

    v22 = objc_msgSend(objc_retainAutorelease(v16), "bytes");
    objc_msgSend(v13, "params");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)(objc_msgSend(v23, "bytes") + 504) = v22;

    objc_msgSend(v13, "params");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (BNNSNDArrayDescriptor *)(objc_msgSend(v24, "bytes") + 368);
    objc_msgSend(v13, "fusedPrimitiveParams");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v25) = BNNSCopy(v25, (const BNNSNDArrayDescriptor *)(objc_msgSend(v26, "bytes") + 176), 0);

    if ((_DWORD)v25)
    {
      +[MLCLog framework](MLCLog, "framework");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMatMulLayer:sourceTensors:resultTensor:].cold.1();

    }
  }
  filter = (void *)objc_msgSend(v13, "BNNSFilter", a2);
  v28 = objc_retainAutorelease(v14);
  v29 = (const void *)objc_msgSend(v28, "bytes");
  v30 = objc_msgSend(v13, "sourceStride");
  v31 = objc_retainAutorelease(v15);
  v32 = (const void *)objc_msgSend(v31, "bytes");
  v33 = objc_msgSend(v13, "sourceStrideSecondary");
  v34 = objc_retainAutorelease(v16);
  if (BNNSFilterApplyTwoInputBatch(filter, 1uLL, v29, v30, v32, v33, (void *)objc_msgSend(v34, "bytes"), objc_msgSend(v13, "resultStride")))
  {
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMatMulLayer:sourceTensors:resultTensor:].cold.1();

  }
  objc_msgSend(v13, "setSource:", v28);
  objc_msgSend(v13, "setSecondarySource:", v31);

}

- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t v48;
  float *v49;
  float v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  float v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  float __B;
  float __C;
  float v64;
  vDSP_Length __N;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v13);
  v55 = v10;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSource:", v15);
  v58 = objc_retainAutorelease(v15);
  v16 = (uint64_t *)objc_msgSend(v58, "bytes");
  objc_msgSend(v11, "data");
  v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v57, "bytes");
  v59 = v13;
  CPU_GetDeviceMemoryData(v13);
  v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (char *)objc_msgSend(v56, "bytes");
  objc_msgSend(v11, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shape");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v11;
  objc_msgSend(v11, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v21, "dimensionCount") - 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  __N = v23;
  objc_msgSend(v12, "descriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "tensorAllocationSizeInBytes");
  v60 = v12;
  objc_msgSend(v12, "descriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", objc_msgSend(v26, "dataType"));
  v28 = v25 / v27;

  objc_msgSend(v14, "embeddingParams");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v14, "embeddingParams");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "floatValue");
    v33 = v32;

    objc_msgSend(v14, "embeddingParams");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "floatValue");
    v37 = v36;
    v64 = v36;

    if (v37 == INFINITY)
    {
      v38 = v55;
      if (v27 <= v25)
      {
        if (v28 <= 1)
          v39 = 1;
        else
          v39 = v25 / v27;
        do
        {
          __C = 0.0;
          v40 = *v16++;
          v41 = (float *)(v17 + 4 * v23 * v40);
          vDSP_maxmgv(v41, 1, &__C, v23);
          if (__C > (float)(v33 + 0.00001))
          {
            __B = v33 / __C;
            vDSP_vsmul(v41, 1, &__B, v41, 1, v23);
          }
          memcpy(v18, v41, 4 * v23);
          v18 += 4 * v23;
          --v39;
        }
        while (v39);
      }
    }
    else if (v37 == 1.0)
    {
      v38 = v55;
      if (v27 <= v25)
      {
        if (v28 <= 1)
          v44 = 1;
        else
          v44 = v25 / v27;
        do
        {
          __C = 0.0;
          v45 = *v16++;
          v46 = (float *)(v17 + 4 * v23 * v45);
          vDSP_svemg(v46, 1, &__C, v23);
          if (__C > (float)(v33 + 0.00001))
          {
            __B = v33 / __C;
            vDSP_vsmul(v46, 1, &__B, v46, 1, v23);
          }
          memcpy(v18, v46, 4 * v23);
          v18 += 4 * v23;
          --v44;
        }
        while (v44);
      }
    }
    else
    {
      v38 = v55;
      if (v37 == 2.0)
      {
        if (v27 <= v25)
        {
          if (v28 <= 1)
            v47 = 1;
          else
            v47 = v25 / v27;
          do
          {
            __C = 0.0;
            v48 = *v16++;
            v49 = (float *)(v17 + 4 * v23 * v48);
            vDSP_svesq(v49, 1, &__C, v23);
            v50 = sqrtf(__C);
            __C = v50;
            if (v50 > (float)(v33 + 0.00001))
            {
              __B = v33 / v50;
              vDSP_vsmul(v49, 1, &__B, v49, 1, v23);
            }
            memcpy(v18, v49, 4 * v23);
            v18 += 4 * v23;
            --v47;
          }
          while (v47);
        }
      }
      else if (v27 <= v25)
      {
        if (v28 <= 1)
          v51 = 1;
        else
          v51 = v25 / v27;
        do
        {
          __C = 0.0;
          v52 = *v16++;
          v53 = (void *)(v17 + 4 * v23 * v52);
          memcpy(v18, v53, 4 * v23);
          vDSP_vabs((const float *)v18, 1, (float *)v18, 1, v23);
          vvpowsf((float *)v18, &v64, (const float *)v18, (const int *)&__N);
          vDSP_sve((const float *)v18, 1, &__C, __N);
          v54 = powf(__C, 1.0 / v64);
          __C = v54;
          if (v54 > (float)(v33 + 0.00001))
          {
            __B = v33 / v54;
            vDSP_vsmul((const float *)v53, 1, &__B, (float *)v53, 1, __N);
          }
          v23 = __N;
          memcpy(v18, v53, 4 * __N);
          v18 += 4 * v23;
          --v51;
        }
        while (v51);
      }
    }
  }
  else
  {
    v38 = v55;
    if (v27 <= v25)
    {
      if (v28 <= 1)
        v42 = 1;
      else
        v42 = v25 / v27;
      do
      {
        v43 = *v16++;
        memcpy(v18, (const void *)(v17 + 4 * v23 * v43), 4 * v23);
        v18 += 4 * v23;
        --v42;
      }
      while (v42);
    }
  }

}

- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  id v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  const BNNSNDArrayDescriptor *v35;
  size_t v36;
  const void *value;
  size_t value_stride;
  void *v39;
  size_t output_stride;
  int v41;
  const BNNSNDArrayDescriptor *v42;
  size_t *v43;
  size_t *p_workspace_size;
  int v45;
  NSObject *v46;
  void *v47;
  id v48;
  int v49;
  uint64_t key_stride;
  const void *v51;
  size_t v52;
  const void *v53;
  size_t v54;
  id v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  size_t workspace_size;
  size_t backprop_cache_size[2];

  v7 = (id)a7;
  v11 = a4;
  v12 = a5;
  v13 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v12);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v12);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)objc_msgSend(v20, "BNNSFilter");
  if (objc_msgSend(v20, "hasKeyMask"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "keyMask");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "bytes");

    v25 = objc_retainAutorelease(v22);
    *(_QWORD *)(v24 + 136) = objc_msgSend(v25, "bytes");

  }
  if (objc_msgSend(v20, "hasKeyMask"))
  {
    if (objc_msgSend(v20, "hasAttnMask"))
      v26 = 4;
    else
      v26 = 3;
  }
  else
  {
    v26 = 3;
  }
  if (objc_msgSend(v20, "hasAttnMask"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "attnMask");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "bytes");

    v31 = objc_retainAutorelease(v28);
    *(_QWORD *)(v30 + 136) = objc_msgSend(v31, "bytes");

  }
  v62 = 0;
  v63 = 0;
  workspace_size = 0;
  backprop_cache_size[0] = 0;
  if ((_DWORD)v7)
  {
    if (BNNSApplyMultiheadAttention(v61, objc_msgSend(v20, "batchSize"), (const void *)objc_msgSend(objc_retainAutorelease(v15), "bytes"), 0, (const void *)objc_msgSend(objc_retainAutorelease(v17), "bytes"), 0, 0, 0, (const void *)objc_msgSend(objc_retainAutorelease(v19), "bytes"), 0, (void *)objc_msgSend(objc_retainAutorelease(v59), "bytes"), 0, 0, backprop_cache_size, 0, &workspace_size, 0))
    {
      +[MLCLog framework](MLCLog, "framework");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:].cold.2();

    }
    if (backprop_cache_size[0])
      v63 = malloc_type_malloc(backprop_cache_size[0], 0x4790C500uLL);
    else
      v63 = 0;
    if (workspace_size)
      v62 = malloc_type_malloc(workspace_size, 0x27382CF9uLL);
    else
      v62 = 0;
  }
  v58 = v11;
  v54 = objc_msgSend(v20, "batchSize");
  v33 = objc_retainAutorelease(v15);
  v53 = (const void *)objc_msgSend(v33, "bytes");
  v52 = objc_msgSend(v20, "sourceStride");
  v34 = objc_retainAutorelease(v17);
  v51 = (const void *)objc_msgSend(v34, "bytes");
  key_stride = objc_msgSend(v20, "sourceStrideSecondary");
  v57 = (int)v7;
  v56 = v34;
  v49 = objc_msgSend(v20, "hasKeyMask");
  if (v49)
  {
    objc_msgSend(v20, "keyMask");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = (const BNNSNDArrayDescriptor *)objc_msgSend(v48, "bytes");
  }
  else
  {
    v35 = 0;
  }
  v36 = objc_msgSend(v20, "keyMaskStride");
  v55 = objc_retainAutorelease(v19);
  value = (const void *)objc_msgSend(v55, "bytes");
  value_stride = objc_msgSend(v20, "sourceStrideTertiary");
  v60 = objc_retainAutorelease(v59);
  v39 = (void *)objc_msgSend(v60, "bytes");
  output_stride = objc_msgSend(v20, "resultStride");
  v41 = objc_msgSend(v20, "hasAttnMask");
  if (v41)
  {
    objc_msgSend(v20, "attnMask");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (const BNNSNDArrayDescriptor *)objc_msgSend(v7, "bytes");
  }
  else
  {
    v42 = 0;
  }
  v43 = backprop_cache_size;
  if (!backprop_cache_size[0])
    v43 = 0;
  p_workspace_size = &workspace_size;
  if (!workspace_size)
    p_workspace_size = 0;
  v45 = BNNSApplyMultiheadAttention(v61, v54, v53, v52, v51, key_stride, v35, v36, value, value_stride, v39, output_stride, v42, v43, v63, p_workspace_size, v62);
  if (v41)

  if (v49)
  if (v45)
  {
    +[MLCLog framework](MLCLog, "framework");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardMHALayer:sourceTensors:resultTensor:resultStateIsTemporary:forTraining:].cold.1();

  }
  if (workspace_size)
    free(v62);
  if (!backprop_cache_size[0])
  {
    v47 = 0;
    if (!v57)
      goto LABEL_44;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v63, backprop_cache_size[0], 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
LABEL_43:
    objc_msgSend(v20, "setSource:", v33);
    objc_msgSend(v20, "setSecondarySource:", v56);
    objc_msgSend(v20, "setTertiarySource:", v55);
    objc_msgSend(v20, "setResult:", v60);
    objc_msgSend(v20, "setSourceDataOffset:", 0);
    objc_msgSend(v20, "setSecondarySourceDataOffset:", 0);
    objc_msgSend(v20, "setTertiarySourceDataOffset:", 0);
    objc_msgSend(v20, "setResultDataOffset:", 0);
    objc_msgSend(v20, "setBackpropCacheSize:", backprop_cache_size[0]);
    objc_msgSend(v20, "setBackpropCacheData:", v47);
  }
LABEL_44:

}

- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  -[MLCDeviceCPU shareDeviceMemoryWithResultTensor:sourceTensor:](self, "shareDeviceMemoryWithResultTensor:sourceTensor:", a5, a4);
}

- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  -[MLCDeviceCPU dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:](self, "dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", a3, a4, a5, 0, a6);
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  const void *v19;
  size_t v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  size_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  const void *v32;
  size_t v33;
  void *v34;
  size_t v35;
  size_t v36;
  int v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  size_t v43;
  void *v44;
  size_t v45;
  void *v46;
  size_t v47;
  id v48;
  size_t v49;
  void *v50;
  uint64_t v51;
  const void *v52;
  size_t v53;
  void *v54;
  size_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const void *v60;
  size_t v61;
  void *v62;
  size_t v63;
  void *v64;
  size_t v65;
  size_t v66;
  const void *v67;
  size_t traininga;
  _BOOL4 training;
  uint64_t v70;
  uint64_t v71;
  id v72;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v12);
  CPU_GetDeviceMemoryData(v11);
  v72 = (id)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "BNNSFilter");
  v16 = objc_msgSend(v13, "batchSize");
  v17 = objc_msgSend(v13, "deviceOpType");
  if (v17 <= 0x29)
  {
    if (((1 << v17) & 0x36100000E00) != 0)
    {
      v18 = adjustBatchSizeForFC(v11, v16);
LABEL_4:
      objc_msgSend(v13, "setBatchSize:", v18);
      goto LABEL_5;
    }
    if (v17 == 39)
    {
      v18 = 1;
      goto LABEL_4;
    }
  }
LABEL_5:
  if (objc_msgSend(v13, "isFusedBNNSFilter"))
  {
    traininga = objc_msgSend(v13, "batchSize");
    v70 = v16;
    v19 = (const void *)objc_msgSend(objc_retainAutorelease(v72), "bytes");
    v20 = objc_msgSend(v13, "sourceStride");
    v21 = v15;
    v22 = v7;
    v23 = objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v24 = objc_msgSend(v13, "resultStride");
    v25 = v21;
    v26 = v70;
    v27 = (void *)v23;
    v28 = v22;
    v29 = BNNSFusedFilterApplyBatch(v25, traininga, v19, v20, v27, v24, v22);
LABEL_10:
    v37 = v29;
    goto LABEL_11;
  }
  training = v7;
  v30 = objc_msgSend(v13, "deviceOpType");
  if (v30 > 0x22)
    goto LABEL_26;
  if (((1 << v30) & 0x63030000CLL) != 0)
  {
    v31 = objc_msgSend(v13, "batchSize");
    v26 = v16;
    v32 = (const void *)objc_msgSend(objc_retainAutorelease(v72), "bytes");
    v33 = objc_msgSend(v13, "sourceStride");
    v34 = (void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v35 = objc_msgSend(v13, "resultStride");
    v36 = v31;
    v28 = training;
    v29 = BNNSNormalizationFilterApplyBatch(v15, v36, v32, v33, v34, v35, training);
    goto LABEL_10;
  }
  if (v30 == 15)
  {
    if (!v7)
    {
      v57 = objc_msgSend(v13, "batchSize");
      v58 = v15;
      v59 = v16;
      v60 = (const void *)objc_msgSend(objc_retainAutorelease(v72), "bytes");
      v61 = objc_msgSend(v13, "sourceStride");
      v62 = (void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
      v63 = objc_msgSend(v13, "resultStride");
      v64 = v58;
      v65 = v57;
      v28 = 0;
      v26 = v59;
      v29 = BNNSFilterApplyBatch(v64, v65, v60, v61, v62, v63);
      goto LABEL_10;
    }
    v71 = v16;
    objc_msgSend(v13, "params");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend(v39, "bytes");

    if (!*(_DWORD *)(v40 + 576))
    {
      objc_msgSend(v13, "poolingIndicesBuffer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        objc_msgSend(v12, "descriptor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 2 * (objc_msgSend(v42, "tensorAllocationSizeInBytes") & 0x1FFFFFFFFFFFFFFFLL);

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v43, 1uLL, 0x7DCB5C59uLL), v43, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPoolingIndicesBuffer:", v44);

      }
    }
    v45 = objc_msgSend(v13, "batchSize");
    v67 = (const void *)objc_msgSend(objc_retainAutorelease(v72), "bytes");
    v66 = objc_msgSend(v13, "sourceStride");
    v46 = (void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v47 = objc_msgSend(v13, "resultStride");
    objc_msgSend(v13, "poolingIndicesBuffer");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = BNNSPoolingFilterApplyBatch(v15, v45, v67, v66, v46, v47, (size_t *)objc_msgSend(v48, "bytes"), objc_msgSend(v13, "resultStride"));

    v28 = training;
    v26 = v71;
  }
  else
  {
LABEL_26:
    v49 = objc_msgSend(v13, "batchSize");
    v50 = v15;
    v51 = v16;
    v52 = (const void *)objc_msgSend(objc_retainAutorelease(v72), "bytes");
    v53 = objc_msgSend(v13, "sourceStride");
    v54 = (void *)objc_msgSend(objc_retainAutorelease(v14), "bytes");
    v55 = objc_msgSend(v13, "resultStride");
    v56 = v50;
    v26 = v51;
    v37 = BNNSFilterApplyBatch(v56, v49, v52, v53, v54, v55);
    v28 = training;
  }
LABEL_11:
  if (v37)
  {
    +[MLCLog framework](MLCLog, "framework");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:].cold.1();

  }
  objc_msgSend(v13, "setBatchSize:", v26, v66);
  if (v28)
  {
    objc_msgSend(v13, "setSource:", v72);
    objc_msgSend(v13, "setResult:", v14);
    objc_msgSend(v13, "setSourceDataOffset:", 0);
    objc_msgSend(v13, "setResultDataOffset:", 0);
  }

}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  id v23;
  uint64_t v24;
  const BNNSNDArrayDescriptor *v25;
  int v26;
  size_t v27;
  size_t v28;
  NSObject *v29;
  BNNSRelationalOperator op;
  size_t in_stride;
  uint64_t v32;
  void *in;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  v15 = a4;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "BNNSFilter");
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v14);
  CPU_GetDeviceMemoryData(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v18);
  in = (void *)objc_msgSend(v20, "bytes");
  v34 = 0;
  in_stride = objc_msgSend(v16, "sourceStride");
  v32 = 0;
  v21 = 0;
  if (objc_msgSend(v16, "binaryOperation"))
  {
    CPU_GetDeviceMemoryData(v13);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = objc_msgSend(v21, "bytes");
    v32 = objc_msgSend(v16, "sourceStrideSecondary");
    if (a9)
    {
      objc_msgSend(v16, "setSecondarySource:", v21);
      objc_msgSend(v16, "setSecondarySourceDataOffset:", 0);
    }
  }
  v22 = objc_msgSend(v16, "deviceOpType");
  if (v22 == 1)
  {
    v27 = objc_msgSend(v16, "batchSize");
    if (objc_msgSend(v16, "binaryOperation"))
      v28 = 2;
    else
      v28 = 1;
    v26 = BNNSArithmeticFilterApplyBatch(v17, v27, v28, (const void **)&in, &in_stride, (void *)objc_msgSend(objc_retainAutorelease(v19), "bytes"), objc_msgSend(v16, "resultStride"));
  }
  else
  {
    if (v22 != 42)
      goto LABEL_18;
    objc_msgSend(v16, "params");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "bytes");

    op = *(_DWORD *)v24;
    *(_QWORD *)(v24 + 144) = objc_msgSend(objc_retainAutorelease(v20), "bytes");
    *(_QWORD *)(v24 + 320) = objc_msgSend(objc_retainAutorelease(v21), "bytes");
    *(_QWORD *)(v24 + 496) = objc_msgSend(objc_retainAutorelease(v19), "bytes");
    if (objc_msgSend(v16, "binaryOperation"))
      v25 = (const BNNSNDArrayDescriptor *)(v24 + 184);
    else
      v25 = (const BNNSNDArrayDescriptor *)(v24 + 8);
    v26 = BNNSCompareTensor((const BNNSNDArrayDescriptor *)(v24 + 8), v25, op, (BNNSNDArrayDescriptor *)(v24 + 360));
  }
  if (v26)
  {
LABEL_18:
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:].cold.1();

    if (a9)
      goto LABEL_16;
    goto LABEL_17;
  }
  if (a9)
  {
LABEL_16:
    objc_msgSend(v16, "setSource:", v20);
    objc_msgSend(v16, "setResult:", v19);
    objc_msgSend(v16, "setSourceDataOffset:", 0);
    objc_msgSend(v16, "setResultDataOffset:", 0);
  }
LABEL_17:

}

- (void)dispatchForwardFusedArithmeticLayerNormalizationLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchForwardLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultStateIsTemporary:(BOOL)a9 forTraining:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  id v27;
  id v28;
  size_t v29;
  float *v30;
  void *v31;
  size_t v32;
  id v33;
  const void *v34;
  size_t v35;
  id v36;
  const void *v37;
  id v38;
  NSObject *v39;
  float *weights;
  void *v41;
  float v43;

  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v15);
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "lossWeight");
  v26 = v25;
  v43 = v25;
  v27 = objc_retainAutorelease(v24);
  v41 = v27;
  if (objc_msgSend(v27, "bytes"))
  {
    v28 = objc_retainAutorelease(v27);
    weights = (float *)objc_msgSend(v28, "bytes");
    v29 = (unint64_t)objc_msgSend(v28, "length") >> 2;
  }
  else
  {
    v29 = v26 != 1.0;
    v30 = &v43;
    if (v26 == 1.0)
      v30 = 0;
    weights = v30;
  }
  v31 = (void *)objc_msgSend(v20, "BNNSFilter");
  v32 = objc_msgSend(v20, "batchSize");
  v33 = objc_retainAutorelease(v21);
  v34 = (const void *)objc_msgSend(v33, "bytes");
  v35 = objc_msgSend(v20, "sourceStride");
  v36 = objc_retainAutorelease(v23);
  v37 = (const void *)objc_msgSend(v36, "bytes");
  v38 = objc_retainAutorelease(v22);
  if (BNNSLossFilterApplyBatch(v31, v32, v34, v35, v37, a6, weights, v29, (void *)objc_msgSend(v38, "bytes"), 0, 0))
  {
    +[MLCLog framework](MLCLog, "framework");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultStateIsTemporary:forTraining:].cold.1();

  }
  if (a10)
  {
    objc_msgSend(v20, "setSource:", v33);
    objc_msgSend(v20, "setSourceDataOffset:", 0);
  }

}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  BNNSNDArrayDescriptor *v18;
  void *v19;
  id v20;
  BNNSNDArrayDescriptor *out_delta;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  const void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  size_t v36;
  size_t v37;
  BNNSNDArrayDescriptor *v38;
  int v39;
  void *v40;
  size_t v41;
  size_t v42;
  size_t v43;
  id v44;
  BNNSNDArrayDescriptor *v45;
  BNNSNDArrayDescriptor *v46;
  id v47;
  NSObject *v48;
  int v49;
  void *v50;
  size_t v51;
  size_t v52;
  size_t out_delta_stride;
  id v54;
  BNNSNDArrayDescriptor *v55;
  size_t v56;
  size_t v57;
  size_t v58;
  id v59;
  void *v60;
  const BNNSNDArrayDescriptor *v61;
  BNNSNDArrayDescriptor *weights_delta;
  id v63;
  BNNSNDArrayDescriptor *in_delta;
  size_t v65;
  uint64_t batch_sizea;
  uint64_t batch_size;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *out;
  BNNSNDArrayDescriptor *v73[6];

  v73[4] = *(BNNSNDArrayDescriptor **)MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v9);
  objc_msgSend(v8, "deviceMemory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceMemory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "batchSize");
  v14 = objc_msgSend(v10, "deviceOpType");
  if (v14 <= 0x29)
  {
    if (((1 << v14) & 0x36100000E00) != 0)
    {
      v15 = adjustBatchSizeForFC(v8, v13);
LABEL_4:
      objc_msgSend(v10, "setBatchSize:", v15);
      goto LABEL_5;
    }
    if (v14 == 39)
    {
      v15 = 1;
      goto LABEL_4;
    }
  }
LABEL_5:
  v69 = v13;
  objc_msgSend(v10, "inDeltaData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (BNNSNDArrayDescriptor *)objc_msgSend(v17, "bytes");

  objc_msgSend(v10, "outDeltaData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  out_delta = (BNNSNDArrayDescriptor *)objc_msgSend(v20, "bytes");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18->data = (void *)objc_msgSend(v22, "bytes");

  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  out_delta->data = (void *)objc_msgSend(v23, "bytes");

  out = 0;
  if (objc_msgSend(v10, "resultOfForwardNeededForGradient"))
  {
    objc_msgSend(v10, "result");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v10, "resultDataOffset");
    v26 = objc_retainAutorelease(v24);
    out = (void *)(objc_msgSend(v26, "bytes") + v25);

  }
  if (objc_msgSend(v10, "sourceOfForwardNeededForGradient"))
  {
    objc_msgSend(v10, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v10, "sourceDataOffset");
    v29 = objc_retainAutorelease(v27);
    v30 = (const void *)(objc_msgSend(v29, "bytes") + v28);

  }
  else
  {
    v30 = 0;
  }
  v70 = v12;
  v71 = v11;
  if (objc_msgSend(v10, "isFusedBNNSFilter"))
  {
    objc_msgSend(v10, "weightsDeltaData");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v73[0] = (BNNSNDArrayDescriptor *)objc_msgSend(v31, "bytes");
    objc_msgSend(v10, "biasDeltaData");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v73[1] = (BNNSNDArrayDescriptor *)objc_msgSend(v32, "bytes");
    objc_msgSend(v10, "betaDeltaData");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v73[2] = (BNNSNDArrayDescriptor *)objc_msgSend(v33, "bytes");
    objc_msgSend(v10, "gammaDeltaData");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v73[3] = (BNNSNDArrayDescriptor *)objc_msgSend(v34, "bytes");

    v35 = (void *)objc_msgSend(v10, "BNNSFilter");
    v36 = objc_msgSend(v10, "batchSize");
    v37 = objc_msgSend(v10, "sourceStride");
    if (objc_msgSend(v10, "computeWeightsAndBiasOnly"))
      v38 = 0;
    else
      v38 = v18;
    v39 = BNNSFusedFilterApplyBackwardBatch(v35, v36, v30, v37, v38, objc_msgSend(v10, "sourceStride"), out, objc_msgSend(v10, "resultStride"), out_delta, objc_msgSend(v10, "resultStride"), v73);
  }
  else
  {
    v68 = v8;
    if (objc_msgSend(v10, "deviceOpType") == 2
      || objc_msgSend(v10, "deviceOpType") == 3
      || objc_msgSend(v10, "deviceOpType") == 20
      || objc_msgSend(v10, "deviceOpType") == 21
      || objc_msgSend(v10, "deviceOpType") == 28
      || objc_msgSend(v10, "deviceOpType") == 29
      || objc_msgSend(v10, "deviceOpType") == 33
      || objc_msgSend(v10, "deviceOpType") == 34)
    {
      v40 = (void *)objc_msgSend(v10, "BNNSFilter");
      batch_sizea = objc_msgSend(v10, "batchSize");
      v41 = objc_msgSend(v10, "sourceStride");
      v42 = objc_msgSend(v10, "resultStride");
      v43 = objc_msgSend(v10, "resultStride");
      objc_msgSend(v10, "betaDeltaData");
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = (BNNSNDArrayDescriptor *)objc_msgSend(v44, "bytes");
      objc_msgSend(v10, "gammaDeltaData");
      v46 = out_delta;
      v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39 = BNNSNormalizationFilterApplyBackwardBatch(v40, batch_sizea, v18, v41, out, v42, v46, v43, v45, (BNNSNDArrayDescriptor *)objc_msgSend(v47, "bytes"));

    }
    else
    {
      v49 = objc_msgSend(v10, "deviceOpType");
      v50 = (void *)objc_msgSend(v10, "BNNSFilter");
      batch_size = objc_msgSend(v10, "batchSize");
      v65 = objc_msgSend(v10, "sourceStride");
      if (v49 == 15)
      {
        v51 = objc_msgSend(v10, "sourceStride");
        v52 = objc_msgSend(v10, "resultStride");
        out_delta_stride = objc_msgSend(v10, "resultStride");
        objc_msgSend(v10, "poolingIndicesBuffer");
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v39 = BNNSPoolingFilterApplyBackwardBatch(v50, batch_size, v30, v65, v18, v51, out, v52, out_delta, out_delta_stride, 0, (const size_t *)objc_msgSend(v54, "bytes"), objc_msgSend(v10, "resultStride"));

      }
      else
      {
        if (objc_msgSend(v10, "computeWeightsAndBiasOnly"))
          v55 = 0;
        else
          v55 = v18;
        in_delta = v55;
        v56 = objc_msgSend(v10, "sourceStride");
        v57 = objc_msgSend(v10, "resultStride");
        v58 = objc_msgSend(v10, "resultStride");
        objc_msgSend(v10, "weightsDeltaData");
        v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v60 = v50;
        v61 = out_delta;
        weights_delta = (BNNSNDArrayDescriptor *)objc_msgSend(v59, "bytes");
        objc_msgSend(v10, "biasDeltaData");
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v39 = BNNSFilterApplyBackwardBatch(v60, batch_size, v30, v65, in_delta, v56, out, v57, v61, v58, weights_delta, (BNNSNDArrayDescriptor *)objc_msgSend(v63, "bytes"));

      }
    }
    v8 = v68;
  }
  if (v39)
  {
    +[MLCLog framework](MLCLog, "framework");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:].cold.1();

  }
  objc_msgSend(v10, "setBatchSize:", v69);

}

- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  const void *v47;
  size_t v48;
  size_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  const BNNSNDArrayDescriptor *out_delta;
  size_t v55;
  uint64_t inA_stride;
  const void *v57;
  void *v58;
  id v59;
  BNNSNDArrayDescriptor *inB_delta;
  id v61;
  id v62;
  BNNSNDArrayDescriptor *inA_delta;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v69 != v17)
          objc_enumerationMutation(v14);
        -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v16);
  }

  v66 = v9;
  objc_msgSend(v9, "deviceMemory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v11;
  objc_msgSend(v11, "deviceMemory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "deviceMemory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "inDeltaData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "bytes");

  v64 = objc_retainAutorelease(v22);
  inA_delta = (BNNSNDArrayDescriptor *)v27;
  *(_QWORD *)(v27 + 136) = objc_msgSend(v64, "bytes");
  objc_msgSend(v13, "inDeltaData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = objc_msgSend(v29, "bytes");

  v62 = objc_retainAutorelease(v24);
  inB_delta = (BNNSNDArrayDescriptor *)v30;
  *(_QWORD *)(v30 + 136) = objc_msgSend(v62, "bytes");
  objc_msgSend(v13, "outDeltaData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = objc_msgSend(v32, "bytes");

  v61 = objc_retainAutorelease(v20);
  *(_QWORD *)(v33 + 136) = objc_msgSend(v61, "bytes");
  if (objc_msgSend(v14, "count") == 3)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deviceMemory");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    objc_msgSend(v13, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "secondaryFilter");
    v39 = *(const void **)(v33 + 136);
    v40 = objc_retainAutorelease(v36);
    LODWORD(v38) = BNNSFilterApply(v38, v39, (void *)objc_msgSend(v40, "bytes"));

    if ((_DWORD)v38)
    {
      +[MLCLog framework](MLCLog, "framework");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMatMulLayer:sourceGradientTensor:resultGradientTensors:].cold.1();

    }
  }
  v58 = (void *)objc_msgSend(v13, "BNNSFilter");
  objc_msgSend(v13, "source");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v13, "sourceDataOffset");
  v59 = objc_retainAutorelease(v42);
  v57 = (const void *)(objc_msgSend(v59, "bytes") + v43);
  inA_stride = objc_msgSend(v13, "sourceStride");
  v55 = objc_msgSend(v13, "sourceStride");
  objc_msgSend(v13, "secondarySource");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  out_delta = (const BNNSNDArrayDescriptor *)v33;
  v45 = objc_msgSend(v13, "secondarySourceDataOffset");
  v46 = objc_retainAutorelease(v44);
  v47 = (const void *)(objc_msgSend(v46, "bytes") + v45);
  v48 = objc_msgSend(v13, "sourceStrideSecondary");
  v49 = objc_msgSend(v13, "sourceStrideSecondary");
  objc_msgSend(v13, "result");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v13, "resultDataOffset");
  v52 = objc_retainAutorelease(v50);
  LODWORD(v47) = BNNSFilterApplyBackwardTwoInputBatch(v58, 1uLL, v57, inA_stride, inA_delta, v55, v47, v48, inB_delta, v49, (const void *)(objc_msgSend(v52, "bytes") + v51), objc_msgSend(v13, "resultStride"), out_delta, objc_msgSend(v13, "resultStride"), 0, 0);

  if ((_DWORD)v47)
  {
    +[MLCLog framework](MLCLog, "framework");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMatMulLayer:sourceGradientTensor:resultGradientTensors:].cold.1();

  }
}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BNNSNDArrayDescriptor *v20;
  id v21;
  void *v22;
  id v23;
  BNNSNDArrayDescriptor *out_delta;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  size_t v51;
  size_t v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  BNNSNDArrayDescriptor *in_delta;
  uint64_t v60;
  size_t in_delta_stride;
  uint64_t v62;
  void *in;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "binaryOperation")
    || !objc_msgSend(v14, "useSourceGradientDeviceMemoryForSecondaryResultGradientTensor")
    || !objc_msgSend(v14, "useSourceGradientDeviceMemoryForResultGradientTensor"))
  {
    if (v12)
      -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v12);
    v57 = v10;
    if (v13)
      -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v13);
    objc_msgSend(v11, "deviceMemory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceMemory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceMemory");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inDeltaData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (BNNSNDArrayDescriptor *)objc_msgSend(v19, "bytes");

    v55 = v17;
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20->data = (void *)objc_msgSend(v21, "bytes");

    objc_msgSend(v14, "outDeltaData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    out_delta = (BNNSNDArrayDescriptor *)objc_msgSend(v23, "bytes");

    v56 = v16;
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    out_delta->data = (void *)objc_msgSend(v25, "bytes");

    in = 0;
    v64 = 0;
    in_delta_stride = objc_msgSend(v14, "sourceStride");
    v62 = 0;
    in_delta = v20;
    v60 = 0;
    if (objc_msgSend(v14, "binaryOperation"))
    {
      objc_msgSend(v14, "source");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v14, "sourceDataOffset");
      v28 = objc_retainAutorelease(v26);
      v29 = (void *)(objc_msgSend(v28, "bytes") + v27);

      if (objc_msgSend(v14, "sourceOfForwardNeededForGradient"))
        in = v29;
      objc_msgSend(v14, "inDeltaData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = objc_msgSend(v31, "bytes");

      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_QWORD *)(v32 + 136) = objc_msgSend(v33, "bytes");

      objc_msgSend(v14, "secondarySource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v14, "secondarySourceDataOffset");
      v36 = objc_retainAutorelease(v34);
      v37 = (void *)(objc_msgSend(v36, "bytes") + v35);

      if (objc_msgSend(v14, "sourceOfForwardNeededForGradient"))
        v64 = v37;
      v62 = objc_msgSend(v14, "sourceStrideSecondary");
      if (v29 == v37)
        v38 = (uint64_t)v20;
      else
        v38 = v32;
      v60 = v38;
      objc_msgSend(v14, "params");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = objc_msgSend(v39, "bytes");

      v41 = *(_QWORD *)(v40 + 8);
      if (!*(_DWORD *)(v41 + 176))
        in_delta = 0;
      v42 = 0;
      if (!*(_DWORD *)(v41 + 360))
        v60 = 0;
    }
    else if (objc_msgSend(v14, "resultOfForwardNeededForGradient"))
    {
      objc_msgSend(v14, "result");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v14, "resultDataOffset");
      v45 = objc_retainAutorelease(v43);
      v42 = (const void *)(objc_msgSend(v45, "bytes") + v44);

    }
    else
    {
      objc_msgSend(v14, "source");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v14, "sourceDataOffset");
      v48 = objc_retainAutorelease(v46);
      v49 = (void *)(objc_msgSend(v48, "bytes") + v47);

      v42 = 0;
      in = v49;
    }
    if (objc_msgSend(v14, "deviceOpType") == 1)
    {
      v50 = (void *)objc_msgSend(v14, "BNNSFilter");
      v51 = objc_msgSend(v14, "batchSize");
      if (objc_msgSend(v14, "binaryOperation"))
        v52 = 2;
      else
        v52 = 1;
      v53 = BNNSArithmeticFilterApplyBackwardBatch(v50, v51, v52, (const void **)&in, &in_delta_stride, &in_delta, &in_delta_stride, v42, objc_msgSend(v14, "resultStride"), out_delta, objc_msgSend(v14, "resultStride"));
      v10 = v57;
      if (!v53)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      v10 = v57;
    }
    +[MLCLog framework](MLCLog, "framework");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:].cold.1();

    goto LABEL_35;
  }
  v15 = (void *)MEMORY[0x1D8263D2C]();
  -[MLCDeviceCPU shareDeviceMemoryWithResultTensor:sourceTensor:](self, "shareDeviceMemoryWithResultTensor:sourceTensor:", v12, v11);
  -[MLCDeviceCPU shareDeviceMemoryWithResultTensor:sourceTensor:](self, "shareDeviceMemoryWithResultTensor:sourceTensor:", v13, v11);
  objc_autoreleasePoolPop(v15);
LABEL_36:

}

- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  const void *v43;
  size_t output_stride;
  void *v45;
  id v46;
  BNNSMHAProjectionParameters *v47;
  size_t backprop_cache_size;
  id v49;
  int v50;
  NSObject *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  BNNSNDArrayDescriptor *value_attn_bias_delta;
  BNNSNDArrayDescriptor *v59;
  const BNNSNDArrayDescriptor *add_to_attention;
  const BNNSNDArrayDescriptor *v61;
  void *value;
  int v63;
  void *query;
  const void *v65;
  BNNSMHAProjectionParameters *v66;
  int v67;
  uint64_t value_stride;
  BNNSMHAProjectionParameters *key_param_delta;
  int v70;
  size_t key_mask_stride;
  id v72;
  void *v73;
  id v74;
  size_t v75;
  id v76;
  BNNSMHAProjectionParameters *v77;
  void *v78;
  size_t v79;
  size_t v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;

  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v13);

  }
  v88 = v9;
  objc_msgSend(v9, "deviceMemory");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "bytes");
  objc_msgSend(v11, "outDeltaData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(objc_msgSend(v17, "bytes") + 136) = v15;

  for (j = 0; j != 3; ++j)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", j);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceMemory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndexedSubscript:", j);
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "bytes");
    objc_msgSend(v11, "inDeltaData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", j);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_QWORD *)(objc_msgSend(v24, "bytes") + 136) = v22;

  }
  v81 = (void *)objc_msgSend(v11, "BNNSFilter");
  v80 = objc_msgSend(v11, "batchSize");
  objc_msgSend(v11, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v11, "sourceDataOffset");
  v27 = objc_retainAutorelease(v25);
  v28 = objc_msgSend(v27, "bytes");
  v79 = objc_msgSend(v11, "sourceStride");
  objc_msgSend(v11, "inDeltaData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v77 = (BNNSMHAProjectionParameters *)objc_msgSend(v30, "bytes");
  objc_msgSend(v11, "secondarySource");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v11, "secondarySourceDataOffset");
  v33 = objc_retainAutorelease(v31);
  v34 = objc_msgSend(v33, "bytes");
  v75 = objc_msgSend(v11, "sourceStrideSecondary");
  v86 = v27;
  v83 = v33;
  v82 = objc_msgSend(v11, "hasKeyMask");
  if ((v82 & 1) != 0)
  {
    objc_msgSend(v11, "keyMask");
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v61 = (const BNNSNDArrayDescriptor *)objc_msgSend(v57, "bytes");
  }
  else
  {
    v61 = 0;
  }
  key_mask_stride = objc_msgSend(v11, "keyMaskStride");
  objc_msgSend(v11, "inDeltaData");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
  v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  key_param_delta = (BNNSMHAProjectionParameters *)objc_msgSend(v76, "bytes");
  objc_msgSend(v11, "tertiarySource");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v11, "tertiarySourceDataOffset");
  v74 = objc_retainAutorelease(v35);
  v37 = objc_msgSend(v74, "bytes");
  value_stride = objc_msgSend(v11, "sourceStrideTertiary");
  objc_msgSend(v11, "inDeltaData");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectAtIndexedSubscript:", 2);
  v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v66 = (BNNSMHAProjectionParameters *)objc_msgSend(v72, "bytes");
  v70 = objc_msgSend(v11, "hasAttnMask");
  if (v70)
  {
    objc_msgSend(v11, "attnMask");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    add_to_attention = (const BNNSNDArrayDescriptor *)objc_msgSend(v56, "bytes");
  }
  else
  {
    add_to_attention = 0;
  }
  v38 = (void *)(v28 + v26);
  v39 = (const void *)(v34 + v32);
  v67 = objc_msgSend(v11, "hasAttnBias");
  if (v67)
  {
    objc_msgSend(v11, "attnBiasDeltaData");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = (BNNSNDArrayDescriptor *)objc_msgSend(v54, "bytes");
  }
  else
  {
    v59 = 0;
  }
  v84 = v30;
  v85 = v29;
  query = v38;
  v65 = v39;
  v63 = objc_msgSend(v11, "hasAttnBias");
  value = (void *)(v37 + v36);
  if (v63)
  {
    objc_msgSend(v11, "attnBiasDeltaData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "objectAtIndexedSubscript:", 1);
    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    value_attn_bias_delta = (BNNSNDArrayDescriptor *)objc_msgSend(v52, "bytes");
  }
  else
  {
    value_attn_bias_delta = 0;
  }
  objc_msgSend(v11, "result");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v11, "resultDataOffset");
  v42 = objc_retainAutorelease(v40);
  v43 = (const void *)(objc_msgSend(v42, "bytes") + v41);
  output_stride = objc_msgSend(v11, "resultStride");
  objc_msgSend(v11, "outDeltaData");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v47 = (BNNSMHAProjectionParameters *)objc_msgSend(v46, "bytes");
  backprop_cache_size = objc_msgSend(v11, "backpropCacheSize");
  objc_msgSend(v11, "backpropCacheData");
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v50 = BNNSApplyMultiheadAttentionBackward(v81, v80, query, v79, v77, v65, v75, v61, key_mask_stride, key_param_delta, value, value_stride, v66, add_to_attention, v59, value_attn_bias_delta, v43, output_stride, v47,
          backprop_cache_size,
          (void *)objc_msgSend(v49, "bytes"),
          0,
          0);

  if (v63)
  {

  }
  if (v67)
  {

  }
  if (v70)

  if (v82)
  if (v50)
  {
    +[MLCLog framework](MLCLog, "framework");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientMHALayer:sourceGradientTensor:resultGradientTensors:resultStateIsTemporary:].cold.1();

  }
}

- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  id v35;
  id v36;
  float *v37;
  void *v38;
  size_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  const void *v43;
  size_t v44;
  size_t v45;
  id v46;
  NSObject *v47;
  size_t v48;
  float *weights;
  const BNNSNDArrayDescriptor *out_delta;
  BNNSNDArrayDescriptor *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  float v57;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v13);
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deviceMemory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "deviceMemory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "deviceMemory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "deviceMemory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "inDeltaData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "bytes");

  objc_msgSend(v18, "outDeltaData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "bytes");

  v54 = v20;
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = (BNNSNDArrayDescriptor *)v25;
  *(_QWORD *)(v25 + 136) = objc_msgSend(v29, "bytes");

  v56 = v19;
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  out_delta = (const BNNSNDArrayDescriptor *)v28;
  *(_QWORD *)(v28 + 136) = objc_msgSend(v30, "bytes");

  v53 = v21;
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v22;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lossWeight");
  v34 = v33;
  v57 = v33;
  v35 = objc_retainAutorelease(v32);
  if (objc_msgSend(v35, "bytes"))
  {
    v36 = objc_retainAutorelease(v35);
    weights = (float *)objc_msgSend(v36, "bytes");
    v48 = (unint64_t)objc_msgSend(v36, "length") >> 2;
  }
  else
  {
    v48 = v34 != 1.0;
    v37 = &v57;
    if (v34 == 1.0)
      v37 = 0;
    weights = v37;
  }
  v38 = (void *)objc_msgSend(v18, "BNNSFilter");
  v39 = objc_msgSend(v18, "batchSize");
  objc_msgSend(v18, "source");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v18, "sourceDataOffset");
  v42 = objc_retainAutorelease(v40);
  v43 = (const void *)(objc_msgSend(v42, "bytes") + v41);
  v44 = objc_msgSend(v18, "sourceStride");
  v45 = objc_msgSend(v18, "sourceStride");
  v46 = objc_retainAutorelease(v31);
  LODWORD(v38) = BNNSLossFilterApplyBackwardBatch(v38, v39, v43, v44, v51, v45, (const void *)objc_msgSend(v46, "bytes"), a6, weights, v48, out_delta, objc_msgSend(v18, "resultStride"));

  if ((_DWORD)v38)
  {
    +[MLCLog framework](MLCLog, "framework");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLossLayer:sourceGradientTensor:labelsTensor:labelsTensorStride:weightsTensor:resultGradientTensor:].cold.1();

  }
}

- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  float *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  float v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t __N;
  float __B;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceMemory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "scaleGradientByFrequency") & 1) != 0)
  {
    v40 = v13;
    v37 = v8;
    v38 = v7;
    objc_msgSend(v7, "source");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (uint64_t *)objc_msgSend(v14, "bytes");
    v36 = v14;
    v16 = objc_msgSend(v14, "length");
    objc_msgSend(v6, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v6;
    objc_msgSend(v6, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v19, "dimensionCount") - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __N = objc_msgSend(v20, "unsignedIntegerValue");

    v21 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    if (v16 > 7)
    {
      v35 = v5;
      if (v16 >> 3 <= 1)
        v22 = 1;
      else
        v22 = v16 >> 3;
      v23 = v15;
      v24 = v22;
      do
      {
        v25 = *v23++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25, v35);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "unsignedIntegerValue") + 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v29, v26);

        }
        else
        {
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E9844278, v26);
        }

        --v24;
      }
      while (v24);
      v13 = v40;
      v30 = (float *)objc_msgSend(objc_retainAutorelease(v40), "bytes");
      v5 = v35;
      do
      {
        __B = 0.0;
        v31 = *v15++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 1.0 / (float)(unint64_t)objc_msgSend(v33, "unsignedIntegerValue");

        __B = v34;
        vDSP_vsmul(v30, 1, &__B, v30, 1, __N);
        v30 += __N;
        --v22;
      }
      while (v22);
    }
    else
    {
      v13 = v40;
      objc_msgSend(objc_retainAutorelease(v40), "bytes");
    }
    v7 = v38;
    objc_msgSend(v38, "setWeightsDeltaDataBytes:", v13);

    v6 = v39;
    v8 = v37;
  }
  else
  {
    objc_msgSend(v7, "setWeightsDeltaDataBytes:", v13);
  }

}

- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  id v36;
  id v37;
  float *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  size_t v48;
  id v49;
  const void *v50;
  size_t v51;
  id v52;
  const void *v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  size_t weights_size;
  float *v63;
  BNNSNDArrayDescriptor *in_delta;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  float v77;

  v14 = a4;
  v15 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a3;
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v17);
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v16);
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v14;
  objc_msgSend(v14, "deviceMemory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v15;
  objc_msgSend(v15, "deviceMemory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceMemory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "deviceMemory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deviceMemory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inDeltaData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "bytes");

  v74 = v25;
  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  in_delta = (BNNSNDArrayDescriptor *)v28;
  *(_QWORD *)(v28 + 136) = objc_msgSend(v29, "bytes");

  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v24;
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v23;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lossWeight");
  v35 = v34;
  v77 = v34;
  if (objc_msgSend(v20, "deviceOpType") == 18)
  {
    weights_size = 0;
    v63 = 0;
  }
  else
  {
    v36 = objc_retainAutorelease(v33);
    if (objc_msgSend(v36, "bytes"))
    {
      v37 = objc_retainAutorelease(v36);
      v63 = (float *)objc_msgSend(v37, "bytes");
      weights_size = (unint64_t)objc_msgSend(v37, "length") >> 2;
    }
    else
    {
      weights_size = v35 != 1.0;
      v38 = &v77;
      if (v35 == 1.0)
        v38 = 0;
      v63 = v38;
    }
  }
  v72 = v21;
  v73 = v16;
  v71 = v22;
  v66 = v32;
  v67 = v30;
  v65 = v33;
  if (objc_msgSend(v20, "deviceOpType") == 18)
  {
    v39 = (void *)MEMORY[0x1E0C99D50];
    v40 = objc_retainAutorelease(v30);
    objc_msgSend(v39, "dataWithBytes:length:", objc_msgSend(v40, "bytes"), objc_msgSend(v40, "length"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0C99D50];
    v43 = objc_retainAutorelease(v32);
    objc_msgSend(v42, "dataWithBytes:length:", objc_msgSend(v43, "bytes"), objc_msgSend(v43, "length"));
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "descriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    convertDataLayout(v45, v40, v41, 0, 1);

    objc_msgSend(v75, "descriptor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    convertDataLayout(v46, v43, v44, 0, 1);

  }
  else
  {
    v41 = v30;
    v44 = v32;
  }
  v47 = (void *)objc_msgSend(v20, "BNNSFilter");
  v48 = objc_msgSend(v20, "batchSize");
  v49 = objc_retainAutorelease(v41);
  v50 = (const void *)objc_msgSend(v49, "bytes");
  v51 = objc_msgSend(v20, "sourceStride");
  v52 = objc_retainAutorelease(v44);
  v53 = (const void *)objc_msgSend(v52, "bytes");
  v54 = objc_retainAutorelease(v31);
  v55 = BNNSLossFilterApplyBatch(v47, v48, v50, v51, v53, a6, v63, weights_size, (void *)objc_msgSend(v54, "bytes"), in_delta, objc_msgSend(v20, "sourceStride"));
  if (objc_msgSend(v20, "deviceOpType") == 18)
  {
    objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0C99D50];
    v58 = objc_retainAutorelease(v56);
    objc_msgSend(v57, "dataWithBytes:length:", objc_msgSend(v58, "bytes"), objc_msgSend(v58, "length"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "descriptor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    convertDataLayout(v60, v59, v58, 1, 0);

  }
  if (v55)
  {
    +[MLCLog framework](MLCLog, "framework");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardAndGradientLossLayer:sourceTensor:labelsTensor:labelsTensorStride:weightsTensor:resultTensor:resultGradientTensor:].cold.1();

  }
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  -[MLCDeviceCPU dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:](self, "dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:", a3, a4, a5, 1, 0);
}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  size_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  const void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  unint64_t v114;
  char v115;
  int v117;
  _DWORD *__dst;
  id v119;
  id v120;
  id v121;
  NSObject *log;
  void *v123;
  _BOOL4 v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v124 = a7;
  v131 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v14);

      ++v13;
    }
    while (v13 < objc_msgSend(v12, "count"));
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") == 4)
  {

    goto LABEL_7;
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v18 = v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shape");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v10 = v18;
  if (v22 == 3)
  {
LABEL_7:
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);

    v121 = v10;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "params");
    v120 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v120, "bytes");
    v29 = objc_retainAutorelease(v24);
    v30 = -[NSObject bytes](v29, "bytes");
    v119 = objc_retainAutorelease(v26);
    __dst = (_DWORD *)objc_msgSend(v119, "bytes");
    bzero(__dst, objc_msgSend(v119, "length"));
    v117 = objc_msgSend(v27, "returnsSequences");
    v31 = objc_msgSend(v27, "batchSize");
    *(_QWORD *)(v28 + 16) = v31;
    v32 = objc_msgSend(v27, "biDirectional");
    v33 = 1;
    if (v32)
      v33 = 2;
    v114 = v33;
    v115 = v32;
    v123 = v27;
    if (!objc_msgSend(v27, "batchFirst"))
      goto LABEL_13;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shape");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37 == 3)
    {
      v38 = *(_QWORD *)(v28 + 32);
      *(_QWORD *)(v28 + 232) = *(_QWORD *)v28;
      *(_QWORD *)(v28 + 240) = v38;
      *(_QWORD *)(v28 + 248) = v31;
      *(_DWORD *)(v28 + 368) = 65568;
      *(_DWORD *)(v28 + 228) = 196610;
      if (v117)
      {
        *(_QWORD *)(v28 + 784) = 0;
        *(_QWORD *)(v28 + 776) = v31;
        *(_QWORD *)(v28 + 768) = v38;
        *(_QWORD *)(v28 + 760) = *(_QWORD *)(v28 + 8) << v115;
        *(_DWORD *)(v28 + 756) = 196610;
        *(_QWORD *)(v28 + 888) = __dst;
        goto LABEL_15;
      }
    }
    else
    {
LABEL_13:
      *(_QWORD *)(v28 + 240) = v31;
    }
    *(_QWORD *)(v28 + 776) = v31;
LABEL_15:
    *(_QWORD *)(v28 + 416) = v31;
    *(_QWORD *)(v28 + 592) = v31;
    *(_QWORD *)(v28 + 944) = v31;
    *(_QWORD *)(v28 + 1120) = v31;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "descriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shape");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42 == 4)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      convertNCHWtoTNC(v43, v31, v30, *(_DWORD **)(v28 + 360));

LABEL_17:
      v44 = v123;
      goto LABEL_23;
    }
    v44 = v123;
    if (!objc_msgSend(v123, "batchFirst"))
      goto LABEL_22;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "descriptor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "shape");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    v49 = v48 == 3;
    v44 = v123;
    if (v49)
    {
      *(_QWORD *)(v28 + 360) = v30;
    }
    else
    {
LABEL_22:
      if ((objc_msgSend(v44, "batchFirst") & 1) == 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "descriptor");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "shape");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v109, "count");

        if (v110 != 3)
        {
          +[MLCLog framework](MLCLog, "framework");
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:].cold.2(log);
          v10 = v121;
          v44 = v123;
          goto LABEL_56;
        }
        *(_QWORD *)(v28 + 360) = v30;
        goto LABEL_17;
      }
    }
LABEL_23:
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "descriptor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "batchSizePerSequenceStep");
    log = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "descriptor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "variableLengthSequences");

    if (v54)
    {
      v113 = v29;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "descriptor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sequenceLengths");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v112 = v57;
      objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "unsignedIntegerValue");

      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v59);
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v61 = log;
      v62 = -[NSObject countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v127;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v127 != v64)
              objc_enumerationMutation(v61);
            v66 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
            v125 = 0;
            v125 = objc_msgSend(v66, "unsignedIntegerValue");
            objc_msgSend(v60, "appendBytes:length:", &v125, 4);
          }
          v63 = -[NSObject countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
        }
        while (v63);
      }

      v67 = objc_retainAutorelease(v60);
      *(_QWORD *)(v28 + 184) = objc_msgSend(v67, "bytes");
      *(_DWORD *)(v28 + 52) = 0x10000;
      *(_DWORD *)(v28 + 192) = 65568;
      *(_QWORD *)(v28 + 56) = v59;
      *(_QWORD *)(v28 + 212) = 1065353216;

      v29 = v113;
      v44 = v123;
    }
    if (objc_msgSend(v11, "count") == 3 || objc_msgSend(v11, "count") == 4)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_retainAutorelease(v69);
      *(_QWORD *)(v28 + 536) = objc_msgSend(v73, "bytes");

      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_retainAutorelease(v71);
      *(_QWORD *)(v28 + 712) = objc_msgSend(v75, "bytes");

    }
    if (objc_msgSend(v12, "count") == 3)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      CPU_GetDeviceMemoryData(v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_retainAutorelease(v77);
      *(_QWORD *)(v28 + 1064) = objc_msgSend(v81, "bytes");

      objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_retainAutorelease(v79);
      *(_QWORD *)(v28 + 1240) = objc_msgSend(v83, "bytes");

    }
    if (v124)
    {
      v84 = MEMORY[0x1D82638C4](v28);
      v85 = malloc_type_malloc(v84, 0x2C272D16uLL);
    }
    else
    {
      v84 = 0;
      v85 = 0;
    }
    if (MEMORY[0x1D82638E8](v28, 0, v85, v84))
    {
      +[MLCLog framework](MLCLog, "framework");
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:].cold.1();

    }
    if (v124)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v85, v84, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setTrainingCache:", v87);

    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "descriptor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "shape");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "count");

    if (v91 == 4)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      convertTNCtoNCHW(v92, v93, v31, *(_DWORD **)(v28 + 888), __dst, objc_msgSend(v44, "returnsSequences"));

    }
    else
    {
      if (objc_msgSend(v44, "batchFirst"))
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "descriptor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "shape");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "count");

        if (v97 == 3)
        {
          v10 = v121;
          if ((v117 & 1) == 0)
          {
            v98 = *(_QWORD *)(v28 + 1064);
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            convertHiddenBNNStoMLC(v98, (uint64_t)__dst, v99, objc_msgSend(v44, "numLayers"), v114);

          }
          goto LABEL_56;
        }
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "descriptor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "shape");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "count");

      if (v103 == 3)
      {
        v10 = v121;
        if (v117)
        {
          v104 = *(const void **)(v28 + 888);
        }
        else
        {
          v111 = (objc_msgSend(v44, "numLayers") - 1) << v115;
          v104 = (const void *)(*(_QWORD *)(v28 + 1064) + 4 * objc_msgSend(v44, "hiddenSize") * v31 * v111);
        }
        v106 = v119;
        memcpy(__dst, v104, objc_msgSend(v119, "length"));
        v105 = v120;
        goto LABEL_57;
      }
    }
    v10 = v121;
LABEL_56:
    v106 = v119;
    v105 = v120;
LABEL_57:

    goto LABEL_60;
  }
  +[MLCLog framework](MLCLog, "framework");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNForwardLayer:sourceTensors:resultTensors:resultStateIsTemporary:forTraining:].cold.3(a2);
LABEL_60:

}

- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  _DWORD *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  size_t v63;
  _DWORD *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v119;
  _DWORD *__dst;
  id v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  unint64_t v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  v12 = objc_msgSend(v10, "count");
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v13);

  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v14 = 1;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v15);

      ++v14;
    }
    while (v14 < objc_msgSend(v9, "count"));
  }
  v16 = v12 - 3;
  if (v16 < 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v17);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v18);

  }
  v123 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "params");
  v122 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v130 = objc_msgSend(v122, "bytes");
  v135 = v19;
  objc_msgSend(v19, "lstmDeltaParams");
  v121 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v121, "bytes");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deviceMemory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "deviceMemory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = v22;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v24;
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  if (v11 == 3)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "deviceMemory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);

    v30 = objc_retainAutorelease(v29);
    *(_QWORD *)(v20 + 1064) = objc_msgSend(v30, "bytes");
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "deviceMemory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);

    v34 = objc_retainAutorelease(v33);
    *(_QWORD *)(v20 + 1240) = objc_msgSend(v34, "bytes");

  }
  if (v16 <= 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "deviceMemory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);

    v38 = objc_retainAutorelease(v37);
    *(_QWORD *)(v20 + 536) = objc_msgSend(v38, "bytes");
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "deviceMemory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);

    v42 = objc_retainAutorelease(v41);
    *(_QWORD *)(v20 + 712) = objc_msgSend(v42, "bytes");

  }
  v134 = v10;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "descriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "variableLengthSequences");

  if (v45)
  {
    v46 = objc_retainAutorelease(v26);
    bzero((void *)objc_msgSend(v46, "bytes"), objc_msgSend(v46, "length"));
  }
  v47 = objc_msgSend(v135, "batchSize");
  *(_QWORD *)(v20 + 16) = v47;
  *(_QWORD *)(v20 + 240) = v47;
  *(_QWORD *)(v20 + 416) = v47;
  *(_QWORD *)(v20 + 592) = v47;
  *(_QWORD *)(v20 + 776) = v47;
  *(_QWORD *)(v20 + 944) = v47;
  *(_QWORD *)(v20 + 1120) = v47;
  v48 = objc_retainAutorelease(v25);
  v49 = objc_msgSend(v48, "bytes");
  v50 = objc_retainAutorelease(v26);
  v51 = (_DWORD *)objc_msgSend(v50, "bytes");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v51, objc_msgSend(v50, "length"));
  v129 = (id)objc_claimAutoreleasedReturnValue();
  v124 = v48;
  v127 = v50;
  v128 = v47;
  v119 = v49;
  __dst = v51;
  if (objc_msgSend(v135, "returnsSequences"))
  {
    bzero(v51, objc_msgSend(v50, "length"));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v49, objc_msgSend(v48, "length"));
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "descriptor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "shape");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56 == 4)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_retainAutorelease(v52);
      v47 = v128;
      convertNCHWtoTNC(v57, v128, v49, (_DWORD *)objc_msgSend(v52, "bytes"));

      v58 = v135;
    }
    else
    {
      v58 = v135;
      v47 = v128;
      if (objc_msgSend(v135, "batchFirst"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "descriptor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "shape");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "count");

      }
    }
    v65 = v134;
  }
  else
  {
    v59 = objc_msgSend(objc_retainAutorelease(v48), "bytes");
    v60 = *(_QWORD *)(v130 + 8);
    v61 = *(_QWORD *)(v130 + 32);
    if ((*(_DWORD *)(v130 + 44) & 1) != 0)
      v62 = 2;
    else
      v62 = 1;
    v63 = 4 * v60 * ((v61 * v47) << (*(_DWORD *)(v130 + 44) & 1));
    v64 = malloc_type_malloc(v63, 0x100004052888210uLL);
    convertNCtoTNC(v61, v60, v62, v47, v59, v64);
    v65 = v134;
    v58 = v135;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v64, v63, 1);
    v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "descriptor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "batchSizePerSequenceStep");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "descriptor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "variableLengthSequences");

  if (v73)
  {
    v117 = v52;
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "descriptor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "sequenceLengths");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v76, "objectAtIndexedSubscript:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "unsignedIntegerValue");

    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v78);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v80 = v133;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v138 != v83)
            objc_enumerationMutation(v80);
          v85 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
          v136 = 0;
          v136 = objc_msgSend(v85, "unsignedIntegerValue");
          objc_msgSend(v79, "appendBytes:length:", &v136, 4);
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v137, v141, 16);
      }
      while (v82);
    }

    v86 = objc_retainAutorelease(v79);
    *(_QWORD *)(v130 + 184) = objc_msgSend(v86, "bytes");
    *(_DWORD *)(v130 + 52) = 0x10000;
    *(_DWORD *)(v130 + 192) = 65568;
    *(_QWORD *)(v130 + 56) = v78;
    *(_QWORD *)(v130 + 212) = 1065353216;
    v87 = objc_retainAutorelease(v86);
    *(_QWORD *)(v20 + 184) = objc_msgSend(v87, "bytes");
    *(_DWORD *)(v20 + 52) = 0x10000;
    *(_DWORD *)(v20 + 192) = 65568;
    *(_QWORD *)(v20 + 56) = v78;
    *(_QWORD *)(v20 + 212) = 1065353216;

    v65 = v134;
    v52 = v117;
    v47 = v128;
  }
  if (!objc_msgSend(v58, "returnsSequences"))
    goto LABEL_35;
  if (!objc_msgSend(v58, "batchFirst"))
    goto LABEL_35;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "descriptor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "shape");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "count");

  if (v91 == 3)
  {
    v92 = objc_msgSend(v58, "biDirectional");
    *(_QWORD *)(v20 + 776) = v47;
    *(_QWORD *)(v20 + 768) = *(_QWORD *)(v130 + 32);
    *(_QWORD *)(v20 + 760) = *(_QWORD *)(v130 + 8) << v92;
    *(_DWORD *)(v20 + 756) = 196610;
    v93 = v119;
  }
  else
  {
LABEL_35:
    v93 = objc_msgSend(objc_retainAutorelease(v52), "bytes");
  }
  *(_QWORD *)(v20 + 888) = v93;
  if (!objc_msgSend(v58, "batchFirst"))
    goto LABEL_39;
  objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "descriptor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "shape");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "count");

  if (v97 == 3)
  {
    v98 = v129;
    *(_QWORD *)(v20 + 232) = *(_QWORD *)v130;
    *(_QWORD *)(v20 + 240) = *(_QWORD *)(v130 + 32);
    *(_QWORD *)(v20 + 248) = v47;
    *(_DWORD *)(v20 + 228) = 196610;
    v99 = (uint64_t)__dst;
  }
  else
  {
LABEL_39:
    v98 = v129;
    v99 = objc_msgSend(objc_retainAutorelease(v129), "bytes");
  }
  *(_QWORD *)(v20 + 360) = v99;
  v100 = v65;
  if (!*(_QWORD *)(v20 + 1416)
    || !*(_QWORD *)(v20 + 2344)
    || !*(_QWORD *)(v20 + 3272)
    || !*(_QWORD *)(v20 + 4200)
    || !*(_QWORD *)(v20 + 1768)
    || !*(_QWORD *)(v20 + 2696)
    || !*(_QWORD *)(v20 + 3624)
    || !*(_QWORD *)(v20 + 4552))
  {
    v101 = v52;
    +[MLCLog framework](MLCLog, "framework");
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:].cold.1(a2);
    goto LABEL_66;
  }
  if (*(_QWORD *)(v130 + 24) >= 2uLL
    && (!*(_QWORD *)(v20 + 1592) || !*(_QWORD *)(v20 + 2520) || !*(_QWORD *)(v20 + 3448) || !*(_QWORD *)(v20 + 4376)))
  {
    v101 = v52;
    +[MLCLog framework](MLCLog, "framework");
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:].cold.2(a2);
    goto LABEL_66;
  }
  if (objc_msgSend(v58, "hasBias")
    && (!*(_QWORD *)(v20 + 2120) || !*(_QWORD *)(v20 + 3048) || !*(_QWORD *)(v20 + 3976) || !*(_QWORD *)(v20 + 4904)))
  {
    v101 = v52;
    +[MLCLog framework](MLCLog, "framework");
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:].cold.3(a2);
LABEL_66:

    v105 = v122;
    v104 = v123;
    v106 = v121;
    goto LABEL_67;
  }
  v101 = v52;
  v102 = MEMORY[0x1D82638C4](v130);
  objc_msgSend(v58, "trainingCache");
  v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(v102) = MEMORY[0x1D82638DC](v130, v20, 0, objc_msgSend(v103, "bytes"), v102);

  v105 = v122;
  v104 = v123;
  v106 = v121;
  if ((_DWORD)v102)
  {
    +[MLCLog framework](MLCLog, "framework");
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchRNNGradientLayer:sourceGradientTensors:resultGradientTensors:].cold.4();

  }
  objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "descriptor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "shape");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v110, "count");

  if (v131 == 4)
  {
    objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v129;
    convertTNCtoNCHW(v111, v112, v128, (_DWORD *)objc_msgSend(objc_retainAutorelease(v129), "bytes"), __dst, 1);

  }
  else
  {
    v98 = v129;
    if (!objc_msgSend(v58, "batchFirst"))
      goto LABEL_74;
    objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "descriptor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "shape");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v116, "count");

    v98 = v129;
    if (v132 != 3)
LABEL_74:
      memcpy(__dst, (const void *)objc_msgSend(objc_retainAutorelease(v98), "bytes"), objc_msgSend(v127, "length"));
  }
LABEL_67:

}

- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const void *v19;
  size_t v20;
  id v21;
  NSObject *v22;

  v8 = a8;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v12);
  CPU_GetDeviceMemoryData(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CPU_GetDeviceMemoryData(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "BNNSFilter");
  v18 = objc_retainAutorelease(v15);
  v19 = (const void *)objc_msgSend(v18, "bytes");
  v20 = objc_msgSend(v14, "sourceStride");
  v21 = objc_retainAutorelease(v16);
  if (BNNSFilterApplyBatch(v17, 1uLL, v19, v20, (void *)objc_msgSend(v21, "bytes"), objc_msgSend(v14, "resultStride")))
  {
    +[MLCLog framework](MLCLog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:].cold.1();

  }
  objc_msgSend(v14, "setBatchSize:", 1);
  if (v8)
  {
    objc_msgSend(v14, "setSource:", v18);
    objc_msgSend(v14, "setResult:", v21);
    objc_msgSend(v14, "setSourceDataOffset:", 0);
    objc_msgSend(v14, "setResultDataOffset:", 0);
  }

}

- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BNNSNDArrayDescriptor *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  const void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  size_t v31;
  size_t v32;
  size_t v33;
  size_t v34;
  id v35;
  BNNSNDArrayDescriptor *weights_delta;
  id v37;
  NSObject *v38;
  void *in;
  const void *v40;
  const BNNSNDArrayDescriptor *out_delta;
  void *v42;
  void *v43;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v10);
  objc_msgSend(v11, "deviceMemory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "deviceMemory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "inDeltaData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (BNNSNDArrayDescriptor *)objc_msgSend(v16, "bytes");

  objc_msgSend(v12, "outDeltaData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v19, "bytes");

  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17->data = (void *)objc_msgSend(v21, "bytes");

  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)(v20 + 136) = objc_msgSend(v22, "bytes");

  v23 = 0;
  if (objc_msgSend(v12, "resultOfForwardNeededForGradient"))
  {
    objc_msgSend(v12, "result");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v12, "resultDataOffset");
    v26 = objc_retainAutorelease(v24);
    v23 = (const void *)(objc_msgSend(v26, "bytes") + v25);

  }
  v42 = v14;
  v43 = v13;
  v40 = v23;
  out_delta = (const BNNSNDArrayDescriptor *)v20;
  if (objc_msgSend(v12, "sourceOfForwardNeededForGradient"))
  {
    objc_msgSend(v12, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v12, "sourceDataOffset");
    v29 = objc_retainAutorelease(v27);
    in = (void *)(objc_msgSend(v29, "bytes") + v28);

  }
  else
  {
    in = 0;
  }
  v30 = (void *)objc_msgSend(v12, "BNNSFilter");
  v31 = objc_msgSend(v12, "sourceStride");
  if (objc_msgSend(v12, "computeWeightsAndBiasOnly"))
    v17 = 0;
  v32 = objc_msgSend(v12, "sourceStride");
  v33 = objc_msgSend(v12, "resultStride");
  v34 = objc_msgSend(v12, "resultStride");
  objc_msgSend(v12, "weightsDeltaData");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  weights_delta = (BNNSNDArrayDescriptor *)objc_msgSend(v35, "bytes");
  objc_msgSend(v12, "biasDeltaData");
  v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(weights_delta) = BNNSFilterApplyBackwardBatch(v30, 1uLL, in, v31, v17, v32, v40, v33, out_delta, v34, weights_delta, (BNNSNDArrayDescriptor *)objc_msgSend(v37, "bytes"));

  if ((_DWORD)weights_delta)
  {
    +[MLCLog framework](MLCLog, "framework");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLCEngineDispatch) dispatchGradientLayer:sourceGradientTensor:resultGradientTensor:].cold.1();

  }
  objc_msgSend(v12, "setBatchSize:", 1);

}

- (void)dispatchForwardSelectLayer:(id)a3 conditionTensor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 forTraining:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchGradientSelectLayer:(id)a3 conditionTensor:(id)a4 sourceGradientTensor:(id)a5 resultGradientTensors:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  const void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  size_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  float v29;
  void *v30;
  void *v31;
  int v32;
  float *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  unint64_t v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[2] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v10);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const void *)objc_msgSend(v13, "bytes");

  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v64 = objc_msgSend(v16, "bytes");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v17);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v63 = objc_msgSend(v18, "bytes");

  CPU_GetDeviceMemoryData(v10);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (void *)objc_msgSend(v19, "bytes");

  objc_msgSend(v10, "descriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "tensorAllocationSizeInBytes");
  if (v11 == v10)
    bzero(v20, v22);
  else
    memcpy(v20, v14, v22);

  v23 = objc_msgSend(v65, "scatterGatherDimension");
  v69[0] = 0;
  v69[1] = 0;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "elementCount");

  if (v26)
  {
    v27 = 0;
    v67 = v9;
    v68 = v23;
    v61 = v20;
    v62 = v10;
    while (1)
    {
      v28 = *(_DWORD *)(v64 + 4 * v27);
      v66 = v27;
      v29 = *(float *)(v63 + 4 * v27);
      objc_msgSend(v10, "descriptor", v60);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "shape");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      v33 = (float *)v20;
      if (v32 >= 1)
      {
        v34 = 0;
        v33 = (float *)v20;
        do
        {
          v35 = v28;
          if (v68 != v34)
            v35 = *((_DWORD *)v69 + v34);
          objc_msgSend(v10, "descriptor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stride");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (float *)((char *)v33 + (int)(v35 * objc_msgSend(v38, "unsignedIntegerValue")));

          ++v34;
          objc_msgSend(v10, "descriptor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "shape");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v38) = objc_msgSend(v40, "count");

        }
        while (v34 < (int)v38);
      }
      v41 = objc_msgSend(v65, "scatterReduceType");
      if (!v41)
        break;
      v9 = v67;
      if (v41 == 1)
      {
        v29 = v29 + *v33;
LABEL_18:
        *v33 = v29;
      }
      objc_msgSend(v10, "descriptor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "shape");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");
      ++*((_DWORD *)v69 + v44 - 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "descriptor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "shape");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v48 >= 2)
      {
        v49 = v48;
        do
        {
          v50 = v49 - 1;
          v51 = *((_DWORD *)v69 + (v49 - 1));
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "descriptor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "shape");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", (v49 - 1));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "unsignedIntegerValue");

          if (v51 == v56)
          {
            *((_DWORD *)v69 + (v49 - 1)) = 0;
            ++*((_DWORD *)v69 + (v49 - 2));
          }
          --v49;
          v9 = v67;
        }
        while ((unint64_t)(v50 + 1) > 2);
      }
      v27 = v66 + 1;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "descriptor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "elementCount");

      v20 = v61;
      v10 = v62;
      if (v66 + 1 >= v59)
        goto LABEL_25;
    }
    v9 = v67;
    goto LABEL_18;
  }
LABEL_25:

}

- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[2] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCDeviceCPU allocateResultTensor:](self, "allocateResultTensor:", v10);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v61 = objc_msgSend(v13, "bytes");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CPU_GetDeviceMemoryData(v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v60 = objc_msgSend(v15, "bytes");

  v57 = v10;
  CPU_GetDeviceMemoryData(v10);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v59 = objc_msgSend(v16, "bytes");

  v64[0] = 0;
  v64[1] = 0;
  v56 = v11;
  v17 = objc_msgSend(v11, "scatterGatherDimension");
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "elementCount");

  if (v20)
  {
    v21 = 0;
    v63 = v17;
    do
    {
      v22 = 0;
      v23 = (_DWORD *)v61;
      v24 = *(_DWORD *)(v60 + 4 * v21);
      while (1)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shape");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v22 >= v28)
          break;
        v29 = v24;
        if (v63 != v22)
          v29 = *((_DWORD *)v64 + v22);
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "descriptor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stride");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", v22);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (_DWORD *)((char *)v23 + (int)(v29 * objc_msgSend(v33, "unsignedIntegerValue")));

        ++v22;
      }
      v62 = v21;
      *(_DWORD *)(v59 + 4 * v21) = *v23;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "descriptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "shape");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");
      ++*((_DWORD *)v64 + v37 - 1);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "descriptor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shape");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v41 >= 2)
      {
        v42 = v41;
        do
        {
          v43 = v42 - 1;
          v44 = *((_DWORD *)v64 + (v42 - 1));
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "descriptor");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "shape");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectAtIndexedSubscript:", (v42 - 1));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "unsignedIntegerValue");

          if (v44 == v49)
          {
            *((_DWORD *)v64 + (v42 - 1)) = 0;
            ++*((_DWORD *)v64 + (v42 - 2));
          }
          --v42;
        }
        while ((unint64_t)(v43 + 1) > 2);
      }
      v21 = v62 + 1;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "descriptor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "elementCount");

    }
    while (v62 + 1 < v52);
  }
  if (a6)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    CPU_GetDeviceMemoryData(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSource:", v54);

    objc_msgSend(v56, "setSourceDataOffset:", 0);
  }

}

- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8
{
  uint64_t v8;

  LOBYTE(v8) = a8;
  -[MLCDeviceCPU dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:](self, "dispatchForwardLayer:sourceTensor:secondaryTensor:tertiaryTensor:resultTensor:resultStateIsTemporary:forTraining:", a3, a4, a5, 0, a6, 0, v8);
}

- (MLCDeviceCPU)initWithType:(int)a3
{
  MLCDeviceCPU *v4;
  MLCDeviceCPU *v5;
  NSArray *deviceList;
  NSData *deviceHeap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLCDeviceCPU;
  v4 = -[MLCDeviceCPU init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_deviceType = a3;
    deviceList = v4->_deviceList;
    v4->_deviceList = (NSArray *)&unk_1E9844B10;

    deviceHeap = v5->_deviceHeap;
    v5->_deviceHeap = 0;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCDeviceCPU deviceType](self, "deviceType");
  -[MLCDeviceCPU deviceList](self, "deviceList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { deviceType=%d : deviceList=%@}"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:", -[MLCDeviceCPU deviceType](self, "deviceType"));
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", objc_msgSend(v4, "dataType"));

  if (v5)
  {
    objc_msgSend(v3, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      v10 = 1;
      do
      {
        objc_msgSend(v3, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "shape");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 *= objc_msgSend(v13, "unsignedIntegerValue");

        ++v9;
        objc_msgSend(v3, "descriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shape");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v9 < v16);
    }
    else
    {
      v10 = 1;
    }
    v18 = v10 * v5;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU deviceMemorySizeForTensor:].cold.1();

    v18 = 0;
  }

  return v18;
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3 batchSize:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;

  v5 = a3;
  objc_msgSend(v5, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", objc_msgSend(v6, "dataType"));

  if (v7)
  {
    objc_msgSend(v5, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shape");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 1)
    {
      objc_msgSend(v5, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shape");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue") * v7;

    }
    else
    {
      v14 = v7 * a4;
      objc_msgSend(v5, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 >= 2)
      {
        v19 = 1;
        do
        {
          objc_msgSend(v5, "descriptor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "shape");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v14 *= objc_msgSend(v22, "unsignedIntegerValue");

          ++v19;
          objc_msgSend(v5, "descriptor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "shape");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

        }
        while (v19 < v25);
      }
    }
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU deviceMemorySizeForTensor:].cold.1();

    v14 = 0;
  }

  return v14;
}

- (BOOL)needToAllocateDeviceMemoryForTensor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  BOOL v11;

  v3 = a3;
  objc_msgSend(v3, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v3, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (!v8
    || (objc_msgSend(v3, "device"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "type"),
        v9,
        v10 == 3))
  {
    v11 = 0;
  }
  else
  {
LABEL_6:
    v11 = 1;
  }

  return v11;
}

- (void)allocateDeviceMemoryForTensor:(id)a3
{
  id v4;
  void *v5;
  size_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "setDeviceMemory:", v5);

  v6 = -[MLCDeviceCPU deviceMemorySizeForTensor:](self, "deviceMemorySizeForTensor:", v4);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v6, 1uLL, 0xF3298B3DuLL), v6, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceMemory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:atIndexedSubscript:", v8, 0);
}

- (void)deallocateDeviceMemoryForTensor:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = (void *)MEMORY[0x1D8263D2C]();
  objc_msgSend(v5, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_autoreleasePoolPop(v3);
}

- (BOOL)shareDeviceMemoryWithResultTensor:(id)a3 sourceTensor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (v6 != v5)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v5, "setDeviceMemory:", v7);

    objc_msgSend(v6, "deviceMemory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v5, "deviceMemory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deviceMemory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v13);

        ++v10;
        objc_msgSend(v6, "deviceMemory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

      }
      while (v10 < v15);
    }
    objc_msgSend(v6, "sharedMemoryTensor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "sharedMemoryTensor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSharedMemoryTensor:", v17);

    }
    else
    {
      objc_msgSend(v5, "setSharedMemoryTensor:", v6);
    }

    objc_msgSend(v5, "setDeviceIndex:", objc_msgSend(v6, "deviceIndex"));
  }

  return 1;
}

- (id)getHostPointerIfUnifiedDeviceMemory:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "deviceIndex");

  objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readTensor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MLCDeviceCPU readTensor:fromDeviceIndex:](self, "readTensor:fromDeviceIndex:", v4, objc_msgSend(v4, "deviceIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "unsignedIntegerValue");

  }
  -[MLCDeviceCPU readFromDevice:deviceIndex:allocateData:batchSize:](self, "readFromDevice:deviceIndex:allocateData:batchSize:", v6, a4, 0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  return -[MLCDeviceCPU readFromDevice:deviceIndex:allocateData:batchSize:](self, "readFromDevice:deviceIndex:allocateData:batchSize:", a3, a4, 0, a5);
}

- (id)readFromDevice:(id)a3 deviceIndex:(unint64_t)a4 allocateData:(BOOL)a5 batchSize:(unint64_t)a6
{
  _BOOL4 v7;
  id v11;
  void *v12;
  NSObject *v13;
  size_t v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (objc_msgSend(v11, "deviceIndex") != a4)
  {
    +[MLCLog framework](MLCLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v22;
      v25 = 2048;
      v26 = objc_msgSend(v11, "deviceIndex");
      v27 = 2048;
      v28 = a4;
      _os_log_error_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%@: -readTensor:deviceIndex:allocateData:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu", (uint8_t *)&v23, 0x20u);

    }
    goto LABEL_6;
  }
  objc_msgSend(v11, "deviceMemory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = -[MLCDeviceCPU deviceMemorySizeForTensor:batchSize:](self, "deviceMemorySizeForTensor:batchSize:", v11, a6);
  v15 = v14;
  if (!v7)
  {
    objc_msgSend(v11, "data");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (void *)objc_msgSend(v19, "bytes");

    if (v16)
      goto LABEL_8;
    +[MLCLog framework](MLCLog, "framework");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[MLCDeviceCPU readFromDevice:deviceIndex:allocateData:batchSize:].cold.1(v21);

LABEL_6:
    v18 = 0;
    goto LABEL_11;
  }
  v16 = malloc_type_malloc(v14, 0x511AFD09uLL);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v16, v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setData:", v17);

LABEL_8:
  v13 = objc_retainAutorelease(v13);
  if ((void *)-[NSObject bytes](v13, "bytes") != v16)
    memcpy(v16, (const void *)-[NSObject bytes](objc_retainAutorelease(v13), "bytes"), v15);
  objc_msgSend(v11, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v18;
}

- (void)readTensor:(id)a3 targetBuffer:(void *)a4
{
  id v6;
  id v7;

  v7 = a3;
  CPU_GetDeviceMemoryData(v7);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if ((void *)objc_msgSend(v6, "bytes") != a4)
    memcpy(a4, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), -[MLCDeviceCPU deviceMemorySizeForTensor:](self, "deviceMemorySizeForTensor:", v7));

}

- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v8;
  id v9;

  v9 = a3;
  CPU_GetDeviceMemoryData(v9);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if ((void *)objc_msgSend(v8, "bytes") != a4)
    memcpy(a4, (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), -[MLCDeviceCPU deviceMemorySizeForTensor:batchSize:](self, "deviceMemorySizeForTensor:batchSize:", v9, a5));

}

- (void)broadcastTensor:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v10, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  -[MLCDeviceCPU writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", v10, 0, v6);

}

- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
  -[MLCDeviceCPU writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", a3, 0, a4);
}

- (void)dispatchBroadcastTensor:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v10, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  -[MLCDeviceCPU writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", v10, 0, v6);

}

- (void)dispatchBroadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
  -[MLCDeviceCPU writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", a3, 0, a4);
}

- (void)writeToAllDevices:(id)a3 allocateData:(BOOL)a4 batchSize:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    -[MLCDeviceCPU allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v8);
    v8 = v9;
  }
  -[MLCDeviceCPU writeToDevice:batchSize:](self, "writeToDevice:batchSize:", v8, a5);

}

- (void)writeToDevice:(id)a3 batchSize:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "data");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[MLCDeviceCPU writeToDevice:sourceBuffer:batchSize:](self, "writeToDevice:sourceBuffer:batchSize:", v6, objc_msgSend(v7, "bytes"), a4);

}

- (void)writeToDevice:(id)a3 sourceBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v8;
  void *v9;
  size_t v10;
  id v11;

  v8 = a3;
  CPU_GetDeviceMemoryData(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MLCDeviceCPU deviceMemorySizeForTensor:batchSize:](self, "deviceMemorySizeForTensor:batchSize:", v8, a5);

  v11 = objc_retainAutorelease(v9);
  if ((void *)objc_msgSend(v11, "bytes") != a4)
    memcpy((void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), a4, v10);

}

- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  double v12;
  double Current;
  id v14;
  void *v15;
  void (**v16)(id, id, _QWORD, double);

  v8 = a4;
  v16 = (void (**)(id, id, _QWORD, double))a3;
  v10 = a5;
  v11 = a6;
  v12 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v12 = Current - *(double *)objc_msgSend(objc_retainAutorelease(v10), "bytes");
  }
  if (v11)
  {
    objc_msgSend(v11, "data");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v14, "bytes"))
    {
      objc_msgSend(v11, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_8;
      objc_msgSend(v11, "data");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[MLCDeviceCPU readTensor:targetBuffer:](self, "readTensor:targetBuffer:", v11, objc_msgSend(v14, "bytes"));
    }

  }
LABEL_8:
  if (v16)
    v16[2](v16, v11, 0, v12);

}

- (void)commitAndWaitForCompletion:(id)a3
{
  -[MLCDeviceCPU commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:](self, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", a3, 0, 0, 0);
}

- (void)commitWithCompletionHandler:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  double v12;
  double Current;
  id v14;
  void *v15;
  void (**v16)(id, id, _QWORD, double);

  v8 = a4;
  v16 = (void (**)(id, id, _QWORD, double))a3;
  v10 = a5;
  v11 = a6;
  v12 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v12 = Current - *(double *)objc_msgSend(objc_retainAutorelease(v10), "bytes");
  }
  if (v11)
  {
    objc_msgSend(v11, "data");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v14, "bytes"))
    {
      objc_msgSend(v11, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_8;
      objc_msgSend(v11, "data");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[MLCDeviceCPU readTensor:targetBuffer:](self, "readTensor:targetBuffer:", v11, objc_msgSend(v14, "bytes"));
    }

  }
LABEL_8:
  if (v16)
    v16[2](v16, v11, 0, v12);

}

- (BOOL)synchronizeTensor:(id)a3
{
  return 1;
}

- (unint64_t)numDevices
{
  return 1;
}

- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4
{
  id v7;
  MLCDeviceCPU *v8;
  char isKindOfClass;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (MLCDeviceCPU *)a4;
  if (v8)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (self != v8 || (isKindOfClass & 1) == 0)
    {
      v11 = objc_msgSend(v7, "deviceIndex");
      objc_msgSend(v7, "deviceMemory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        +[MLCLog framework](MLCLog, "framework");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "deviceMemory");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v24;
          v43 = 2112;
          v44 = (id)objc_opt_class();
          v27 = v44;
          _os_log_error_impl(&dword_1D4999000, v23, OS_LOG_TYPE_ERROR, "%@: unsupported device memory class=%@", buf, 0x16u);

        }
        goto LABEL_25;
      }
      objc_msgSend(v7, "deviceMemory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      objc_msgSend(v7, "deviceMemory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 == 1)
      {
        v19 = -[MLCDeviceCPU deviceMemorySizeForTensor:](self, "deviceMemorySizeForTensor:", v7);
        v20 = (char *)malloc_type_malloc(v19, 0x6C79BDF3uLL);
        v16 = 1;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v20, v19, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deviceMemory");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v21);
      }
      else
      {
        objc_msgSend(v7, "deviceMemory");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (v29 != 2)
        {
          +[MLCLog framework](MLCLog, "framework");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE transferTensor:fromDevice:].cold.4();
          goto LABEL_25;
        }
        objc_msgSend(v7, "deviceMemory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          v32 = 0;
          while (1)
          {
            objc_msgSend(v7, "deviceMemory");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectAtIndexedSubscript:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v35 = objc_opt_isKindOfClass();

            if ((v35 & 1) != 0)
              break;
            if (v31 == ++v32)
              goto LABEL_19;
          }
          v16 = v32;
        }
LABEL_19:
        objc_msgSend(v7, "deviceMemory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v16);
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = (char *)objc_msgSend(v22, "bytes");
      }

      objc_msgSend(v7, "deviceMemory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v11);
      v23 = objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v7, "calculateBatchSizeToUse");
      -[NSObject liveIOStatus](v23, "liveIOStatus");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v37) = ANE_ReadOutputTensor(v7, v38, objc_msgSend(v7, "deviceIndex"), v20, v37);

      if ((v37 & 1) != 0)
      {
        objc_msgSend(v7, "setDeviceIndex:", v16);
        v10 = 1;
LABEL_26:

        goto LABEL_27;
      }
      +[MLCLog framework](MLCLog, "framework");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU transferTensor:fromDevice:].cold.1();

LABEL_25:
      v10 = 0;
      goto LABEL_26;
    }
  }
  v10 = 1;
LABEL_27:

  return v10;
}

- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_msgSend(a4, "data");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "deviceIndex");

  objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v7);
}

- (BOOL)updateDeviceMemoryForTensor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  BOOL v16;

  v4 = a3;
  objc_msgSend(v4, "deviceMemory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_13;
  objc_msgSend(v4, "deviceMemory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 < 3)
  {
    objc_msgSend(v4, "deviceMemory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
LABEL_9:
      +[MLCLog framework](MLCLog, "framework");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU updateDeviceMemoryForTensor:].cold.2(a2);
      goto LABEL_11;
    }
    v12 = 0;
    while (1)
    {
      objc_msgSend(v4, "deviceMemory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      if (v11 == ++v12)
        goto LABEL_9;
    }
    objc_msgSend(v4, "setDeviceIndex:", v12);
LABEL_13:
    v16 = 1;
    goto LABEL_14;
  }
  +[MLCLog framework](MLCLog, "framework");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceCPU updateDeviceMemoryForTensor:].cold.1(a2);
LABEL_11:

  v16 = 0;
LABEL_14:

  return v16;
}

- (NSArray)deviceList
{
  return self->_deviceList;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (NSData)deviceHeap
{
  return self->_deviceHeap;
}

- (void)setDeviceHeap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHeap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHeap, 0);
  objc_storeStrong((id *)&self->_deviceList, 0);
}

- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  -[MLCDeviceCPU updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:](self, "updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  -[MLCDeviceCPU updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:](self, "updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  -[MLCDeviceCPU updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:](self, "updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  size_t v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t i;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  int v46;
  NSObject *v47;
  uint64_t v48;
  SEL v49;
  uint64_t *v50;
  id v51;
  id v52;
  MLCDeviceCPU *v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v53 = self;
  v56[2] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a9;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fusedPrimitiveParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v17, "fusedPrimitiveParams");
  else
    objc_msgSend(v17, "params");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  v21 = objc_msgSend(v20, "bytes");
  v56[0] = 0;
  v56[1] = 0;
  v55[0] = 0;
  v55[1] = 0;
  if (v14 && objc_msgSend(v14, "isUpdatable"))
  {
    v56[0] = v21 + 352;
    objc_msgSend(v17, "betaDeltaData");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55[0] = objc_msgSend(v22, "bytes");

    v23 = 0;
    v24 = 1;
    if (!v15)
      goto LABEL_11;
  }
  else
  {
    v24 = 0;
    v23 = 1;
    if (!v15)
      goto LABEL_11;
  }
  if (objc_msgSend(v15, "isUpdatable"))
  {
    v51 = v20;
    v52 = v15;
    v49 = a2;
    v56[v24] = v21 + 528;
    objc_msgSend(v17, "gammaDeltaData");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55[v24] = objc_msgSend(v25, "bytes");

    v26 = v24 + 1;
    goto LABEL_13;
  }
LABEL_11:
  if ((v23 & 1) != 0)
    goto LABEL_33;
  v51 = v20;
  v52 = v15;
  v49 = a2;
  v26 = 1;
LABEL_13:
  v54 = v16;
  v27 = v13;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "accumulatorBufferCount");

  v50 = &v48;
  v30 = 8 * v29 * v26;
  v31 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v30 >= 0x200)
    v32 = 512;
  else
    v32 = 8 * v29 * v26;
  bzero((char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v32);
  bzero((char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v29 * v26);
  if (v26 == 2)
  {
    if (v29)
    {
      v33 = 0;
      v34 = v31 + 8;
      do
      {
        objc_msgSend(v17, "betaMomentumData");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v33);
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(v34 - 1) = objc_msgSend(v36, "bytes");

        objc_msgSend(v17, "gammaMomentumData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndexedSubscript:", v33);
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *v34 = objc_msgSend(v38, "bytes");
        v34 += 2;

        ++v33;
      }
      while (v29 != v33);
    }
  }
  else if (v29)
  {
    for (i = 0; i != v29; ++i)
    {
      if (objc_msgSend(v14, "isUpdatable"))
        objc_msgSend(v17, "betaMomentumData");
      else
        objc_msgSend(v17, "gammaMomentumData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", i);
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_QWORD *)&v31[8 * i] = objc_msgSend(v41, "bytes");

    }
  }
  v16 = v54;
  if (v54)
  {
    -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v53, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v56, v55, v31, v26, v54);
    v13 = v27;
    v20 = v51;
    v15 = v52;
  }
  else
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "function");
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "optimizerAlgFields");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = MEMORY[0x1D8263A50](v43, objc_msgSend(v45, "bytes"), v26, v56, v55, v31, 0);

    v13 = v27;
    v16 = v54;

    v20 = v51;
    v15 = v52;
    if (v46)
    {
      +[MLCLog framework](MLCLog, "framework");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateBatchNormalizationLayer:optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:].cold.1();

    }
  }
LABEL_33:

}

- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  float *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  float *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  float *v37;
  uint64_t v38;
  float v39;
  void *v40;
  unint64_t v41;
  id v42;

  v42 = a3;
  objc_msgSend(v42, "childLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
    goto LABEL_33;
  objc_msgSend(v42, "childLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deviceOps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v8, "weights");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {
    if (v12 == v42)
    {
      objc_msgSend(v10, "weightsDeltaData");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = (_QWORD *)objc_msgSend(v13, "bytes");

      v15 = v14[12];
      v16 = v14[4];
LABEL_8:
      v18 = v16 * v15;
      goto LABEL_9;
    }
  }
  else if (v12 == v42)
  {
    objc_msgSend(v10, "weightsDeltaData");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (_QWORD *)objc_msgSend(v19, "bytes");

    v15 = v14[10];
    v16 = v14[2];
    goto LABEL_8;
  }
  objc_msgSend(v10, "biasDeltaData");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (_QWORD *)objc_msgSend(v17, "bytes");

  v18 = v14[1];
LABEL_9:
  v20 = (float *)v14[17];
  objc_msgSend(v42, "childLayers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v23 = 0;
    while (1)
    {
      v24 = v8;
      objc_msgSend(v42, "childLayers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 == a4 || !objc_msgSend(v8, "isTrainable"))
        goto LABEL_30;
      objc_msgSend(v8, "deviceOps");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_29:
      v10 = v27;
LABEL_30:
      v36 = v42;
LABEL_31:
      ++v23;
      objc_msgSend(v36, "childLayers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (v23 >= v41)
        goto LABEL_32;
    }
    v28 = v8;
    if (v12 == v42)
    {
      objc_msgSend(v28, "weightsParameter");
      v29 = (float *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_24;
      objc_msgSend(v28, "weightsParameter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isUpdatable");

      if (v34)
      {
        objc_msgSend(v27, "weightsDeltaData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v28, "biasesParameter");
      v29 = (float *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_24;
      objc_msgSend(v28, "biasesParameter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isUpdatable");

      if (v31)
      {
        objc_msgSend(v27, "biasDeltaData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v35 = objc_retainAutorelease(v32);
        v29 = *(float **)(objc_msgSend(v35, "bytes") + 136);

        goto LABEL_24;
      }
    }
    v29 = 0;
LABEL_24:

    if (v29)
    {
      v36 = v42;
      if (v18)
      {
        v37 = v20;
        v38 = v18;
        do
        {
          v39 = *v29++;
          *v37 = v39 + *v37;
          ++v37;
          --v38;
        }
        while (v38);
      }
      v10 = v27;
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_32:

LABEL_33:
}

- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  float *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  float *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  float *v37;
  uint64_t v38;
  void *v39;
  float v40;
  void *v41;
  unint64_t v42;
  id v43;

  v5 = a5;
  v43 = a3;
  objc_msgSend(v43, "childLayers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 1)
  {
    objc_msgSend(v43, "childLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "deviceOps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v12, "betaDeltaData");
    else
      objc_msgSend(v12, "gammaDeltaData");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "bytes");

    v15 = *(_QWORD *)(v14 + 8);
    if (v15)
    {
      v16 = (uint64_t *)(v14 + 16);
      v17 = 1;
      v18 = v43;
      do
      {
        v17 *= v15;
        v19 = *v16++;
        v15 = v19;
      }
      while (v19);
    }
    else
    {
      v17 = 1;
      v18 = v43;
    }
    v20 = *(float **)(v14 + 136);
    objc_msgSend(v18, "childLayers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = 0;
      while (1)
      {
        v24 = v10;
        objc_msgSend(v43, "childLayers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == a4 || !objc_msgSend(v10, "isTrainable"))
          goto LABEL_33;
        objc_msgSend(v10, "deviceOps");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
LABEL_32:
        v12 = v27;
LABEL_33:
        v39 = v43;
LABEL_34:
        ++v23;
        objc_msgSend(v39, "childLayers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        if (v23 >= v42)
          goto LABEL_35;
      }
      v28 = v10;
      v29 = v28;
      if (v5)
      {
        objc_msgSend(v28, "betaParameter");
        v30 = (float *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v29, "betaParameter");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isUpdatable");

          if (v32)
          {
            objc_msgSend(v27, "betaDeltaData");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
            v36 = objc_retainAutorelease(v33);
            v30 = *(float **)(objc_msgSend(v36, "bytes") + 136);

            goto LABEL_27;
          }
          goto LABEL_26;
        }
      }
      else
      {
        objc_msgSend(v28, "gammaParameter");
        v30 = (float *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v29, "gammaParameter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isUpdatable");

          if (v35)
          {
            objc_msgSend(v27, "gammaDeltaData");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
LABEL_26:
          v30 = 0;
        }
      }
LABEL_27:

      if (v30 && v17)
      {
        v37 = v20;
        v38 = v17;
        v39 = v43;
        do
        {
          v40 = *v30++;
          *v37 = v40 + *v37;
          ++v37;
          --v38;
        }
        while (v38);
        v12 = v27;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
LABEL_35:

  }
}

- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  size_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t i;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  SEL v46;
  uint64_t v47;
  uint64_t *v48;
  id v49;
  MLCDeviceCPU *v50;
  id v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v50 = self;
  v53[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "params");
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v51, "bytes");
  v53[0] = 0;
  v53[1] = 0;
  v52[0] = 0;
  v52[1] = 0;
  v18 = objc_msgSend(v13, "isUpdatable");
  v19 = 0;
  if (v18)
  {
    v53[0] = v17 + 176;
    objc_msgSend(v16, "weightsDeltaData");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52[0] = objc_msgSend(v20, "bytes");

    v19 = 1;
  }
  if (v14 && objc_msgSend(v14, "isUpdatable"))
  {
    v46 = a2;
    v49 = v14;
    v53[v19] = v17 + 528;
    objc_msgSend(v16, "biasDeltaData");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52[v19] = objc_msgSend(v21, "bytes");

    v22 = v19 + 1;
  }
  else
  {
    if (!v18)
      goto LABEL_28;
    v46 = a2;
    v49 = v14;
    v22 = 1;
  }
  v23 = v12;
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "accumulatorBufferCount");

  v48 = &v45;
  v26 = 8 * v25 * v22;
  v27 = (char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v26 >= 0x200)
    v28 = 512;
  else
    v28 = 8 * v25 * v22;
  bzero((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  bzero((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v25 * v22);
  v47 = v22;
  if (v22 == 2)
  {
    if (v25)
    {
      v29 = 0;
      v30 = v27 + 8;
      do
      {
        objc_msgSend(v16, "weightsMomentumData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v29);
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(v30 - 1) = objc_msgSend(v32, "bytes");

        objc_msgSend(v16, "biasMomentumData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v29);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *v30 = objc_msgSend(v34, "bytes");
        v30 += 2;

        ++v29;
      }
      while (v25 != v29);
    }
  }
  else if (v25)
  {
    for (i = 0; i != v25; ++i)
    {
      if (objc_msgSend(v13, "isUpdatable"))
        objc_msgSend(v16, "weightsMomentumData");
      else
        objc_msgSend(v16, "biasMomentumData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", i);
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_QWORD *)&v27[8 * i] = objc_msgSend(v37, "bytes");

    }
  }
  if (v15)
  {
    -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v50, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v53, v52, v27, v47, v15);
    v12 = v23;
    v14 = v49;
  }
  else
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "function");
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "optimizerAlgFields");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "bytes");
    v43 = MEMORY[0x1D8263A50](v39, v42, v47, v53, v52, v27, 0);

    v12 = v23;
    v14 = v49;
    if (v43)
    {
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateFullyConnectedLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:].cold.1();

    }
  }
LABEL_28:

}

- ($ADD8B2928F54472B65CB84445603561F)getGateDesc:(SEL)a3 lstmParams:(unint64_t)a4
{
  $ADD8B2928F54472B65CB84445603561F *p_var11;
  $ADD8B2928F54472B65CB84445603561F *p_var13;
  $ADD8B2928F54472B65CB84445603561F *p_var12;

  p_var11 = &a5->var11;
  p_var13 = &a5->var13;
  if (!a4)
    p_var13 = &a5->var10;
  if (a4 != 1)
    p_var11 = p_var13;
  if (a4 == 2)
    p_var12 = &a5->var12;
  else
    p_var12 = p_var11;
  return ($ADD8B2928F54472B65CB84445603561F *)memcpy(retstr, p_var12, sizeof($ADD8B2928F54472B65CB84445603561F));
}

- (void)saveOrRestoreLSTMBiasesAndAccumulators:(id)a3 auxParameter:(id)a4 auxAccumulators:(id)a5 mlcIndex:(unint64_t)a6 auxIndex:(unint64_t)a7 saveParameter:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t count;
  unint64_t v37;
  id v38;
  uint64_t v39;

  v8 = a8;
  v13 = a3;
  v35 = a4;
  v38 = a5;
  objc_msgSend(v13, "params");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v34, "bytes");
  count = objc_msgSend(v13, "hiddenSize");
  v14 = objc_msgSend(v13, "biDirectional");
  v15 = objc_msgSend(v13, "numLayers");
  v16 = objc_msgSend(v13, "numAccumulatorsPerParameter");
  v17 = 4 * v15;
  if (v15 < 2)
  {
    v18 = 0;
  }
  else if ((objc_msgSend(v13, "biDirectional") & 1) != 0)
  {
    if (objc_msgSend(v13, "biDirectional"))
      v18 = (a6 - v17) >> 2;
    else
      v18 = 0;
  }
  else
  {
    v18 = a6 >> 2;
  }
  v37 = a6 & 3;
  -[MLCDeviceCPU getGateDesc:lstmParams:](self, "getGateDesc:lstmParams:", a7);
  if (a6 >= v17)
    v19 = count;
  else
    v19 = 0;
  v20 = v19 + (v18 << v14) * count;
  v21 = v13;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), count, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v22);
    v23 = v32;
  }
  else
  {
    v23 = v32;
    objc_msgSend(v35, "objectAtIndexedSubscript:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = objc_retainAutorelease(v22);
  saveOrRestoreLSTMWeightsAndAccumulatorsHelper(v39, v20, (void *)objc_msgSend(v33, "bytes"), 4 * count, v8);
  if (v16)
  {
    v24 = v16 * v23;
    do
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(count, 4uLL, 0x100004052888210uLL), count, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v25);
      }
      else
      {
        objc_msgSend(v38, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "biasMomentumData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v37);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "bytes");

      v29 = *(_QWORD *)(v28 + 136);
      v30 = objc_retainAutorelease(v25);
      saveOrRestoreLSTMWeightsAndAccumulatorsHelper(v29, v20, (void *)objc_msgSend(v30, "bytes"), 4 * count, v8);

      ++v24;
      --v16;
    }
    while (v16);
  }

}

- (void)createBNNSDesc2DForLSTMWeights:(id)a3 tensorParameters:(id)a4 deviceOptimizers:(id)a5 isInputWeight:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  __int128 v24;
  unint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  int v64;
  _DWORD v65[2];
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _OWORD v85[58];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _DWORD v110[2];
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[32];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "params");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v57 = objc_msgSend(v12, "bytes");

  objc_msgSend(v9, "lstmDeltaParams");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v56 = objc_msgSend(v13, "bytes");

  v14 = objc_msgSend(v9, "numLayers");
  v59 = objc_msgSend(v9, "biDirectional");
  v48 = v11;
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "accumulatorBufferCount");

  v17 = v6;
  v49 = v10;
  v63 = objc_msgSend(v10, "count");
  v55 = objc_msgSend(v9, "inputSize");
  v54 = objc_msgSend(v9, "hiddenSize");
  if (v6)
  {
    objc_msgSend(v9, "bnnsDesc2DInputWeightParams");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bnnsDesc2DInputWeightGrads");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bnnsDesc2DInputWeightAccumulators");
  }
  else
  {
    objc_msgSend(v9, "bnnsDesc2DHiddenWeightParams");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bnnsDesc2DHiddenWeightGrads");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bnnsDesc2DHiddenWeightAccumulators");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count") && v16)
  {
    v19 = 0;
    v20 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(v18, "setObject:atIndexedSubscript:", v21, v19);

      ++v19;
    }
    while (v16 != v19);
  }
  v53 = v16;
  v60 = v18;
  v50 = v9;
  if ((v17 & 1) != 0)
    objc_msgSend(v9, "inputWeightsMomentumDescData");
  else
    objc_msgSend(v9, "hiddenWeightsMomentumDescData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v23 = 0;
    v52 = 4 * v14;
    v51 = v17 << 63 >> 63;
    v24 = 0uLL;
    v25 = 0x1E0C99000uLL;
    v64 = v17;
    do
    {
      v26 = v23 >= v52;
      v27 = v59 & v26;
      *(_OWORD *)v123 = v24;
      *(_OWORD *)&v123[16] = v24;
      if ((v59 & v26) != 0)
        v28 = v52;
      else
        v28 = 0;
      v29 = v23 - v28;
      v132 = v24;
      v30 = (v23 - v28) >> 2;
      v131 = v24;
      v130 = v24;
      v129 = v24;
      v128 = v24;
      v127 = v24;
      v126 = v24;
      v125 = v24;
      v124 = v24;
      LODWORD(v131) = 65568;
      v31 = (v23 - v28 < 4) & v17;
      v32 = v55;
      if (!v31)
        v32 = v54;
      *(_QWORD *)&v123[8] = v32;
      *(_QWORD *)&v123[16] = v54;
      *(_DWORD *)&v123[4] = 0x20000;
      v110[0] = v24;
      v113 = *((_QWORD *)&v24 + 1);
      v122 = v24;
      v121 = v24;
      v120 = v24;
      v119 = v24;
      v118 = v24;
      v117 = v24;
      v116 = v24;
      v115 = v24;
      v114 = v24;
      LODWORD(v121) = 65568;
      v111 = v32;
      v112 = v54;
      v110[1] = 0x20000;
      v33 = v23 & 3;
      v109 = v24;
      v108 = v24;
      v107 = v24;
      v106 = v24;
      v105 = v24;
      v104 = v24;
      v103 = v24;
      v102 = v24;
      v101 = v24;
      v100 = v24;
      v99 = v24;
      v98 = v24;
      v97 = v24;
      v96 = v24;
      v95 = v24;
      v94 = v24;
      v93 = v24;
      v92 = v24;
      v91 = v24;
      v90 = v24;
      v89 = v24;
      v88 = v24;
      v87 = v24;
      v86 = v24;
      v85[57] = v24;
      v85[56] = v24;
      v85[55] = v24;
      v85[54] = v24;
      v85[53] = v24;
      v85[52] = v24;
      v85[51] = v24;
      v85[50] = v24;
      -[MLCDeviceCPU getGateDesc:lstmParams:](self, "getGateDesc:lstmParams:", v33, v57);
      memset(v85, 0, 384);
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      -[MLCDeviceCPU getGateDesc:lstmParams:](self, "getGateDesc:lstmParams:", v33, v56);
      if (v31 == 1)
      {
        v34 = v30;
        v35 = (_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v27);
        v36 = (char *)v85 + 8;
        v37 = v27;
      }
      else if ((_DWORD)v17)
      {
        v34 = v30;
        v37 = ((v30 - 1) << v59) + v27;
        v35 = (_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * v37);
        v36 = (char *)&v85[11] + 8;
      }
      else
      {
        v34 = v30;
        v37 = (v30 << v59) + v27;
        v35 = (_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v37);
        v36 = (char *)&v85[22] + 8;
      }
      *((_QWORD *)&v130 + 1) = *v35;
      *((_QWORD *)&v120 + 1) = *(_QWORD *)(*(_QWORD *)v36 + 8 * v37);
      objc_msgSend(*(id *)(v25 + 3408), "dataWithBytes:length:", v123, 176);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setObject:atIndexedSubscript:", v38, v23);

      objc_msgSend(*(id *)(v25 + 3408), "dataWithBytes:length:", v110, 176);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:atIndexedSubscript:", v39, v23);

      v24 = 0uLL;
      if (v53)
      {
        v40 = 0;
        if ((v64 & (v29 > 3)) != 0)
          v33 |= 4uLL;
        v41 = (v34 + v51) << v59;
        if ((v31 & 1) != 0)
          v41 = 0;
        v42 = v41 + v27;
        do
        {
          v65[0] = v24;
          v67 = *((_QWORD *)&v24 + 1);
          v75 = v24;
          v76 = v24;
          v73 = v24;
          v74 = v24;
          v71 = v24;
          v72 = v24;
          v69 = v24;
          v70 = v24;
          v68 = v24;
          LODWORD(v75) = 65568;
          v66 = *(_OWORD *)&v123[8];
          v65[1] = 0x20000;
          objc_msgSend(v22, "objectAtIndexedSubscript:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndexedSubscript:", v33);
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = objc_msgSend(v44, "bytes");

          *((_QWORD *)&v74 + 1) = *(_QWORD *)(*(_QWORD *)(v45 + 136) + 8 * v42);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v65, 176);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", v40);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:atIndexedSubscript:", v46, v23);

          v24 = 0uLL;
          ++v40;
        }
        while (v53 != v40);
      }
      ++v23;
      LODWORD(v17) = v64;
      v25 = 0x1E0C99000;
    }
    while (v23 != v63);
  }

}

- (void)optimizerStepForSingleParameterLSTM:(id)a3 tensorParameters:(id)a4 parameterForGateDesc:(id *)a5 gradientsForGateDesc:(id *)a6 parameterMomentumDescData:(id)a7 gateIndex:(unint64_t)a8 deviceOptimizers:(id)a9 isStackedInputWeight:(BOOL)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  int v36;
  uint64_t v37;
  id v38;
  unint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  unsigned int v53;
  NSObject *v54;
  uint64_t v55;
  id v56;
  __int128 v57;
  uint64_t v58;
  _BOOL8 v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  $22A621540F3C52AEBEBEF3416F2F9BEF *v64;
  id v65;
  unint64_t v66;
  $22A621540F3C52AEBEBEF3416F2F9BEF *v67;
  id v68;
  id v69;
  uint64_t v70;
  char *v71;
  unsigned int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[9];
  __int128 v101;
  __int128 v102;
  _QWORD *v103;
  _QWORD v104[3];

  v67 = a6;
  v104[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v18 = objc_msgSend(v14, "numLayers");
  v56 = v14;
  v72 = objc_msgSend(v14, "biDirectional");
  v69 = v17;
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "accumulatorBufferCount");

  v55 = (uint64_t)&v55;
  v89 = 0u;
  v90 = 0u;
  v93 = 0u;
  v94 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v95 = 0u;
  v91 = 0u;
  v92 = 0u;
  DWORD1(v89) = 0x20000;
  v21 = a5->var2[1];
  *((_QWORD *)&v89 + 1) = a5->var2[0];
  *(_QWORD *)&v90 = v21;
  v22 = a5->var3[1];
  *((_QWORD *)&v93 + 1) = a5->var3[0];
  *(_QWORD *)&v94 = v22;
  v104[0] = &v89;
  LODWORD(v98) = a5->var5;
  v77[0] = 0x2000000000000;
  v78 = 0u;
  v81 = 0;
  v83 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v84 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77[1] = *((_QWORD *)&v89 + 1);
  *(_QWORD *)&v78 = v21;
  v82 = *((_QWORD *)&v93 + 1);
  *(_QWORD *)&v83 = v22;
  LODWORD(v87) = v98;
  v103 = v77;
  if ((unint64_t)(8 * v20) >= 0x200)
    v23 = 512;
  else
    v23 = 8 * v20;
  bzero((char *)&v55 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
  v71 = (char *)&v55 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v71, 8 * v20);
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy", v55);
  v26 = v20;
  if (v20)
  {
    v27 = 0;
    do
    {
      memset(v100, 0, sizeof(v100));
      v101 = 0u;
      v102 = 0u;
      LODWORD(v101) = a5->var5;
      *(_OWORD *)((char *)v100 + 8) = *(_OWORD *)a5->var2;
      DWORD1(v100[0]) = 0x20000;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v100, 176);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:atIndexedSubscript:", v28, v27);

      objc_msgSend(v24, "objectAtIndexedSubscript:", v27);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "bytes");
      *(_QWORD *)&v71[8 * v27] = v30;

      ++v27;
    }
    while (v26 != v27);
  }
  v68 = v24;
  v75 = v26;
  v60 = a5->var2[3];
  if (v60)
  {
    v31 = 0;
    v58 = v72;
    v59 = a10;
    v32 = a8 + 4;
    if (!a10)
      v32 = a8;
    v62 = v32;
    *(_QWORD *)&v25 = 67109120;
    v57 = v25;
    v65 = v15;
    v66 = a8;
    v63 = v18;
    v64 = a5;
    do
    {
      v33 = 0;
      v73 = v31 + v59;
      v61 = v31;
      v70 = v31 << v58;
      v34 = 1;
      do
      {
        v74 = v34;
        objc_msgSend(v15, "objectAtIndexedSubscript:", a8 + 4 * (v73 + v33 * v18));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isUpdatable");

        if (v36)
        {
          v37 = v33 + v70;
          *((_QWORD *)&v97 + 1) = *((_QWORD *)a5->var4 + v33 + v70);
          v38 = v68;
          *((_QWORD *)&v86 + 1) = *((_QWORD *)v67->var4 + v37);
          v39 = v62;
          if (v75)
          {
            for (i = 0; i != v75; ++i)
            {
              objc_msgSend(v38, "objectAtIndexedSubscript:", i);
              v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v76 = objc_msgSend(v41, "bytes");
              objc_msgSend(v16, "objectAtIndexedSubscript:", i);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectAtIndexedSubscript:", v39);
              v43 = v37;
              v44 = v16;
              v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v46 = objc_msgSend(v45, "bytes");

              v16 = v44;
              v37 = v43;

              *(_QWORD *)(v76 + 136) = *(_QWORD *)(*(_QWORD *)(v46 + 136) + 8 * v43);
            }
          }
          v47 = v69;
          objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "function");
          objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "optimizerAlgFields");
          v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v52 = objc_msgSend(v51, "bytes");
          v53 = MEMORY[0x1D8263A50](v49, v52, 1, v104, &v103, v71, 0);

          v15 = v65;
          a8 = v66;
          v18 = v63;
          a5 = v64;
          if (v53)
          {
            +[MLCLog framework](MLCLog, "framework");
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_QWORD *)&v100[0] = __PAIR64__(v53, v57);
              _os_log_error_impl(&dword_1D4999000, v54, OS_LOG_TYPE_ERROR, "Optimizer update for LSTM with BNNS failed:%d", (uint8_t *)v100, 8u);
            }

          }
        }
        v33 = 1;
        v34 = 0;
      }
      while ((v72 & v74 & 1) != 0);
      v31 = v61 + 1;
    }
    while (v61 + 1 != v60);
  }

}

- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  unsigned int v26;
  unint64_t v27;
  void *v28;
  unsigned int v29;
  id v30;
  int v31;
  unint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  unint64_t v37;
  char *v38;
  size_t v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  unint64_t v49;
  void *v50;
  int v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  size_t v64;
  char *v65;
  size_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  id v74;
  unint64_t v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  id v80;
  int v81;
  void *v82;
  id v83;
  char *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  NSObject *v97;
  SEL v98;
  char *v99;
  char *v100;
  SEL *v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  MLCDeviceCPU *v106;
  id v107;
  uint64_t v108;
  int v109;
  id v110;
  uint64_t v111;

  v98 = a2;
  v111 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v98);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "params");
  v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v108 = objc_msgSend(v104, "bytes");
  objc_msgSend(v19, "lstmDeltaParams");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v103 = objc_msgSend(v20, "bytes");

  objc_msgSend(v19, "auxBiasTerms");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

  objc_msgSend(v19, "auxBiasTermsAccumulators");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeAllObjects");

  -[MLCDeviceCPU createBNNSDesc2DForLSTMWeights:tensorParameters:deviceOptimizers:isInputWeight:](self, "createBNNSDesc2DForLSTMWeights:tensorParameters:deviceOptimizers:isInputWeight:", v19, v15, v14, 1);
  v105 = v14;
  v106 = self;
  -[MLCDeviceCPU createBNNSDesc2DForLSTMWeights:tensorParameters:deviceOptimizers:isInputWeight:](self, "createBNNSDesc2DForLSTMWeights:tensorParameters:deviceOptimizers:isInputWeight:", v19, v16, v14, 0);
  v23 = 0;
  if (objc_msgSend(v15, "count"))
  {
    v24 = 0;
    do
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isUpdatable");

      v23 += v26;
      ++v24;
    }
    while (v24 < objc_msgSend(v15, "count"));
  }
  if (objc_msgSend(v16, "count"))
  {
    v27 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isUpdatable");

      v23 += v29;
      ++v27;
    }
    while (v27 < objc_msgSend(v16, "count"));
  }
  if (v17)
    v109 = objc_msgSend(v17, "count") != 0;
  else
    v109 = 0;
  v107 = v17;
  v110 = v19;
  if (objc_msgSend(v19, "hasBias"))
  {
    v30 = v18;
    v31 = 0;
    if (objc_msgSend(v17, "count"))
    {
      v32 = 0;
      v17 = v107;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isUpdatable");

        if ((v34 & 1) == 0)
        {
          objc_msgSend(v110, "auxBiasTerms");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "auxBiasTermsAccumulators");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCDeviceCPU saveOrRestoreLSTMBiasesAndAccumulators:auxParameter:auxAccumulators:mlcIndex:auxIndex:saveParameter:](v106, "saveOrRestoreLSTMBiasesAndAccumulators:auxParameter:auxAccumulators:mlcIndex:auxIndex:saveParameter:", v110, v35, v36, v32, 0, 1);

        }
        v31 |= v34;
        ++v32;
        v17 = v107;
      }
      while (v32 < objc_msgSend(v107, "count"));
    }
    else
    {
      v17 = v107;
    }
    v109 &= v31;
    if (v109)
      v23 += 4;
    v18 = v30;
    v19 = v110;
  }
  if (v23)
  {
    v101 = &v98;
    v102 = v18;
    v37 = (8 * v23 + 15) & 0xFFFFFFFFFFFFFFF0;
    v38 = (char *)&v98 - v37;
    if ((unint64_t)(8 * v23) >= 0x200)
      v39 = 512;
    else
      v39 = 8 * v23;
    bzero((char *)&v98 - v37, v39);
    bzero((char *)&v98 - v37, 8 * v23);
    v40 = (char *)&v98 - v37;
    bzero((char *)&v98 - v37, v39);
    bzero((char *)&v98 - v37, 8 * v23);
    if (objc_msgSend(v15, "count"))
    {
      v41 = 0;
      v42 = 0;
      do
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isUpdatable");

        if (v44)
        {
          objc_msgSend(v19, "bnnsDesc2DInputWeightParams");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectAtIndexedSubscript:", v41);
          v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_QWORD *)&v38[8 * v42] = objc_msgSend(v46, "bytes");

          objc_msgSend(v19, "bnnsDesc2DInputWeightGrads");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectAtIndexedSubscript:", v41);
          v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_QWORD *)&v40[8 * v42] = objc_msgSend(v48, "bytes");

          ++v42;
        }
        ++v41;
      }
      while (v41 < objc_msgSend(v15, "count"));
    }
    else
    {
      v42 = 0;
    }
    if (objc_msgSend(v16, "count"))
    {
      v49 = 0;
      do
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "isUpdatable");

        if (v51)
        {
          objc_msgSend(v19, "bnnsDesc2DHiddenWeightParams");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectAtIndexedSubscript:", v49);
          v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_QWORD *)&v38[8 * v42] = objc_msgSend(v53, "bytes");

          objc_msgSend(v19, "bnnsDesc2DHiddenWeightGrads");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", v49);
          v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_QWORD *)&v40[8 * v42] = objc_msgSend(v55, "bytes");

          ++v42;
        }
        ++v49;
      }
      while (v49 < objc_msgSend(v16, "count"));
    }
    v56 = objc_msgSend(v19, "hasBias");
    if ((v56 & v109 & 1) != 0)
    {
      v57 = v108;
      *(_QWORD *)&v38[8 * v42] = v108 + 1984;
      v58 = 8 * v42 + 8;
      *(_QWORD *)&v38[v58] = v57 + 2912;
      v59 = 8 * v42 + 16;
      *(_QWORD *)&v38[v59] = v57 + 3840;
      v60 = 8 * v42 + 24;
      *(_QWORD *)&v38[v60] = v57 + 4768;
      v61 = v103;
      *(_QWORD *)&v40[8 * v42] = v103 + 1984;
      *(_QWORD *)&v40[v58] = v61 + 2912;
      *(_QWORD *)&v40[v59] = v61 + 3840;
      *(_QWORD *)&v40[v60] = v61 + 4768;
    }
    v99 = v40;
    v100 = v38;
    objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "accumulatorBufferCount");

    v103 = v23;
    v64 = 8 * v63 * v23;
    v65 = (char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v64 >= 0x200)
      v66 = 512;
    else
      v66 = v64;
    bzero((char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), v66);
    bzero((char *)&v98 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0), v64);
    v108 = v63;
    if (v63)
    {
      v67 = 0;
      v68 = 0;
      do
      {
        if (objc_msgSend(v15, "count"))
        {
          v69 = 0;
          do
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "isUpdatable");

            if (v71)
            {
              objc_msgSend(v19, "bnnsDesc2DInputWeightAccumulators");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "objectAtIndexedSubscript:", v67);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "objectAtIndexedSubscript:", v69);
              v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *(_QWORD *)&v65[8 * v68] = objc_msgSend(v74, "bytes");

              ++v68;
              v19 = v110;
            }
            ++v69;
          }
          while (v69 < objc_msgSend(v15, "count"));
        }
        if (objc_msgSend(v16, "count"))
        {
          v75 = 0;
          do
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "isUpdatable");

            if (v77)
            {
              objc_msgSend(v19, "bnnsDesc2DHiddenWeightAccumulators");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectAtIndexedSubscript:", v67);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "objectAtIndexedSubscript:", v75);
              v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *(_QWORD *)&v65[8 * v68] = objc_msgSend(v80, "bytes");

              ++v68;
              v19 = v110;
            }
            ++v75;
          }
          while (v75 < objc_msgSend(v16, "count"));
        }
        v81 = objc_msgSend(v19, "hasBias");
        if ((v81 & v109 & 1) != 0)
        {
          objc_msgSend(v19, "biasMomentumData");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectAtIndexedSubscript:", 4 * v67);
          v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v84 = &v65[8 * v68];
          *(_QWORD *)v84 = objc_msgSend(v83, "bytes");

          objc_msgSend(v19, "biasMomentumData");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectAtIndexedSubscript:", (4 * v67) | 1);
          v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *((_QWORD *)v84 + 1) = objc_msgSend(v86, "bytes");

          objc_msgSend(v19, "biasMomentumData");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "objectAtIndexedSubscript:", (4 * v67) | 2);
          v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *((_QWORD *)v84 + 2) = objc_msgSend(v88, "bytes");

          objc_msgSend(v19, "biasMomentumData");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "objectAtIndexedSubscript:", (4 * v67) | 3);
          v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v68 += 4;
          *((_QWORD *)v84 + 3) = objc_msgSend(v90, "bytes");

        }
        ++v67;
      }
      while (v67 != v108);
    }
    v18 = v102;
    if (v102)
    {
      -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v106, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v100, v99, v65, v103, v102);
      v17 = v107;
    }
    else
    {
      v91 = v105;
      objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "function");
      objc_msgSend(v91, "objectAtIndexedSubscript:", 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "optimizerAlgFields");
      v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v96 = objc_msgSend(v95, "bytes");
      LODWORD(v93) = MEMORY[0x1D8263A50](v93, v96, v103, v100, v99, v65, 0);

      v17 = v107;
      if ((_DWORD)v93)
      {
        +[MLCLog framework](MLCLog, "framework");
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateRNNLayer:optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:].cold.1();

      }
    }
  }

}

- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unsigned int v20;
  unint64_t v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  _QWORD *v25;
  size_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  size_t v30;
  unint64_t v31;
  char *v32;
  size_t v33;
  _QWORD *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  id v52;
  int v53;
  uint64_t v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  int v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  void *v68;
  int v69;
  void *v70;
  id v71;
  void *v72;
  int v73;
  void *v74;
  id v75;
  void *v76;
  int v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  id v102;
  uint64_t v103;
  void *v104;
  unint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  uint64_t v110;
  NSObject *v111;
  SEL v112;
  uint64_t v113;
  SEL *v114;
  uint64_t v115;
  id v116;
  id v117;
  id v118;
  MLCDeviceCPU *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;

  v112 = a2;
  v119 = self;
  v123 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0, v112);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "params");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v120 = objc_msgSend(v16, "bytes");
  v17 = 0;
  if (objc_msgSend(v12, "count"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isUpdatable");

      v17 += v20;
      ++v18;
    }
    while (v18 < objc_msgSend(v12, "count"));
  }
  if (v13 && objc_msgSend(v13, "count"))
  {
    v21 = 0;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isUpdatable");

      v17 += v23;
      ++v21;
    }
    while (v21 < objc_msgSend(v13, "count"));
  }
  if (v17)
  {
    v116 = v16;
    v117 = v14;
    v114 = &v112;
    v24 = (8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0;
    v25 = (SEL *)((char *)&v112 - v24);
    if ((unint64_t)(8 * v17) >= 0x200)
      v26 = 512;
    else
      v26 = 8 * v17;
    bzero((char *)&v112 - v24, v26);
    bzero((char *)&v112 - v24, 8 * v17);
    v27 = (char *)&v112 - v24;
    bzero(v27, v26);
    bzero(v27, 8 * v17);
    v118 = v11;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "accumulatorBufferCount");

    v121 = v29;
    v30 = 8 * v29 * v17;
    v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
    v32 = (char *)&v112 - v31;
    if (v30 >= 0x200)
      v33 = 512;
    else
      v33 = v30;
    v34 = v27;
    bzero((char *)&v112 - v31, v33);
    v122 = v32;
    bzero(v32, v30);
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isUpdatable");

    v37 = 0;
    v38 = v120;
    if (v36)
    {
      *v25 = v120 + 176;
      objc_msgSend(v15, "inDeltaData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *v34 = objc_msgSend(v40, "bytes") + 176;

      v37 = 1;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isUpdatable");

    if (v42)
    {
      v25[v37] = v38 + 704;
      objc_msgSend(v15, "inDeltaData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 1);
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34[v37] = objc_msgSend(v44, "bytes") + 176;

      ++v37;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isUpdatable");

    if (v46)
    {
      v25[v37] = v38 + 1232;
      objc_msgSend(v15, "inDeltaData");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectAtIndexedSubscript:", 2);
      v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34[v37] = objc_msgSend(v48, "bytes") + 176;

      ++v37;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isUpdatable");

    if (v50)
    {
      v25[v37] = v38 + 2120;
      objc_msgSend(v15, "outDeltaData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34[v37] = objc_msgSend(v52, "bytes") + 176;

      ++v37;
    }
    v53 = objc_msgSend(v15, "hasBias");
    v54 = 4;
    if (!v53)
      v54 = 0;
    v113 = v54;
    v55 = objc_msgSend(v15, "hasBias");
    v115 = v17;
    if (v55)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isUpdatable");

      if (v57)
      {
        v25[v37] = v38 + 352;
        objc_msgSend(v15, "inDeltaData");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
        v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v59, "bytes") + 352;

        ++v37;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isUpdatable");

      if (v61)
      {
        v25[v37] = v38 + 880;
        objc_msgSend(v15, "inDeltaData");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v63, "bytes") + 352;

        ++v37;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isUpdatable");

      if (v65)
      {
        v25[v37] = v38 + 1408;
        objc_msgSend(v15, "inDeltaData");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectAtIndexedSubscript:", 2);
        v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v67, "bytes") + 352;

        ++v37;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "isUpdatable");

      if (v69)
      {
        v25[v37] = v38 + 2296;
        objc_msgSend(v15, "outDeltaData");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
        v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v71, "bytes") + 352;

        ++v37;
      }
    }
    if (objc_msgSend(v15, "hasAttnBias"))
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v113);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "isUpdatable");

      if (v73)
      {
        v25[v37] = v38 + 1592;
        objc_msgSend(v15, "attnBiasDeltaData");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
        v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v75, "bytes");

        ++v37;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", v113 | 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "isUpdatable");

      if (v77)
      {
        v25[v37] = v38 + 1768;
        objc_msgSend(v15, "attnBiasDeltaData");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectAtIndexedSubscript:", 1);
        v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34[v37] = objc_msgSend(v79, "bytes");

      }
    }
    v113 = (uint64_t)v34;
    v120 = (uint64_t)v25;
    if (v121)
    {
      v80 = 0;
      v81 = 0;
      v82 = v12;
      do
      {
        v83 = v13;
        objc_msgSend(v15, "weightsMomentumDeltaDataArray");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "count");

        if (v85)
        {
          v86 = 0;
          do
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "isUpdatable");

            if (v88)
            {
              objc_msgSend(v15, "weightsMomentumDeltaDataArray");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "objectAtIndexedSubscript:", v86);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectAtIndexedSubscript:", v80);
              v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v92 = objc_msgSend(v91, "bytes");
              *(_QWORD *)&v122[8 * v81] = v92;

              ++v81;
              v12 = v82;
            }
            ++v86;
            objc_msgSend(v15, "weightsMomentumDeltaDataArray");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v93, "count");

          }
          while (v86 < v94);
        }
        objc_msgSend(v15, "biasMomentumDeltaDataArray");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "count");

        if (v96)
        {
          v97 = 0;
          v13 = v83;
          do
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "isUpdatable");

            if (v99)
            {
              objc_msgSend(v15, "biasMomentumDeltaDataArray");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "objectAtIndexedSubscript:", v97);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "objectAtIndexedSubscript:", v80);
              v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v103 = objc_msgSend(v102, "bytes");
              *(_QWORD *)&v122[8 * v81] = v103;

              v13 = v83;
              ++v81;
              v12 = v82;
            }
            ++v97;
            objc_msgSend(v15, "biasMomentumDeltaDataArray");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v104, "count");

          }
          while (v97 < v105);
        }
        else
        {
          v13 = v83;
        }
        ++v80;
      }
      while (v80 != v121);
    }
    v14 = v117;
    if (v117)
    {
      -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v119, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v120, v113, v122, v115, v117);
      v11 = v118;
    }
    else
    {
      v11 = v118;
      objc_msgSend(v118, "objectAtIndexedSubscript:", 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v106, "function");
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "optimizerAlgFields");
      v109 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v110 = objc_msgSend(v109, "bytes");
      LODWORD(v107) = MEMORY[0x1D8263A50](v107, v110, v115, v120, v113, v122, 0);

      if ((_DWORD)v107)
      {
        +[MLCLog framework](MLCLog, "framework");
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:].cold.1();

      }
    }
    v16 = v116;
  }

}

- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  size_t v20;
  char *v21;
  size_t v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  vDSP_Length v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  const float *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  MLCDeviceCPU *v56;
  uint64_t v57;
  char *v58;
  id v59;
  uint64_t *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v12, "isUpdatable"))
  {
    v56 = self;
    v62 = v14;
    v65 = v11;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v12;
    objc_msgSend(v12, "tensor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "params");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v67[0] = objc_msgSend(v17, "bytes");

    v63 = v13;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "accumulatorBufferCount");

    v60 = &v55;
    v57 = v19;
    v20 = 8 * v19;
    v21 = (char *)&v55 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v20 >= 0x200)
      v22 = 512;
    else
      v22 = v20;
    bzero(v21, v22);
    v58 = v21;
    bzero(v21, v20);
    objc_msgSend(v15, "source");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = (uint64_t *)objc_msgSend(v23, "bytes");
    v59 = v23;
    v25 = objc_msgSend(v23, "length");
    v26 = v25 >> 3;
    objc_msgSend(v16, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v29, "dimensionCount") - 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    objc_msgSend(v15, "weightsDeltaData");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = *(void **)(objc_msgSend(v32, "bytes") + 136);

    v61 = v16;
    objc_msgSend(v16, "descriptor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    bzero(v33, objc_msgSend(v34, "tensorAllocationSizeInBytes"));

    objc_msgSend(v15, "weightsDeltaDataBytes");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = (const float *)objc_msgSend(v35, "bytes");

    objc_msgSend(v15, "paddingIndex");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      if (v25 >= 8)
      {
        if (v26 <= 1)
          v38 = 1;
        else
          v38 = v25 >> 3;
        do
        {
          objc_msgSend(v15, "paddingIndex");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "longLongValue");
          v41 = *v24;

          if (v40 != v41)
            vDSP_vadd((const float *)v33 + *v24 * v31, 1, v36, 1, (float *)v33 + *v24 * v31, 1, v31);
          ++v24;
          v36 += v31;
          --v38;
        }
        while (v38);
      }
    }
    else if (v25 >= 8)
    {
      if (v26 <= 1)
        v42 = 1;
      else
        v42 = v25 >> 3;
      do
      {
        v43 = *v24++;
        vDSP_vadd((const float *)v33 + v43 * v31, 1, v36, 1, (float *)v33 + v43 * v31, 1, v31);
        v36 += v31;
        --v42;
      }
      while (v42);
    }
    objc_msgSend(v15, "weightsDeltaData");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v66 = objc_msgSend(v44, "bytes");

    v45 = v57;
    v46 = v58;
    if (v57)
    {
      v47 = 0;
      do
      {
        objc_msgSend(v15, "weightsMomentumData");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", v47);
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_QWORD *)&v46[8 * v47] = objc_msgSend(v49, "bytes");

        ++v47;
      }
      while (v45 != v47);
    }
    v14 = v62;
    v13 = v63;
    if (v62)
    {
      -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v56, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v67, &v66, v46, 1, v62);
      v12 = v64;
      v11 = v65;
    }
    else
    {
      objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "function");
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "optimizerAlgFields");
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(v51) = MEMORY[0x1D8263A50](v51, objc_msgSend(v53, "bytes"), 1, v67, &v66, v46, 0);

      v12 = v64;
      v11 = v65;
      if ((_DWORD)v51)
      {
        +[MLCLog framework](MLCLog, "framework");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateMultiheadAttentionLayer:optimizer:weightsParameter:biasesParameter:arrayOfParams:].cold.1();

      }
    }

  }
}

- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = objc_msgSend(v7, "bytes");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend(v8, "bytes");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend(v9, "bytes");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = *(_QWORD *)objc_msgSend(v10, "bytes");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = *(_QWORD *)objc_msgSend(v12, "bytes");

  if (v11 != v13)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "accumulatorBufferCount");

    if (v15 >= 2)
    {
      v16 = 8 * v11;
      v17 = (char *)(v31 + 8 * v11);
      v18 = 1;
      v19 = (char *)(v31 + 8 * v13);
      do
      {
        memmove(v19, v17, 8 * v13);
        ++v18;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "accumulatorBufferCount");

        v17 += v16;
        v19 += 8 * v13;
      }
      while (v18 < v21);
    }
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0, a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "function");
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "optimizerAlgFields");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(v23) = MEMORY[0x1D8263A50](v23, objc_msgSend(v25, "bytes"), v13, v30, v29, v31, 0);

  if ((_DWORD)v23)
  {
    +[MLCLog framework](MLCLog, "framework");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateAllParametersWithOptimizer:arrayOfParameters:].cold.1();

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_QWORD *)objc_msgSend(v27, "bytes") = 0;

}

- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  size_t v29;
  uint64_t i;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  MLCDeviceCPU *v40;
  uint64_t *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "isUpdatable"))
  {
    v40 = self;
    objc_msgSend(v11, "tensor", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "optimizerDeviceData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "tensor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deviceMemory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v19;
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceMemory");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sourceBNNSDesc");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "bytes");

    objc_msgSend(v17, "gradientBNNSDesc");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v24, "bytes");

    v43 = objc_retainAutorelease(v20);
    *(_QWORD *)(v23 + 136) = objc_msgSend(v43, "bytes");
    v42 = objc_retainAutorelease(v21);
    *(_QWORD *)(v25 + 136) = objc_msgSend(v42, "bytes");
    v46 = v25;
    v47[0] = v23;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "accumulatorBufferCount");

    v41 = &v39;
    v28 = (char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    if ((unint64_t)(8 * v27) >= 0x200)
      v29 = 512;
    else
      v29 = 8 * v27;
    bzero((char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
    bzero((char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v27);
    if (v27)
    {
      for (i = 0; i != v27; ++i)
      {
        objc_msgSend(v17, "momentumData");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", i);
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_QWORD *)&v28[8 * i] = objc_msgSend(v32, "bytes");

      }
    }
    if (v14)
    {
      -[MLCDeviceCPU accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:](v40, "accumulateParams:gradients:accumulators:numOfParameters:inArrayOfParams:", v47, &v46, (char *)&v39 - ((8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v14);
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "function");
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "optimizerAlgFields");
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v37 = MEMORY[0x1D8263A50](v34, objc_msgSend(v36, "bytes"), 1, v47, &v46, v28, 0);

      if (v37)
      {
        +[MLCLog framework](MLCLog, "framework");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) updateTensorParameter:optimizer:gradient:arrayOfParams:].cold.1();

      }
    }

  }
}

- (void)copyBiasFromBNNSToMLCTensor:(id)a3 biasTensors:(id)a4 baseGateIndex:(unint64_t)a5 lstmDescriptor:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  id v22;
  id v23;

  v19 = a3;
  v23 = a4;
  v9 = a6;
  v10 = objc_msgSend(v9, "layerCount");
  v11 = objc_msgSend(v9, "hiddenSize");
  v21 = objc_msgSend(v9, "isBidirectional");
  objc_msgSend(v19, "objectAtIndexedSubscript:", a5);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = 0;
    v20 = 4 * v10;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "data");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (void *)objc_msgSend(v14, "bytes");
      v16 = objc_retainAutorelease(v22);
      memcpy(v15, (const void *)(objc_msgSend(v16, "bytes") + 4 * (v12 << v21)), 4 * v11);

      if (v21)
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", v20 + a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "data");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        memcpy((void *)objc_msgSend(v18, "bytes"), (const void *)(objc_msgSend(objc_retainAutorelease(v16), "bytes") + 4 * ((v12 << v21) + v11)), 4 * v11);

      }
      a5 += 4;
      v12 += v11;
      --v10;
    }
    while (v10);
  }

}

- (void)synchronizeUpdatesForLayer:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v23;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v23;
    objc_msgSend(v6, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isBidirectional"))
    {

    }
    else
    {
      objc_msgSend(v6, "descriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "layerCount");

      if (v9 < 2)
      {
LABEL_8:

        v5 = v23;
        goto LABEL_9;
      }
    }
    objc_msgSend(v6, "deviceOps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "combinedGateWeightsAndBias");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "usesBiases");

    if (v14)
    {
      objc_msgSend(v6, "biases");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:](self, "copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:", v12, v15, 0, v16);

      objc_msgSend(v6, "biases");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:](self, "copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:", v12, v17, 1, v18);

      objc_msgSend(v6, "biases");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:](self, "copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:", v12, v19, 2, v20);

      objc_msgSend(v6, "biases");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCDeviceCPU copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:](self, "copyBiasFromBNNSToMLCTensor:biasTensors:baseGateIndex:lstmDescriptor:", v12, v21, 3, v22);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)exportBiasGateOptimizerDataForDeviceOps:(id)a3 biasTensors:(id)a4 gateIndex:(unint64_t)a5 optimizerDataIndex:(unint64_t)a6
{
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  size_t v22;
  id v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;

  v31 = a3;
  v9 = a4;
  v10 = objc_msgSend(v31, "numLayers");
  v11 = objc_msgSend(v31, "biDirectional");
  v12 = objc_msgSend(v31, "hiddenSize");
  objc_msgSend(v31, "biasMomentumData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a5 + 4 * a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_retainAutorelease(v14);
  v35 = objc_msgSend(v30, "bytes");
  if (v10)
  {
    v15 = v12;
    v16 = 0;
    v17 = 0;
    v18 = 4 * v15;
    v34 = v11;
    v32 = v10;
    v33 = v15;
    do
    {
      v19 = 0;
      v20 = 4 * v17;
      v21 = 1;
      v36 = v16;
      do
      {
        v22 = v18;
        objc_msgSend(v9, "objectAtIndexedSubscript:", a5 + 4 * (v16 + v19 * v10));
        v23 = v9;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "optimizerData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", a6);
        v26 = a5;
        v27 = a6;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        memcpy((void *)objc_msgSend(v28, "bytes"), (const void *)(*(_QWORD *)(v35 + 136) + v20), v22);

        a6 = v27;
        a5 = v26;

        v18 = v22;
        v16 = v36;
        v9 = v23;
        v10 = v32;
        v17 += v33;
        v29 = v34 & v21;
        v20 += v22;
        v19 = 1;
        v21 = 0;
      }
      while ((v29 & 1) != 0);
      v16 = v36 + 1;
    }
    while (v36 + 1 != v32);
  }

}

- (void)convertUpdatesToTensorDataForLayer:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v15;
    objc_msgSend(v6, "deviceOps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "biases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "optimizerData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        for (i = 0; i != v13; ++i)
        {
          -[MLCDeviceCPU exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:](self, "exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:", v8, v10, 0, i);
          -[MLCDeviceCPU exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:](self, "exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:", v8, v10, 1, i);
          -[MLCDeviceCPU exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:](self, "exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:", v8, v10, 2, i);
          -[MLCDeviceCPU exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:](self, "exportBiasGateOptimizerDataForDeviceOps:biasTensors:gateIndex:optimizerDataIndex:", v8, v10, 3, i);
        }
      }
    }

    v5 = v15;
  }

}

- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optimizerAlgFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  *(float *)objc_msgSend(v7, "bytes") = a4;

}

- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optimizerAlgFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  *(float *)(objc_msgSend(v7, "bytes") + 12) = (float)a4;

}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  id v39;

  v3 = a3;
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(v6, "biases");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(v6, "biases"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7 = 0,
          v9))
    {
      while (1)
      {
        objc_msgSend(v6, "biases");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v11 == v3;
        if (v11 == v3)
          break;
        ++v7;
        objc_msgSend(v6, "biases");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v7 >= v14)
        {
          v7 = 0;
          break;
        }
      }
    }
    else
    {
      v12 = 0;
    }
    v15 = v6;
    v39 = v3;
    objc_msgSend(v15, "deviceOps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "params");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "bytes");
    objc_msgSend(v17, "inputSize");
    v20 = objc_msgSend(v17, "hiddenSize");
    v37 = objc_msgSend(v17, "biDirectional");
    v21 = objc_msgSend(v17, "numLayers");
    v22 = 0;
    v38 = 4 * v21;
    if (v21 >= 2)
    {
      if ((objc_msgSend(v17, "biDirectional") & 1) != 0)
      {
        if (objc_msgSend(v17, "biDirectional"))
        {
          v22 = (v7 - v38) >> 2;
          if (!v12)
            goto LABEL_31;
        }
        else
        {
          v22 = 0;
          if (!v12)
            goto LABEL_31;
        }
        goto LABEL_15;
      }
      v22 = v7 >> 2;
    }
    if (!v12)
    {
LABEL_31:

      goto LABEL_32;
    }
LABEL_15:
    objc_msgSend(v15, "biases");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v7 & 3;
      v25 = (_QWORD *)(v19 + 3048);
      v26 = v19 + 4904;
      if ((v7 & 3) == 0)
        v26 = v19 + 2120;
      if (v24 != 1)
        v25 = (_QWORD *)v26;
      if (v24 == 2)
        v27 = (_QWORD *)(v19 + 3976);
      else
        v27 = v25;
      objc_msgSend(v39, "data", *v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (v29 != 4 * v20)
      {
        +[MLCLog framework](MLCLog, "framework");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[MLCDeviceCPU(MLComputeEngineOptimizerUpdate) reloadParameterDataFromHostToDeviceMemoryForTensor:].cold.1(v39, 4 * v20, v30);

      }
      if (v7 >= v38)
        v31 = v20;
      else
        v31 = 0;
      v32 = (void *)(v36 + 4 * (v31 + (v22 << v37) * v20));
      objc_msgSend(v39, "data");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = (const void *)objc_msgSend(v33, "bytes");
      objc_msgSend(v39, "data");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      memcpy(v32, v34, objc_msgSend(v35, "length"));

    }
    goto LABEL_31;
  }
LABEL_32:

}

- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7
{
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  id v23;

  v23 = a7;
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "bytes");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "bytes");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "bytes");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 3);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = *(_QWORD *)objc_msgSend(v16, "bytes");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 4);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (_QWORD *)objc_msgSend(v18, "bytes");

  objc_msgSend(v23, "objectAtIndexedSubscript:", 5);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = *(_QWORD *)objc_msgSend(v20, "bytes");

  memcpy((void *)(v11 + 8 * *v19), a3, 8 * a6);
  memcpy((void *)(v13 + 8 * *v19), a4, 8 * a6);
  for (; v21; --v21)
  {
    memcpy((void *)(v15 + 8 * *v19), a5, 8 * a6);
    v15 += 8 * v17;
    a5 += a6;
  }
  *v19 += a6;

}

- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a4;
  v11 = a7;
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "params");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "bytes");
  objc_msgSend(v12, "lstmDeltaParams");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "bytes");

  if (objc_msgSend(v12, "hasBias"))
  {
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "accumulatorBufferCount");

    if (v11)
    {
      if (objc_msgSend(v11, "count"))
      {
        if (objc_msgSend(v11, "count"))
        {
          v17 = 0;
          v18 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isUpdatable");

            v18 |= v20;
            ++v17;
          }
          while (v17 < objc_msgSend(v11, "count"));
          if ((v18 & 1) != 0)
          {
            if (v16)
            {
              v21 = 3;
              do
              {
                objc_msgSend(v12, "biasMomentumData");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", v21 - 3);
                v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v23, "bytes");

                objc_msgSend(v12, "biasMomentumData");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectAtIndexedSubscript:", v21 - 2);
                v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v25, "bytes");

                objc_msgSend(v12, "biasMomentumData");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectAtIndexedSubscript:", v21 - 1);
                v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v27, "bytes");

                objc_msgSend(v12, "biasMomentumData");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectAtIndexedSubscript:", v21);
                v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                objc_msgSend(v29, "bytes");

                v21 += 4;
                --v16;
              }
              while (v16);
            }
            if (objc_msgSend(v11, "count"))
            {
              v30 = 0;
              v31 = 0;
              do
              {
                objc_msgSend(v11, "objectAtIndexedSubscript:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "isUpdatable");

                if ((v33 & 1) == 0)
                {
                  objc_msgSend(v12, "auxBiasTerms");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "auxBiasTermsAccumulators");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MLCDeviceCPU saveOrRestoreLSTMBiasesAndAccumulators:auxParameter:auxAccumulators:mlcIndex:auxIndex:saveParameter:](self, "saveOrRestoreLSTMBiasesAndAccumulators:auxParameter:auxAccumulators:mlcIndex:auxIndex:saveParameter:", v12, v34, v35, v30, v31, 0);

                  ++v31;
                }
                ++v30;
              }
              while (v30 < objc_msgSend(v11, "count"));
            }
          }
        }
      }
    }
  }

}

- (void)deviceMemorySizeForTensor:.cold.1()
{
  void *v0;
  SEL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataType");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D4999000, v4, v5, "%@: Illegal tensor data type:%d", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4_1();
}

- (void)readFromDevice:(os_log_t)log deviceIndex:allocateData:batchSize:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D4999000, log, OS_LOG_TYPE_FAULT, "NULL tensor.tensorData.bytes", v1, 2u);
}

- (void)transferTensor:fromDevice:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to read ANE device memory in tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unsupported number of device memory", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)updateDeviceMemoryForTensor:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: cannot find NSData in device memory", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
