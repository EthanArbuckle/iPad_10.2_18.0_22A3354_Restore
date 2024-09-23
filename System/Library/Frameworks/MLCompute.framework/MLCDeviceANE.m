@implementation MLCDeviceANE

- (id)convolutionLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  return ANE_CreateConvolutionLayer(a4, a5, a3, 0);
}

- (id)fullyConnectedLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  return ANE_CreateFullyConnectedLayer();
}

- (id)convolutionTransposeLayerWithDescriptor:(id)a3 weights:(id)a4 biasTerms:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)poolingLayerWithDescriptor:(id)a3 paddingSizes:(unint64_t *)a4
{
  return ANE_CreatePoolingLayer(a3, a4);
}

- (id)neuronLayerWithDescriptor:(id)a3
{
  return ANE_CreateNeuronLayer(a3);
}

- (id)batchNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_CreateNormalizationLayer(0, 0, v20, a8, 1, v18, v17, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)layerNormalizationLayerWithNormalizedShape:(id)a3 beta:(id)a4 gamma:(id)a5 varianceEpsilon:(float)a6 isFusedWithArithmeticLayer:(BOOL)a7
{
  return ANE_CreateNormalizationLayer(2, 0, a3, a6, 1, 0, 0, a4, a5);
}

- (id)instanceNormalizationLayerWithChannelCount:(unint64_t)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(v14, "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_CreateNormalizationLayer(1, 0, v20, a8, 1, v18, v17, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)groupNormalizationLayerWithFeatureChannelCount:(unint64_t)a3 groupCount:(unint64_t)a4 beta:(id)a5 gamma:(id)a6 varianceEpsilon:(float)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = a6;
  v13 = a5;
  objc_msgSend(v11, "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ANE_CreateNormalizationLayer(3, 0, v15, a7, a4, 0, 0, v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)arithmeticLayerWithOperation:(int)a3 activationDescriptor:(id)a4
{
  return ANE_CreateArithmeticLayer(a3);
}

- (id)compareLayerWithOperation:(int)a3
{
  return ANE_CreateComparisonLayer(a3);
}

- (id)reductionLayerWithReduceType:(int)a3 dimensions:(id)a4 sourceShapeCount:(unint64_t)a5
{
  return ANE_CreateReductionLayer(a3, a4, a5);
}

- (id)softmaxLayerWithOperation:(int)a3 dimension:(unint64_t)a4 sourceShapeCount:(unint64_t)a5
{
  return ANE_CreateSoftmaxLayer(a3, a4, a5);
}

- (id)lossLayerWithDescriptor:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)lossYOLOLayerWithDescriptor:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)dropoutLayerWithRate:(float)a3 seed:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)transposeLayerWithShape:(id)a3
{
  return ANE_CreateTransposeLayer(a3);
}

- (id)paddingLayerWithPaddingType:(int)a3 paddingLeft:(unint64_t)a4 paddingRight:(unint64_t)a5 paddingTop:(unint64_t)a6 paddingBottom:(unint64_t)a7 constantValue:(float)a8 dataType:(int)a9
{
  NSObject *v10;

  +[MLCLog framework](MLCLog, "framework", *(_QWORD *)&a3, a4, a5, a6, a7, *(_QWORD *)&a9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)imageReshapeWithWidth:(unint64_t)a3 height:(unint64_t)a4 alignCorners:(BOOL)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)lstmLayerWithDescriptor:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 peepholeWeights:(id)a6 biasTerms:(id)a7 gateActivations:(id)a8 outputResultActivation:(id)a9 inferenceOnly:(BOOL)a10
{
  NSObject *v11;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)gramMatrixLayerWithScaleFactor:(float)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)upsampleLayerWithScaleFactorX:(float)a3 scaleFactorY:(float)a4 sampleMode:(int)a5 alignCorners:(BOOL)a6
{
  return ANE_CreateUpsampleLayer(a5, a3, *(double *)&a4);
}

- (id)concatLayerWithConcatDimension:(unint64_t)a3 sourceShapeCount:(unint64_t)a4
{
  return ANE_CreateConcatLayer(a3, a4);
}

- (id)matMulLayerWithDescriptor:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 inferenceOnly:(BOOL)a6
{
  return ANE_CreateMatMulLayer(a3);
}

- (id)optimizerSGDWithDescriptor:(id)a3 momentunScale:(float)a4 useNesterovMomentum:(BOOL)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)optimizerAdamWithDescriptor:(id)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(float)a6 amsgrad:(BOOL)a7 timeStep:(unint64_t)a8 isAdamW:(BOOL)a9
{
  NSObject *v10;

  +[MLCLog framework](MLCLog, "framework", a3, a7, a8, a9, a4, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)optimizerRMSPropWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (unint64_t)allocatedDeviceDataSizeForTraining:(BOOL)a3 layer:(id)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

- (BOOL)setConvolutionLayerOptimizerDataForDeviceOps:(id)a3 weights:(id)a4 bias:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

- (BOOL)setMHALayerOptimizerDataForDeviceOps:(id)a3 optimizerDataForWeights:(id)a4 optimizerDataForBias:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

- (BOOL)setNormalizationLayerOptimizerDataForDeviceOps:(id)a3 beta:(id)a4 gamma:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

- (BOOL)setLSTMLayerOptimizerDataForDeviceOps:(id)a3 inputWeights:(id)a4 hiddenWeights:(id)a5 biasTerms:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

- (id)createOptimizerDeviceDataForTensor:(id)a3 optimizer:(id)a4 optimizerData:(id)a5 isVector:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (void)allocateDeviceDataForGlobalNormClippingWithOptimizer:(id)a3 updatableParameterCount:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

}

- (void)resetLayer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "setDevice:", 0);
  objc_msgSend(v3, "setDeviceOps:", MEMORY[0x1E0C9AA60]);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "resultTensors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setDevice:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6 configurationJSON:(id)a7
{
  id v10;
  id v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v58;
  id obj;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v54 = a4;
  v79 = *MEMORY[0x1E0C80C00];
  v61 = a5;
  v10 = a6;
  v11 = a7;
  objc_msgSend(a3, "graphLayerList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v73 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "layerID", v54));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v16);
  }
  v56 = v10;
  v58 = v14;

  v21 = (void *)MEMORY[0x1E0C9AA60];
  v62 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v63 = (void *)objc_msgSend(v21, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v55 = v11;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ane_subgraphs"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v23)
  {
    v24 = v23;
    v60 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v69 != v60)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E20], "set", v54);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v28 = v26;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v65;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v65 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * k));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v33);
              objc_msgSend(v22, "addObject:", v33);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          }
          while (v30);
        }

        objc_msgSend(v63, "addObject:", v27);
        v34 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        +[MLCDeviceGraph deviceGraphWithLayers:device:](MLCDeviceGraph, "deviceGraphWithLayers:device:", v34, v61);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        ANE_ComputeLiveOutputs(v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "mutableCopy");
        objc_msgSend(v35, "setLiveOutputs:", v37);

        objc_msgSend(v62, "addObject:", v35);
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v24);
  }

  v38 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  +[MLCDeviceGraph deviceGraphWithLayers:device:](MLCDeviceGraph, "deviceGraphWithLayers:device:", v38, v56);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v58, "count");
  v41 = v54;
  if (v40 > v54)
  {
    v42 = v40;
    do
    {
      v43 = v41;
      objc_msgSend(v58, "objectAtIndexedSubscript:", v54);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "skipLayer") & 1) == 0)
      {
        if ((objc_msgSend(v22, "containsObject:", v44) & 1) != 0)
        {
          v45 = objc_msgSend(v63, "count");
          if (v45)
          {
            v46 = v45;
            for (m = 0; m != v46; ++m)
            {
              objc_msgSend(v63, "objectAtIndexedSubscript:", m);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "containsObject:", v44);

              if (v49)
              {
                objc_msgSend(v62, "objectAtIndexedSubscript:", m);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "graphLayerList");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v44);

              }
            }
          }
        }
        else
        {
          -[MLCDeviceANE resetLayer:](self, "resetLayer:", v44);
          objc_msgSend(v39, "graphLayerList");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v44);

        }
      }

      v41 = v43 + 1;
    }
    while (v43 + 1 != v42);
  }
  objc_msgSend(v62, "addObject:", v39, v54);

  return v62;
}

- (void)saveGraphPartitioning:(id)a3 toFile:(id)a4
{
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v8, "graphLayerList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "type");

        if (v12)
          v13 = CFSTR("ane_subgraphs");
        else
          v13 = CFSTR("cpu_subgraphs");
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v8, "graphLayerList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "layerID"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v17);
        }

        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v13);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v14);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", v25, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "open");
  objc_msgSend(MEMORY[0x1E0CB36D8], "writeJSONObject:toStream:options:error:", v6, v24, 1, 0);
  objc_msgSend(v24, "close");

}

