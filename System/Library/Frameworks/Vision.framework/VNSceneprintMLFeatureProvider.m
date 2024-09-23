@implementation VNSceneprintMLFeatureProvider

- (VNSceneprintMLFeatureProvider)initWithSceneprint:(id)a3 dataType:(int64_t)a4 forKey:(id)a5 originalFeatureProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  VNSceneprintMLFeatureProvider *v14;
  VNSceneprintMLFeatureProvider *v15;
  uint64_t v16;
  NSString *sceneprintKey;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VNSceneprintMLFeatureProvider;
  v14 = -[VNSceneprintMLFeatureProvider init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sceneprint, a3);
    v16 = objc_msgSend(v12, "copy");
    sceneprintKey = v15->_sceneprintKey;
    v15->_sceneprintKey = (NSString *)v16;

    v15->_sceneprintDataType = a4;
    objc_storeStrong((id *)&v15->_originalFeatureProvider, a6);
  }

  return v15;
}

- (NSSet)featureNames
{
  void *v3;
  MLFeatureProvider *originalFeatureProvider;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", self->_sceneprintKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  originalFeatureProvider = self->_originalFeatureProvider;
  if (originalFeatureProvider)
  {
    -[MLFeatureProvider featureNames](originalFeatureProvider, "featureNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v5);

  }
  return (NSSet *)v3;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  VNSceneprint *sceneprint;
  int64_t sceneprintDataType;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", self->_sceneprintKey))
  {
    sceneprint = self->_sceneprint;
    sceneprintDataType = self->_sceneprintDataType;
    v19 = 0;
    -[VNEspressoModelImageprint VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:error:](sceneprint, "VNEspressoModelImageprintOneDimensionMLMultiArrayWithDataType:error:", sceneprintDataType, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      objc_msgSend(v8, "localizedDescription");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v11, "UTF8String");
      VNValidatedLog(4, (uint64_t)CFSTR("Unable to obtain data array %s - %s"), v12, v13, v14, v15, v16, v17, v10);

      v9 = 0;
    }

  }
  else
  {
    -[MLFeatureProvider featureValueForName:](self->_originalFeatureProvider, "featureValueForName:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFeatureProvider, 0);
  objc_storeStrong((id *)&self->_sceneprintKey, 0);
  objc_storeStrong((id *)&self->_sceneprint, 0);
}

@end
