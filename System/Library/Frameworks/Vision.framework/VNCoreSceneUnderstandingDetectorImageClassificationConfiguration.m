@implementation VNCoreSceneUnderstandingDetectorImageClassificationConfiguration

- (VNCoreSceneUnderstandingDetectorImageClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  id v4;
  VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *v5;
  VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *v6;
  void *v7;
  uint64_t v8;
  VNDisallowedList *disallowedList;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
  v5 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration initWithObservationsRecipient:](&v11, sel_initWithObservationsRecipient_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_maximumLeafClassifications = 0x7FFFFFFFFFFFFFFFLL;
    v5->_maximumHierarchicalClassifications = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "originatingRequestSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
    {
      v6->_maximumLeafClassifications = 5;
      v6->_maximumHierarchicalClassifications = 5;
    }
    else if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
    {
      +[VNDisallowedList sceneNetV5](VNDisallowedList, "sceneNetV5");
      v8 = objc_claimAutoreleasedReturnValue();
      disallowedList = v6->_disallowedList;
      v6->_disallowedList = (VNDisallowedList *)v8;

    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *v4;
  VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = (VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v15.receiver = self;
      v15.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
      if (-[VNCoreSceneUnderstandingDetectorFeatureConfiguration isEqual:](&v15, sel_isEqual_, v5)
        && (-[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration minimumConfidence](self, "minimumConfidence"), v7 = v6, -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration minimumConfidence](v5, "minimumConfidence"), v7 == v8)&& (v9 = -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration maximumLeafClassifications](self, "maximumLeafClassifications"), v9 == -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration maximumLeafClassifications](v5, "maximumLeafClassifications"))&& (v10 = -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration maximumHierarchicalClassifications](self, "maximumHierarchicalClassifications"), v10 == -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration maximumHierarchicalClassifications](v5, "maximumHierarchicalClassifications")))
      {
        -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration disallowedList](self, "disallowedList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration disallowedList](v5, "disallowedList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
  v4 = -[VNCoreSceneUnderstandingDetectorFeatureConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = (id)self->_maximumLeafClassifications;
    v5[5] = (id)self->_maximumHierarchicalClassifications;
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

- (unint64_t)maximumLeafClassifications
{
  return self->_maximumLeafClassifications;
}

- (void)setMaximumLeafClassifications:(unint64_t)a3
{
  self->_maximumLeafClassifications = a3;
}

- (unint64_t)maximumHierarchicalClassifications
{
  return self->_maximumHierarchicalClassifications;
}

- (void)setMaximumHierarchicalClassifications:(unint64_t)a3
{
  self->_maximumHierarchicalClassifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
