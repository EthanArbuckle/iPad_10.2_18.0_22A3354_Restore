@implementation VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration

- (VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3
{
  VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
  result = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:](&v4, sel_initWithObservationsRecipient_, a3);
  if (result)
  {
    result->_minimumDetectionConfidence = 0.1;
    result->_nonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *v4;
  VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  char v12;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = (VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v16.receiver = self;
      v16.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
      if (-[VNCoreSceneUnderstandingDetectorFeatureConfiguration isEqual:](&v16, sel_isEqual_, v5)
        && (-[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration minimumDetectionConfidence](self, "minimumDetectionConfidence"), v7 = v6, -[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration minimumDetectionConfidence](v5, "minimumDetectionConfidence"), v7 == v8)&& (-[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration nonMaximumSuppressionThreshold](self, "nonMaximumSuppressionThreshold"), v10 = v9, -[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration nonMaximumSuppressionThreshold](v5, "nonMaximumSuppressionThreshold"), v10 == v11))
      {
        -[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration disallowedList](self, "disallowedList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration disallowedList](v5, "disallowedList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  float *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
  v4 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = (float *)v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    v5[4] = self->_minimumDetectionConfidence;
    v5[5] = self->_nonMaximumSuppressionThreshold;
  }
  return v5;
}

- (VNDisallowedList)disallowedList
{
  return self->_disallowedList;
}

- (void)setDisallowedList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)minimumDetectionConfidence
{
  return self->_minimumDetectionConfidence;
}

- (void)setMinimumDetectionConfidence:(float)a3
{
  self->_minimumDetectionConfidence = a3;
}

- (float)nonMaximumSuppressionThreshold
{
  return self->_nonMaximumSuppressionThreshold;
}

- (void)setNonMaximumSuppressionThreshold:(float)a3
{
  self->_nonMaximumSuppressionThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