- (id)partitionInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4 aneDevice:(id)a5 secondaryDevice:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  int v89;
  int v90;
  void *v91;
  int v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  void *v110;
  unint64_t v111;
  unint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  unint64_t v117;
  unint64_t v118;
  void *v119;
  uint64_t v120;
  unint64_t v121;
  void *v122;
  uint64_t v123;
  unint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t k;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  void *v139;
  unint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t m;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  void *v149;
  BOOL v150;
  void *v151;
  NSObject *v152;
  void *v153;
  unint64_t v154;
  const char *aSelector;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  id v168;
  void *obj;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  void *v185;
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "graphLayerList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    if (v11 && v12)
    {
      aSelector = a2;
      v157 = v12;
      if ((objc_msgSend(v10, "compilerOptions") & 3) == 0)
        +[MLCComputeEngineCommon applyPatternMatcherForGraph:stopGradientTensorList:startAtLayerIndex:forInference:](MLCComputeEngineCommon, "applyPatternMatcherForGraph:stopGradientTensorList:startAtLayerIndex:forInference:", v14, 0, a4, 1);
      v15 = (void *)MEMORY[0x1E0C9AA60];
      v158 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v160 = (void *)objc_msgSend(v15, "mutableCopy");
      v163 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      v159 = (void *)objc_opt_new();
      v162 = v14;
      v16 = objc_msgSend(v14, "count");
      v161 = v11;
      if (v16 > (uint64_t)a4)
      {
        v17 = v16;
        do
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", --v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "skipLayer") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "key");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "setObject:forKeyedSubscript:", v19, v20);

            objc_msgSend(v18, "setCompileForInferenceOnly:", 1);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            objc_msgSend(v18, "sourceTensors");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "resultTensors");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if ((isKindOfClass & 1) != 0)
            {
              v25 = objc_msgSend(v18, "compileForDevice:sourceTensors:resultTensors:", v11, v22, v23);

              if ((v25 & 1) != 0)
                goto LABEL_17;
            }
            else
            {
              objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v18, "compileForDevice:sourceTensors:resultTensor:", v11, v22, v27);

              if (v28)
              {
LABEL_17:
                objc_msgSend(v18, "resultTensors");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "count");

                v11 = v161;
                if (v30)
                {
                  v31 = 0;
                  do
                  {
                    objc_msgSend(v18, "resultTensors");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "objectAtIndexedSubscript:", v31);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setDevice:", v161);

                    ++v31;
                    objc_msgSend(v18, "resultTensors");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v34, "count");

                  }
                  while (v31 < v35);
                }
                objc_msgSend(v18, "deviceOps");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v37, "setPlistBuilder:", v159);
                -[NSObject addObject:](v158, "addObject:", v18);

                goto LABEL_21;
              }
            }
            +[MLCLog framework](MLCLog, "framework");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(aSelector);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v183 = v38;
              v184 = 2112;
              v185 = v18;
              _os_log_debug_impl(&dword_1D4999000, v26, OS_LOG_TYPE_DEBUG, "%@: ANE unsupported layer = %@", buf, 0x16u);

            }
            -[MLCDeviceANE resetLayer:](self, "resetLayer:", v18);
            v11 = v161;
            if ((ANE_IsSupportedLayer(v18) & 1) == 0)
              objc_msgSend(v160, "addObject:", v18);
          }
LABEL_21:

        }
        while (v17 > (uint64_t)a4);
      }
      v156 = v10;
      if ((objc_msgSend(v10, "compilerOptions") & 3) != 0)
      {
        v168 = v159;
        v176 = 0u;
        v177 = 0u;
        v178 = 0u;
        v179 = 0u;
        v39 = v158;
        -[NSObject reverseObjectEnumerator](v158, "reverseObjectEnumerator");
        obj = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
        if (v42)
        {
          v43 = v42;
          v44 = 0;
          v165 = 0;
          v45 = *(_QWORD *)v177;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v177 != v45)
                objc_enumerationMutation(obj);
              v47 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
              objc_msgSend(v47, "sourceTensors");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "count");
              objc_msgSend(v47, "resultTensors");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "count") + v49;

              if (v51 <= 0xFF)
              {
                objc_msgSend(v47, "deviceOps");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                if (v51 + v44 <= 0xFF)
                {
                  objc_msgSend(v53, "setPlistBuilder:", v168);
                  v44 += v51;
                }
                else if ((unint64_t)++v165 >= 0x10)
                {
                  -[MLCDeviceANE resetLayer:](self, "resetLayer:", v47);
                }
                else
                {
                  v54 = objc_opt_new();

                  objc_msgSend(v53, "setPlistBuilder:", v54);
                  v44 = v51;
                  v168 = (id)v54;
                }

              }
              else
              {
                -[MLCDeviceANE resetLayer:](self, "resetLayer:", v47);
              }
            }
            v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v181, 16);
          }
          while (v43);
          v10 = v156;
          v12 = v157;
          v11 = v161;
          v14 = v162;
          v39 = v158;
          v55 = v160;
          v40 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v40 = (void *)MEMORY[0x1E0C9AA60];
          v12 = v157;
          v55 = v160;
        }
        goto LABEL_138;
      }
      v55 = v160;
      if (+[MLCPlatformInfo isAneGraphPartitioningConfigSet](MLCPlatformInfo, "isAneGraphPartitioningConfigSet"))
      {
        v56 = (void *)MEMORY[0x1E0C99D50];
        +[MLCPlatformInfo aneGraphPartitioningConfigEnvVariable](MLCPlatformInfo, "aneGraphPartitioningConfigEnvVariable");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dataWithContentsOfFile:", v57);
        v58 = objc_claimAutoreleasedReturnValue();

        v39 = v158;
        if (v58)
        {
          v175 = 0;
          v168 = (id)v58;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v58, 0, &v175);
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v175;
          if (!v60)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v12 = v157;
              obj = (void *)v59;
              -[MLCDeviceANE partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:configurationJSON:](self, "partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:configurationJSON:", v10, a4, v11, v157, v59);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_138:

              goto LABEL_28;
            }
          }
          v61 = (void *)v59;
          +[MLCLog framework](MLCLog, "framework");
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v183 = v63;
            _os_log_impl(&dword_1D4999000, v62, OS_LOG_TYPE_INFO, "%@: cannot parse JSON", buf, 0xCu);

          }
          v64 = v168;
        }
        else
        {
          v64 = 0;
          +[MLCLog framework](MLCLog, "framework");
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(aSelector);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v183 = v65;
            _os_log_impl(&dword_1D4999000, v60, OS_LOG_TYPE_INFO, "%@: cannot find config file to partition the graph", buf, 0xCu);

          }
        }

      }
      +[_MLCANEDomTree computeDominationForGraph:](_MLCANEDomTree, "computeDominationForGraph:", v14, a4);
      v168 = (id)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      objc_msgSend(v14, "reverseObjectEnumerator");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
      obj = v66;
      v164 = v67;
      if (!v69)
        goto LABEL_71;
      v70 = v69;
      v71 = *(_QWORD *)v172;
      v166 = v68;
      while (1)
      {
        for (j = 0; j != v70; ++j)
        {
          if (*(_QWORD *)v172 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * j);
          if ((objc_msgSend(v73, "skipLayer") & 1) == 0)
          {
            if (objc_msgSend(v55, "containsObject:", v73))
            {
              objc_msgSend(v55, "removeObject:", v73);
            }
            else if ((objc_msgSend(v67, "containsObject:", v73) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v55);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "key");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "objectForKeyedSubscript:", v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              buildANESubgraph(v73, v74, v75, v168, v67, v163, objc_msgSend(v77, "unsignedIntegerValue"));

              if (!objc_msgSend(v74, "count"))
              {
                +[MLCLog framework](MLCLog, "framework");
                v152 = objc_claimAutoreleasedReturnValue();
                v11 = v161;
                if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                  -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:].cold.4();

                v40 = (void *)MEMORY[0x1E0C9AA60];
                v10 = v156;
                v12 = v157;
                v14 = v162;
                v39 = v158;
                v55 = v160;
LABEL_135:
                v153 = v164;

                v151 = v166;
                goto LABEL_137;
              }
              v66 = obj;
              objc_msgSend(obj, "addObject:", v74);
              objc_msgSend(v67, "unionSet:", v74);

              v55 = v160;
              v68 = v166;
            }
          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v171, v180, 16);
        if (!v70)
        {
LABEL_71:

          objc_msgSend(v67, "removeAllObjects");
          v78 = objc_msgSend(v66, "count");
          v79 = v168;
          if (v78)
          {
            v80 = v78;
            v81 = 0;
            do
            {
              v167 = v81 + 1;
              if (v81 + 1 < v80)
              {
                v82 = v81 + 1;
                do
                {
                  objc_msgSend(v66, "objectAtIndexedSubscript:", v81);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "objectAtIndexedSubscript:", v82);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v85 = v83;
                  v86 = v84;
                  v87 = v79;
                  v88 = v163;
                  v89 = objc_msgSend(v87, "doesSubgraph:dominatesSubgraph:", v85, v86);
                  v90 = objc_msgSend(v87, "doesSubgraph:dominatesSubgraph:", v86, v85);
                  if ((v89 & 1) != 0 || (v90 & 1) != 0)
                  {
                    if ((v89 & v90) == 1)
                    {
                      +[MLCLog framework](MLCLog, "framework");
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                        -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:].cold.3(buf, &v183, v93);

                      v66 = obj;
                    }
                    if (v89)
                    {
                      v94 = v85;
                      v95 = v86;
                    }
                    else
                    {
                      v94 = v86;
                      v95 = v85;
                    }
                    v92 = canMergeANESubgraphsHelper(v94, v95, v87, v88);
                  }
                  else
                  {
                    objc_msgSend(v87, "getPostDominanceFrontierForSubgraph:", v85);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v91, "count"))
                    {
                      v92 = 0;
                    }
                    else
                    {
                      objc_msgSend(v87, "getPostDominanceFrontierForSubgraph:", v86);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      v92 = objc_msgSend(v96, "count") == 0;

                      v79 = v168;
                    }

                    v66 = obj;
                  }

                  if (v92)
                  {
                    objc_msgSend(v66, "objectAtIndexedSubscript:", v81);
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "objectAtIndexedSubscript:", v82);

                    objc_msgSend(v66, "objectAtIndexedSubscript:", v81);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "objectAtIndexedSubscript:", v82);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "unionSet:", v99);

                    objc_msgSend(v66, "objectAtIndexedSubscript:", v82);
                    v85 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v85, "removeAllObjects");
                  }
                  else
                  {

                  }
                  ++v82;
                }
                while (v80 != v82);
              }
              ++v81;
            }
            while (v167 != v80);
          }
          v100 = v156;
          v101 = v66;
          v102 = objc_msgSend(v101, "count");
          if (v102)
          {
            v103 = v102;
            v104 = 0;
            while (1)
            {
              objc_msgSend(v101, "objectAtIndexedSubscript:", v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v105, "count") != 1)
                goto LABEL_101;
              objc_msgSend(v100, "graphLayerList");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v106, "count") <= 1)
                break;
              objc_msgSend(v101, "objectAtIndexedSubscript:", v104);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "anyObject");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = objc_msgSend(v108, "isDebuggingEnabled");

              if ((v109 & 1) == 0)
              {
                objc_msgSend(v101, "objectAtIndexedSubscript:", v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "removeAllObjects");
LABEL_101:

              }
              if (v103 == ++v104)
                goto LABEL_103;
            }

            goto LABEL_101;
          }
