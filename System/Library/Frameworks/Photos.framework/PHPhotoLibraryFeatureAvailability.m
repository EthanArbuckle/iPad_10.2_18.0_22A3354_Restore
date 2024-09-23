@implementation PHPhotoLibraryFeatureAvailability

- (PHPhotoLibraryFeatureAvailability)initWithFeature:(unint64_t)a3
{
  PHPhotoLibraryFeatureAvailability *v4;
  PHPhotoLibraryFeatureAvailability *v5;
  PHPhotoLibraryFeatureAvailability *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHPhotoLibraryFeatureAvailability;
  v4 = -[PHPhotoLibraryFeatureAvailability init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_feature = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PHPhotoLibraryFeatureAvailability *v4;
  PHPhotoLibraryFeatureAvailability *v5;
  unint64_t v6;
  _BOOL4 v7;
  int64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  BOOL v45;

  v4 = (PHPhotoLibraryFeatureAvailability *)a3;
  if (v4 == self)
  {
    v45 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHPhotoLibraryFeatureAvailability feature](self, "feature");
      if (v6 != -[PHPhotoLibraryFeatureAvailability feature](v5, "feature"))
        goto LABEL_22;
      v7 = -[PHPhotoLibraryFeatureAvailability photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady");
      if (v7 != -[PHPhotoLibraryFeatureAvailability photosKnowledgeGraphIsReady](v5, "photosKnowledgeGraphIsReady"))
        goto LABEL_22;
      v8 = -[PHPhotoLibraryFeatureAvailability featureAvailability](self, "featureAvailability");
      if (v8 != -[PHPhotoLibraryFeatureAvailability featureAvailability](v5, "featureAvailability"))
        goto LABEL_22;
      v9 = -[PHPhotoLibraryFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets");
      if (v9 != -[PHPhotoLibraryFeatureAvailability numberOfCuratedAssets](v5, "numberOfCuratedAssets"))
        goto LABEL_22;
      v10 = -[PHPhotoLibraryFeatureAvailability stillAssetEmbeddingsAreIndexedEnough](self, "stillAssetEmbeddingsAreIndexedEnough");
      if (v10 != -[PHPhotoLibraryFeatureAvailability stillAssetEmbeddingsAreIndexedEnough](v5, "stillAssetEmbeddingsAreIndexedEnough"))goto LABEL_22;
      v11 = -[PHPhotoLibraryFeatureAvailability libraryHasEnoughCuratedAssets](self, "libraryHasEnoughCuratedAssets");
      if (v11 != -[PHPhotoLibraryFeatureAvailability libraryHasEnoughCuratedAssets](v5, "libraryHasEnoughCuratedAssets"))goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithSceneAnalysis](self, "fractionOfAssetsWithSceneAnalysis");
      v13 = v12;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithSceneAnalysis](v5, "fractionOfAssetsWithSceneAnalysis");
      if (vabdd_f64(v13, v14) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFaceAnalysis](self, "fractionOfAssetsWithFaceAnalysis");
      v16 = v15;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFaceAnalysis](v5, "fractionOfAssetsWithFaceAnalysis");
      if (vabdd_f64(v16, v17) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddings](self, "fractionOfAssetsWithEmbeddings");
      v19 = v18;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddings](v5, "fractionOfAssetsWithEmbeddings");
      if (vabdd_f64(v19, v20) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithCaptions](self, "fractionOfAssetsWithCaptions");
      v22 = v21;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithCaptions](v5, "fractionOfAssetsWithCaptions");
      if (vabdd_f64(v22, v23) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithScenesInIndex](self, "fractionOfAssetsWithScenesInIndex");
      v25 = v24;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithScenesInIndex](v5, "fractionOfAssetsWithScenesInIndex");
      if (vabdd_f64(v25, v26) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFacesInIndex](self, "fractionOfAssetsWithFacesInIndex");
      v28 = v27;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFacesInIndex](v5, "fractionOfAssetsWithFacesInIndex");
      if (vabdd_f64(v28, v29) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddingsInIndex](self, "fractionOfAssetsWithEmbeddingsInIndex");
      v31 = v30;
      -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddingsInIndex](v5, "fractionOfAssetsWithEmbeddingsInIndex");
      if (vabdd_f64(v31, v32) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddings](self, "fractionOfCuratedAssetsWithEmbeddings");
      v34 = v33;
      -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddings](v5, "fractionOfCuratedAssetsWithEmbeddings");
      if (vabdd_f64(v34, v35) >= 2.22044605e-16)
        goto LABEL_22;
      -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithCaptions](self, "fractionOfCuratedAssetsWithCaptions");
      v37 = v36;
      -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithCaptions](v5, "fractionOfCuratedAssetsWithCaptions");
      if (vabdd_f64(v37, v38) < 2.22044605e-16
        && (-[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInIndex](self, "fractionOfCuratedAssetsWithEmbeddingsInIndex"), v40 = v39, -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInIndex](v5, "fractionOfCuratedAssetsWithEmbeddingsInIndex"), vabdd_f64(v40, v41) < 2.22044605e-16))
      {
        -[PHPhotoLibraryFeatureAvailability fractionOfHighlightsEnriched](self, "fractionOfHighlightsEnriched");
        v43 = v42;
        -[PHPhotoLibraryFeatureAvailability fractionOfHighlightsEnriched](v5, "fractionOfHighlightsEnriched");
        v45 = vabdd_f64(v43, v44) < 2.22044605e-16;
      }
      else
      {
LABEL_22:
        v45 = 0;
      }

    }
    else
    {
      v45 = 0;
    }
  }

  return v45;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("-- General Processing Availability --\n"));
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithSceneAnalysis](self, "fractionOfAssetsWithSceneAnalysis");
  objc_msgSend(v3, "appendFormat:", CFSTR("Scene analysis progress (all assets): %f\n"), v4);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFaceAnalysis](self, "fractionOfAssetsWithFaceAnalysis");
  objc_msgSend(v3, "appendFormat:", CFSTR("Face analysis progress (all assets): %f\n"), v5);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddings](self, "fractionOfAssetsWithEmbeddings");
  objc_msgSend(v3, "appendFormat:", CFSTR("Embedding progress (all assets): %f\n"), v6);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithCaptions](self, "fractionOfAssetsWithCaptions");
  objc_msgSend(v3, "appendFormat:", CFSTR("Captioning progress (all assets): %f\n"), v7);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithScenesInIndex](self, "fractionOfAssetsWithScenesInIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (scenes): %f\n"), v8);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithFacesInIndex](self, "fractionOfAssetsWithFacesInIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (faces): %f\n"), v9);
  -[PHPhotoLibraryFeatureAvailability fractionOfAssetsWithEmbeddingsInIndex](self, "fractionOfAssetsWithEmbeddingsInIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (embeddings): %f\n"), v10);
  -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddings](self, "fractionOfCuratedAssetsWithEmbeddings");
  objc_msgSend(v3, "appendFormat:", CFSTR("Embedding progress (curated assets): %f\n"), v11);
  -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithCaptions](self, "fractionOfCuratedAssetsWithCaptions");
  objc_msgSend(v3, "appendFormat:", CFSTR("Captioning progress (curated assets): %f\n"), v12);
  -[PHPhotoLibraryFeatureAvailability fractionOfCuratedAssetsWithEmbeddingsInIndex](self, "fractionOfCuratedAssetsWithEmbeddingsInIndex");
  objc_msgSend(v3, "appendFormat:", CFSTR("Search indexing progress (curated asset embeddings): %f\n"), v13);
  -[PHPhotoLibraryFeatureAvailability fractionOfHighlightsEnriched](self, "fractionOfHighlightsEnriched");
  objc_msgSend(v3, "appendFormat:", CFSTR("Highlights progress: %f\n"), v14);
  if (-[PHPhotoLibraryFeatureAvailability photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady"))
    v15 = CFSTR("true");
  else
    v15 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Photos Knowledge Graph is Ready: %@\n"), v15);
  objc_msgSend(v3, "appendFormat:", CFSTR("Count of curated assets: %lu\n"), -[PHPhotoLibraryFeatureAvailability numberOfCuratedAssets](self, "numberOfCuratedAssets"));
  if (-[PHPhotoLibraryFeatureAvailability stillAssetEmbeddingsAreIndexedEnough](self, "stillAssetEmbeddingsAreIndexedEnough"))
  {
    v16 = CFSTR("true");
  }
  else
  {
    v16 = CFSTR("false");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("Enough still assets are in the index: %@\n"), v16);
  if (-[PHPhotoLibraryFeatureAvailability libraryHasEnoughCuratedAssets](self, "libraryHasEnoughCuratedAssets"))
    v17 = CFSTR("true");
  else
    v17 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Library has enough curated assets: %@\n"), v17);
  if (-[PHPhotoLibraryFeatureAvailability featureAvailability](self, "featureAvailability"))
    v18 = CFSTR("true");
  else
    v18 = CFSTR("false");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Processing done: %@\n"), v18);
  return v3;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (double)fractionOfAssetsWithSceneAnalysis
{
  return self->_fractionOfAssetsWithSceneAnalysis;
}

- (void)setFractionOfAssetsWithSceneAnalysis:(double)a3
{
  self->_fractionOfAssetsWithSceneAnalysis = a3;
}

- (double)fractionOfAssetsWithFaceAnalysis
{
  return self->_fractionOfAssetsWithFaceAnalysis;
}

- (void)setFractionOfAssetsWithFaceAnalysis:(double)a3
{
  self->_fractionOfAssetsWithFaceAnalysis = a3;
}

- (double)fractionOfAssetsWithEmbeddings
{
  return self->_fractionOfAssetsWithEmbeddings;
}

- (void)setFractionOfAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfAssetsWithEmbeddings = a3;
}

- (double)fractionOfAssetsWithCaptions
{
  return self->_fractionOfAssetsWithCaptions;
}

- (void)setFractionOfAssetsWithCaptions:(double)a3
{
  self->_fractionOfAssetsWithCaptions = a3;
}

- (double)fractionOfAssetsWithScenesInIndex
{
  return self->_fractionOfAssetsWithScenesInIndex;
}

- (void)setFractionOfAssetsWithScenesInIndex:(double)a3
{
  self->_fractionOfAssetsWithScenesInIndex = a3;
}

- (double)fractionOfAssetsWithFacesInIndex
{
  return self->_fractionOfAssetsWithFacesInIndex;
}

- (void)setFractionOfAssetsWithFacesInIndex:(double)a3
{
  self->_fractionOfAssetsWithFacesInIndex = a3;
}

- (double)fractionOfAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfAssetsWithEmbeddingsInIndex = a3;
}

