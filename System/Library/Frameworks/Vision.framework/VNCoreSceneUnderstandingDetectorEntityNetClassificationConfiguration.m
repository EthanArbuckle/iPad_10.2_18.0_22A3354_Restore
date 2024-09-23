@implementation VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration

- (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
  result = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:](&v4, sel_initWithObservationsRecipient_, a3);
  if (result)
    result->_maximumClassifications = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *v4;
  VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)a3;
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
      v14.receiver = self;
      v14.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
      if (-[VNCoreSceneUnderstandingDetectorFeatureConfiguration isEqual:](&v14, sel_isEqual_, v5)
        && (-[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration minimumConfidence](self, "minimumConfidence"), v7 = v6, -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration minimumConfidence](v5, "minimumConfidence"), v7 == v8)&& (v9 = -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration maximumClassifications](self, "maximumClassifications"), v9 == -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration maximumClassifications](v5, "maximumClassifications")))
      {
        -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration disallowedList](self, "disallowedList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration disallowedList](v5, "disallowedList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
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
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
  v4 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = (id)self->_maximumClassifications;
  }
  return v5;
}

- (VNDisallowedList)disallowedList
{
  return (VNDisallowedList *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisallowedList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumClassifications
{
  return self->_maximumClassifications;
}

- (void)setMaximumClassifications:(unint64_t)a3
{
  self->_maximumClassifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
