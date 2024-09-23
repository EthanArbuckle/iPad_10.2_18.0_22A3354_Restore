@implementation MLCBatchNormalizationLayer(CoreMLModelSpecification)

+ (id)batchNormLayer:()CoreMLModelSpecification error:
{
  const CoreML::Specification::WeightParams *v6;
  const CoreML::Specification::WeightParams *v7;
  const CoreML::Specification::WeightParams *v8;
  const CoreML::Specification::WeightParams *v9;
  uint64_t *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t *v19;
  void *v20;
  double v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE v28[80];
  _BYTE v29[80];
  _BYTE v30[80];
  _BYTE v31[80];

  if (*(_QWORD *)(a3 + 16))
    v6 = *(const CoreML::Specification::WeightParams **)(a3 + 16);
  else
    v6 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v31, v6);
  if (*(_QWORD *)(a3 + 24))
    v7 = *(const CoreML::Specification::WeightParams **)(a3 + 24);
  else
    v7 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v30, v7);
  if (*(_QWORD *)(a3 + 32))
    v8 = *(const CoreML::Specification::WeightParams **)(a3 + 32);
  else
    v8 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v29, v8);
  if (*(_QWORD *)(a3 + 40))
    v9 = *(const CoreML::Specification::WeightParams **)(a3 + 40);
  else
    v9 = (const CoreML::Specification::WeightParams *)&CoreML::Specification::_WeightParams_default_instance_;
  CoreML::Specification::WeightParams::WeightParams((CoreML::Specification::WeightParams *)v28, v9);
  if (*(_QWORD *)(a3 + 16))
    v10 = *(uint64_t **)(a3 + 16);
  else
    v10 = &CoreML::Specification::_WeightParams_default_instance_;
  v27 = 0;
  _validateAndGetData((uint64_t)v10, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  if (v11)
  {
    if (*(_QWORD *)(a3 + 24))
      v13 = *(uint64_t **)(a3 + 24);
    else
      v13 = &CoreML::Specification::_WeightParams_default_instance_;
    v26 = v12;
    _validateAndGetData((uint64_t)v13, &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v26;

    if (v14)
    {
      if (*(_QWORD *)(a3 + 32))
        v16 = *(uint64_t **)(a3 + 32);
      else
        v16 = &CoreML::Specification::_WeightParams_default_instance_;
      v25 = v15;
      _validateAndGetData((uint64_t)v16, &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v25;

      if (v17)
      {
        if (*(_QWORD *)(a3 + 40))
          v19 = *(uint64_t **)(a3 + 40);
        else
          v19 = &CoreML::Specification::_WeightParams_default_instance_;
        v24 = v18;
        _validateAndGetData((uint64_t)v19, &v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v24;

        if (v20)
        {
          LODWORD(v21) = *(_DWORD *)(a3 + 60);
          +[MLNeuralNetworkMLComputeLayer batchNormLayerWithFeatureChannels:varianceEpsilon:gamma:beta:mean:variance:](MLNeuralNetworkMLComputeLayer, "batchNormLayerWithFeatureChannels:varianceEpsilon:gamma:beta:mean:variance:", *(_QWORD *)(a3 + 48), v11, v14, v17, v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (a4)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v15, CFSTR("Failed to construct batchnorm layer due to non supported variance weight type."));
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        if (a4)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v18, CFSTR("Failed to construct batchnorm layer due to non supported mean weight type."));
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v15 = v18;
      }

    }
    else if (a4)
    {
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v15, CFSTR("Failed to construct batchnorm layer due to non supported beta weight type."));
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

    v12 = v15;
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v12, CFSTR("Failed to construct batchnorm layer due to non supported gamma weight type."));
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v28);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v29);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v30);
  CoreML::Specification::WeightParams::~WeightParams((CoreML::Specification::WeightParams *)v31);
  return v22;
}

@end
