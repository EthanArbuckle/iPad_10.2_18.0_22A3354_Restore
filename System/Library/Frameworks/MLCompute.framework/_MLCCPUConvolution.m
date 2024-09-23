@implementation _MLCCPUConvolution

- (_MLCCPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _MLCCPUConvolution *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  objc_super v57;
  _OWORD v58[11];
  _OWORD v59[11];
  _BYTE v60[704];
  uint64_t v61;
  void *v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v50 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  bzero(v60, 0x348uLL);
  CPU_BuildBNNSConvolutionWeightAndBiasParams((uint64_t)v60, v15, v13, v14);
  v17 = objc_msgSend(v15, "isConvolutionTranspose");
  if (v17)
    v18 = 25;
  else
    v18 = 4;
  v56 = v14;
  if (v16)
  {
    v19 = v17;
    if (!setBNNSActivation((uint64_t)&v61, v16))
    {
      v37 = 0;
      v38 = v50;
      goto LABEL_24;
    }
    v48 = v12;
    if (v19)
      v20 = 26;
    else
      v20 = 5;
    v46 = v20;
  }
  else
  {
    v46 = v18;
    v48 = v12;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v60, 840);
  v21 = objc_claimAutoreleasedReturnValue();
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v59, 176);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v58, 176);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_class();
  objc_msgSend(v13, "descriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v15, 0, 0, objc_msgSend(v23, "dataType"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  for (i = 0; i != 3; ++i)
  {
    v26 = (void *)objc_opt_class();
    objc_msgSend(v13, "descriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v15, 0, 0, objc_msgSend(v27, "dataType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:atIndexedSubscript:", v28, i);

  }
  v47 = v16;
  v49 = (void *)v21;
  if (v56)
  {
    v29 = (void *)objc_opt_class();
    objc_msgSend(v56, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v15, 0, objc_msgSend(v30, "dataType"));
    v54 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    for (j = 0; j != 3; ++j)
    {
      v33 = (void *)objc_opt_class();
      objc_msgSend(v56, "descriptor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v15, 0, objc_msgSend(v34, "dataType"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:atIndexedSubscript:", v35, j);

    }
    v21 = (uint64_t)v49;
    v36 = (void *)v54;
  }
  else
  {
    v36 = 0;
    v31 = 0;
  }
  v63[0] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v36;
  +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", v46, v21, v39, v40, v51, v36, v24, v31);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v48;
  v14 = v56;
  v38 = v50;
  if (v41)
  {
    objc_msgSend(v50, "addObject:", v41);
    v42 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    objc_msgSend(v41, "setWeightsMomentumDataBytes:", v42);

    if (v56)
    {
      v43 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      objc_msgSend(v41, "setBiasMomentumDataBytes:", v43);

    }
    objc_msgSend(v41, "setPaddingPolicy:", objc_msgSend(v15, "paddingPolicy"));
  }
  v44 = (void *)objc_msgSend(v50, "copy");
  v57.receiver = self;
  v57.super_class = (Class)_MLCCPUConvolution;
  self = -[_MLCCPULayer initWithDevice:deviceOps:](&v57, sel_initWithDevice_deviceOps_, v48, v44);

  v37 = self;
  v16 = v47;
LABEL_24:

  return v37;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:weights:biasTerms:convolutionDescriptor:neuronDescriptor:", v16, v15, v14, v13, v12);

  return v17;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 convolutionTranspose:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  id v14;
  BNNSLayerParametersConvolution *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  BNNSFilterParameters v23;

  v7 = a7;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "params");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (BNNSLayerParametersConvolution *)objc_msgSend(v14, "bytes");
  CPU_BuildBNNSConvolutionInputOutputParams(v15, v11, v12, v7, objc_msgSend(v13, "paddingPolicy"));
  memset(&v23, 0, sizeof(v23));
  v23.flags = 1;
  if (v7)
    v16 = BNNSFilterCreateLayerTransposedConvolution(v15, &v23);
  else
    v16 = (void *)MEMORY[0x1D826396C](v15, &v23);
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v13, "setBNNSFilter:", v16, *(_OWORD *)&v23.flags, *(_OWORD *)&v23.alloc_memory);
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceStride:", CPU_SetBatchStride(v18));

    objc_msgSend(v13, "setResultStride:", CPU_SetBatchStride(v12));
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework", *(_OWORD *)&v23.flags, *(_OWORD *)&v23.alloc_memory);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[_MLCCPUConvolution compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:].cold.1(a2, v19);

  }
  objc_opt_class();
  v20 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLayer:", v20);

  objc_msgSend(v13, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFilter:", v17);

  return 1;
}

+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 biasDelta:(id)a4 dataType:(int)a5
{
  id v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v7 = a4;
  *((_QWORD *)&v10 + 1) = objc_msgSend(a3, "outputFeatureChannelCount", 0x1000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0,
                            0,
                            0,
                            0);
  *((_QWORD *)&v11 + 1) = 1;
  if (v7)
    *((_QWORD *)&v12 + 1) = objc_msgSend(objc_retainAutorelease(v7), "bytes");
  LODWORD(v13) = CPU_BNNSDataType(a5);
  *(_QWORD *)((char *)&v14 + 4) = 1065353216;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 176);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 weightsDelta:(id)a4 fullyConnected:(BOOL)a5 dataType:(int)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  if (v7)
  {
    DWORD1(v19) = 0x20000;
    *((_QWORD *)&v19 + 1) = objc_msgSend(v9, "inputFeatureChannelCount", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    *(_QWORD *)&v20 = objc_msgSend(v9, "outputFeatureChannelCount");
    *((_QWORD *)&v23 + 1) = 1;
    *(_QWORD *)&v24 = objc_msgSend(v9, "inputFeatureChannelCount");
    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "usesDepthwiseConvolution", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29))
    v11 = objc_msgSend(v9, "inputFeatureChannelCount");
  else
    v11 = objc_msgSend(v9, "groupCount");
  v12 = v11;
  DWORD1(v19) = 0x40000;
  v13 = objc_msgSend(v9, "kernelWidth");
  *((_QWORD *)&v19 + 1) = v13;
  v14 = objc_msgSend(v9, "kernelHeight");
  *(_QWORD *)&v20 = v14;
  v15 = objc_msgSend(v9, "inputFeatureChannelCount");
  if (v12 == 1)
    v16 = v15;
  else
    v16 = v15 / v12;
  *((_QWORD *)&v20 + 1) = v16;
  *(_QWORD *)&v21 = objc_msgSend(v9, "outputFeatureChannelCount");
  *((_QWORD *)&v23 + 1) = 1;
  *(_QWORD *)&v24 = v13;
  *((_QWORD *)&v24 + 1) = v14 * v13;
  *(_QWORD *)&v25 = v16 * v14 * v13;
  if (v10)
LABEL_11:
    *((_QWORD *)&v27 + 1) = objc_msgSend(objc_retainAutorelease(v10), "bytes");
LABEL_12:
  LODWORD(v28) = CPU_BNNSDataType(a6);
  *(_QWORD *)((char *)&v29 + 4) = 1065353216;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v19, 176);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(NSObject *)a2 sourceTensors:resultTensor:convolutionTranspose:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D4999000, a2, v4, "%@: BNNS filter could not be created", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_0();
}

@end
