@implementation PHFeatureAvailabilityConfig

- (PHFeatureAvailabilityConfig)init
{
  PHFeatureAvailabilityConfig *v2;
  PHFeatureAvailabilityConfig *v3;
  PHFeatureAvailabilityConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHFeatureAvailabilityConfig;
  v2 = -[PHFeatureAvailabilityConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (PHFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3
{
  PHFeatureAvailabilityConfig *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PHFeatureAvailabilityConfig *v11;

  v4 = -[PHFeatureAvailabilityConfig init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71730]), "initWithFeature:", a3);
    objc_msgSend(v5, "fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold");
    v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = v6;
    objc_msgSend(v5, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold");
    v4->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = v7;
    objc_msgSend(v5, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
    v4->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = v8;
    objc_msgSend(v5, "fractionOfCuratedAssetsWithCaptionsThreshold");
    v4->_fractionOfCuratedAssetsWithCaptionsThreshold = v9;
    objc_msgSend(v5, "fractionOfHighlightsEnrichedThreshold");
    v4->_fractionOfHighlightsEnrichedThreshold = v10;
    v4->_minimumNumberOfCuratedAssets = objc_msgSend(v5, "minimumNumberOfCuratedAssets");
    v4->_needsPhotosKnowledgeGraph = objc_msgSend(v5, "needsPhotosKnowledgeGraph");
    v11 = v4;

  }
  return v4;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
}

- (double)fractionOfCuratedAssetsWithCaptionsThreshold
{
  return self->_fractionOfCuratedAssetsWithCaptionsThreshold;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
}

- (double)fractionOfHighlightsEnrichedThreshold
{
  return self->_fractionOfHighlightsEnrichedThreshold;
}

- (BOOL)needsPhotosKnowledgeGraph
{
  return self->_needsPhotosKnowledgeGraph;
}

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

@end