LABEL_103:
          objc_msgSend(v101, "sortedArrayUsingComparator:", &__block_literal_global);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v110, "count"))
          {
            v111 = 0;
            v112 = 0;
            do
            {
              objc_msgSend(v110, "objectAtIndexedSubscript:", v111);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              ANE_ComputeLiveInputs(v113);
              v114 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v110, "objectAtIndexedSubscript:", v111);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              ANE_ComputeLiveOutputs(v115);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              v117 = objc_msgSend(v114, "count") + v112;
              v118 = v117 + objc_msgSend(v116, "count");
              if (v118 > 0xFF)
              {
                objc_msgSend(v110, "objectAtIndexedSubscript:", v111);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "removeAllObjects");

                v118 = v112;
              }

              ++v111;
              v112 = v118;
            }
            while (v111 < objc_msgSend(v110, "count"));
          }

          v120 = objc_msgSend(v101, "count");
          if (v120 >= 1)
          {
            v121 = v120 + 1;
            do
            {
              objc_msgSend(v101, "objectAtIndexedSubscript:", v121 - 2);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = objc_msgSend(v122, "count");

              v124 = v121 - 2;
              if (v123)
              {
                objc_msgSend(v101, "objectAtIndexedSubscript:", v124);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v164, "unionSet:", v125);

              }
              else
              {
                objc_msgSend(v101, "removeObjectAtIndex:", v124);
              }
              --v121;
            }
            while (v121 > 1);
          }
          v126 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          v127 = objc_msgSend(v101, "count");
          if (v127)
          {
            v128 = v127;
            for (k = 0; k != v128; ++k)
            {
              v130 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
              +[MLCDeviceGraph deviceGraphWithLayers:device:](MLCDeviceGraph, "deviceGraphWithLayers:device:", v130, v161);
              v131 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v101, "objectAtIndexedSubscript:", k);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              ANE_ComputeLiveOutputs(v132);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = (void *)objc_msgSend(v133, "mutableCopy");
              objc_msgSend(v131, "setLiveOutputs:", v134);

              objc_msgSend(v126, "addObject:", v131);
            }
          }
          v135 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          +[MLCDeviceGraph deviceGraphWithLayers:device:](MLCDeviceGraph, "deviceGraphWithLayers:device:", v135, v157);
          v166 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v162;
          v136 = objc_msgSend(v162, "count");
          v137 = v154;
          v55 = v160;
          if (v136 > v154)
          {
            v138 = v136;
            do
            {
              v139 = v14;
              v140 = v137;
              objc_msgSend(v139, "objectAtIndexedSubscript:");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v141, "skipLayer") & 1) == 0)
              {
                if ((objc_msgSend(v164, "containsObject:", v141) & 1) != 0)
                {
                  v142 = objc_msgSend(v101, "count");
                  if (v142)
                  {
                    v143 = v142;
                    for (m = 0; m != v143; ++m)
                    {
                      objc_msgSend(v101, "objectAtIndexedSubscript:", m);
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      v146 = objc_msgSend(v145, "containsObject:", v141);

                      if (v146)
                      {
                        objc_msgSend(v126, "objectAtIndexedSubscript:", m);
                        v147 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v147, "graphLayerList");
                        v148 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v148, "addObject:", v141);

                      }
                    }
                  }
                }
                else
                {
                  -[MLCDeviceANE resetLayer:](self, "resetLayer:", v141);
                  objc_msgSend(v166, "graphLayerList");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v149, "addObject:", v141);

                }
              }

              v137 = v140 + 1;
              v150 = v140 + 1 == v138;
              v14 = v162;
            }
            while (!v150);
          }
          v40 = v126;
          v151 = v166;
          objc_msgSend(v126, "addObject:", v166);
          if (+[MLCPlatformInfo isAneSaveGraphPartitioningConfigSet](MLCPlatformInfo, "isAneSaveGraphPartitioningConfigSet"))
          {
            +[MLCPlatformInfo aneSaveGraphPartitioningConfig](MLCPlatformInfo, "aneSaveGraphPartitioningConfig");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCDeviceANE saveGraphPartitioning:toFile:](self, "saveGraphPartitioning:toFile:", v126, v74);
            v10 = v156;
            v12 = v157;
            v11 = v161;
            v39 = v158;
            goto LABEL_135;
          }
          v10 = v156;
          v12 = v157;
          v11 = v161;
          v39 = v158;
          v153 = v164;
LABEL_137:

          goto LABEL_138;
        }
      }
    }
    +[MLCLog framework](MLCLog, "framework");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:].cold.2(a2);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE(MLCLayerOperations) partitionInferenceGraph:startAtLayerIndex:aneDevice:secondaryDevice:].cold.1(a2);
  }
  v40 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

  return v40;
}

- (BOOL)updateTensorsForFusedLayers:(id)a3 ofInferenceGraph:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  BOOL v58;
  NSObject *v59;
  void *v61;
  NSObject *v62;
  id v63;
  void *v64;
  void *v65;
  id obj;
  uint64_t v67;
  id v68;
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
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v86;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v11);
      if (ANE_IsAneCompiledLayer(v12))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v12, "deviceOps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "plistBuilder");
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_56;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ANE_ComputeLiveInputs(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ANE_ComputeLiveOutputs(v19);
      v20 = objc_claimAutoreleasedReturnValue();

      -[NSObject allObjects](v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:](v15, "buildProcedureWithRootLayer:aneSubgraphLayerList:liveInputs:liveOutputs:", v6, v7, v17, v20) & 1) != 0)
      {
        v64 = v21;
        v65 = v18;
        v61 = v17;
        v62 = v15;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v63 = v7;
        v22 = v7;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        v68 = v6;
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v82 != v25)
                objc_enumerationMutation(v22);
              v27 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * i);
              if (v27 != v6)
              {
                objc_msgSend(v6, "fusedLayers");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v27);

                objc_msgSend(v27, "setSkipLayer:", 1);
              }
              if (objc_msgSend(v27, "isLastLayer"))
              {
                objc_msgSend(v27, "setIsLastFusedLayer:", 1);
              }
              else
              {
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                objc_msgSend(v27, "resultTensors");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
                if (v30)
                {
                  v31 = v30;
                  v32 = *(_QWORD *)v78;
                  while (2)
                  {
                    for (j = 0; j != v31; ++j)
                    {
                      if (*(_QWORD *)v78 != v32)
                        objc_enumerationMutation(v29);
                      if (-[NSObject containsObject:](v20, "containsObject:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j)))
                      {
                        objc_msgSend(v27, "setIsLastFusedLayer:", 1);
                        goto LABEL_32;
                      }
                    }
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
                    if (v31)
                      continue;
                    break;
                  }
                }
LABEL_32:

                v6 = v68;
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
          }
          while (v24);
        }

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v65, "mutableCopy");
        objc_msgSend(v6, "setSourceTensors:", v35);

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v6, "sourceTensors");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
        if (v36)
        {
          v37 = v36;
          v67 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v74 != v67)
                objc_enumerationMutation(obj);
              v39 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "childLayers");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "count");

              if (v42)
              {
                for (m = 0; m != v42; ++m)
                {
                  objc_msgSend(v39, "childLayers");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "objectAtIndexedSubscript:", m);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  if (-[NSObject containsObject:](v34, "containsObject:", v45))
                    objc_msgSend(v40, "addIndex:", m);

                }
              }
              objc_msgSend(v39, "childLayers");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "removeObjectsAtIndexes:", v40);

              objc_msgSend(v39, "childLayers");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v68;
              objc_msgSend(v47, "addObject:", v68);

            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
          }
          while (v37);
        }

        v48 = (void *)objc_msgSend(v64, "mutableCopy");
        objc_msgSend(v6, "setResultTensors:", v48);

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v6, "resultTensors");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v70;
          while (2)
          {
            for (n = 0; n != v51; ++n)
            {
              if (*(_QWORD *)v70 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * n);
              objc_msgSend(v54, "parentLayers");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "count");

              if (!v56)
              {
                +[MLCLog framework](MLCLog, "framework");
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                  -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:].cold.3();

                v58 = 0;
                v6 = v68;
                goto LABEL_68;
              }
              objc_msgSend(v54, "parentLayers");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v68;
              objc_msgSend(v57, "setObject:atIndexedSubscript:", v68, 0);

            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
            if (v51)
              continue;
            break;
          }
        }
        v58 = 1;
LABEL_68:
        v7 = v63;

        v17 = v61;
        v15 = v62;
        v21 = v64;
        v18 = v65;
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:].cold.4();
        v58 = 0;
      }

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:].cold.2();
      v58 = 0;
    }

  }
  else
  {
LABEL_9:

LABEL_56:
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE(MLCLayerOperations) updateTensorsForFusedLayers:ofInferenceGraph:].cold.1(a2);
    v58 = 0;
  }

  return v58;
}

