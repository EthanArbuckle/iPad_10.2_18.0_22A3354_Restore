@implementation VNDetectionprintMLFeatureProvider

- (VNDetectionprintMLFeatureProvider)initWithDetectionprint:(id)a3 featureDescriptions:(id)a4 originalFeatureProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  VNDetectionprintMLFeatureProvider *v12;
  VNDetectionprintMLFeatureProvider *v13;
  uint64_t v14;
  NSDictionary *detectionprintFeatureDescriptions;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNDetectionprintMLFeatureProvider;
  v12 = -[VNDetectionprintMLFeatureProvider init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_detectionprint, a3);
    v14 = objc_msgSend(v10, "copy");
    detectionprintFeatureDescriptions = v13->_detectionprintFeatureDescriptions;
    v13->_detectionprintFeatureDescriptions = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_originalFeatureProvider, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  id v3;
  void *v4;
  void *v5;
  MLFeatureProvider *originalFeatureProvider;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NSDictionary allKeys](self->_detectionprintFeatureDescriptions, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    -[MLFeatureProvider featureNames](originalFeatureProvider, "featureNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v7);

  }
  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNDetectionprint *detectionprint;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  id v32;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_detectionprintFeatureDescriptions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "VNDetectionprintTensorKeyForFeatureName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      detectionprint = self->_detectionprint;
      v32 = 0;
      -[VNDetectionprint tensorForKey:error:](detectionprint, "tensorForKey:error:", v6, &v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v32;
      if (v8)
      {
        objc_msgSend(v5, "multiArrayConstraint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v8, "VNEspressoModelImageprintMLMultiArrayWithConstraint:error:", v10, &v31);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v31;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "description");
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = objc_msgSend(v21, "UTF8String");
          objc_msgSend(v12, "localizedDescription");
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v23, "UTF8String");
          VNValidatedLog(4, (uint64_t)CFSTR("Unable to create detectionprint %s - %s"), v24, v25, v26, v27, v28, v29, v22);

          v13 = 0;
        }

      }
      else
      {
        v14 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        objc_msgSend(v9, "localizedDescription");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "UTF8String");
        VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain detection print tensor %s - %s"), v15, v16, v17, v18, v19, v20, v14);
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    -[MLFeatureProvider featureValueForName:](self->_originalFeatureProvider, "featureValueForName:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);
  objc_storeStrong((id *)&self->_detectionprintFeatureDescriptions, 0);
  objc_storeStrong((id *)&self->_detectionprint, 0);
}

+ (id)VNDetectionprintTensorKeyForFeatureName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::onceToken != -1)
    dispatch_once(&+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::onceToken, &__block_literal_global_98);
  objc_msgSend((id)+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __77__VNDetectionprintMLFeatureProvider_VNDetectionprintTensorKeyForFeatureName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mixed2");
  v2[1] = CFSTR("mixed6");
  v3[0] = CFSTR("VNDetectionprintTensorKeyMixed2");
  v3[1] = CFSTR("VNDetectionprintTensorKeyMixed6");
  v2[2] = CFSTR("stride8Feature");
  v2[3] = CFSTR("stride16Feature");
  v3[2] = CFSTR("VNDetectionprintTensorKeyStride8FeatureMap");
  v3[3] = CFSTR("VNDetectionprintTensorKeyStride16FeatureMap");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName;
  +[VNDetectionprintMLFeatureProvider VNDetectionprintTensorKeyForFeatureName:]::tensorKeyForFeatureName = v0;

}

@end
