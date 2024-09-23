@implementation MLNeuralNetworkMLComputeLayer

+ (id)convolutionalLayerWithKernelHeight:(unint64_t)a3 kernelWidth:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 dilationRateInX:(unint64_t)a9 dilationRateInY:(unint64_t)a10 nGroups:(unint64_t)a11 weight:(id)a12 bias:(id)a13 paddingPolicy:(int)a14
{
  id v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v18 = a13;
  if (a11 <= 1)
    v19 = 1;
  else
    v19 = a11;
  v20 = v19 * a5;
  v21 = (void *)MEMORY[0x1E0CC1408];
  v22 = a12;
  v41 = v20;
  objc_msgSend(v21, "convolutionWeightsDescriptorWithWidth:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", a4, a3, v20, a6, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:data:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v18;
  v38 = a6;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CC1408], "convolutionBiasesDescriptorWithFeatureChannelCount:dataType:", a6, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:data:", v23, v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  v37 = (void *)MEMORY[0x1E0CC1368];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = a14;
  objc_msgSend(v37, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:paddingSizes:", v26, v41, v38, a11, v29, v32, v36, &unk_1E3DA2978);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC1370], "layerWithWeights:biases:descriptor:", v44, v42, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)fullyConnectedLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 weight:(id)a7 bias:(id)a8
{
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a8;
  v14 = (void *)MEMORY[0x1E0CC1408];
  v15 = a7;
  objc_msgSend(v14, "convolutionWeightsDescriptorWithWidth:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", a3, a4, a5, a6, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:data:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CC1408], "convolutionBiasesDescriptorWithFeatureChannelCount:dataType:", a6, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithDescriptor:data:", v18, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CC1368], "descriptorWithKernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:", a3, a4, a5, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1380], "layerWithWeights:biases:descriptor:", v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)uniDirectionalLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeightsData:(id)a5 recursionWeightsData:(id)a6 hasBias:(BOOL)a7 biasTermsData:(id)a8 sequenceOutput:(BOOL)a9 inputGateActivation:(id)a10 cellGateActivation:(id)a11 hiddenOutputActivation:(id)a12
{
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  double v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _BOOL4 v54;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v13 = a7;
  v73 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v53 = a10;
  v52 = a11;
  v51 = a12;
  v18 = objc_msgSend(v15, "count");
  if (v18 != objc_msgSend(v16, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("inputWeightsData.count (%tu) != recursionWeightsData.count (%tu)"), objc_msgSend(v15, "count"), objc_msgSend(v16, "count"));
  v49 = v16;
  if (v13)
  {
    v19 = objc_msgSend(v17, "count");
    if (v19 != objc_msgSend(v15, "count"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("biasTermsData.count (%tu) != inputWeightsData.count (%tu)"), objc_msgSend(v17, "count"), objc_msgSend(v15, "count"), v16);
  }
  v54 = v13;
  v20 = (void *)MEMORY[0x1E0C9AA60];
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v22 = (void *)objc_msgSend(v20, "mutableCopy");
  v23 = (void *)objc_msgSend(v20, "mutableCopy");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v24 = v15;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v66 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a4 * a3, 1, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v26);
  }
  v50 = v24;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v30 = v49;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v62 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a4 * a4, 1, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v32);
  }

  if (v54)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v37 = v17;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v58 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a4, 1, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v39);
    }

  }
  LOBYTE(v48) = a9;
  LODWORD(v36) = 0;
  objc_msgSend(MEMORY[0x1E0CC1398], "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", a3, a4, 1, v36, v48, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0CC13A0];
  v69[0] = v53;
  v69[1] = v53;
  v69[2] = v52;
  v69[3] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v43, v21, v22, 0, v23, v45, v51);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

+ (id)batchNormLayerWithFeatureChannels:(unint64_t)a3 varianceEpsilon:(float)a4 gamma:(id)a5 beta:(id)a6 mean:(id)a7 variance:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;

  v13 = (void *)MEMORY[0x1E0CC13F8];
  v14 = a8;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v13, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a3, 1, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a3, 1, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a3, 1, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC13F8], "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a3, 1, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v21 = a4;
  objc_msgSend(MEMORY[0x1E0CC1358], "layerWithFeatureChannelCount:mean:variance:beta:gamma:varianceEpsilon:", a3, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)reshapeLayerWithChannelFirstOrderingAndTargetShape:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CC13E0], "layerWithShape:", a3);
}