- (void)fuseLayersForTrainingGraph:(id)a3 stopGradientTensorList:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;

  v24 = a3;
  v5 = a4;
  if (v24)
  {
    if ((unint64_t)objc_msgSend(v24, "count") >= 2)
    {
      v6 = objc_msgSend(v24, "count");
      v7 = v24;
      if (v6)
      {
        v8 = 0;
        while (1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isLastLayer"))
            break;
          if ((objc_msgSend(v9, "skipLayer") & 1) == 0)
          {
            objc_msgSend(v9, "resultTensors");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "childLayers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

            if (v13 == 1)
            {
              objc_msgSend(v9, "resultTensors");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "childLayers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v17, "skipLayer") & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v17, "resultTensors");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v9, "resultTensors");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "setObject:atIndexedSubscript:", v19, 0);

                    objc_msgSend(v19, "parentLayers");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "setObject:atIndexedSubscript:", v9, 0);

                    objc_msgSend(v9, "fusedLayers");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addObject:", v17);

                    objc_msgSend(v17, "setSkipLayer:", 1);
                  }
                }
              }

            }
          }

          ++v8;
          v23 = objc_msgSend(v24, "count");
          v7 = v24;
          if (v8 >= v23)
            goto LABEL_17;
        }

      }
    }
  }
LABEL_17:

}

- (void)fuseLayersForInferenceGraph:(id)a3 startAtLayerIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MLCDeviceANE updateTensorsForFusedLayers:ofInferenceGraph:](self, "updateTensorsForFusedLayers:ofInferenceGraph:", v8, v7))
    {
      v9 = objc_msgSend(v7, "count");
      if (v9)
      {
        v11 = v9;
        v12 = 0;
        *(_QWORD *)&v10 = 138412546;
        v20 = v10;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v12, v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "skipLayer") & 1) == 0)
          {
            objc_msgSend(v13, "fusedLayers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v11 != 1 && !v15)
            {
              +[MLCLog framework](MLCLog, "framework");
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v20;
                v22 = v17;
                v23 = 2112;
                v24 = v13;
                _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%@: failed to fuse layer = %@", buf, 0x16u);

              }
            }
          }

          ++v12;
        }
        while (v11 != v12);
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v19;
        v23 = 2112;
        v24 = v8;
        v25 = 2112;
        v26 = v7;
        _os_log_error_impl(&dword_1D4999000, v18, OS_LOG_TYPE_ERROR, "%@: failed to update tensors for rootLayer = %@ and graphLayerList = %@", buf, 0x20u);

      }
    }

  }
}

- (id)fusedConvolutionAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fusedFullyConnectedAndNeuronLayerWithDescriptor:(id)a3 convolutionDescriptor:(id)a4 weights:(id)a5 biasTerms:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fusedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 numOfFeatureChannels:(unint64_t)a4 mean:(id)a5 variance:(id)a6 beta:(id)a7 gamma:(id)a8 varianceEpsilon:(float)a9 momentum:(float)a10
{
  NSObject *v11;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) convolutionTransposeLayerWithDescriptor:weights:biasTerms:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  NSObject *v13;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)fusedFullyConnectedBatchNormalizationAndNeuronLayerWithDescriptor:(id)a3 mean:(id)a4 variance:(id)a5 beta:(id)a6 gamma:(id)a7 varianceEpsilon:(float)a8 momentum:(float)a9 neuronDescriptor:(id)a10 weights:(id)a11 biasTerms:(id)a12
{
  NSObject *v13;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)multiheadAttentionLayerWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attnBias:(id)a6 inferenceOnly:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)sliceLayerWithbegin:(id)a3 end:(id)a4 stride:(id)a5 inferenceOnly:(BOOL)a6
{
  return ANE_CreateSliceLayer(a3, a4, a5);
}

- (BOOL)compileLayerDeviceOps:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v10, "deviceOpType"))
    {
      case 1u:
        ANE_CompileArithmeticLayer(v7, (uint64_t)v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 2u:
        v13 = 0;
        goto LABEL_18;
      case 4u:
        ANE_CompileConvolutionLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 7u:
        ANE_CompileFullyConnectedLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0xAu:
        ANE_CompileNeuronLayer(v7, (uint64_t)v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0xBu:
        ANE_CompilePoolingLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0xCu:
        ANE_CompileSoftmaxLayer(v7, (uint64_t)v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0xDu:
        v13 = 1;
        goto LABEL_18;
      case 0x10u:
        ANE_CompileUpsampleLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x12u:
        ANE_CompileReshapeLayer((uint64_t)v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x13u:
        v13 = 2;
        goto LABEL_18;
      case 0x17u:
        v13 = 3;
LABEL_18:
        ANE_CompileNormalizationLayer(v13, v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x1Cu:
        ANE_CompileTransposeLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x1Eu:
        ANE_CompileReductionLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x1Fu:
        ANE_CompileConcatLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x20u:
        ANE_CompileMatMulLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x21u:
        ANE_CompileSliceLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x22u:
        ANE_CompileComparisonLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 0x23u:
        ANE_CompileSelectionLayer(v7, v8, v9);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v14 = v11;
        if (v11 && -[NSObject count](v11, "count"))
        {
          objc_msgSend(v10, "setUnits:", v14);
          v12 = 1;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.2();

LABEL_32:
          v12 = 0;
        }

        break;
      default:
        +[MLCLog framework](MLCLog, "framework");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE(MLCLayerOperations) compileLayerDeviceOps:sourceTensors:resultTensor:].cold.1();
        goto LABEL_32;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)compileOptimizerDeviceOps:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

  return 0;
}

+ (BOOL)hasANE
{
  if (hasANE_onceToken != -1)
    dispatch_once(&hasANE_onceToken, &__block_literal_global_2);
  return hasANE_hasANE;
}

id __22__MLCDeviceANE_hasANE__block_invoke()
{
  id result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  if (AppleNeuralEngineLibrary_frameworkLibrary_1)
  {
    result = softLinkClass_ANEDeviceInfo_0();
    if (result)
    {
      result = softLinkClass_ANERequest();
      if (result)
      {
        result = softLinkClass_ANEQoSMapper();
        if (result)
        {
          result = softLinkClass_ANEInMemoryModelDescriptor();
          if (result)
          {
            result = softLinkClass_ANEInMemoryModel();
            if (result)
            {
              if (softLinkClass_ANEIOSurfaceObject_onceToken_0 != -1)
                dispatch_once(&softLinkClass_ANEIOSurfaceObject_onceToken_0, &__block_literal_global_182);
              result = objc_retainAutorelease((id)softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject_0);
              if (result)
                result = (id)objc_msgSend(softLinkClass_ANEDeviceInfo_0(), "hasANE");
            }
          }
        }
      }
    }
  }
  else
  {
    result = 0;
  }
  hasANE_hasANE = (char)result;
  return result;
}

- (MLCDeviceANE)initWithType:(int)a3
{
  MLCDeviceANE *v6;
  MLCDeviceANE *v7;
  NSArray *deviceList;
  MLCDeviceANE *v9;
  NSObject *v10;
  objc_super v12;

  if ((objc_msgSend((id)objc_opt_class(), "hasANE") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)MLCDeviceANE;
    v6 = -[MLCDeviceANE init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_deviceType = a3;
      deviceList = v6->_deviceList;
      v6->_deviceList = (NSArray *)&unk_1E9844AB0;

    }
    self = v7;
    v9 = self;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE initWithType:].cold.1(a2);

    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MLCDeviceANE deviceType](self, "deviceType");
  objc_msgSend(softLinkClass_ANEDeviceInfo_0(), "aneSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { deviceType=%d, aneSubType=%@ }"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:", -[MLCDeviceANE deviceType](self, "deviceType"));
}

- (unint64_t)numberOfDevices
{
  return 1;
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3
{
  uint64_t v4;

  v4 = 1;
  return -[MLCDeviceANE deviceMemorySizeForTensor:interleave:](self, "deviceMemorySizeForTensor:interleave:", a3, &v4);
}

- (unint64_t)deviceMemorySizeForTensor:(id)a3 interleave:(unint64_t *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "interleave");
  v8 = ANE_CalculatePlaneCountForTensor(v6, v7);
  v9 = ANE_CalculatePlaneStrideForTensor(v6, v7);

  if (v8 && v9)
  {
    *a4 = v7;
    return v9 * v8;
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v12;
      v15 = 2048;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      _os_log_error_impl(&dword_1D4999000, v11, OS_LOG_TYPE_ERROR, "%@: invalid plane count=%lu or plane stride=%lu", (uint8_t *)&v13, 0x20u);

    }
    return 0;
  }
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "deviceMemory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == 3
      || (objc_msgSend(v3, "device"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "type"),
          v9,
          v10))
    {
LABEL_5:
      v11 = 0;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
      objc_msgSend(v3, "deviceMemory", 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = 0;
              goto LABEL_18;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v15)
            continue;
          break;
        }
      }
      v11 = 1;
LABEL_18:

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)allocateDeviceMemoryForTensor:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8263D2C]();
  v23 = 1;
  v7 = -[MLCDeviceANE deviceMemorySizeForTensor:interleave:](self, "deviceMemorySizeForTensor:interleave:", v5, &v23);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v5, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "dataType");

    v11 = ANE_CalculatePlaneCountForTensor(v5, v23);
    v12 = ANE_CalculatePlaneStrideForTensor(v5, v23);
    v13 = ANE_CalculateRowStrideForTensor(v5, v23);
    ANE_GetANECIRDataTypeWithMLCDataType(v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v25[0] = v14;
      v24[0] = CFSTR("Type");
      v24[1] = CFSTR("Interleave");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v16;
      v24[2] = CFSTR("PlaneCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2] = v17;
      v24[3] = CFSTR("RowStride");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[3] = v18;
      v24[4] = CFSTR("PlaneStride");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[4] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
      v20 = objc_claimAutoreleasedReturnValue();

      +[_MLCANEIOSurface objectWithDataLength:liveIOStatus:](_MLCANEIOSurface, "objectWithDataLength:liveIOStatus:", v8, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v5, "deviceMemory");
        v22 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v22, "addObject:", v21);
      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE allocateDeviceMemoryForTensor:].cold.3(a2);
      }

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE allocateDeviceMemoryForTensor:].cold.2(a2, v10, v20);
    }

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE allocateDeviceMemoryForTensor:].cold.1(a2);
  }

  objc_autoreleasePoolPop(v6);
}