- (double)fractionOfStillAssetsWithEmbeddings
{
  return self->_fractionOfStillAssetsWithEmbeddings;
}

- (void)setFractionOfStillAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfStillAssetsWithEmbeddings = a3;
}

- (double)fractionOfStillAssetsWithCaptions
{
  return self->_fractionOfStillAssetsWithCaptions;
}

- (void)setFractionOfStillAssetsWithCaptions:(double)a3
{
  self->_fractionOfStillAssetsWithCaptions = a3;
}

- (double)fractionOfStillAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfStillAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfStillAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfStillAssetsWithEmbeddingsInIndex = a3;
}

- (BOOL)stillAssetEmbeddingsAreIndexedEnough
{
  return self->_stillAssetEmbeddingsAreIndexedEnough;
}

- (void)setStillAssetEmbeddingsAreIndexedEnough:(BOOL)a3
{
  self->_stillAssetEmbeddingsAreIndexedEnough = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddings
{
  return self->_fractionOfCuratedAssetsWithEmbeddings;
}

- (void)setFractionOfCuratedAssetsWithEmbeddings:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddings = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInIndex;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInIndex = a3;
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

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (BOOL)libraryHasEnoughCuratedAssets
{
  return self->_libraryHasEnoughCuratedAssets;
}

- (void)setLibraryHasEnoughCuratedAssets:(BOOL)a3
{
  self->_libraryHasEnoughCuratedAssets = a3;
}

- (int64_t)featureAvailability
{
  return self->_featureAvailability;
}

- (void)setFeatureAvailability:(int64_t)a3
{
  self->_featureAvailability = a3;
}

@end
