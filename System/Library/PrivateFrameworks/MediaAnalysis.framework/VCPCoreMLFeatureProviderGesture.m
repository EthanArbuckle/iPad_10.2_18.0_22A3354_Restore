@implementation VCPCoreMLFeatureProviderGesture

- (VCPCoreMLFeatureProviderGesture)initWith:(id)a3 rotationInDegrees:(int)a4
{
  VCPHandObservation *v6;
  VCPCoreMLFeatureProviderGesture *v7;
  VCPHandObservation *observation;
  objc_super v10;

  v6 = (VCPHandObservation *)a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPCoreMLFeatureProviderGesture;
  v7 = -[VCPCoreMLFeatureProviderGesture init](&v10, sel_init);
  observation = v7->_observation;
  v7->_observation = v6;

  v7->_rotationInDegrees = a4;
  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6B76380);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  float v14;
  id v15;
  uint64_t v16;
  float v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  CGPoint v24;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E6B76398, 65568, 0);
  for (i = 0; i != 21; ++i)
  {
    -[VCPHandObservation keypoints](self->_observation, "keypoints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    transformLocation(v24, 0, self->_rotationInDegrees);
    v9 = v8;
    v11 = v10;

    v12 = objc_retainAutorelease(v4);
    v13 = objc_msgSend(v12, "dataPointer");
    v14 = v9;
    *(float *)(v13 + 4 * i) = v14;
    v15 = objc_retainAutorelease(v12);
    v16 = objc_msgSend(v15, "dataPointer");
    v17 = v11;
    *(float *)(v16 + 4 * i + 84) = v17;
    -[VCPHandObservation keypoints](self->_observation, "keypoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "confidence");
    LODWORD(v11) = v20;
    v21 = objc_retainAutorelease(v15);
    *(_DWORD *)(objc_msgSend(v21, "dataPointer") + 4 * i + 168) = LODWORD(v11);

  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_rotationInDegrees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