- (void)deallocateDeviceMemoryForTensor:(id)a3
{
  id v3;

  objc_msgSend(a3, "deviceMemory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

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
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __IOSurface *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *BaseAddress;
  void *v23;
  NSObject *v24;
  id v26;

  v3 = a3;
  if (VerifyTensorBeforeRead(v3))
  {
    objc_msgSend(v3, "deviceMemory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "deviceIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "liveIOStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Interleave"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = ANE_ANECDataTypeToMLCDataType(v9);
    if (v8 != 1
      || (v11 = v10,
          objc_msgSend(v3, "descriptor"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "dataType"),
          v12,
          (_DWORD)v11 != v13))
    {
      v23 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v26 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v3, &v26);
    v14 = v26;
    objc_msgSend(v5, "ioSurfaceObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (__IOSurface *)objc_msgSend(v15, "ioSurface");

    if (v16)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RowStride"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      v19 = v18 / ANE_GetANEElementByteCount(v11);
      objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      if (v19 == v21)
      {
        BaseAddress = IOSurfaceGetBaseAddress(v16);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", BaseAddress, IOSurfaceGetAllocSize(v16), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE getHostPointerIfUnifiedDeviceMemory:].cold.1();

    }
    v23 = 0;
    goto LABEL_13;
  }
  v23 = 0;
LABEL_15:

  return v23;
}

- (id)readTensor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MLCDeviceANE readTensor:fromDeviceIndex:](self, "readTensor:fromDeviceIndex:", v4, objc_msgSend(v4, "deviceIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MLCDeviceANE readTensor:fromDeviceIndex:batchSize:](self, "readTensor:fromDeviceIndex:batchSize:", v6, a4, objc_msgSend(v6, "calculateBatchSizeToUse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  id v8;
  size_t v9;
  void *v10;

  v8 = a3;
  v9 = ANE_CalculateImageSizeForTensor(v8) * a5;
  v10 = malloc_type_malloc(v9, 0xC6646363uLL);
  -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v8, a4, v10, a5);

  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v9, 1);
}

- (void)readTensor:(id)a3 targetBuffer:(void *)a4
{
  id v6;
  id v7;

  v7 = a3;
  -[MLCDeviceANE getHostPointerIfUnifiedDeviceMemory:](self, "getHostPointerIfUnifiedDeviceMemory:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if ((void *)objc_msgSend(v6, "bytes") != a4)
    -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v7, objc_msgSend(v7, "deviceIndex"), a4, objc_msgSend(v7, "calculateBatchSizeToUse"));

}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (VerifyTensorBeforeRead(v10))
  {
    if (objc_msgSend(v10, "deviceIndex") != a4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v18;
        v21 = 2048;
        v22 = objc_msgSend(v10, "deviceIndex");
        v23 = 2048;
        v24 = a4;
        _os_log_error_impl(&dword_1D4999000, v12, OS_LOG_TYPE_ERROR, "%@: -readTensor:fromDeviceIndex:targetBuffer:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu", (uint8_t *)&v19, 0x20u);

      }
      goto LABEL_13;
    }
    objc_msgSend(v10, "deviceMemory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject liveIOStatus](v12, "liveIOStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "calculateBatchSizeToUse");
    if (v14 >= a6)
    {
      if ((ANE_ReadOutputTensor(v10, v13, a4, (char *)a5, a6) & 1) != 0)
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:].cold.1();
    }
    else
    {
      v15 = v14;
      +[MLCLog framework](MLCLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v17;
        v21 = 2048;
        v22 = a6;
        v23 = 2048;
        v24 = v15;
        _os_log_error_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%@: invalid batchSize=%lu. batchSize cannot exceed the batch size of the tensor=%lu", (uint8_t *)&v19, 0x20u);

      }
    }

    goto LABEL_12;
  }
LABEL_14:

}

- (void)readTensor:(id)a3 fromDeviceIndex:(unint64_t)a4 targetBuffer:(void *)a5 batchSize:(unint64_t)a6 reduceOverBatch:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

}

- (void)dispatchReadTensor:(id)a3 targetBuffer:(void *)a4 batchSize:(unint64_t)a5
{
  id v8;

  v8 = a3;
  -[MLCDeviceANE readTensor:fromDeviceIndex:targetBuffer:batchSize:](self, "readTensor:fromDeviceIndex:targetBuffer:batchSize:", v8, objc_msgSend(v8, "deviceIndex"), a4, a5);

}

- (void)broadcastTensor:(id)a3
{
  id v4;

  v4 = a3;
  -[MLCDeviceANE writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", v4, 0, objc_msgSend(v4, "calculateBatchSizeToUse"));

}

- (void)broadcastTensor:(id)a3 batchSize:(unint64_t)a4
{
  -[MLCDeviceANE writeToAllDevices:allocateData:batchSize:](self, "writeToAllDevices:allocateData:batchSize:", a3, 0, a4);
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
    -[MLCDeviceANE allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v8);
    v8 = v9;
  }
  -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:](self, "writeToDevice:toDeviceIndex:batchSize:", v8, 0, a5);

}

- (void)writeToDevice:(id)a3 toDeviceIndex:(unint64_t)a4 batchSize:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __IOSurface *v25;
  char *BaseAddress;
  id v27;
  char *v28;
  void *v29;
  char v30;
  NSObject *v31;
  int v32;
  void *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  if (v10)
  {
    objc_msgSend(v8, "deviceMemory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
    {
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:].cold.1();
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "deviceIndex") != a4)
    {
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = v19;
        v34 = 2048;
        v35 = objc_msgSend(v8, "deviceIndex");
        v36 = 2048;
        v37 = a4;
        v20 = "%@: -writeToDevice:toDeviceIndex:batchSize must be called with deviceIndex = %lu, but given deviceIndex = %lu";
        goto LABEL_12;
      }
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v8, "deviceMemory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:].cold.4(a2);
      goto LABEL_24;
    }
    v16 = objc_msgSend(v8, "calculateBatchSizeToUse");
    if (v16 < a5)
    {
      v17 = v16;
      +[MLCLog framework](MLCLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = v19;
        v34 = 2048;
        v35 = a5;
        v36 = 2048;
        v37 = v17;
        v20 = "%@: invalid batchSize=%lu. batchSize cannot exceed the batch size of the tensor=%lu";
LABEL_12:
        _os_log_error_impl(&dword_1D4999000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v32, 0x20u);

        goto LABEL_24;
      }
      goto LABEL_24;
    }
    objc_msgSend(v8, "deviceMemory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", a4);
    v18 = objc_claimAutoreleasedReturnValue();

    -[NSObject liveIOStatus](v18, "liveIOStatus");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && objc_msgSend(v22, "count"))
    {
      -[NSObject ioSurfaceObject](v18, "ioSurfaceObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (__IOSurface *)objc_msgSend(v24, "ioSurface");

      IOSurfaceLock(v25, 0, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v25);
      objc_msgSend(v8, "data");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (char *)objc_msgSend(v27, "bytes");
      objc_msgSend(v8, "data");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = ANE_ConvertInputTensor(v8, v23, v28, objc_msgSend(v29, "length"), BaseAddress, a5);

      IOSurfaceUnlock(v25, 0, 0);
      if ((v30 & 1) != 0)
      {
LABEL_23:

        goto LABEL_24;
      }
      +[MLCLog framework](MLCLog, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:].cold.3();
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE writeToDevice:toDeviceIndex:batchSize:].cold.2();
    }

    goto LABEL_23;
  }
LABEL_25:

}

- (BOOL)synchronizeTensor:(id)a3
{
  return 1;
}

- (void)commitWithProfiling:(BOOL)a3 graphExecutionTime:(id)a4
{
  -[MLCDeviceANE commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:](self, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", 0, a3, a4, 0);
}

- (void)commitAndWaitForCompletion:(id)a3
{
  -[MLCDeviceANE commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:](self, "commitAndWaitForCompletion:enableProfiling:graphExecutionTime:graphResultTensor:", a3, 0, 0, 0);
}

- (void)commitAndWaitForCompletion:(id)a3 enableProfiling:(BOOL)a4 graphExecutionTime:(id)a5 graphResultTensor:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  double v11;
  double Current;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(id, id, _QWORD, double);

  v8 = a4;
  v17 = (void (**)(id, id, _QWORD, double))a3;
  v9 = a5;
  v10 = a6;
  v11 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v11 = Current - *(double *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
  }
  if (v10)
  {
    objc_msgSend(v10, "data");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v13, "bytes"))
    {
      objc_msgSend(v10, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_8;
      objc_msgSend(v10, "device");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "computeEngine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "data");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "readTensor:targetBuffer:", v10, objc_msgSend(v16, "bytes"));

    }
  }