+ (id)concatNDLayerWithAxis:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CC1360], "layerWithDimension:", a3);
}

+ (id)transposeLayerWithAxes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CC1418], "layerWithDimensions:", a3);
}

+ (id)poolingLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 strideInX:(unint64_t)a5 strideInY:(unint64_t)a6 paddingPolicy:(int)a7 poolingType:(int)a8
{
  uint64_t v8;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v8 = *(_QWORD *)&a7;
  v27[2] = *MEMORY[0x1E0C80C00];
  if (a8 == 2)
  {
    v20 = (void *)MEMORY[0x1E0CC13D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "averagePoolingDescriptorWithKernelSizes:strides:paddingPolicy:paddingSizes:countIncludesPadding:", v15, v18, v8, 0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a8 != 1)
    {
      v21 = 0;
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x1E0CC13D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maxPoolingDescriptorWithKernelSizes:strides:paddingPolicy:paddingSizes:", v15, v18, v8, 0);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v19;

LABEL_7:
  objc_msgSend(MEMORY[0x1E0CC13D8], "layerWithDescriptor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)sigmoid
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CC1340], "descriptorWithType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1348], "layerWithDescriptor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)softmax
{
  return (id)objc_msgSend(MEMORY[0x1E0CC13F0], "layerWithOperation:", 0);
}

+ (id)relu
{
  double v2;
  void *v3;
  void *v4;

  LODWORD(v2) = 0;
  objc_msgSend(MEMORY[0x1E0CC1340], "descriptorWithType:a:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1348], "layerWithDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)leakyRelu
{
  double v2;
  void *v3;
  void *v4;

  LODWORD(v2) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CC1340], "descriptorWithType:a:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1348], "layerWithDescriptor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reluNLayerWithAlpha:(float)a3 beta:(float)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CC1340], "descriptorWithType:a:b:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC1348], "layerWithDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)matMulLayerWithTransposesX:(BOOL)a3 transposesY:(BOOL)a4
{
  double v4;
  void *v5;
  void *v6;

  LODWORD(v4) = 1.0;
  objc_msgSend(MEMORY[0x1E0CC13B8], "descriptorWithAlpha:transposesX:transposesY:", a3, a4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13C0], "layerWithDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)categoricalCrossEntropyLossWithNumberOfClasses:(unint64_t)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  LODWORD(v3) = 1.0;
  LODWORD(v4) = 0;
  objc_msgSend(MEMORY[0x1E0CC13A8], "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 2, 2, a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13B0], "layerWithDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)meanSquaredErrorLoss
{
  double v2;
  double v3;
  void *v4;
  void *v5;

  LODWORD(v2) = 1.0;
  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CC13A8], "descriptorWithType:reductionType:weight:labelSmoothing:classCount:", 1, 2, 1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC13B0], "layerWithDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sgdOptimizerWithLearningRate:(double)a3 momentum:(double)a4
{
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;

  v5 = a4;
  *(float *)&a3 = a3;
  LODWORD(a4) = 1.0;
  LODWORD(v4) = 1.0;
  objc_msgSend(MEMORY[0x1E0CC13C8], "descriptorWithLearningRate:gradientRescale:regularizationType:regularizationScale:", 0, a3, a4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(MEMORY[0x1E0CC13E8], "optimizerWithDescriptor:momentumScale:usesNesterovMomentum:", v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)adamOptimizerWithLearningRate:(double)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(double)a6 timeStep:(unint64_t)a7
{
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v9 = a5;
  v10 = a4;
  *(float *)&a3 = a3;
  LODWORD(a4) = 1.0;
  LODWORD(a5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CC13C8], "descriptorWithLearningRate:gradientRescale:regularizationType:regularizationScale:", 0, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v10;
  *(float *)&v13 = v9;
  *(float *)&v14 = a6;
  objc_msgSend(MEMORY[0x1E0CC1350], "optimizerWithDescriptor:beta1:beta2:epsilon:timeStep:", v11, a7, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
