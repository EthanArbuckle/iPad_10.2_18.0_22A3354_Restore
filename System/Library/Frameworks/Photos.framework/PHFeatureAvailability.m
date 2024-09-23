@implementation PHFeatureAvailability

- (id)initForFeature:(unint64_t)a3
{
  return -[PHFeatureAvailability initForFeature:withPLFeatureAvailability:](self, "initForFeature:withPLFeatureAvailability:", a3, 0);
}

- (id)initForFeature:(unint64_t)a3 withPLFeatureAvailability:(id)a4
{
  id v6;
  PHFeatureAvailability *v7;
  PHFeatureAvailability *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  NSDate *dateComputed;
  void *v24;
  unint64_t numberOfCuratedAssets;
  double fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
  double v27;
  double fractionOfCuratedAssetsIndexedInVUClustering;
  double v29;
  PHFeatureAvailability *v30;
  PHFeatureAvailability *v31;
  PHFeatureAvailability *v32;
  objc_super v34;

  v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PHFeatureAvailability;
  v7 = -[PHFeatureAvailability init](&v34, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_feature = a3;
    if (v6)
    {
      objc_msgSend(v6, "availabilityByFeature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "processingSnapshot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8->_wasComputed = 1;
        v8->_isAvailable = objc_msgSend(v11, "BOOLValue");
        objc_msgSend(v12, "fractionOfAllAssetsAnalyzedForScenes");
        v8->_fractionOfAllAssetsAnalyzedForScenes = v13;
        objc_msgSend(v12, "fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
        v8->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = v14;
        objc_msgSend(v12, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
        v8->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = v15;
        objc_msgSend(v12, "fractionOfAllAssetsWithCaptions");
        v8->_fractionOfAllAssetsWithCaptions = v16;
        objc_msgSend(v12, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
        v8->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = v17;
        objc_msgSend(v12, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
        v8->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v18;
        objc_msgSend(v12, "fractionOfCuratedAssetsIndexedInVUClustering");
        v8->_fractionOfCuratedAssetsIndexedInVUClustering = v19;
        objc_msgSend(v12, "fractionOfCuratedAssetsWithCaptions");
        v8->_fractionOfCuratedAssetsWithCaptions = v20;
        objc_msgSend(v12, "fractionOfHighlightsEnriched");
        v8->_fractionOfHighlightsEnriched = v21;
        v8->_photosKnowledgeGraphIsReady = objc_msgSend(v12, "photosKnowledgeGraphIsReady");
        v8->_numberOfAssets = objc_msgSend(v12, "totalAssetCount");
        v8->_numberOfCuratedAssets = objc_msgSend(v12, "totalCuratedAssetCount");
        objc_msgSend(v12, "dateComputed");
        v22 = objc_claimAutoreleasedReturnValue();
        dateComputed = v8->_dateComputed;
        v8->_dateComputed = (NSDate *)v22;

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71730]), "initWithFeature:", a3);
        numberOfCuratedAssets = v8->_numberOfCuratedAssets;
        v8->_libraryHasEnoughCuratedAssets = numberOfCuratedAssets >= objc_msgSend(v24, "minimumNumberOfCuratedAssets");
        fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v8->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
        objc_msgSend(v24, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
        v8->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex = fractionOfCuratedAssetsWithEmbeddingsInVectorIndex >= v27;
        fractionOfCuratedAssetsIndexedInVUClustering = v8->_fractionOfCuratedAssetsIndexedInVUClustering;
        objc_msgSend(v24, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
        v8->_libraryHasEnoughCuratedAssetsIndexedInVUClustering = fractionOfCuratedAssetsIndexedInVUClustering >= v29;
        v30 = v8;

      }
      else
      {
        v32 = v8;
      }

    }
    else
    {
      v7->_isAvailable = 0;
      v7->_wasComputed = 0;
      v31 = v7;
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PHFeatureAvailability *v4;
  PHFeatureAvailability *v5;
  unint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;

  v4 = (PHFeatureAvailability *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHFeatureAvailability feature](self, "feature");
      if (v6 == -[PHFeatureAvailability feature](v5, "feature")
        && (v7 = -[PHFeatureAvailability wasComputed](self, "wasComputed"),
            v7 == -[PHFeatureAvailability wasComputed](v5, "wasComputed")))
      {
        -[PHFeatureAvailability dateComputed](self, "dateComputed");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHFeatureAvailability dateComputed](v5, "dateComputed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 != v10)
          goto LABEL_25;
        v11 = -[PHFeatureAvailability photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady");
        if (v11 != -[PHFeatureAvailability photosKnowledgeGraphIsReady](v5, "photosKnowledgeGraphIsReady"))
          goto LABEL_25;
        v12 = -[PHFeatureAvailability isAvailable](self, "isAvailable");
        if (v12 != -[PHFeatureAvailability isAvailable](v5, "isAvailable"))
          goto LABEL_25;
        v13 = -[PHFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets");
        if (v13 != -[PHFeatureAvailability numberOfCuratedAssets](v5, "numberOfCuratedAssets"))
          goto LABEL_25;
        v14 = -[PHFeatureAvailability numberOfAssets](self, "numberOfAssets");
        if (v14 != -[PHFeatureAvailability numberOfAssets](v5, "numberOfAssets"))
          goto LABEL_25;
        v15 = -[PHFeatureAvailability libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex](self, "libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex");
        if (v15 != -[PHFeatureAvailability libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex](v5, "libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex"))goto LABEL_25;
        v16 = -[PHFeatureAvailability libraryHasEnoughCuratedAssetsIndexedInVUClustering](self, "libraryHasEnoughCuratedAssetsIndexedInVUClustering");
        if (v16 != -[PHFeatureAvailability libraryHasEnoughCuratedAssetsIndexedInVUClustering](v5, "libraryHasEnoughCuratedAssetsIndexedInVUClustering"))goto LABEL_25;
        v17 = -[PHFeatureAvailability libraryHasEnoughCuratedAssets](self, "libraryHasEnoughCuratedAssets");
        if (v17 != -[PHFeatureAvailability libraryHasEnoughCuratedAssets](v5, "libraryHasEnoughCuratedAssets"))
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfAllAssetsAnalyzedForScenes](self, "fractionOfAllAssetsAnalyzedForScenes");
        v19 = v18;
        -[PHFeatureAvailability fractionOfAllAssetsAnalyzedForScenes](v5, "fractionOfAllAssetsAnalyzedForScenes");
        if (vabdd_f64(v19, v20) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfAllAssetsWithCaptions](self, "fractionOfAllAssetsWithCaptions");
        v22 = v21;
        -[PHFeatureAvailability fractionOfAllAssetsWithCaptions](v5, "fractionOfAllAssetsWithCaptions");
        if (vabdd_f64(v22, v23) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfAllAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
        v25 = v24;
        -[PHFeatureAvailability fractionOfAllAssetsWithSceneAnalysisInSearchIndex](v5, "fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
        if (vabdd_f64(v25, v26) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfAllAssetsWithMediaAnalysisInSearchIndex](self, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
        v28 = v27;
        -[PHFeatureAvailability fractionOfAllAssetsWithMediaAnalysisInSearchIndex](v5, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
        if (vabdd_f64(v28, v29) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
        v31 = v30;
        -[PHFeatureAvailability fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex](v5, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
        if (vabdd_f64(v31, v32) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInVectorIndex](self, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
        v34 = v33;
        -[PHFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInVectorIndex](v5, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
        if (vabdd_f64(v34, v35) >= 2.22044605e-16)
          goto LABEL_25;
        -[PHFeatureAvailability fractionOfCuratedAssetsIndexedInVUClustering](self, "fractionOfCuratedAssetsIndexedInVUClustering");
        v37 = v36;
        -[PHFeatureAvailability fractionOfCuratedAssetsIndexedInVUClustering](v5, "fractionOfCuratedAssetsIndexedInVUClustering");
        if (vabdd_f64(v37, v38) < 2.22044605e-16
          && (-[PHFeatureAvailability fractionOfCuratedAssetsWithCaptions](self, "fractionOfCuratedAssetsWithCaptions"),
              v40 = v39,
              -[PHFeatureAvailability fractionOfCuratedAssetsWithCaptions](v5, "fractionOfCuratedAssetsWithCaptions"),
              vabdd_f64(v40, v41) < 2.22044605e-16))
        {
          -[PHFeatureAvailability fractionOfHighlightsEnriched](self, "fractionOfHighlightsEnriched");
          v43 = v42;
          -[PHFeatureAvailability fractionOfHighlightsEnriched](v5, "fractionOfHighlightsEnriched");
          v8 = vabdd_f64(v43, v44) < 2.22044605e-16;
        }
        else
        {
LABEL_25:
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  PHStringFromAnalysisCoordinatorFeature(-[PHFeatureAvailability feature](self, "feature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("-- General Processing Availability For %@ --\n"), v4);

  -[PHFeatureAvailability fractionOfAllAssetsAnalyzedForScenes](self, "fractionOfAllAssetsAnalyzedForScenes");
  objc_msgSend(v3, "appendFormat:", CFSTR("Scene analysis progress (all assets): %f\n"), v5);
  -[PHFeatureAvailability fractionOfAllAssetsWithCaptions](self, "fractionOfAllAssetsWithCaptions");
  objc_msgSend(v3, "appendFormat:", CFSTR("Captioning progress (all assets): %f\n"), v6);
  -[PHFeatureAvailability fractionOfAllAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (scenes): %f\n"), v7);
  -[PHFeatureAvailability fractionOfAllAssetsWithMediaAnalysisInSearchIndex](self, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (embeddings): %f\n"), v8);
  -[PHFeatureAvailability fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (curated assets scenes): %f\n"), v9);
  -[PHFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInVectorIndex](self, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (curated asset embeddings): %f\n"), v10);
  -[PHFeatureAvailability fractionOfCuratedAssetsIndexedInVUClustering](self, "fractionOfCuratedAssetsIndexedInVUClustering");
  objc_msgSend(v3, "appendFormat:", CFSTR("Clustering indexing progress (curated asset embeddings): %f\n"), v11);
  -[PHFeatureAvailability fractionOfCuratedAssetsWithCaptions](self, "fractionOfCuratedAssetsWithCaptions");
  objc_msgSend(v3, "appendFormat:", CFSTR("Captioning progress (curated assets): %f\n"), v12);
  -[PHFeatureAvailability fractionOfHighlightsEnriched](self, "fractionOfHighlightsEnriched");
  objc_msgSend(v3, "appendFormat:", CFSTR("Highlights progress: %f\n"), v13);
  if (-[PHFeatureAvailability photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady"))
    v14 = CFSTR("true");
  else
    v14 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Photos Knowledge Graph is Ready: %@\n"), v14);
  objc_msgSend(v3, "appendFormat:", CFSTR("Count of curated assets: %lu\n"), -[PHFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if (-[PHFeatureAvailability libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex](self, "libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex"))
  {
    v15 = CFSTR("true");
  }
  else
  {
    v15 = CFSTR("false");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Enough curated assets are in the embedding search index: %@\n"), v15);
  if (-[PHFeatureAvailability libraryHasEnoughCuratedAssetsIndexedInVUClustering](self, "libraryHasEnoughCuratedAssetsIndexedInVUClustering"))
  {
    v16 = CFSTR("true");
  }
  else
  {
    v16 = CFSTR("false");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Enough curated assets are in the clustering index: %@\n"), v16);
  if (-[PHFeatureAvailability libraryHasEnoughCuratedAssets](self, "libraryHasEnoughCuratedAssets"))
    v17 = CFSTR("true");
  else
    v17 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Library has enough curated assets: %@\n"), v17);
  objc_msgSend(v3, "appendFormat:", CFSTR("Total number of assets available for analysis in library: %lu\n"), -[PHFeatureAvailability numberOfAssets](self, "numberOfAssets"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Total number of curated assets in library: %lu\n"), -[PHFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if (-[PHFeatureAvailability wasComputed](self, "wasComputed"))
    v18 = CFSTR("true");
  else
    v18 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Availability was computed: %@\n"), v18);
  -[PHFeatureAvailability dateComputed](self, "dateComputed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Availability was computed on date: %@\n"), v19);

  if (-[PHFeatureAvailability isAvailable](self, "isAvailable"))
    v20 = CFSTR("true");
  else
    v20 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Feature is available: %@\n"), v20);
  return v3;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (double)fractionOfAllAssetsAnalyzedForScenes
{
  return self->_fractionOfAllAssetsAnalyzedForScenes;
}

- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3
{
  self->_fractionOfAllAssetsAnalyzedForScenes = a3;
}

- (double)fractionOfAllAssetsWithCaptions
{
  return self->_fractionOfAllAssetsWithCaptions;
}

- (void)setFractionOfAllAssetsWithCaptions:(double)a3
{
  self->_fractionOfAllAssetsWithCaptions = a3;
}

- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (double)fractionOfCuratedAssetsIndexedInVUClustering
{
  return self->_fractionOfCuratedAssetsIndexedInVUClustering;
}

- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3
{
  self->_fractionOfCuratedAssetsIndexedInVUClustering = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfHighlightsEnriched
{
  return self->_fractionOfHighlightsEnriched;
}

- (void)setFractionOfHighlightsEnriched:(double)a3
{
  self->_fractionOfHighlightsEnriched = a3;
}

- (BOOL)photosKnowledgeGraphIsReady
{
  return self->_photosKnowledgeGraphIsReady;
}

- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3
{
  self->_photosKnowledgeGraphIsReady = a3;
}

- (BOOL)libraryHasEnoughCuratedAssets
{
  return self->_libraryHasEnoughCuratedAssets;
}

- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssets = a3;
}

- (BOOL)libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setLibraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (BOOL)libraryHasEnoughCuratedAssetsIndexedInVUClustering
{
  return self->_libraryHasEnoughCuratedAssetsIndexedInVUClustering;
}

- (void)setLibraryHasEnoughCuratedAssetsIndexedInVUClustering:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssetsIndexedInVUClustering = a3;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->_numberOfAssets = a3;
}

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (BOOL)wasComputed
{
  return self->_wasComputed;
}

- (NSDate)dateComputed
{
  return self->_dateComputed;
}

- (void)setDateComputed:(id)a3
{
  objc_storeStrong((id *)&self->_dateComputed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComputed, 0);
}

@end