LABEL_8:
  if (v17)
    v17[2](v17, v10, 0, v11);

}

- (unint64_t)numDevices
{
  return 1;
}

- (BOOL)allocateDeviceMemoryForSourceAndResultTensorsOfLayer:(id)a3 tensorLabelToIOSurfaceMap:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v6, "sourceTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v6, "sourceTensors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((ANE_CanProgramANECConstantTensorUnit(v12) & 1) == 0)
      {
        if (-[MLCDeviceANE needToAllocateDeviceMemoryForTensor:](self, "needToAllocateDeviceMemoryForTensor:", v12))
          -[MLCDeviceANE allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v12);
        objc_msgSend(v12, "deviceMemory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deviceMemory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          +[MLCLog framework](MLCLog, "framework");
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:].cold.1();

LABEL_25:
          v28 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v12, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

      }
      ++v10;
      objc_msgSend(v6, "sourceTensors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v10 < v18);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "resultTensors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[MLCDeviceANE allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v24);
        ANE_GetDeviceMemoryData(v24);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          +[MLCLog framework](MLCLog, "framework");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:].cold.1();

          goto LABEL_25;
        }
        v26 = (void *)v25;
        objc_msgSend(v24, "label");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v27);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v21)
        continue;
      break;
    }
  }

  *a4 = (id)objc_msgSend(v7, "copy");
  v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)procedureInformationWithModelAttributes:(id)a3 procedureName:(id)a4 procedureID:(unint64_t *)a5 procedureInputSymbols:(id *)a6 procedureInputSymbolIndices:(id *)a7 procedureOutputSymbols:(id *)a8 procedureOutputSymbolIndices:(id *)a9
{
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  BOOL v57;
  void *v58;
  NSObject *v59;
  const char *aSelector;
  char *aSelectora;
  _QWORD *v62;
  id *v63;
  id *v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t *v67;
  id *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  unint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  if (softLinkObjcConstantkANEFModelDescriptionKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelDescriptionKey_once_token, &__block_literal_global_186);
  v17 = (_QWORD *)softLinkObjcConstantkANEFModelDescriptionKey_constant;
  v68 = a6;
  if (softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_once_token, &__block_literal_global_188);
  v18 = (_QWORD *)softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_constant;
  if (softLinkObjcConstantkANEFModelProceduresArrayKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelProceduresArrayKey_once_token, &__block_literal_global_190);
  v19 = (_QWORD *)softLinkObjcConstantkANEFModelProceduresArrayKey_constant;
  v67 = a5;
  if (softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_once_token, &__block_literal_global_192);
  v20 = (_QWORD *)softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_constant;
  if (softLinkObjcConstantkANEFModelInputSymbolsArrayKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelInputSymbolsArrayKey_once_token, &__block_literal_global_194);
  v21 = (_QWORD *)softLinkObjcConstantkANEFModelInputSymbolsArrayKey_constant;
  if (softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_once_token != -1)
    dispatch_once(&softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_once_token, &__block_literal_global_196);
  v22 = softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant;
  if (softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_once_token != -1)
  {
    v66 = softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant;
    dispatch_once(&softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_once_token, &__block_literal_global_198);
    v22 = v66;
  }
  v69 = v15;
  if (v17 && v18 && v19 && v20 && v21 && v22 && softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant)
  {
    aSelector = a2;
    v62 = (_QWORD *)softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant;
    v64 = a8;
    v65 = (_QWORD *)v22;
    v63 = a7;
    objc_msgSend(v15, "objectForKeyedSubscript:", *v17);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0C9AA60];
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v26 = (void *)objc_msgSend(v24, "mutableCopy");
    -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", *v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    v30 = objc_msgSend(v28, "unsignedIntegerValue");

    v31 = v30;
    -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", *v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");
    v34 = v30 < v33;
    if (v30 >= v33)
    {
      v16 = v29;
      +[MLCLog framework](MLCLog, "framework");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v53 = v32;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v81 = v54;
        v82 = 2048;
        v83 = v31;
        v84 = 2048;
        v85 = objc_msgSend(v53, "count");
        _os_log_error_impl(&dword_1D4999000, v51, OS_LOG_TYPE_ERROR, "%@: procedureID=%lu can not exceed the count of procedures=%lu", buf, 0x20u);

        v32 = v53;
      }
    }
    else
    {
      v58 = v29;
      v55 = v30;
      v56 = v32;
      objc_msgSend(v32, "objectAtIndexedSubscript:", v30);
      v59 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *v20);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      aSelectora = (char *)v23;
      -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", *v21);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v37 = v35;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v75 != v40)
              objc_enumerationMutation(v37);
            objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "unsignedIntegerValue"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v42);

          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
        }
        while (v39);
      }
      v57 = v34;

      -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *v65);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(aSelectora, "objectForKeyedSubscript:", *v62);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v45 = v43;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v71 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "unsignedIntegerValue"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v50);

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v47);
      }

      *v67 = v55;
      *v68 = (id)objc_msgSend(v25, "copy");
      *v63 = (id)objc_msgSend(v37, "copy");
      *v64 = (id)objc_msgSend(v26, "copy");
      *a9 = (id)objc_msgSend(v45, "copy");

      v16 = v58;
      v51 = v59;
      v23 = aSelectora;
      v34 = v57;
      v32 = v56;
    }

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE procedureInformationWithModelAttributes:procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:].cold.1(a2);
    v34 = 0;
  }

  return v34;
}

- (id)ANERequestWithModelAttributes:(id)a3 procedureName:(id)a4 tensorLabelToIOSurfaceMap:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  os_log_t log;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "count"))
  {
    v44 = 0;
    v45 = -1;
    v42 = 0;
    v43 = 0;
    v41 = 0;
    v12 = -[MLCDeviceANE procedureInformationWithModelAttributes:procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:](self, "procedureInformationWithModelAttributes:procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:", v9, v10, &v45, &v44, &v43, &v42, &v41);
    v13 = v44;
    v14 = v43;
    v39 = v42;
    v15 = v41;
    v38 = v13;
    if (v12)
    {
      v37 = v10;
      v16 = (void *)MEMORY[0x1E0C9AA60];
      log = (os_log_t)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v17 = (void *)objc_msgSend(v16, "mutableCopy");
      if (objc_msgSend(v14, "count"))
      {
        v18 = 0;
        while (1)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

          objc_msgSend(v13, "objectAtIndexedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "ioSurfaceObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
            break;
          -[NSObject addObject:](log, "addObject:", v22);

          if (++v18 >= (unint64_t)objc_msgSend(v14, "count"))
            goto LABEL_7;
        }
        +[MLCLog framework](MLCLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:].cold.3();
        v31 = 0;
        v10 = v37;
      }
      else
      {
LABEL_7:
        v36 = v9;
        v23 = (void *)MEMORY[0x1E0C9AA60];
        v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v24 = objc_msgSend(v23, "mutableCopy");
        if (objc_msgSend(v15, "count"))
        {
          v25 = 0;
          while (1)
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v24, "addObject:", v26);

            objc_msgSend(v39, "objectAtIndexedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "ioSurfaceObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
              break;
            objc_msgSend(v20, "addObject:", v29);

            if (++v25 >= (unint64_t)objc_msgSend(v15, "count"))
              goto LABEL_11;
          }
          +[MLCLog framework](MLCLog, "framework");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:].cold.2();

          v31 = 0;
        }
        else
        {
LABEL_11:
          v30 = softLinkClass_ANERequest();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "requestWithInputs:inputIndices:outputs:outputIndices:procedureIndex:", log, v17, v20, v24, v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = v36;
        v10 = v37;

      }
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v47 = v35;
        v48 = 2112;
        v49 = v10;
        v50 = 2112;
        v51 = v9;
        _os_log_error_impl(&dword_1D4999000, log, OS_LOG_TYPE_ERROR, "%@: failed to get procedure information for procedure name=%@ from model attributes=%@", buf, 0x20u);

      }
      v31 = 0;
    }

  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:].cold.1(a2);

    v31 = 0;
  }

  return v31;
}

