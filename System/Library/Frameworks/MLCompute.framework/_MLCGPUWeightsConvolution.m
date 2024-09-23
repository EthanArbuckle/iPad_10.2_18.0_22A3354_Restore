@implementation _MLCGPUWeightsConvolution

+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:biasTerms:weights:neuronDescriptor:", v10, v9, v8, 0);

  return v11;
}

+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:biasTerms:weights:neuronDescriptor:", v13, v12, v11, v10);

  return v14;
}

- (_MLCGPUWeightsConvolution)initWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6
{
  id v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _MLCGPUWeightsConvolution *v16;
  _MLCGPUWeightsConvolution *v17;
  MLCTensor *localWeight;
  MLCTensor *localBiasTerm;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  MPSCNNConvolutionDescriptor *descMPS;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  NSObject *v40;
  _MLCGPUWeightsConvolution *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MLCTensor *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  MLCTensor *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  NSObject *v67;
  void *v69;
  const char *v70;
  void *v71;
  id obj;
  objc_super v73;

  v9 = a3;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v73.receiver = self;
  v73.super_class = (Class)_MLCGPUWeightsConvolution;
  v16 = -[_MLCGPUWeightsConvolution init](&v73, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_19;
  v70 = a2;
  localWeight = v16->_localWeight;
  v16->_localWeight = 0;

  localBiasTerm = v17->_localBiasTerm;
  v17->_localBiasTerm = 0;

  if (objc_msgSend(v12, "usesDepthwiseConvolution"))
  {
    if (objc_msgSend(v12, "inputFeatureChannelCount"))
    {
      v20 = objc_msgSend(v12, "outputFeatureChannelCount");
      if (v20 / objc_msgSend(v12, "inputFeatureChannelCount") != 1)
      {
        +[MLCLog framework](MLCLog, "framework");
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          -[_MLCGPUWeightsConvolution initWithDescriptor:biasTerms:weights:neuronDescriptor:].cold.2(v70);

        goto LABEL_23;
      }
    }
    obj = v13;
    v21 = (void *)MEMORY[0x1E0CC6CE8];
    v22 = objc_msgSend(v12, "kernelWidth");
    v23 = objc_msgSend(v12, "kernelHeight");
    v24 = objc_msgSend(v12, "inputFeatureChannelCount");
    v25 = objc_msgSend(v12, "outputFeatureChannelCount");
    v26 = v21;
    v27 = v22;
    v28 = v23;
    v29 = v24;
  }
  else
  {
    obj = v13;
    v30 = (void *)MEMORY[0x1E0CC6CB0];
    v31 = objc_msgSend(v12, "kernelWidth");
    v32 = objc_msgSend(v12, "kernelHeight");
    v33 = objc_msgSend(v12, "inputFeatureChannelCount");
    v25 = objc_msgSend(v12, "outputFeatureChannelCount");
    v26 = v30;
    v27 = v31;
    v28 = v32;
    v29 = v33;
  }
  objc_msgSend(v26, "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", v27, v28, v29, v25);
  v34 = objc_claimAutoreleasedReturnValue();
  descMPS = v17->_descMPS;
  v17->_descMPS = (MPSCNNConvolutionDescriptor *)v34;

  -[MPSCNNConvolutionDescriptor setStrideInPixelsX:](v17->_descMPS, "setStrideInPixelsX:", objc_msgSend(v12, "strideInX"));
  -[MPSCNNConvolutionDescriptor setStrideInPixelsY:](v17->_descMPS, "setStrideInPixelsY:", objc_msgSend(v12, "strideInY"));
  -[MPSCNNConvolutionDescriptor setDilationRateX:](v17->_descMPS, "setDilationRateX:", objc_msgSend(v12, "dilationRateInX"));
  -[MPSCNNConvolutionDescriptor setDilationRateY:](v17->_descMPS, "setDilationRateY:", objc_msgSend(v12, "dilationRateInY"));
  if ((unint64_t)objc_msgSend(v12, "groupCount") < 2
    || (v36 = objc_msgSend(v12, "inputFeatureChannelCount"),
        v37 = v36 / objc_msgSend(v12, "groupCount"),
        v38 = objc_msgSend(v12, "outputFeatureChannelCount"),
        v39 = objc_msgSend(v12, "groupCount"),
        (v37 & 3) == 0)
    && ((v38 / v39) & 3) == 0)
  {
    -[MPSCNNConvolutionDescriptor setGroups:](v17->_descMPS, "setGroups:", objc_msgSend(v12, "groupCount"));
    if (objc_msgSend(v12, "isConvolutionTranspose"))
    {
      objc_msgSend(v14, "descriptor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = malloc_type_malloc(objc_msgSend(v42, "tensorAllocationSizeInBytes"), 0x4E4F2958uLL);

      objc_msgSend(v14, "data");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v43, objc_msgSend(v44, "length"), 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "descriptor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLCTensor tensorWithDescriptor:data:](MLCTensor, "tensorWithDescriptor:data:", v45, v71);
      v46 = (MLCTensor *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "descriptor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "shape");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "data");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCTensor data](v46, "data");
      v49 = v9;
      v50 = v14;
      v51 = v15;
      v52 = a6;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      rotateWeightsTensorBy180Degree(v47, v48, v53);

      a6 = v52;
      v15 = v51;
      v14 = v50;
      v9 = v49;

      objc_storeWeak((id *)&v17->_weight, v46);
      v54 = v17->_localWeight;
      v17->_localWeight = v46;

    }
    else
    {
      objc_storeWeak((id *)&v17->_weight, v14);
    }
    objc_storeStrong((id *)&v17->_desc, v9);
    v13 = obj;
    objc_storeWeak((id *)&v17->_biasTerm, obj);
    if (!v15)
      goto LABEL_19;
    objc_storeStrong((id *)&v17->_neuronDesc, a6);
    v55 = +[_MLCGPUNeuron mpsNeurontypeFrom:](_MLCGPUNeuron, "mpsNeurontypeFrom:", objc_msgSend(v15, "activationType"));
    if ((_DWORD)v55 != 16)
    {
      v56 = v55;
      v57 = (void *)MEMORY[0x1E0CC71E8];
      objc_msgSend(v15, "a");
      v59 = v58;
      objc_msgSend(v15, "b");
      v61 = v60;
      objc_msgSend(v15, "c");
      LODWORD(v63) = v62;
      LODWORD(v64) = v59;
      LODWORD(v65) = v61;
      objc_msgSend(v57, "cnnNeuronDescriptorWithType:a:b:c:", v56, v64, v65, v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSCNNConvolutionDescriptor setFusedNeuronDescriptor:](v17->_descMPS, "setFusedNeuronDescriptor:", v66);

LABEL_19:
      v41 = v17;
      goto LABEL_24;
    }
LABEL_23:
    v41 = 0;
    goto LABEL_24;
  }
  +[MLCLog framework](MLCLog, "framework");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    -[_MLCGPUWeightsConvolution initWithDescriptor:biasTerms:weights:neuronDescriptor:].cold.1(v70);

  v41 = 0;
  v13 = obj;
LABEL_24:

  return v41;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution descMPS](self, "descMPS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution desc](self, "desc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution weight](self, "weight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { descMPS=%@ : desc=%@ : weight=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (float)biasTerms
{
  void *v2;
  id v3;
  float *v4;

  -[_MLCGPUWeightsConvolution biasTerm](self, "biasTerm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (float *)objc_msgSend(v3, "bytes");

  return v4;
}

- (unsigned)dataType
{
  void *v2;
  void *v3;
  int v4;

  -[_MLCGPUWeightsConvolution weight](self, "weight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataType");

  if (v4 == 3)
    return 268435472;
  else
    return 268435488;
}

- (id)label
{
  void *v2;
  int v3;

  -[_MLCGPUWeightsConvolution desc](self, "desc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConvolutionTranspose");

  if (v3)
    return CFSTR("MPSWeightConvolutionTranspose");
  else
    return CFSTR("MPSWeightConvolution");
}

- (BOOL)load
{
  return 1;
}

- (void)weights
{
  void *v2;
  id v3;
  void *v4;

  -[_MLCGPUWeightsConvolution weight](self, "weight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (void *)objc_msgSend(v3, "bytes");

  return v4;
}

- (unsigned)weightsLayout
{
  return 1;
}

- (unsigned)kernelWeightsDataType
{
  void *v2;
  void *v3;
  int v4;

  -[_MLCGPUWeightsConvolution weight](self, "weight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dataType");

  if (v4 == 3)
    return 268435472;
  else
    return 268435488;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_MLCGPUWeightsConvolution desc](self, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution biasTerm](self, "biasTerm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution weight](self, "weight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLCGPUWeightsConvolution neuronDesc](self, "neuronDesc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithDescriptor:biasTerms:weights:neuronDescriptor:", v5, v6, v7, v8);

  return v9;
}

- (MLCTensor)weight
{
  return (MLCTensor *)objc_loadWeakRetained((id *)&self->_weight);
}

- (MLCTensor)biasTerm
{
  return (MLCTensor *)objc_loadWeakRetained((id *)&self->_biasTerm);
}

- (MLCTensor)localWeight
{
  return self->_localWeight;
}

- (void)setLocalWeight:(id)a3
{
  objc_storeStrong((id *)&self->_localWeight, a3);
}

- (MLCTensor)localBiasTerm
{
  return self->_localBiasTerm;
}

- (void)setLocalBiasTerm:(id)a3
{
  objc_storeStrong((id *)&self->_localBiasTerm, a3);
}

- (MLCActivationDescriptor)neuronDesc
{
  return self->_neuronDesc;
}

- (MPSCNNConvolutionDescriptor)descMPS
{
  return self->_descMPS;
}

- (MLCConvolutionDescriptor)desc
{
  return self->_desc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_descMPS, 0);
  objc_storeStrong((id *)&self->_neuronDesc, 0);
  objc_storeStrong((id *)&self->_localBiasTerm, 0);
  objc_storeStrong((id *)&self->_localWeight, 0);
  objc_destroyWeak((id *)&self->_biasTerm);
  objc_destroyWeak((id *)&self->_weight);
}

- (void)initWithDescriptor:(const char *)a1 biasTerms:weights:neuronDescriptor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: groupCount > 1 with Number of input/output channels in each group NOT be multiple of 4 is unsupported on GPU", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDescriptor:(const char *)a1 biasTerms:weights:neuronDescriptor:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: channel multiplier > 1 for depthWiseConvolution is not supported in MLCompute-GPU", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
