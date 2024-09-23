@implementation MLCConvolutionLayer(CoreMLModelSpecification)

+ (id)convolutionLayer:()CoreMLModelSpecification error:
{
  uint64_t *v6;
  void *v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _BOOL4 v23;
  unint64_t v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;

  if (*(_QWORD *)(a3 + 112))
    v6 = *(uint64_t **)(a3 + 112);
  else
    v6 = &CoreML::Specification::_WeightParams_default_instance_;
  v29 = 0;
  _validateAndGetData((uint64_t)v6, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  if (v7)
  {
    if (*(_BYTE *)(a3 + 153))
    {
      if (*(_QWORD *)(a3 + 120))
        v9 = *(uint64_t **)(a3 + 120);
      else
        v9 = &CoreML::Specification::_WeightParams_default_instance_;
      v28 = v8;
      _validateAndGetData((uint64_t)v9, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;

      if (!v10)
      {
        if (!a4)
        {
          v10 = 0;
          v12 = 0;
          goto LABEL_36;
        }
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v11, CFSTR("Failed to construct convolutional layer due to non supported bias type."));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        goto LABEL_32;
      }
      v8 = v11;
    }
    else
    {
      v10 = 0;
    }
    if (*(int *)(a3 + 16) < 1)
    {
      v14 = 3;
      v15 = 3;
    }
    else
    {
      v13 = *(_QWORD *)(a3 + 24);
      v14 = *(_QWORD *)(v13 + 8);
      v15 = *(_QWORD *)(v13 + 16);
    }
    if (*(int *)(a3 + 40) < 1)
    {
      v17 = 1;
      v18 = 1;
    }
    else
    {
      v16 = *(_QWORD *)(a3 + 48);
      v17 = *(_QWORD *)(v16 + 8);
      v18 = *(_QWORD *)(v16 + 16);
    }
    if (*(int *)(a3 + 64) < 1)
    {
      v20 = 1;
      v21 = 1;
    }
    else
    {
      v19 = *(_QWORD *)(a3 + 72);
      v20 = *(_QWORD *)(v19 + 8);
      v21 = *(_QWORD *)(v19 + 16);
    }
    v22 = *(_DWORD *)(a3 + 172);
    if (v22)
    {
      v23 = v22 != 51;
      v24 = *(_QWORD *)(a3 + 144);
      if (v24 <= 1)
        v24 = 1;
      LODWORD(v27) = v23;
      +[MLNeuralNetworkMLComputeLayer convolutionalLayerWithKernelHeight:kernelWidth:inputChannels:outputChannels:strideInX:strideInY:dilationRateInX:dilationRateInY:nGroups:weight:bias:paddingPolicy:](MLNeuralNetworkMLComputeLayer, "convolutionalLayerWithKernelHeight:kernelWidth:inputChannels:outputChannels:strideInX:strideInY:dilationRateInX:dilationRateInY:nGroups:weight:bias:paddingPolicy:", v14, v15, *(_QWORD *)(a3 + 136), *(_QWORD *)(a3 + 128), v17, v18, v20, v21, v24, v7, v10, v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (!a4)
    {
      v12 = 0;
LABEL_27:
      v11 = v8;
LABEL_36:

      v8 = v11;
      goto LABEL_37;
    }
    +[MLModelErrorUtils updateErrorWithFormat:](MLModelErrorUtils, "updateErrorWithFormat:", CFSTR("Convolution padding type not set or not supported"), v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
LABEL_32:
    v12 = 0;
    *a4 = v25;
    goto LABEL_36;
  }
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v8, CFSTR("Failed to construct convolutional layer due to non supported weight type."));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_37:

  return v12;
}

@end