- (BOOL)postProcessCompiledGraph:(id)a3 compilerOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  BOOL v27;
  __int128 v28;
  uint64_t v29;
  NSObject *v30;
  MLCDeviceANE *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  char v44;
  id v45;
  int v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  int v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  __int128 v70;
  id v71;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  NSObject *obj;
  unsigned int v81;
  void *v82;
  MLCDeviceANE *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[16];
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  id v102;
  _BYTE v103[16];
  _BYTE v104[16];
  _BYTE v105[128];
  _QWORD v106[4];

  v4 = a4;
  v106[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "graphLayerList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    +[MLCLog framework](MLCLog, "framework");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.1();
    v27 = 0;
    goto LABEL_88;
  }
  v83 = self;
  v9 = v4 & 6;
  v74 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v6, "graphLayerList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      objc_msgSend(v6, "graphLayerList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject skipLayer](v15, "skipLayer") & 1) == 0 && ANE_IsAneCompiledLayer(v15))
      {
        obj = v15;
        -[NSObject deviceOps](v15, "deviceOps");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "plistBuilder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          +[MLCLog framework](MLCLog, "framework");
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.8();

          goto LABEL_86;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", obj);
        }
        else
        {
          -[NSObject addObject:](v74, "addObject:", v18);
          v106[0] = obj;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v19);

        }
        if (v9 && (objc_msgSend(v18, "buildProcedureWithLayer:", obj) & 1) == 0)
        {
          +[MLCLog framework](MLCLog, "framework");
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.9();

LABEL_86:
          v27 = 0;
          v25 = v74;
          goto LABEL_87;
        }

        v15 = obj;
      }

      ++v13;
      objc_msgSend(v6, "graphLayerList");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v13 < v24);
  }
  v25 = v74;
  if (!-[NSObject count](v74, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.2(a2, obj);
    goto LABEL_74;
  }
  v26 = -[NSObject count](v74, "count");
  if (v9)
  {
    if (v26 > 0x10)
    {
      +[MLCLog framework](MLCLog, "framework");
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.7();
LABEL_82:
      v27 = 0;
      goto LABEL_87;
    }
  }
  else if (v26 != 1)
  {
    +[MLCLog framework](MLCLog, "framework");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.6(a2);
    goto LABEL_82;
  }
  v94 = 0u;
  v92 = 0u;
  v93 = 0u;
  v91 = 0u;
  obj = v74;
  v77 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
  if (!v77)
  {
LABEL_74:
    v27 = 1;
    goto LABEL_87;
  }
  v73 = v10;
  v29 = *(_QWORD *)v92;
  v71 = v6;
  *(_QWORD *)&v28 = 138412546;
  v70 = v28;
  v30 = obj;
  v31 = v83;
  v76 = *(_QWORD *)v92;
  while (2)
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v92 != v29)
        objc_enumerationMutation(v30);
      v33 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v32);
      v81 = objc_msgSend(softLinkClass_ANEQoSMapper(), "aneUserInteractiveTaskQoS");
      objc_msgSend(v33, "plist");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "copy");

      v36 = (void *)MEMORY[0x1D8263D2C]();
      objc_msgSend(v33, "weightOps");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "weights");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v38, "copy");

      if (+[MLCPlatformInfo isAnePlistKept](MLCPlatformInfo, "isAnePlistKept"))
        ANE_WriteANEModelFiles(v35, v39);
      v90 = 0;
      v79 = v35;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v35, 100, 0, &v90, v70);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v90;
      v78 = v32;
      if (v40)
      {
        objc_msgSend(softLinkClass_ANEInMemoryModelDescriptor(), "modelWithNetworkDescription:weights:optionsPlist:", v40, v39, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_msgSend(softLinkClass_ANEInMemoryModel(), "inMemoryModelWithDescriptor:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v41;
          v44 = objc_msgSend(v43, "loadWithQoS:options:error:", v81, MEMORY[0x1E0C9AA70], &v89);
          v45 = v89;

          objc_msgSend(v33, "releaseWeights");
          if ((v44 & 1) != 0)
          {
            v46 = 1;
            v41 = v45;
            v31 = v83;
            goto LABEL_47;
          }
          +[MLCLog framework](MLCLog, "framework");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v98 = v65;
            v99 = 2112;
            v100 = v43;
            v101 = 2112;
            v102 = v45;
            _os_log_error_impl(&dword_1D4999000, v47, OS_LOG_TYPE_ERROR, "%@: failed to load model=%@ : error=%@", buf, 0x20u);

          }
          v41 = v45;
          v31 = v83;
        }
        else
        {
          +[MLCLog framework](MLCLog, "framework");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.5((uint64_t)v103, (uint64_t)a2);
          v43 = 0;
        }

      }
      else
      {
        +[MLCLog framework](MLCLog, "framework");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.4((uint64_t)v104, (uint64_t)a2);
        v43 = 0;
      }
      v46 = 0;
LABEL_47:

      objc_autoreleasePoolPop(v36);
      if (v46)
      {
        +[_MLCANEModel objectWithModel:options:qos:plist:](_MLCANEModel, "objectWithModel:options:qos:plist:", v43, MEMORY[0x1E0C9AA70], v81, v79);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v33);
        v48 = objc_claimAutoreleasedReturnValue();
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v75 = (void *)v48;
        objc_msgSend(v73, "objectForKeyedSubscript:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v86;
          while (2)
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v86 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
              objc_msgSend(v54, "deviceOps");
              v55 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v55, "objectAtIndexedSubscript:", 0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              v84 = 0;
              LOBYTE(v55) = -[MLCDeviceANE allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:](v31, "allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:", v54, &v84);
              v57 = v84;
              if ((v55 & 1) == 0)
              {
                +[MLCLog framework](MLCLog, "framework");
                v64 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v70;
                  v98 = v66;
                  v99 = 2112;
                  v100 = v54;
                  _os_log_error_impl(&dword_1D4999000, v64, OS_LOG_TYPE_ERROR, "%@: failed to allocate device memory for source and result tensors of layer=%@", buf, 0x16u);

                }
                v62 = 1;
                goto LABEL_69;
              }
              objc_msgSend(v56, "procedureName");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "modelAttributes");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLCDeviceANE ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:](v31, "ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:", v59, v58, v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
              {
                objc_msgSend(v56, "setRequest:", v60);
                objc_msgSend(v56, "setModel:", v82);
              }
              else
              {
                +[MLCLog framework](MLCLog, "framework");
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                  -[MLCDeviceANE postProcessCompiledGraph:compilerOptions:].cold.3((uint64_t)v95, (uint64_t)a2);

              }
              if (!v60)
              {
                v62 = 1;
                v31 = v83;
                goto LABEL_69;
              }
              v31 = v83;
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
            v62 = 0;
            if (v51)
              continue;
            break;
          }
        }
        else
        {
          v62 = 0;
        }
LABEL_69:

        v29 = v76;
        v63 = v79;
      }
      else
      {
        v62 = 1;
        v63 = v79;
        v29 = v76;
      }

      if (v62)
      {
        v27 = 0;
        goto LABEL_76;
      }
      v32 = v78 + 1;
      v30 = obj;
    }
    while (v78 + 1 != v77);
    v27 = 1;
    v77 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
    if (v77)
      continue;
    break;
  }
LABEL_76:
  v6 = v71;
  v10 = v73;
  v25 = v74;
LABEL_87:

LABEL_88:
  return v27;
}

- (BOOL)transferTensor:(id)a3 fromDevice:(id)a4
{
  id v7;
  MLCDeviceANE *v8;
  char isKindOfClass;
  BOOL v10;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __IOSurface *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  char *BaseAddress;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (MLCDeviceANE *)a4;
  if (!v8 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), self == v8) && (isKindOfClass & 1) != 0)
  {
    v10 = 1;
    goto LABEL_5;
  }
  v12 = objc_msgSend(v7, "deviceIndex");
  objc_msgSend(v7, "deviceMemory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v7, "deviceMemory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    objc_msgSend(v7, "deviceMemory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 == 1)
    {
      -[MLCDeviceANE allocateDeviceMemoryForTensor:](self, "allocateDeviceMemoryForTensor:", v7);
      objc_msgSend(v7, "deviceMemory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count") == 1)
      {

        goto LABEL_20;
      }
      objc_msgSend(v7, "deviceMemory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 1;
      objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) == 0)
      {
LABEL_20:
        +[MLCLog framework](MLCLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE transferTensor:fromDevice:].cold.1();
LABEL_24:
        v34 = 1;
LABEL_37:

        v10 = v34 == 0;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(v7, "deviceMemory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 != 2)
      {
        +[MLCLog framework](MLCLog, "framework");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[MLCDeviceANE transferTensor:fromDevice:].cold.4();
        goto LABEL_24;
      }
      objc_msgSend(v7, "deviceMemory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v25)
      {
        v26 = 0;
        while (1)
        {
          objc_msgSend(v7, "deviceMemory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v29 = objc_opt_isKindOfClass();

          if ((v29 & 1) != 0)
            break;
          if (v25 == ++v26)
            goto LABEL_26;
        }
        v17 = v26;
      }
    }
LABEL_26:
    v35 = objc_msgSend(v7, "calculateBatchSizeToUse");
    objc_msgSend(v7, "deviceMemory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", v17);
    v33 = objc_claimAutoreleasedReturnValue();

    -[NSObject liveIOStatus](v33, "liveIOStatus");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37 && objc_msgSend(v37, "count"))
    {
      -[NSObject ioSurfaceObject](v33, "ioSurfaceObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (__IOSurface *)objc_msgSend(v39, "ioSurface");

      IOSurfaceLock(v40, 0, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(v40);
      objc_msgSend(v7, "deviceMemory");
      v41 = v35;
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v42, "objectAtIndexedSubscript:", v12);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_retainAutorelease(v43);
      LOBYTE(v42) = ANE_ConvertInputTensor(v7, v38, (char *)-[NSObject bytes](v44, "bytes"), -[NSObject length](v44, "length"), BaseAddress, v41);
      IOSurfaceUnlock(v40, 0, 0);
      if ((v42 & 1) != 0)
      {
        objc_msgSend(v7, "setDeviceIndex:", v17);
        v34 = 0;
LABEL_36:

        goto LABEL_37;
      }
      +[MLCLog framework](MLCLog, "framework");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE transferTensor:fromDevice:].cold.3();

    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[MLCDeviceANE transferTensor:fromDevice:].cold.2();
    }
    v34 = 1;
    goto LABEL_36;
  }
  +[MLCLog framework](MLCLog, "framework");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceMemory");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", v12);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v52 = v46;
    v53 = 2112;
    v54 = (id)objc_opt_class();
    v49 = v54;
    _os_log_error_impl(&dword_1D4999000, v21, OS_LOG_TYPE_ERROR, "%@: unsupported device memory class=%@", buf, 0x16u);

  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (void)setDeviceMemoryForTensor:(id)a3 data:(id)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

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
        -[MLCDeviceANE updateDeviceMemoryForTensor:].cold.2(a2);
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
    -[MLCDeviceANE updateDeviceMemoryForTensor:].cold.1(a2);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceList, 0);
}

