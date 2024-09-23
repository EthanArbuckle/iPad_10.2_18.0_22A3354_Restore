@implementation VNImageAnalyzerMultiDetectorSceneClassificationConfiguration

- (VNImageAnalyzerMultiDetectorSceneClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  id v4;
  VNImageAnalyzerMultiDetectorSceneClassificationConfiguration *v5;
  VNImageAnalyzerMultiDetectorSceneClassificationConfiguration *v6;
  void *v7;
  uint64_t v8;
  VNDisallowedList *disallowedList;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNImageAnalyzerMultiDetectorSceneClassificationConfiguration;
  v5 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:](&v11, sel_initWithObservationsRecipient_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_maximumLeafLabels = 0x7FFFFFFFFFFFFFFFLL;
    v5->_maximumHierarchicalLabels = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "originatingRequestSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
    {
      v6->_maximumLeafLabels = 5;
      v6->_maximumHierarchicalLabels = 5;
    }
    else if (objc_msgSend(v7, "specifiesRequestClass:", objc_opt_class()))
    {
      +[VNImageAnalyzerMultiDetector disallowedListForModel:](VNImageAnalyzerMultiDetector, "disallowedListForModel:", +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", objc_msgSend(v7, "requestClassAndReturnError:", 0), objc_msgSend(v7, "requestRevision")));
      v8 = objc_claimAutoreleasedReturnValue();
      disallowedList = v6->_disallowedList;
      v6->_disallowedList = (VNDisallowedList *)v8;

    }
  }

  return v6;
}

- (unsigned)analysisTypes
{
  return 2;
}

- (unsigned)labelsListType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorSceneClassificationConfiguration;
  v4 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = (id)self->_maximumLeafLabels;
    v5[5] = (id)self->_maximumHierarchicalLabels;
    objc_storeStrong(v5 + 6, self->_customHierarchy);
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

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumLeafLabels
{
  return self->_maximumLeafLabels;
}

- (void)setMaximumLeafLabels:(unint64_t)a3
{
  self->_maximumLeafLabels = a3;
}

- (unint64_t)maximumHierarchicalLabels
{
  return self->_maximumHierarchicalLabels;
}

- (void)setMaximumHierarchicalLabels:(unint64_t)a3
{
  self->_maximumHierarchicalLabels = a3;
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (void)setCustomHierarchy:(id)a3
{
  objc_storeStrong((id *)&self->_customHierarchy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHierarchy, 0);
  objc_storeStrong((id *)&self->_disallowedList, 0);
}

@end
