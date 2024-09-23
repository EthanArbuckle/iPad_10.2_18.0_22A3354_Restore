@implementation MLCFullyConnectedLayer(CoreMLModelSpecification)

+ (id)innerProductLayer:()CoreMLModelSpecification error:
{
  uint64_t *v6;
  void *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;

  if (*(_QWORD *)(a3 + 16))
    v6 = *(uint64_t **)(a3 + 16);
  else
    v6 = &CoreML::Specification::_WeightParams_default_instance_;
  v16 = 0;
  _validateAndGetData((uint64_t)v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    if (!*(_BYTE *)(a3 + 48))
    {
      v12 = 0;
      goto LABEL_14;
    }
    if (*(_QWORD *)(a3 + 24))
      v9 = *(uint64_t **)(a3 + 24);
    else
      v9 = &CoreML::Specification::_WeightParams_default_instance_;
    v15 = v8;
    _validateAndGetData((uint64_t)v9, &v15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v10)
    {
      v8 = v11;
      v12 = (void *)v10;
LABEL_14:
      +[MLNeuralNetworkMLComputeLayer fullyConnectedLayerWithKernelWidth:kernelHeight:inputChannels:outputChannels:weight:bias:](MLNeuralNetworkMLComputeLayer, "fullyConnectedLayerWithKernelWidth:kernelHeight:inputChannels:outputChannels:weight:bias:", 1, 1, *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 40), v7, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    if (a4)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to construct innerproduct layer due to non supported bias type."));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v8 = v11;
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v8, CFSTR("Failed to construct innerproduct layer due to non supported weight type."));
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_20:

  return v13;
}

+ (id)innerProductLayerWithBatchedMatMulParams:()CoreMLModelSpecification error:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v6 = *(_QWORD *)(a3 + 32);
  v7 = *(_QWORD *)(a3 + 40);
  if (*(_QWORD *)(a3 + 16))
    v8 = *(uint64_t **)(a3 + 16);
  else
    v8 = &CoreML::Specification::_WeightParams_default_instance_;
  v18 = 0;
  _validateAndGetData((uint64_t)v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v9)
  {
    if (!*(_BYTE *)(a3 + 50))
    {
      v14 = 0;
      goto LABEL_14;
    }
    if (*(_QWORD *)(a3 + 24))
      v11 = *(uint64_t **)(a3 + 24);
    else
      v11 = &CoreML::Specification::_WeightParams_default_instance_;
    v17 = v10;
    _validateAndGetData((uint64_t)v11, &v17);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (v12)
    {
      v10 = v13;
      v14 = (void *)v12;
LABEL_14:
      +[MLNeuralNetworkMLComputeLayer fullyConnectedLayerWithKernelWidth:kernelHeight:inputChannels:outputChannels:weight:bias:](MLNeuralNetworkMLComputeLayer, "fullyConnectedLayerWithKernelWidth:kernelHeight:inputChannels:outputChannels:weight:bias:", 1, 1, v6, v7, v9, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    if (a4)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v13, CFSTR("Failed to construct innerProduct layer from batchedMatMulLayer Params due to non supported bias type."));
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v10 = v13;
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v10, CFSTR("Failed to construct innerProduct layer from batchedMatMulLayer Params due to non supported weight type."));
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

@end