- (void)dispatchForwardLayer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anefModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "qos");
  objc_msgSend(v4, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v6, "evaluateWithQoS:options:request:error:", v9, v11, v7, &v16);
  v13 = v16;

  if ((v12 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v13;
      _os_log_error_impl(&dword_1D4999000, v14, OS_LOG_TYPE_ERROR, "%@: failed to evaluate model=%@ : error=%@", buf, 0x20u);

    }
  }

}

- (void)dispatchForwardConcatLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardSplitLayer:(id)a3 sourceTensor:(id)a4 resultTensors:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientConcatLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientSplitLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardFullyConnectedLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  -[MLCDeviceANE dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:](self, "dispatchForwardLayer:sourceTensor:resultTensor:resultStateIsTemporary:forTraining:", a3, a4, a5, 0, a6);
}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 tertiaryTensor:(id)a6 resultTensor:(id)a7 resultStateIsTemporary:(BOOL)a8 forTraining:(BOOL)a9
{
  NSObject *v10;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

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
  NSObject *v11;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 secondaryResultGradientTensor:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientLossLayer:(id)a3 sourceGradientTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultGradientTensor:(id)a8
{
  NSObject *v9;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardAndGradientLossLayer:(id)a3 sourceTensor:(id)a4 labelsTensor:(id)a5 labelsTensorStride:(unint64_t)a6 weightsTensor:(id)a7 resultTensor:(id)a8 resultGradientTensor:(id)a9
{
  NSObject *v10;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchRNNForwardLayer:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchRNNGradientLayer:(id)a3 sourceGradientTensors:(id)a4 resultGradientTensors:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)incrementReadCountForTensorDeviceMemory:(id)a3 increment:(int64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)incrementReadCountForGradientState:(id)a3 increment:(int64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardMHALayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientMHALayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5 resultStateIsTemporary:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardMatMulLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientMatMulLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensors:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardSliceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardReshapeLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 resultStateIsTemporary:(BOOL)a6 forTraining:(BOOL)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientSliceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientReshapeLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardEmbeddingLayer:(id)a3 weight:(id)a4 sourceTensor:(id)a5 resultTensor:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchGradientEmbeddingLayer:(id)a3 sourceGradientTensor:(id)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)dispatchForwardReduceLayer:(id)a3 sourceTensor:(id)a4 resultTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7 forTraining:(BOOL)a8
{
  NSObject *v9;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, *(_QWORD *)&a6, a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchGradientReduceLayer:(id)a3 sourceGradientTensor:(id)a4 resultGradientTensor:(id)a5 reductionType:(int)a6 reduceDimensions:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, *(_QWORD *)&a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

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

- (void)dispatchForwardCompareLayer:(id)a3 sourceTensor:(id)a4 secondaryTensor:(id)a5 resultTensor:(id)a6 compareOp:(int)a7 forTraining:(BOOL)a8
{
  NSObject *v9;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, *(_QWORD *)&a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)optimizeComputationForTrainingGraph:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchForwardGatherLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)dispatchForwardScatterLayer:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5 forTraining:(BOOL)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE setDeviceMemoryForTensor:data:].cold.1(a2);

}

- (void)sumSharedGradientsForConvolutionLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

}

- (void)sumSharedGradientsForNormalizationLayerTensorParameter:(id)a3 layerIndexForSummedGradients:(unint64_t)a4 isBetaTensor:(BOOL)a5
{
  NSObject *v6;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCLayerOperations) lossLayerWithDescriptor:].cold.1(a2);

}

- (void)updateConvolutionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateFullyConnectedLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateBatchNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 meanTensor:(id)a7 varianceTensor:(id)a8 arrayOfParams:(id)a9
{
  NSObject *v10;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateInstanceNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateLayerNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateGroupNormalizationLayer:(id)a3 optimizer:(id)a4 betaParameter:(id)a5 gammaParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateRNNLayer:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  NSObject *v9;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)restoreRNNParamsWithDeviceOps:(id)a3 optimizer:(id)a4 inputWeightsParameter:(id)a5 hiddenWeightsParameter:(id)a6 biasesParameter:(id)a7 arrayOfParams:(id)a8
{
  NSObject *v9;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateTensorParameter:(id)a3 optimizer:(id)a4 gradient:(id)a5 arrayOfParams:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateMultiheadAttentionLayer:(id)a3 optimizer:(id)a4 weightsParameter:(id)a5 biasesParameter:(id)a6 arrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateEmbeddingLayer:(id)a3 weightsParameter:(id)a4 optimizer:(id)a5 arrayOfParams:(id)a6
{
  NSObject *v7;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)synchronizeUpdatesForLayer:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)synchronizeOptimizerUpdatesForTensor:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)convertUpdatesToTensorDataForLayer:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)convertUpdatesToTensorDataForTensorParameters:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)setOptimizerLearningRate:(id)a3 learningRate:(float)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)setOptimizerTimeStep:(id)a3 timeStep:(unint64_t)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:(id)a3
{
  NSObject *v4;

  +[MLCLog framework](MLCLog, "framework", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)accumulateParams:(void *)a3 gradients:(void *)a4 accumulators:(void *)a5 numOfParameters:(unint64_t)a6 inArrayOfParams:(id)a7
{
  NSObject *v8;

  +[MLCLog framework](MLCLog, "framework", a3, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)updateAllParametersWithOptimizer:(id)a3 arrayOfParameters:(id)a4
{
  NSObject *v5;

  +[MLCLog framework](MLCLog, "framework", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLCDeviceANE(MLCEngineDispatch) dispatchForwardConcatLayer:sourceTensors:resultTensor:].cold.1(a2);

}

- (void)initWithType:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: no Apple Neural Engine available", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateDeviceMemoryForTensor:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: invalid device memory size=%lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateDeviceMemoryForTensor:(NSObject *)a3 .cold.2(const char *a1, int a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failed to get the ANEC IR data type from MLCompute data type=%d", v6, 0x12u);

  OUTLINED_FUNCTION_4_1();
}

- (void)allocateDeviceMemoryForTensor:(const char *)a1 .cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: failed to allocate device memory", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)getHostPointerIfUnifiedDeviceMemory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_2(&dword_1D4999000, v0, v1, "%s: no IOSurface allocated for tensor=%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

- (void)readTensor:fromDeviceIndex:targetBuffer:batchSize:.cold.1()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to read tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.1()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: the device memory has not been allocated for tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.2()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: empty liveIOStatus in tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)writeToDevice:toDeviceIndex:batchSize:.cold.3()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to write tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)writeToDevice:(const char *)a1 toDeviceIndex:batchSize:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: Tensor's device memory was not converted to ANE data structure", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)allocateDeviceMemoryForSourceAndResultTensorsOfLayer:tensorLabelToIOSurfaceMap:.cold.1()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to allocate device memory for tensor=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)procedureInformationWithModelAttributes:(const char *)a1 procedureName:procedureID:procedureInputSymbols:procedureInputSymbolIndices:procedureOutputSymbols:procedureOutputSymbolIndices:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: one or more AppleNeuralEngine symbols cannot be found", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)ANERequestWithModelAttributes:(const char *)a1 procedureName:tensorLabelToIOSurfaceMap:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: empty tensor label to ioSurface map", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:.cold.2()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: can not find the IOSurface object of result tensor label=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)ANERequestWithModelAttributes:procedureName:tensorLabelToIOSurfaceMap:.cold.3()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: can not find the IOSurface object of source tensor label=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.1()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: no layers in graph : %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)postProcessCompiledGraph:(const char *)a1 compilerOptions:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1D4999000, a2, OS_LOG_TYPE_DEBUG, "%@: no ANE compiled layer in the graph", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  const char *v5;
  void *v6;

  v5 = (const char *)OUTLINED_FUNCTION_10_2(a1, a2);
  NSStringFromSelector(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v6;
  OUTLINED_FUNCTION_7(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%@: failed to build an ANE request", v4);

  OUTLINED_FUNCTION_11_1();
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  const char *v5;
  void *v6;

  v5 = (const char *)OUTLINED_FUNCTION_10_2(a1, a2);
  NSStringFromSelector(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v6;
  OUTLINED_FUNCTION_7(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%@: failed to convert the ANEC IR plist in dictionary to NSData", v4);

  OUTLINED_FUNCTION_11_1();
}

- (void)postProcessCompiledGraph:(uint64_t)a1 compilerOptions:(uint64_t)a2 .cold.5(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  const char *v5;
  void *v6;

  v5 = (const char *)OUTLINED_FUNCTION_10_2(a1, a2);
  NSStringFromSelector(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v6;
  OUTLINED_FUNCTION_7(&dword_1D4999000, v2, OS_LOG_TYPE_ERROR, "%@: failed to create ANE model descriptor", v4);

  OUTLINED_FUNCTION_11_1();
}

- (void)postProcessCompiledGraph:(const char *)a1 compilerOptions:.cold.6(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: there must be only one plist when layer fusion is enabled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.7()
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
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: there are at most %lu plists when layer fusion is disabled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.8()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: layer=%@ compiled for ANE device does not have a plist builder instance bound", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)postProcessCompiledGraph:compilerOptions:.cold.9()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to build an ANEC IR procedure with layer=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to allocate ANEIOSurface for a tensor = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)transferTensor:fromDevice:.cold.2()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: empty liveIOStatus in tensor = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)transferTensor:fromDevice:.cold.3()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: failed to write tensor = %@ to ANE device", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)transferTensor:fromDevice:.cold.4()
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
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v2, v3, "%@: tensor = %@ shouldn't have more than 2 elements within deviceMemory", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)setDeviceMemoryForTensor:(const char *)a1 data:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: not supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
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
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: unsupported number of device memory", v4, v5, v6, v7, v8);

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
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: cannot find IOSurface in device memory", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
