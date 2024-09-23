@implementation VCPProtoAssetAnalysis

- (void)setQuality:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQuality
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStatsFlags:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_statsFlags = a3;
}

- (void)setHasStatsFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatsFlags
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTypesWide:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_typesWide = a3;
}

- (void)setHasTypesWide:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTypesWide
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAssetMasterFingerprint
{
  return self->_assetMasterFingerprint != 0;
}

- (BOOL)hasAssetAdjustedFingerprint
{
  return self->_assetAdjustedFingerprint != 0;
}

- (BOOL)hasAssetCloudIdentifier
{
  return self->_assetCloudIdentifier != 0;
}

- (void)clearImageBlurResults
{
  -[NSMutableArray removeAllObjects](self->_imageBlurResults, "removeAllObjects");
}

- (void)addImageBlurResults:(id)a3
{
  id v4;
  NSMutableArray *imageBlurResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageBlurResults = self->_imageBlurResults;
  v8 = v4;
  if (!imageBlurResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageBlurResults;
    self->_imageBlurResults = v6;

    v4 = v8;
    imageBlurResults = self->_imageBlurResults;
  }
  -[NSMutableArray addObject:](imageBlurResults, "addObject:", v4);

}

- (unint64_t)imageBlurResultsCount
{
  return -[NSMutableArray count](self->_imageBlurResults, "count");
}

- (id)imageBlurResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageBlurResults, "objectAtIndex:", a3);
}

+ (Class)imageBlurResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageCompositionResults
{
  -[NSMutableArray removeAllObjects](self->_imageCompositionResults, "removeAllObjects");
}

- (void)addImageCompositionResults:(id)a3
{
  id v4;
  NSMutableArray *imageCompositionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageCompositionResults = self->_imageCompositionResults;
  v8 = v4;
  if (!imageCompositionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageCompositionResults;
    self->_imageCompositionResults = v6;

    v4 = v8;
    imageCompositionResults = self->_imageCompositionResults;
  }
  -[NSMutableArray addObject:](imageCompositionResults, "addObject:", v4);

}

- (unint64_t)imageCompositionResultsCount
{
  return -[NSMutableArray count](self->_imageCompositionResults, "count");
}

- (id)imageCompositionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageCompositionResults, "objectAtIndex:", a3);
}

+ (Class)imageCompositionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageFaceResults
{
  -[NSMutableArray removeAllObjects](self->_imageFaceResults, "removeAllObjects");
}

- (void)addImageFaceResults:(id)a3
{
  id v4;
  NSMutableArray *imageFaceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageFaceResults = self->_imageFaceResults;
  v8 = v4;
  if (!imageFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageFaceResults;
    self->_imageFaceResults = v6;

    v4 = v8;
    imageFaceResults = self->_imageFaceResults;
  }
  -[NSMutableArray addObject:](imageFaceResults, "addObject:", v4);

}

- (unint64_t)imageFaceResultsCount
{
  return -[NSMutableArray count](self->_imageFaceResults, "count");
}

- (id)imageFaceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageFaceResults, "objectAtIndex:", a3);
}

+ (Class)imageFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageFeatureResults
{
  -[NSMutableArray removeAllObjects](self->_imageFeatureResults, "removeAllObjects");
}

- (void)addImageFeatureResults:(id)a3
{
  id v4;
  NSMutableArray *imageFeatureResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageFeatureResults = self->_imageFeatureResults;
  v8 = v4;
  if (!imageFeatureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageFeatureResults;
    self->_imageFeatureResults = v6;

    v4 = v8;
    imageFeatureResults = self->_imageFeatureResults;
  }
  -[NSMutableArray addObject:](imageFeatureResults, "addObject:", v4);

}

- (unint64_t)imageFeatureResultsCount
{
  return -[NSMutableArray count](self->_imageFeatureResults, "count");
}

- (id)imageFeatureResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageFeatureResults, "objectAtIndex:", a3);
}

+ (Class)imageFeatureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageJunkResults
{
  -[NSMutableArray removeAllObjects](self->_imageJunkResults, "removeAllObjects");
}

- (void)addImageJunkResults:(id)a3
{
  id v4;
  NSMutableArray *imageJunkResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageJunkResults = self->_imageJunkResults;
  v8 = v4;
  if (!imageJunkResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageJunkResults;
    self->_imageJunkResults = v6;

    v4 = v8;
    imageJunkResults = self->_imageJunkResults;
  }
  -[NSMutableArray addObject:](imageJunkResults, "addObject:", v4);

}

- (unint64_t)imageJunkResultsCount
{
  return -[NSMutableArray count](self->_imageJunkResults, "count");
}

- (id)imageJunkResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageJunkResults, "objectAtIndex:", a3);
}

+ (Class)imageJunkResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageSaliencyResults
{
  -[NSMutableArray removeAllObjects](self->_imageSaliencyResults, "removeAllObjects");
}

- (void)addImageSaliencyResults:(id)a3
{
  id v4;
  NSMutableArray *imageSaliencyResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageSaliencyResults = self->_imageSaliencyResults;
  v8 = v4;
  if (!imageSaliencyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageSaliencyResults;
    self->_imageSaliencyResults = v6;

    v4 = v8;
    imageSaliencyResults = self->_imageSaliencyResults;
  }
  -[NSMutableArray addObject:](imageSaliencyResults, "addObject:", v4);

}

- (unint64_t)imageSaliencyResultsCount
{
  return -[NSMutableArray count](self->_imageSaliencyResults, "count");
}

- (id)imageSaliencyResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageSaliencyResults, "objectAtIndex:", a3);
}

+ (Class)imageSaliencyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageShotTypeResults
{
  -[NSMutableArray removeAllObjects](self->_imageShotTypeResults, "removeAllObjects");
}

- (void)addImageShotTypeResults:(id)a3
{
  id v4;
  NSMutableArray *imageShotTypeResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageShotTypeResults = self->_imageShotTypeResults;
  v8 = v4;
  if (!imageShotTypeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageShotTypeResults;
    self->_imageShotTypeResults = v6;

    v4 = v8;
    imageShotTypeResults = self->_imageShotTypeResults;
  }
  -[NSMutableArray addObject:](imageShotTypeResults, "addObject:", v4);

}

- (unint64_t)imageShotTypeResultsCount
{
  return -[NSMutableArray count](self->_imageShotTypeResults, "count");
}

- (id)imageShotTypeResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageShotTypeResults, "objectAtIndex:", a3);
}

+ (Class)imageShotTypeResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImagePetsResults
{
  -[NSMutableArray removeAllObjects](self->_imagePetsResults, "removeAllObjects");
}

- (void)addImagePetsResults:(id)a3
{
  id v4;
  NSMutableArray *imagePetsResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imagePetsResults = self->_imagePetsResults;
  v8 = v4;
  if (!imagePetsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imagePetsResults;
    self->_imagePetsResults = v6;

    v4 = v8;
    imagePetsResults = self->_imagePetsResults;
  }
  -[NSMutableArray addObject:](imagePetsResults, "addObject:", v4);

}

- (unint64_t)imagePetsResultsCount
{
  return -[NSMutableArray count](self->_imagePetsResults, "count");
}

- (id)imagePetsResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imagePetsResults, "objectAtIndex:", a3);
}

+ (Class)imagePetsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImagePetsFaceResults
{
  -[NSMutableArray removeAllObjects](self->_imagePetsFaceResults, "removeAllObjects");
}

- (void)addImagePetsFaceResults:(id)a3
{
  id v4;
  NSMutableArray *imagePetsFaceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imagePetsFaceResults = self->_imagePetsFaceResults;
  v8 = v4;
  if (!imagePetsFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imagePetsFaceResults;
    self->_imagePetsFaceResults = v6;

    v4 = v8;
    imagePetsFaceResults = self->_imagePetsFaceResults;
  }
  -[NSMutableArray addObject:](imagePetsFaceResults, "addObject:", v4);

}

- (unint64_t)imagePetsFaceResultsCount
{
  return -[NSMutableArray count](self->_imagePetsFaceResults, "count");
}

- (id)imagePetsFaceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imagePetsFaceResults, "objectAtIndex:", a3);
}

+ (Class)imagePetsFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageSceneprintResults
{
  -[NSMutableArray removeAllObjects](self->_imageSceneprintResults, "removeAllObjects");
}

- (void)addImageSceneprintResults:(id)a3
{
  id v4;
  NSMutableArray *imageSceneprintResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageSceneprintResults = self->_imageSceneprintResults;
  v8 = v4;
  if (!imageSceneprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageSceneprintResults;
    self->_imageSceneprintResults = v6;

    v4 = v8;
    imageSceneprintResults = self->_imageSceneprintResults;
  }
  -[NSMutableArray addObject:](imageSceneprintResults, "addObject:", v4);

}

- (unint64_t)imageSceneprintResultsCount
{
  return -[NSMutableArray count](self->_imageSceneprintResults, "count");
}

- (id)imageSceneprintResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageSceneprintResults, "objectAtIndex:", a3);
}

+ (Class)imageSceneprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoEffectsResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoEffectsResults, "removeAllObjects");
}

- (void)addLivePhotoEffectsResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoEffectsResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoEffectsResults = self->_livePhotoEffectsResults;
  v8 = v4;
  if (!livePhotoEffectsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoEffectsResults;
    self->_livePhotoEffectsResults = v6;

    v4 = v8;
    livePhotoEffectsResults = self->_livePhotoEffectsResults;
  }
  -[NSMutableArray addObject:](livePhotoEffectsResults, "addObject:", v4);

}

- (unint64_t)livePhotoEffectsResultsCount
{
  return -[NSMutableArray count](self->_livePhotoEffectsResults, "count");
}

- (id)livePhotoEffectsResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoEffectsResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoEffectsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoRecommendationResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoRecommendationResults, "removeAllObjects");
}

- (void)addLivePhotoRecommendationResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoRecommendationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  v8 = v4;
  if (!livePhotoRecommendationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoRecommendationResults;
    self->_livePhotoRecommendationResults = v6;

    v4 = v8;
    livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  }
  -[NSMutableArray addObject:](livePhotoRecommendationResults, "addObject:", v4);

}

- (unint64_t)livePhotoRecommendationResultsCount
{
  return -[NSMutableArray count](self->_livePhotoRecommendationResults, "count");
}

- (id)livePhotoRecommendationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoRecommendationResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoRecommendationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoSharpnessResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoSharpnessResults, "removeAllObjects");
}

- (void)addLivePhotoSharpnessResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoSharpnessResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  v8 = v4;
  if (!livePhotoSharpnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoSharpnessResults;
    self->_livePhotoSharpnessResults = v6;

    v4 = v8;
    livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  }
  -[NSMutableArray addObject:](livePhotoSharpnessResults, "addObject:", v4);

}

- (unint64_t)livePhotoSharpnessResultsCount
{
  return -[NSMutableArray count](self->_livePhotoSharpnessResults, "count");
}

- (id)livePhotoSharpnessResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoSharpnessResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoSharpnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoKeyFrameResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoKeyFrameResults, "removeAllObjects");
}

- (void)addLivePhotoKeyFrameResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoKeyFrameResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  v8 = v4;
  if (!livePhotoKeyFrameResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoKeyFrameResults;
    self->_livePhotoKeyFrameResults = v6;

    v4 = v8;
    livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  }
  -[NSMutableArray addObject:](livePhotoKeyFrameResults, "addObject:", v4);

}

- (unint64_t)livePhotoKeyFrameResultsCount
{
  return -[NSMutableArray count](self->_livePhotoKeyFrameResults, "count");
}

- (id)livePhotoKeyFrameResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoKeyFrameResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoKeyFrameResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoKeyFrameStillResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoKeyFrameStillResults, "removeAllObjects");
}

- (void)addLivePhotoKeyFrameStillResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoKeyFrameStillResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  v8 = v4;
  if (!livePhotoKeyFrameStillResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoKeyFrameStillResults;
    self->_livePhotoKeyFrameStillResults = v6;

    v4 = v8;
    livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  }
  -[NSMutableArray addObject:](livePhotoKeyFrameStillResults, "addObject:", v4);

}

- (unint64_t)livePhotoKeyFrameStillResultsCount
{
  return -[NSMutableArray count](self->_livePhotoKeyFrameStillResults, "count");
}

- (id)livePhotoKeyFrameStillResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoKeyFrameStillResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoKeyFrameStillResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoSettlingEffectGatingResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoSettlingEffectGatingResults, "removeAllObjects");
}

- (void)addLivePhotoSettlingEffectGatingResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoSettlingEffectGatingResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  v8 = v4;
  if (!livePhotoSettlingEffectGatingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoSettlingEffectGatingResults;
    self->_livePhotoSettlingEffectGatingResults = v6;

    v4 = v8;
    livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  }
  -[NSMutableArray addObject:](livePhotoSettlingEffectGatingResults, "addObject:", v4);

}

- (unint64_t)livePhotoSettlingEffectGatingResultsCount
{
  return -[NSMutableArray count](self->_livePhotoSettlingEffectGatingResults, "count");
}

- (id)livePhotoSettlingEffectGatingResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoSettlingEffectGatingResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoSettlingEffectGatingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieActivityLevelResults
{
  -[NSMutableArray removeAllObjects](self->_movieActivityLevelResults, "removeAllObjects");
}

- (void)addMovieActivityLevelResults:(id)a3
{
  id v4;
  NSMutableArray *movieActivityLevelResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieActivityLevelResults = self->_movieActivityLevelResults;
  v8 = v4;
  if (!movieActivityLevelResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieActivityLevelResults;
    self->_movieActivityLevelResults = v6;

    v4 = v8;
    movieActivityLevelResults = self->_movieActivityLevelResults;
  }
  -[NSMutableArray addObject:](movieActivityLevelResults, "addObject:", v4);

}

- (unint64_t)movieActivityLevelResultsCount
{
  return -[NSMutableArray count](self->_movieActivityLevelResults, "count");
}

- (id)movieActivityLevelResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieActivityLevelResults, "objectAtIndex:", a3);
}

+ (Class)movieActivityLevelResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieCameraMotionResults
{
  -[NSMutableArray removeAllObjects](self->_movieCameraMotionResults, "removeAllObjects");
}

- (void)addMovieCameraMotionResults:(id)a3
{
  id v4;
  NSMutableArray *movieCameraMotionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieCameraMotionResults = self->_movieCameraMotionResults;
  v8 = v4;
  if (!movieCameraMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieCameraMotionResults;
    self->_movieCameraMotionResults = v6;

    v4 = v8;
    movieCameraMotionResults = self->_movieCameraMotionResults;
  }
  -[NSMutableArray addObject:](movieCameraMotionResults, "addObject:", v4);

}

- (unint64_t)movieCameraMotionResultsCount
{
  return -[NSMutableArray count](self->_movieCameraMotionResults, "count");
}

- (id)movieCameraMotionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieCameraMotionResults, "objectAtIndex:", a3);
}

+ (Class)movieCameraMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieClassificationResults
{
  -[NSMutableArray removeAllObjects](self->_movieClassificationResults, "removeAllObjects");
}

- (void)addMovieClassificationResults:(id)a3
{
  id v4;
  NSMutableArray *movieClassificationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieClassificationResults = self->_movieClassificationResults;
  v8 = v4;
  if (!movieClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieClassificationResults;
    self->_movieClassificationResults = v6;

    v4 = v8;
    movieClassificationResults = self->_movieClassificationResults;
  }
  -[NSMutableArray addObject:](movieClassificationResults, "addObject:", v4);

}

- (unint64_t)movieClassificationResultsCount
{
  return -[NSMutableArray count](self->_movieClassificationResults, "count");
}

- (id)movieClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieClassificationResults, "objectAtIndex:", a3);
}

+ (Class)movieClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFaceResults
{
  -[NSMutableArray removeAllObjects](self->_movieFaceResults, "removeAllObjects");
}

- (void)addMovieFaceResults:(id)a3
{
  id v4;
  NSMutableArray *movieFaceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieFaceResults = self->_movieFaceResults;
  v8 = v4;
  if (!movieFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieFaceResults;
    self->_movieFaceResults = v6;

    v4 = v8;
    movieFaceResults = self->_movieFaceResults;
  }
  -[NSMutableArray addObject:](movieFaceResults, "addObject:", v4);

}

- (unint64_t)movieFaceResultsCount
{
  return -[NSMutableArray count](self->_movieFaceResults, "count");
}

- (id)movieFaceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieFaceResults, "objectAtIndex:", a3);
}

+ (Class)movieFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFaceprintResults
{
  -[NSMutableArray removeAllObjects](self->_movieFaceprintResults, "removeAllObjects");
}

- (void)addMovieFaceprintResults:(id)a3
{
  id v4;
  NSMutableArray *movieFaceprintResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieFaceprintResults = self->_movieFaceprintResults;
  v8 = v4;
  if (!movieFaceprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieFaceprintResults;
    self->_movieFaceprintResults = v6;

    v4 = v8;
    movieFaceprintResults = self->_movieFaceprintResults;
  }
  -[NSMutableArray addObject:](movieFaceprintResults, "addObject:", v4);

}

- (unint64_t)movieFaceprintResultsCount
{
  return -[NSMutableArray count](self->_movieFaceprintResults, "count");
}

- (id)movieFaceprintResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieFaceprintResults, "objectAtIndex:", a3);
}

+ (Class)movieFaceprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFeatureResults
{
  -[NSMutableArray removeAllObjects](self->_movieFeatureResults, "removeAllObjects");
}

- (void)addMovieFeatureResults:(id)a3
{
  id v4;
  NSMutableArray *movieFeatureResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieFeatureResults = self->_movieFeatureResults;
  v8 = v4;
  if (!movieFeatureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieFeatureResults;
    self->_movieFeatureResults = v6;

    v4 = v8;
    movieFeatureResults = self->_movieFeatureResults;
  }
  -[NSMutableArray addObject:](movieFeatureResults, "addObject:", v4);

}

- (unint64_t)movieFeatureResultsCount
{
  return -[NSMutableArray count](self->_movieFeatureResults, "count");
}

- (id)movieFeatureResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieFeatureResults, "objectAtIndex:", a3);
}

+ (Class)movieFeatureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieFineSubjectMotionResults
{
  -[NSMutableArray removeAllObjects](self->_movieFineSubjectMotionResults, "removeAllObjects");
}

- (void)addMovieFineSubjectMotionResults:(id)a3
{
  id v4;
  NSMutableArray *movieFineSubjectMotionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  v8 = v4;
  if (!movieFineSubjectMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieFineSubjectMotionResults;
    self->_movieFineSubjectMotionResults = v6;

    v4 = v8;
    movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  }
  -[NSMutableArray addObject:](movieFineSubjectMotionResults, "addObject:", v4);

}

- (unint64_t)movieFineSubjectMotionResultsCount
{
  return -[NSMutableArray count](self->_movieFineSubjectMotionResults, "count");
}

- (id)movieFineSubjectMotionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieFineSubjectMotionResults, "objectAtIndex:", a3);
}

+ (Class)movieFineSubjectMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieInterestingnessResults
{
  -[NSMutableArray removeAllObjects](self->_movieInterestingnessResults, "removeAllObjects");
}

- (void)addMovieInterestingnessResults:(id)a3
{
  id v4;
  NSMutableArray *movieInterestingnessResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieInterestingnessResults = self->_movieInterestingnessResults;
  v8 = v4;
  if (!movieInterestingnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieInterestingnessResults;
    self->_movieInterestingnessResults = v6;

    v4 = v8;
    movieInterestingnessResults = self->_movieInterestingnessResults;
  }
  -[NSMutableArray addObject:](movieInterestingnessResults, "addObject:", v4);

}

- (unint64_t)movieInterestingnessResultsCount
{
  return -[NSMutableArray count](self->_movieInterestingnessResults, "count");
}

- (id)movieInterestingnessResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieInterestingnessResults, "objectAtIndex:", a3);
}

+ (Class)movieInterestingnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieMovingObjectResults
{
  -[NSMutableArray removeAllObjects](self->_movieMovingObjectResults, "removeAllObjects");
}

- (void)addMovieMovingObjectResults:(id)a3
{
  id v4;
  NSMutableArray *movieMovingObjectResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieMovingObjectResults = self->_movieMovingObjectResults;
  v8 = v4;
  if (!movieMovingObjectResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieMovingObjectResults;
    self->_movieMovingObjectResults = v6;

    v4 = v8;
    movieMovingObjectResults = self->_movieMovingObjectResults;
  }
  -[NSMutableArray addObject:](movieMovingObjectResults, "addObject:", v4);

}

- (unint64_t)movieMovingObjectResultsCount
{
  return -[NSMutableArray count](self->_movieMovingObjectResults, "count");
}

- (id)movieMovingObjectResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieMovingObjectResults, "objectAtIndex:", a3);
}

+ (Class)movieMovingObjectResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieMusicResults
{
  -[NSMutableArray removeAllObjects](self->_movieMusicResults, "removeAllObjects");
}

- (void)addMovieMusicResults:(id)a3
{
  id v4;
  NSMutableArray *movieMusicResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieMusicResults = self->_movieMusicResults;
  v8 = v4;
  if (!movieMusicResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieMusicResults;
    self->_movieMusicResults = v6;

    v4 = v8;
    movieMusicResults = self->_movieMusicResults;
  }
  -[NSMutableArray addObject:](movieMusicResults, "addObject:", v4);

}

- (unint64_t)movieMusicResultsCount
{
  return -[NSMutableArray count](self->_movieMusicResults, "count");
}

- (id)movieMusicResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieMusicResults, "objectAtIndex:", a3);
}

+ (Class)movieMusicResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieObstructionResults
{
  -[NSMutableArray removeAllObjects](self->_movieObstructionResults, "removeAllObjects");
}

- (void)addMovieObstructionResults:(id)a3
{
  id v4;
  NSMutableArray *movieObstructionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieObstructionResults = self->_movieObstructionResults;
  v8 = v4;
  if (!movieObstructionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieObstructionResults;
    self->_movieObstructionResults = v6;

    v4 = v8;
    movieObstructionResults = self->_movieObstructionResults;
  }
  -[NSMutableArray addObject:](movieObstructionResults, "addObject:", v4);

}

- (unint64_t)movieObstructionResultsCount
{
  return -[NSMutableArray count](self->_movieObstructionResults, "count");
}

- (id)movieObstructionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieObstructionResults, "objectAtIndex:", a3);
}

+ (Class)movieObstructionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieOrientationResults
{
  -[NSMutableArray removeAllObjects](self->_movieOrientationResults, "removeAllObjects");
}

- (void)addMovieOrientationResults:(id)a3
{
  id v4;
  NSMutableArray *movieOrientationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieOrientationResults = self->_movieOrientationResults;
  v8 = v4;
  if (!movieOrientationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieOrientationResults;
    self->_movieOrientationResults = v6;

    v4 = v8;
    movieOrientationResults = self->_movieOrientationResults;
  }
  -[NSMutableArray addObject:](movieOrientationResults, "addObject:", v4);

}

- (unint64_t)movieOrientationResultsCount
{
  return -[NSMutableArray count](self->_movieOrientationResults, "count");
}

- (id)movieOrientationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieOrientationResults, "objectAtIndex:", a3);
}

+ (Class)movieOrientationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePreEncodeResults
{
  -[NSMutableArray removeAllObjects](self->_moviePreEncodeResults, "removeAllObjects");
}

- (void)addMoviePreEncodeResults:(id)a3
{
  id v4;
  NSMutableArray *moviePreEncodeResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  moviePreEncodeResults = self->_moviePreEncodeResults;
  v8 = v4;
  if (!moviePreEncodeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_moviePreEncodeResults;
    self->_moviePreEncodeResults = v6;

    v4 = v8;
    moviePreEncodeResults = self->_moviePreEncodeResults;
  }
  -[NSMutableArray addObject:](moviePreEncodeResults, "addObject:", v4);

}

- (unint64_t)moviePreEncodeResultsCount
{
  return -[NSMutableArray count](self->_moviePreEncodeResults, "count");
}

- (id)moviePreEncodeResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_moviePreEncodeResults, "objectAtIndex:", a3);
}

+ (Class)moviePreEncodeResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieQualityResults
{
  -[NSMutableArray removeAllObjects](self->_movieQualityResults, "removeAllObjects");
}

- (void)addMovieQualityResults:(id)a3
{
  id v4;
  NSMutableArray *movieQualityResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieQualityResults = self->_movieQualityResults;
  v8 = v4;
  if (!movieQualityResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieQualityResults;
    self->_movieQualityResults = v6;

    v4 = v8;
    movieQualityResults = self->_movieQualityResults;
  }
  -[NSMutableArray addObject:](movieQualityResults, "addObject:", v4);

}

- (unint64_t)movieQualityResultsCount
{
  return -[NSMutableArray count](self->_movieQualityResults, "count");
}

- (id)movieQualityResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieQualityResults, "objectAtIndex:", a3);
}

+ (Class)movieQualityResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSaliencyResults
{
  -[NSMutableArray removeAllObjects](self->_movieSaliencyResults, "removeAllObjects");
}

- (void)addMovieSaliencyResults:(id)a3
{
  id v4;
  NSMutableArray *movieSaliencyResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSaliencyResults = self->_movieSaliencyResults;
  v8 = v4;
  if (!movieSaliencyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSaliencyResults;
    self->_movieSaliencyResults = v6;

    v4 = v8;
    movieSaliencyResults = self->_movieSaliencyResults;
  }
  -[NSMutableArray addObject:](movieSaliencyResults, "addObject:", v4);

}

- (unint64_t)movieSaliencyResultsCount
{
  return -[NSMutableArray count](self->_movieSaliencyResults, "count");
}

- (id)movieSaliencyResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSaliencyResults, "objectAtIndex:", a3);
}

+ (Class)movieSaliencyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSceneResults
{
  -[NSMutableArray removeAllObjects](self->_movieSceneResults, "removeAllObjects");
}

- (void)addMovieSceneResults:(id)a3
{
  id v4;
  NSMutableArray *movieSceneResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSceneResults = self->_movieSceneResults;
  v8 = v4;
  if (!movieSceneResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSceneResults;
    self->_movieSceneResults = v6;

    v4 = v8;
    movieSceneResults = self->_movieSceneResults;
  }
  -[NSMutableArray addObject:](movieSceneResults, "addObject:", v4);

}

- (unint64_t)movieSceneResultsCount
{
  return -[NSMutableArray count](self->_movieSceneResults, "count");
}

- (id)movieSceneResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSceneResults, "objectAtIndex:", a3);
}

+ (Class)movieSceneResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSceneprintResults
{
  -[NSMutableArray removeAllObjects](self->_movieSceneprintResults, "removeAllObjects");
}

- (void)addMovieSceneprintResults:(id)a3
{
  id v4;
  NSMutableArray *movieSceneprintResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSceneprintResults = self->_movieSceneprintResults;
  v8 = v4;
  if (!movieSceneprintResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSceneprintResults;
    self->_movieSceneprintResults = v6;

    v4 = v8;
    movieSceneprintResults = self->_movieSceneprintResults;
  }
  -[NSMutableArray addObject:](movieSceneprintResults, "addObject:", v4);

}

- (unint64_t)movieSceneprintResultsCount
{
  return -[NSMutableArray count](self->_movieSceneprintResults, "count");
}

- (id)movieSceneprintResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSceneprintResults, "objectAtIndex:", a3);
}

+ (Class)movieSceneprintResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSubjectMotionResults
{
  -[NSMutableArray removeAllObjects](self->_movieSubjectMotionResults, "removeAllObjects");
}

- (void)addMovieSubjectMotionResults:(id)a3
{
  id v4;
  NSMutableArray *movieSubjectMotionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSubjectMotionResults = self->_movieSubjectMotionResults;
  v8 = v4;
  if (!movieSubjectMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSubjectMotionResults;
    self->_movieSubjectMotionResults = v6;

    v4 = v8;
    movieSubjectMotionResults = self->_movieSubjectMotionResults;
  }
  -[NSMutableArray addObject:](movieSubjectMotionResults, "addObject:", v4);

}

- (unint64_t)movieSubjectMotionResultsCount
{
  return -[NSMutableArray count](self->_movieSubjectMotionResults, "count");
}

- (id)movieSubjectMotionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSubjectMotionResults, "objectAtIndex:", a3);
}

+ (Class)movieSubjectMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSubtleMotionResults
{
  -[NSMutableArray removeAllObjects](self->_movieSubtleMotionResults, "removeAllObjects");
}

- (void)addMovieSubtleMotionResults:(id)a3
{
  id v4;
  NSMutableArray *movieSubtleMotionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSubtleMotionResults = self->_movieSubtleMotionResults;
  v8 = v4;
  if (!movieSubtleMotionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSubtleMotionResults;
    self->_movieSubtleMotionResults = v6;

    v4 = v8;
    movieSubtleMotionResults = self->_movieSubtleMotionResults;
  }
  -[NSMutableArray addObject:](movieSubtleMotionResults, "addObject:", v4);

}

- (unint64_t)movieSubtleMotionResultsCount
{
  return -[NSMutableArray count](self->_movieSubtleMotionResults, "count");
}

- (id)movieSubtleMotionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSubtleMotionResults, "objectAtIndex:", a3);
}

+ (Class)movieSubtleMotionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieUtteranceResults
{
  -[NSMutableArray removeAllObjects](self->_movieUtteranceResults, "removeAllObjects");
}

- (void)addMovieUtteranceResults:(id)a3
{
  id v4;
  NSMutableArray *movieUtteranceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieUtteranceResults = self->_movieUtteranceResults;
  v8 = v4;
  if (!movieUtteranceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieUtteranceResults;
    self->_movieUtteranceResults = v6;

    v4 = v8;
    movieUtteranceResults = self->_movieUtteranceResults;
  }
  -[NSMutableArray addObject:](movieUtteranceResults, "addObject:", v4);

}

- (unint64_t)movieUtteranceResultsCount
{
  return -[NSMutableArray count](self->_movieUtteranceResults, "count");
}

- (id)movieUtteranceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieUtteranceResults, "objectAtIndex:", a3);
}

+ (Class)movieUtteranceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieVoiceResults
{
  -[NSMutableArray removeAllObjects](self->_movieVoiceResults, "removeAllObjects");
}

- (void)addMovieVoiceResults:(id)a3
{
  id v4;
  NSMutableArray *movieVoiceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieVoiceResults = self->_movieVoiceResults;
  v8 = v4;
  if (!movieVoiceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieVoiceResults;
    self->_movieVoiceResults = v6;

    v4 = v8;
    movieVoiceResults = self->_movieVoiceResults;
  }
  -[NSMutableArray addObject:](movieVoiceResults, "addObject:", v4);

}

- (unint64_t)movieVoiceResultsCount
{
  return -[NSMutableArray count](self->_movieVoiceResults, "count");
}

- (id)movieVoiceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieVoiceResults, "objectAtIndex:", a3);
}

+ (Class)movieVoiceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSummaryResults
{
  -[NSMutableArray removeAllObjects](self->_movieSummaryResults, "removeAllObjects");
}

- (void)addMovieSummaryResults:(id)a3
{
  id v4;
  NSMutableArray *movieSummaryResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSummaryResults = self->_movieSummaryResults;
  v8 = v4;
  if (!movieSummaryResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSummaryResults;
    self->_movieSummaryResults = v6;

    v4 = v8;
    movieSummaryResults = self->_movieSummaryResults;
  }
  -[NSMutableArray addObject:](movieSummaryResults, "addObject:", v4);

}

- (unint64_t)movieSummaryResultsCount
{
  return -[NSMutableArray count](self->_movieSummaryResults, "count");
}

- (id)movieSummaryResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSummaryResults, "objectAtIndex:", a3);
}

+ (Class)movieSummaryResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHighlightResults
{
  -[NSMutableArray removeAllObjects](self->_movieHighlightResults, "removeAllObjects");
}

- (void)addMovieHighlightResults:(id)a3
{
  id v4;
  NSMutableArray *movieHighlightResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieHighlightResults = self->_movieHighlightResults;
  v8 = v4;
  if (!movieHighlightResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieHighlightResults;
    self->_movieHighlightResults = v6;

    v4 = v8;
    movieHighlightResults = self->_movieHighlightResults;
  }
  -[NSMutableArray addObject:](movieHighlightResults, "addObject:", v4);

}

- (unint64_t)movieHighlightResultsCount
{
  return -[NSMutableArray count](self->_movieHighlightResults, "count");
}

- (id)movieHighlightResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieHighlightResults, "objectAtIndex:", a3);
}

+ (Class)movieHighlightResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageExposureResults
{
  -[NSMutableArray removeAllObjects](self->_imageExposureResults, "removeAllObjects");
}

- (void)addImageExposureResults:(id)a3
{
  id v4;
  NSMutableArray *imageExposureResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageExposureResults = self->_imageExposureResults;
  v8 = v4;
  if (!imageExposureResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageExposureResults;
    self->_imageExposureResults = v6;

    v4 = v8;
    imageExposureResults = self->_imageExposureResults;
  }
  -[NSMutableArray addObject:](imageExposureResults, "addObject:", v4);

}

- (unint64_t)imageExposureResultsCount
{
  return -[NSMutableArray count](self->_imageExposureResults, "count");
}

- (id)imageExposureResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageExposureResults, "objectAtIndex:", a3);
}

+ (Class)imageExposureResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageHumanPoseResults
{
  -[NSMutableArray removeAllObjects](self->_imageHumanPoseResults, "removeAllObjects");
}

- (void)addImageHumanPoseResults:(id)a3
{
  id v4;
  NSMutableArray *imageHumanPoseResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageHumanPoseResults = self->_imageHumanPoseResults;
  v8 = v4;
  if (!imageHumanPoseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageHumanPoseResults;
    self->_imageHumanPoseResults = v6;

    v4 = v8;
    imageHumanPoseResults = self->_imageHumanPoseResults;
  }
  -[NSMutableArray addObject:](imageHumanPoseResults, "addObject:", v4);

}

- (unint64_t)imageHumanPoseResultsCount
{
  return -[NSMutableArray count](self->_imageHumanPoseResults, "count");
}

- (id)imageHumanPoseResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageHumanPoseResults, "objectAtIndex:", a3);
}

+ (Class)imageHumanPoseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanPoseResults
{
  -[NSMutableArray removeAllObjects](self->_movieHumanPoseResults, "removeAllObjects");
}

- (void)addMovieHumanPoseResults:(id)a3
{
  id v4;
  NSMutableArray *movieHumanPoseResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieHumanPoseResults = self->_movieHumanPoseResults;
  v8 = v4;
  if (!movieHumanPoseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieHumanPoseResults;
    self->_movieHumanPoseResults = v6;

    v4 = v8;
    movieHumanPoseResults = self->_movieHumanPoseResults;
  }
  -[NSMutableArray addObject:](movieHumanPoseResults, "addObject:", v4);

}

- (unint64_t)movieHumanPoseResultsCount
{
  return -[NSMutableArray count](self->_movieHumanPoseResults, "count");
}

- (id)movieHumanPoseResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieHumanPoseResults, "objectAtIndex:", a3);
}

+ (Class)movieHumanPoseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieApplauseResults
{
  -[NSMutableArray removeAllObjects](self->_movieApplauseResults, "removeAllObjects");
}

- (void)addMovieApplauseResults:(id)a3
{
  id v4;
  NSMutableArray *movieApplauseResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieApplauseResults = self->_movieApplauseResults;
  v8 = v4;
  if (!movieApplauseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieApplauseResults;
    self->_movieApplauseResults = v6;

    v4 = v8;
    movieApplauseResults = self->_movieApplauseResults;
  }
  -[NSMutableArray addObject:](movieApplauseResults, "addObject:", v4);

}

- (unint64_t)movieApplauseResultsCount
{
  return -[NSMutableArray count](self->_movieApplauseResults, "count");
}

- (id)movieApplauseResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieApplauseResults, "objectAtIndex:", a3);
}

+ (Class)movieApplauseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieBabbleResults
{
  -[NSMutableArray removeAllObjects](self->_movieBabbleResults, "removeAllObjects");
}

- (void)addMovieBabbleResults:(id)a3
{
  id v4;
  NSMutableArray *movieBabbleResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieBabbleResults = self->_movieBabbleResults;
  v8 = v4;
  if (!movieBabbleResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieBabbleResults;
    self->_movieBabbleResults = v6;

    v4 = v8;
    movieBabbleResults = self->_movieBabbleResults;
  }
  -[NSMutableArray addObject:](movieBabbleResults, "addObject:", v4);

}

- (unint64_t)movieBabbleResultsCount
{
  return -[NSMutableArray count](self->_movieBabbleResults, "count");
}

- (id)movieBabbleResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieBabbleResults, "objectAtIndex:", a3);
}

+ (Class)movieBabbleResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieCheeringResults
{
  -[NSMutableArray removeAllObjects](self->_movieCheeringResults, "removeAllObjects");
}

- (void)addMovieCheeringResults:(id)a3
{
  id v4;
  NSMutableArray *movieCheeringResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieCheeringResults = self->_movieCheeringResults;
  v8 = v4;
  if (!movieCheeringResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieCheeringResults;
    self->_movieCheeringResults = v6;

    v4 = v8;
    movieCheeringResults = self->_movieCheeringResults;
  }
  -[NSMutableArray addObject:](movieCheeringResults, "addObject:", v4);

}

- (unint64_t)movieCheeringResultsCount
{
  return -[NSMutableArray count](self->_movieCheeringResults, "count");
}

- (id)movieCheeringResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieCheeringResults, "objectAtIndex:", a3);
}

+ (Class)movieCheeringResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieLaughterResults
{
  -[NSMutableArray removeAllObjects](self->_movieLaughterResults, "removeAllObjects");
}

- (void)addMovieLaughterResults:(id)a3
{
  id v4;
  NSMutableArray *movieLaughterResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieLaughterResults = self->_movieLaughterResults;
  v8 = v4;
  if (!movieLaughterResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieLaughterResults;
    self->_movieLaughterResults = v6;

    v4 = v8;
    movieLaughterResults = self->_movieLaughterResults;
  }
  -[NSMutableArray addObject:](movieLaughterResults, "addObject:", v4);

}

- (unint64_t)movieLaughterResultsCount
{
  return -[NSMutableArray count](self->_movieLaughterResults, "count");
}

- (id)movieLaughterResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieLaughterResults, "objectAtIndex:", a3);
}

+ (Class)movieLaughterResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanActionResults
{
  -[NSMutableArray removeAllObjects](self->_movieHumanActionResults, "removeAllObjects");
}

- (void)addMovieHumanActionResults:(id)a3
{
  id v4;
  NSMutableArray *movieHumanActionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieHumanActionResults = self->_movieHumanActionResults;
  v8 = v4;
  if (!movieHumanActionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieHumanActionResults;
    self->_movieHumanActionResults = v6;

    v4 = v8;
    movieHumanActionResults = self->_movieHumanActionResults;
  }
  -[NSMutableArray addObject:](movieHumanActionResults, "addObject:", v4);

}

- (unint64_t)movieHumanActionResultsCount
{
  return -[NSMutableArray count](self->_movieHumanActionResults, "count");
}

- (id)movieHumanActionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieHumanActionResults, "objectAtIndex:", a3);
}

+ (Class)movieHumanActionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieLoudnessResults
{
  -[NSMutableArray removeAllObjects](self->_movieLoudnessResults, "removeAllObjects");
}

- (void)addMovieLoudnessResults:(id)a3
{
  id v4;
  NSMutableArray *movieLoudnessResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieLoudnessResults = self->_movieLoudnessResults;
  v8 = v4;
  if (!movieLoudnessResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieLoudnessResults;
    self->_movieLoudnessResults = v6;

    v4 = v8;
    movieLoudnessResults = self->_movieLoudnessResults;
  }
  -[NSMutableArray addObject:](movieLoudnessResults, "addObject:", v4);

}

- (unint64_t)movieLoudnessResultsCount
{
  return -[NSMutableArray count](self->_movieLoudnessResults, "count");
}

- (id)movieLoudnessResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieLoudnessResults, "objectAtIndex:", a3);
}

+ (Class)movieLoudnessResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePetsResults
{
  -[NSMutableArray removeAllObjects](self->_moviePetsResults, "removeAllObjects");
}

- (void)addMoviePetsResults:(id)a3
{
  id v4;
  NSMutableArray *moviePetsResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  moviePetsResults = self->_moviePetsResults;
  v8 = v4;
  if (!moviePetsResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_moviePetsResults;
    self->_moviePetsResults = v6;

    v4 = v8;
    moviePetsResults = self->_moviePetsResults;
  }
  -[NSMutableArray addObject:](moviePetsResults, "addObject:", v4);

}

- (unint64_t)moviePetsResultsCount
{
  return -[NSMutableArray count](self->_moviePetsResults, "count");
}

- (id)moviePetsResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_moviePetsResults, "objectAtIndex:", a3);
}

+ (Class)moviePetsResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoviePetsFaceResults
{
  -[NSMutableArray removeAllObjects](self->_moviePetsFaceResults, "removeAllObjects");
}

- (void)addMoviePetsFaceResults:(id)a3
{
  id v4;
  NSMutableArray *moviePetsFaceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  moviePetsFaceResults = self->_moviePetsFaceResults;
  v8 = v4;
  if (!moviePetsFaceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_moviePetsFaceResults;
    self->_moviePetsFaceResults = v6;

    v4 = v8;
    moviePetsFaceResults = self->_moviePetsFaceResults;
  }
  -[NSMutableArray addObject:](moviePetsFaceResults, "addObject:", v4);

}

- (unint64_t)moviePetsFaceResultsCount
{
  return -[NSMutableArray count](self->_moviePetsFaceResults, "count");
}

- (id)moviePetsFaceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_moviePetsFaceResults, "objectAtIndex:", a3);
}

+ (Class)moviePetsFaceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieStabilizationResults
{
  -[NSMutableArray removeAllObjects](self->_movieStabilizationResults, "removeAllObjects");
}

- (void)addMovieStabilizationResults:(id)a3
{
  id v4;
  NSMutableArray *movieStabilizationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieStabilizationResults = self->_movieStabilizationResults;
  v8 = v4;
  if (!movieStabilizationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieStabilizationResults;
    self->_movieStabilizationResults = v6;

    v4 = v8;
    movieStabilizationResults = self->_movieStabilizationResults;
  }
  -[NSMutableArray addObject:](movieStabilizationResults, "addObject:", v4);

}

- (unint64_t)movieStabilizationResultsCount
{
  return -[NSMutableArray count](self->_movieStabilizationResults, "count");
}

- (id)movieStabilizationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieStabilizationResults, "objectAtIndex:", a3);
}

+ (Class)movieStabilizationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHighlightScoreResults
{
  -[NSMutableArray removeAllObjects](self->_movieHighlightScoreResults, "removeAllObjects");
}

- (void)addMovieHighlightScoreResults:(id)a3
{
  id v4;
  NSMutableArray *movieHighlightScoreResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieHighlightScoreResults = self->_movieHighlightScoreResults;
  v8 = v4;
  if (!movieHighlightScoreResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieHighlightScoreResults;
    self->_movieHighlightScoreResults = v6;

    v4 = v8;
    movieHighlightScoreResults = self->_movieHighlightScoreResults;
  }
  -[NSMutableArray addObject:](movieHighlightScoreResults, "addObject:", v4);

}

- (unint64_t)movieHighlightScoreResultsCount
{
  return -[NSMutableArray count](self->_movieHighlightScoreResults, "count");
}

- (id)movieHighlightScoreResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieHighlightScoreResults, "objectAtIndex:", a3);
}

+ (Class)movieHighlightScoreResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearLivePhotoHumanActionClassificationResults
{
  -[NSMutableArray removeAllObjects](self->_livePhotoHumanActionClassificationResults, "removeAllObjects");
}

- (void)addLivePhotoHumanActionClassificationResults:(id)a3
{
  id v4;
  NSMutableArray *livePhotoHumanActionClassificationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  v8 = v4;
  if (!livePhotoHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_livePhotoHumanActionClassificationResults;
    self->_livePhotoHumanActionClassificationResults = v6;

    v4 = v8;
    livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  }
  -[NSMutableArray addObject:](livePhotoHumanActionClassificationResults, "addObject:", v4);

}

- (unint64_t)livePhotoHumanActionClassificationResultsCount
{
  return -[NSMutableArray count](self->_livePhotoHumanActionClassificationResults, "count");
}

- (id)livePhotoHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_livePhotoHumanActionClassificationResults, "objectAtIndex:", a3);
}

+ (Class)livePhotoHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieAudioQualityResults
{
  -[NSMutableArray removeAllObjects](self->_movieAudioQualityResults, "removeAllObjects");
}

- (void)addMovieAudioQualityResults:(id)a3
{
  id v4;
  NSMutableArray *movieAudioQualityResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieAudioQualityResults = self->_movieAudioQualityResults;
  v8 = v4;
  if (!movieAudioQualityResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieAudioQualityResults;
    self->_movieAudioQualityResults = v6;

    v4 = v8;
    movieAudioQualityResults = self->_movieAudioQualityResults;
  }
  -[NSMutableArray addObject:](movieAudioQualityResults, "addObject:", v4);

}

- (unint64_t)movieAudioQualityResultsCount
{
  return -[NSMutableArray count](self->_movieAudioQualityResults, "count");
}

- (id)movieAudioQualityResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieAudioQualityResults, "objectAtIndex:", a3);
}

+ (Class)movieAudioQualityResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieSafetyResults
{
  -[NSMutableArray removeAllObjects](self->_movieSafetyResults, "removeAllObjects");
}

- (void)addMovieSafetyResults:(id)a3
{
  id v4;
  NSMutableArray *movieSafetyResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieSafetyResults = self->_movieSafetyResults;
  v8 = v4;
  if (!movieSafetyResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieSafetyResults;
    self->_movieSafetyResults = v6;

    v4 = v8;
    movieSafetyResults = self->_movieSafetyResults;
  }
  -[NSMutableArray addObject:](movieSafetyResults, "addObject:", v4);

}

- (unint64_t)movieSafetyResultsCount
{
  return -[NSMutableArray count](self->_movieSafetyResults, "count");
}

- (id)movieSafetyResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieSafetyResults, "objectAtIndex:", a3);
}

+ (Class)movieSafetyResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieClassificationResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieClassificationResults, "removeAllObjects");
}

- (void)addFilesystemMovieClassificationResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieClassificationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  v8 = v4;
  if (!filesystemMovieClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieClassificationResults;
    self->_filesystemMovieClassificationResults = v6;

    v4 = v8;
    filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  }
  -[NSMutableArray addObject:](filesystemMovieClassificationResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieClassificationResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieClassificationResults, "count");
}

- (id)filesystemMovieClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieClassificationResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieHumanActionClassificationResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieHumanActionClassificationResults, "removeAllObjects");
}

- (void)addFilesystemMovieHumanActionClassificationResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieHumanActionClassificationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  v8 = v4;
  if (!filesystemMovieHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieHumanActionClassificationResults;
    self->_filesystemMovieHumanActionClassificationResults = v6;

    v4 = v8;
    filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  }
  -[NSMutableArray addObject:](filesystemMovieHumanActionClassificationResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieHumanActionClassificationResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieHumanActionClassificationResults, "count");
}

- (id)filesystemMovieHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieHumanActionClassificationResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieApplauseResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieApplauseResults, "removeAllObjects");
}

- (void)addFilesystemMovieApplauseResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieApplauseResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  v8 = v4;
  if (!filesystemMovieApplauseResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieApplauseResults;
    self->_filesystemMovieApplauseResults = v6;

    v4 = v8;
    filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  }
  -[NSMutableArray addObject:](filesystemMovieApplauseResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieApplauseResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieApplauseResults, "count");
}

- (id)filesystemMovieApplauseResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieApplauseResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieApplauseResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieBabbleResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieBabbleResults, "removeAllObjects");
}

- (void)addFilesystemMovieBabbleResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieBabbleResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  v8 = v4;
  if (!filesystemMovieBabbleResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieBabbleResults;
    self->_filesystemMovieBabbleResults = v6;

    v4 = v8;
    filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  }
  -[NSMutableArray addObject:](filesystemMovieBabbleResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieBabbleResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieBabbleResults, "count");
}

- (id)filesystemMovieBabbleResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieBabbleResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieBabbleResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieCheeringResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieCheeringResults, "removeAllObjects");
}

- (void)addFilesystemMovieCheeringResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieCheeringResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  v8 = v4;
  if (!filesystemMovieCheeringResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieCheeringResults;
    self->_filesystemMovieCheeringResults = v6;

    v4 = v8;
    filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  }
  -[NSMutableArray addObject:](filesystemMovieCheeringResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieCheeringResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieCheeringResults, "count");
}

- (id)filesystemMovieCheeringResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieCheeringResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieCheeringResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieLaughterResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieLaughterResults, "removeAllObjects");
}

- (void)addFilesystemMovieLaughterResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieLaughterResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  v8 = v4;
  if (!filesystemMovieLaughterResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieLaughterResults;
    self->_filesystemMovieLaughterResults = v6;

    v4 = v8;
    filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  }
  -[NSMutableArray addObject:](filesystemMovieLaughterResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieLaughterResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieLaughterResults, "count");
}

- (id)filesystemMovieLaughterResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieLaughterResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieLaughterResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieMusicResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieMusicResults, "removeAllObjects");
}

- (void)addFilesystemMovieMusicResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieMusicResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  v8 = v4;
  if (!filesystemMovieMusicResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieMusicResults;
    self->_filesystemMovieMusicResults = v6;

    v4 = v8;
    filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  }
  -[NSMutableArray addObject:](filesystemMovieMusicResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieMusicResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieMusicResults, "count");
}

- (id)filesystemMovieMusicResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieMusicResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieMusicResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearFilesystemMovieVoiceResults
{
  -[NSMutableArray removeAllObjects](self->_filesystemMovieVoiceResults, "removeAllObjects");
}

- (void)addFilesystemMovieVoiceResults:(id)a3
{
  id v4;
  NSMutableArray *filesystemMovieVoiceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  v8 = v4;
  if (!filesystemMovieVoiceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filesystemMovieVoiceResults;
    self->_filesystemMovieVoiceResults = v6;

    v4 = v8;
    filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  }
  -[NSMutableArray addObject:](filesystemMovieVoiceResults, "addObject:", v4);

}

- (unint64_t)filesystemMovieVoiceResultsCount
{
  return -[NSMutableArray count](self->_filesystemMovieVoiceResults, "count");
}

- (id)filesystemMovieVoiceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filesystemMovieVoiceResults, "objectAtIndex:", a3);
}

+ (Class)filesystemMovieVoiceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearAnimatedStickerResults
{
  -[NSMutableArray removeAllObjects](self->_animatedStickerResults, "removeAllObjects");
}

- (void)addAnimatedStickerResults:(id)a3
{
  id v4;
  NSMutableArray *animatedStickerResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  animatedStickerResults = self->_animatedStickerResults;
  v8 = v4;
  if (!animatedStickerResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_animatedStickerResults;
    self->_animatedStickerResults = v6;

    v4 = v8;
    animatedStickerResults = self->_animatedStickerResults;
  }
  -[NSMutableArray addObject:](animatedStickerResults, "addObject:", v4);

}

- (unint64_t)animatedStickerResultsCount
{
  return -[NSMutableArray count](self->_animatedStickerResults, "count");
}

- (id)animatedStickerResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_animatedStickerResults, "objectAtIndex:", a3);
}

+ (Class)animatedStickerResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieTorsoResults
{
  -[NSMutableArray removeAllObjects](self->_movieTorsoResults, "removeAllObjects");
}

- (void)addMovieTorsoResults:(id)a3
{
  id v4;
  NSMutableArray *movieTorsoResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieTorsoResults = self->_movieTorsoResults;
  v8 = v4;
  if (!movieTorsoResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieTorsoResults;
    self->_movieTorsoResults = v6;

    v4 = v8;
    movieTorsoResults = self->_movieTorsoResults;
  }
  -[NSMutableArray addObject:](movieTorsoResults, "addObject:", v4);

}

- (unint64_t)movieTorsoResultsCount
{
  return -[NSMutableArray count](self->_movieTorsoResults, "count");
}

- (id)movieTorsoResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieTorsoResults, "objectAtIndex:", a3);
}

+ (Class)movieTorsoResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearMovieHumanActionClassificationResults
{
  -[NSMutableArray removeAllObjects](self->_movieHumanActionClassificationResults, "removeAllObjects");
}

- (void)addMovieHumanActionClassificationResults:(id)a3
{
  id v4;
  NSMutableArray *movieHumanActionClassificationResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  v8 = v4;
  if (!movieHumanActionClassificationResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_movieHumanActionClassificationResults;
    self->_movieHumanActionClassificationResults = v6;

    v4 = v8;
    movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  }
  -[NSMutableArray addObject:](movieHumanActionClassificationResults, "addObject:", v4);

}

- (unint64_t)movieHumanActionClassificationResultsCount
{
  return -[NSMutableArray count](self->_movieHumanActionClassificationResults, "count");
}

- (id)movieHumanActionClassificationResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_movieHumanActionClassificationResults, "objectAtIndex:", a3);
}

+ (Class)movieHumanActionClassificationResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoEmbeddingResults
{
  -[NSMutableArray removeAllObjects](self->_videoEmbeddingResults, "removeAllObjects");
}

- (void)addVideoEmbeddingResults:(id)a3
{
  id v4;
  NSMutableArray *videoEmbeddingResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  videoEmbeddingResults = self->_videoEmbeddingResults;
  v8 = v4;
  if (!videoEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_videoEmbeddingResults;
    self->_videoEmbeddingResults = v6;

    v4 = v8;
    videoEmbeddingResults = self->_videoEmbeddingResults;
  }
  -[NSMutableArray addObject:](videoEmbeddingResults, "addObject:", v4);

}

- (unint64_t)videoEmbeddingResultsCount
{
  return -[NSMutableArray count](self->_videoEmbeddingResults, "count");
}

- (id)videoEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoEmbeddingResults, "objectAtIndex:", a3);
}

+ (Class)videoEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearSummarizedEmbeddingResults
{
  -[NSMutableArray removeAllObjects](self->_summarizedEmbeddingResults, "removeAllObjects");
}

- (void)addSummarizedEmbeddingResults:(id)a3
{
  id v4;
  NSMutableArray *summarizedEmbeddingResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  v8 = v4;
  if (!summarizedEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_summarizedEmbeddingResults;
    self->_summarizedEmbeddingResults = v6;

    v4 = v8;
    summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  }
  -[NSMutableArray addObject:](summarizedEmbeddingResults, "addObject:", v4);

}

- (unint64_t)summarizedEmbeddingResultsCount
{
  return -[NSMutableArray count](self->_summarizedEmbeddingResults, "count");
}

- (id)summarizedEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_summarizedEmbeddingResults, "objectAtIndex:", a3);
}

+ (Class)summarizedEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearAudioFusedVideoEmbeddingResults
{
  -[NSMutableArray removeAllObjects](self->_audioFusedVideoEmbeddingResults, "removeAllObjects");
}

- (void)addAudioFusedVideoEmbeddingResults:(id)a3
{
  id v4;
  NSMutableArray *audioFusedVideoEmbeddingResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  v8 = v4;
  if (!audioFusedVideoEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_audioFusedVideoEmbeddingResults;
    self->_audioFusedVideoEmbeddingResults = v6;

    v4 = v8;
    audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  }
  -[NSMutableArray addObject:](audioFusedVideoEmbeddingResults, "addObject:", v4);

}

- (unint64_t)audioFusedVideoEmbeddingResultsCount
{
  return -[NSMutableArray count](self->_audioFusedVideoEmbeddingResults, "count");
}

- (id)audioFusedVideoEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_audioFusedVideoEmbeddingResults, "objectAtIndex:", a3);
}

+ (Class)audioFusedVideoEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageEmbeddingResults
{
  -[NSMutableArray removeAllObjects](self->_imageEmbeddingResults, "removeAllObjects");
}

- (void)addImageEmbeddingResults:(id)a3
{
  id v4;
  NSMutableArray *imageEmbeddingResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageEmbeddingResults = self->_imageEmbeddingResults;
  v8 = v4;
  if (!imageEmbeddingResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageEmbeddingResults;
    self->_imageEmbeddingResults = v6;

    v4 = v8;
    imageEmbeddingResults = self->_imageEmbeddingResults;
  }
  -[NSMutableArray addObject:](imageEmbeddingResults, "addObject:", v4);

}

- (unint64_t)imageEmbeddingResultsCount
{
  return -[NSMutableArray count](self->_imageEmbeddingResults, "count");
}

- (id)imageEmbeddingResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageEmbeddingResults, "objectAtIndex:", a3);
}

+ (Class)imageEmbeddingResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearImageCaptionResults
{
  -[NSMutableArray removeAllObjects](self->_imageCaptionResults, "removeAllObjects");
}

- (void)addImageCaptionResults:(id)a3
{
  id v4;
  NSMutableArray *imageCaptionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageCaptionResults = self->_imageCaptionResults;
  v8 = v4;
  if (!imageCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageCaptionResults;
    self->_imageCaptionResults = v6;

    v4 = v8;
    imageCaptionResults = self->_imageCaptionResults;
  }
  -[NSMutableArray addObject:](imageCaptionResults, "addObject:", v4);

}

- (unint64_t)imageCaptionResultsCount
{
  return -[NSMutableArray count](self->_imageCaptionResults, "count");
}

- (id)imageCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageCaptionResults, "objectAtIndex:", a3);
}

+ (Class)imageCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoCaptionResults
{
  -[NSMutableArray removeAllObjects](self->_videoCaptionResults, "removeAllObjects");
}

- (void)addVideoCaptionResults:(id)a3
{
  id v4;
  NSMutableArray *videoCaptionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  videoCaptionResults = self->_videoCaptionResults;
  v8 = v4;
  if (!videoCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_videoCaptionResults;
    self->_videoCaptionResults = v6;

    v4 = v8;
    videoCaptionResults = self->_videoCaptionResults;
  }
  -[NSMutableArray addObject:](videoCaptionResults, "addObject:", v4);

}

- (unint64_t)videoCaptionResultsCount
{
  return -[NSMutableArray count](self->_videoCaptionResults, "count");
}

- (id)videoCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoCaptionResults, "objectAtIndex:", a3);
}

+ (Class)videoCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoCaptionPreferenceResults
{
  -[NSMutableArray removeAllObjects](self->_videoCaptionPreferenceResults, "removeAllObjects");
}

- (void)addVideoCaptionPreferenceResults:(id)a3
{
  id v4;
  NSMutableArray *videoCaptionPreferenceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  v8 = v4;
  if (!videoCaptionPreferenceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_videoCaptionPreferenceResults;
    self->_videoCaptionPreferenceResults = v6;

    v4 = v8;
    videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  }
  -[NSMutableArray addObject:](videoCaptionPreferenceResults, "addObject:", v4);

}

- (unint64_t)videoCaptionPreferenceResultsCount
{
  return -[NSMutableArray count](self->_videoCaptionPreferenceResults, "count");
}

- (id)videoCaptionPreferenceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoCaptionPreferenceResults, "objectAtIndex:", a3);
}

+ (Class)videoCaptionPreferenceResultsType
{
  return (Class)objc_opt_class();
}

- (void)clearVideoSegmentCaptionResults
{
  -[NSMutableArray removeAllObjects](self->_videoSegmentCaptionResults, "removeAllObjects");
}

- (void)addVideoSegmentCaptionResults:(id)a3
{
  id v4;
  NSMutableArray *videoSegmentCaptionResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  v8 = v4;
  if (!videoSegmentCaptionResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_videoSegmentCaptionResults;
    self->_videoSegmentCaptionResults = v6;

    v4 = v8;
    videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  }
  -[NSMutableArray addObject:](videoSegmentCaptionResults, "addObject:", v4);

}

- (unint64_t)videoSegmentCaptionResultsCount
{
  return -[NSMutableArray count](self->_videoSegmentCaptionResults, "count");
}

- (id)videoSegmentCaptionResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoSegmentCaptionResults, "objectAtIndex:", a3);
}

+ (Class)videoSegmentCaptionResultsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoAssetAnalysis;
  -[VCPProtoAssetAnalysis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoAssetAnalysis dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char has;
  void *v9;
  NSString *assetIdentifier;
  void *v11;
  NSString *assetMasterFingerprint;
  NSString *assetAdjustedFingerprint;
  NSString *assetCloudIdentifier;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ii;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t jj;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t kk;
  void *v70;
  void *v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t mm;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t nn;
  void *v84;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i1;
  void *v91;
  void *v92;
  NSMutableArray *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i2;
  void *v98;
  void *v99;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i3;
  void *v105;
  void *v106;
  NSMutableArray *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i4;
  void *v112;
  void *v113;
  NSMutableArray *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i5;
  void *v119;
  void *v120;
  NSMutableArray *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t i6;
  void *v126;
  void *v127;
  NSMutableArray *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t i7;
  void *v133;
  void *v134;
  NSMutableArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i8;
  void *v140;
  void *v141;
  NSMutableArray *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t i9;
  void *v147;
  void *v148;
  NSMutableArray *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i10;
  void *v154;
  void *v155;
  NSMutableArray *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i11;
  void *v161;
  void *v162;
  NSMutableArray *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t i12;
  void *v168;
  void *v169;
  NSMutableArray *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i13;
  void *v175;
  void *v176;
  NSMutableArray *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t i14;
  void *v182;
  void *v183;
  NSMutableArray *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t i15;
  void *v189;
  void *v190;
  NSMutableArray *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t i16;
  void *v196;
  void *v197;
  NSMutableArray *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t i17;
  void *v203;
  void *v204;
  NSMutableArray *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t i18;
  void *v210;
  void *v211;
  NSMutableArray *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t i19;
  void *v217;
  void *v218;
  NSMutableArray *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t i20;
  void *v224;
  void *v225;
  NSMutableArray *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t i21;
  void *v231;
  void *v232;
  NSMutableArray *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t i22;
  void *v238;
  void *v239;
  NSMutableArray *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t i23;
  void *v245;
  void *v246;
  NSMutableArray *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t i24;
  void *v252;
  void *v253;
  NSMutableArray *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t i25;
  void *v259;
  void *v260;
  NSMutableArray *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i26;
  void *v266;
  void *v267;
  NSMutableArray *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t i27;
  void *v273;
  void *v274;
  NSMutableArray *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t i28;
  void *v280;
  void *v281;
  NSMutableArray *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t i29;
  void *v287;
  void *v288;
  NSMutableArray *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t i30;
  void *v294;
  void *v295;
  NSMutableArray *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t i31;
  void *v301;
  void *v302;
  NSMutableArray *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t i32;
  void *v308;
  void *v309;
  NSMutableArray *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t i33;
  void *v315;
  void *v316;
  NSMutableArray *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t i34;
  void *v322;
  void *v323;
  NSMutableArray *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t i35;
  void *v329;
  void *v330;
  NSMutableArray *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t i36;
  void *v336;
  void *v337;
  NSMutableArray *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t i37;
  void *v343;
  void *v344;
  NSMutableArray *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t i38;
  void *v350;
  void *v351;
  NSMutableArray *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t i39;
  void *v357;
  void *v358;
  NSMutableArray *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t i40;
  void *v364;
  void *v365;
  NSMutableArray *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t i41;
  void *v371;
  void *v372;
  NSMutableArray *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t i42;
  void *v378;
  void *v379;
  NSMutableArray *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t i43;
  void *v385;
  void *v386;
  NSMutableArray *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t i44;
  void *v392;
  void *v393;
  NSMutableArray *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t i45;
  void *v399;
  void *v400;
  NSMutableArray *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t i46;
  void *v406;
  void *v407;
  NSMutableArray *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t i47;
  void *v413;
  void *v414;
  NSMutableArray *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t i48;
  void *v420;
  void *v421;
  NSMutableArray *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t i49;
  void *v427;
  void *v428;
  NSMutableArray *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t i50;
  void *v434;
  void *v435;
  NSMutableArray *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t i51;
  void *v441;
  void *v442;
  NSMutableArray *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t i52;
  void *v448;
  void *v449;
  NSMutableArray *v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t i53;
  void *v455;
  void *v456;
  NSMutableArray *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t i54;
  void *v462;
  void *v463;
  NSMutableArray *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t i55;
  void *v469;
  void *v470;
  NSMutableArray *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t i56;
  void *v476;
  void *v477;
  NSMutableArray *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t i57;
  void *v483;
  void *v484;
  NSMutableArray *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t i58;
  void *v490;
  void *v491;
  NSMutableArray *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t i59;
  void *v497;
  void *v498;
  NSMutableArray *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t i60;
  void *v504;
  void *v505;
  NSMutableArray *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t i61;
  void *v511;
  void *v512;
  NSMutableArray *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t i62;
  void *v518;
  void *v519;
  NSMutableArray *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t i63;
  void *v525;
  void *v526;
  NSMutableArray *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t i64;
  void *v532;
  id v533;
  void *v535;
  void *v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  __int128 v757;
  __int128 v758;
  __int128 v759;
  __int128 v760;
  __int128 v761;
  __int128 v762;
  __int128 v763;
  __int128 v764;
  __int128 v765;
  __int128 v766;
  __int128 v767;
  __int128 v768;
  __int128 v769;
  __int128 v770;
  __int128 v771;
  __int128 v772;
  __int128 v773;
  __int128 v774;
  __int128 v775;
  __int128 v776;
  __int128 v777;
  __int128 v778;
  __int128 v779;
  __int128 v780;
  __int128 v781;
  __int128 v782;
  __int128 v783;
  __int128 v784;
  __int128 v785;
  __int128 v786;
  __int128 v787;
  __int128 v788;
  __int128 v789;
  __int128 v790;
  __int128 v791;
  __int128 v792;
  __int128 v793;
  __int128 v794;
  __int128 v795;
  __int128 v796;
  __int128 v797;
  __int128 v798;
  __int128 v799;
  __int128 v800;
  __int128 v801;
  __int128 v802;
  __int128 v803;
  __int128 v804;
  __int128 v805;
  __int128 v806;
  __int128 v807;
  __int128 v808;
  __int128 v809;
  __int128 v810;
  __int128 v811;
  __int128 v812;
  __int128 v813;
  __int128 v814;
  __int128 v815;
  __int128 v816;
  __int128 v817;
  __int128 v818;
  __int128 v819;
  __int128 v820;
  __int128 v821;
  __int128 v822;
  __int128 v823;
  __int128 v824;
  __int128 v825;
  __int128 v826;
  __int128 v827;
  __int128 v828;
  __int128 v829;
  __int128 v830;
  __int128 v831;
  __int128 v832;
  _BYTE v833[128];
  _BYTE v834[128];
  _BYTE v835[128];
  _BYTE v836[128];
  _BYTE v837[128];
  _BYTE v838[128];
  _BYTE v839[128];
  _BYTE v840[128];
  _BYTE v841[128];
  _BYTE v842[128];
  _BYTE v843[128];
  _BYTE v844[128];
  _BYTE v845[128];
  _BYTE v846[128];
  _BYTE v847[128];
  _BYTE v848[128];
  _BYTE v849[128];
  _BYTE v850[128];
  _BYTE v851[128];
  _BYTE v852[128];
  _BYTE v853[128];
  _BYTE v854[128];
  _BYTE v855[128];
  _BYTE v856[128];
  _BYTE v857[128];
  _BYTE v858[128];
  _BYTE v859[128];
  _BYTE v860[128];
  _BYTE v861[128];
  _BYTE v862[128];
  _BYTE v863[128];
  _BYTE v864[128];
  _BYTE v865[128];
  _BYTE v866[128];
  _BYTE v867[128];
  _BYTE v868[128];
  _BYTE v869[128];
  _BYTE v870[128];
  _BYTE v871[128];
  _BYTE v872[128];
  _BYTE v873[128];
  _BYTE v874[128];
  _BYTE v875[128];
  _BYTE v876[128];
  _BYTE v877[128];
  _BYTE v878[128];
  _BYTE v879[128];
  _BYTE v880[128];
  _BYTE v881[128];
  _BYTE v882[128];
  _BYTE v883[128];
  _BYTE v884[128];
  _BYTE v885[128];
  _BYTE v886[128];
  _BYTE v887[128];
  _BYTE v888[128];
  _BYTE v889[128];
  _BYTE v890[128];
  _BYTE v891[128];
  _BYTE v892[128];
  _BYTE v893[128];
  _BYTE v894[128];
  _BYTE v895[128];
  _BYTE v896[128];
  _BYTE v897[128];
  _BYTE v898[128];
  _BYTE v899[128];
  _BYTE v900[128];
  _BYTE v901[128];
  _BYTE v902[128];
  _BYTE v903[128];
  _BYTE v904[128];
  _BYTE v905[128];
  _BYTE v906[128];
  uint64_t v907;

  v907 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_types);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("types"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_flags);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("flags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("date"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_quality);
    v535 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v535, CFSTR("quality"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_statsFlags);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v536, CFSTR("statsFlags"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_typesWide);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("typesWide"));

  }
LABEL_5:
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetIdentifier, CFSTR("assetIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_assetModificationDate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("assetModificationDate"));

  assetMasterFingerprint = self->_assetMasterFingerprint;
  if (assetMasterFingerprint)
    objc_msgSend(v3, "setObject:forKey:", assetMasterFingerprint, CFSTR("assetMasterFingerprint"));
  assetAdjustedFingerprint = self->_assetAdjustedFingerprint;
  if (assetAdjustedFingerprint)
    objc_msgSend(v3, "setObject:forKey:", assetAdjustedFingerprint, CFSTR("assetAdjustedFingerprint"));
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assetCloudIdentifier, CFSTR("assetCloudIdentifier"));
  if (-[NSMutableArray count](self->_imageBlurResults, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageBlurResults, "count"));
    v829 = 0u;
    v830 = 0u;
    v831 = 0u;
    v832 = 0u;
    v16 = self->_imageBlurResults;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v829, v906, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v830;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v830 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v829 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v829, v906, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("imageBlurResults"));
  }
  if (-[NSMutableArray count](self->_imageCompositionResults, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageCompositionResults, "count"));
    v825 = 0u;
    v826 = 0u;
    v827 = 0u;
    v828 = 0u;
    v23 = self->_imageCompositionResults;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v825, v905, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v826;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v826 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v825 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v825, v905, 16);
      }
      while (v25);
    }

    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("imageCompositionResults"));
  }
  if (-[NSMutableArray count](self->_imageFaceResults, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageFaceResults, "count"));
    v821 = 0u;
    v822 = 0u;
    v823 = 0u;
    v824 = 0u;
    v30 = self->_imageFaceResults;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v821, v904, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v822;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v822 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v821 + 1) + 8 * k), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v821, v904, 16);
      }
      while (v32);
    }

    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("imageFaceResults"));
  }
  if (-[NSMutableArray count](self->_imageFeatureResults, "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageFeatureResults, "count"));
    v817 = 0u;
    v818 = 0u;
    v819 = 0u;
    v820 = 0u;
    v37 = self->_imageFeatureResults;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v817, v903, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v818;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v818 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v817 + 1) + 8 * m), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v817, v903, 16);
      }
      while (v39);
    }

    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("imageFeatureResults"));
  }
  if (-[NSMutableArray count](self->_imageJunkResults, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageJunkResults, "count"));
    v813 = 0u;
    v814 = 0u;
    v815 = 0u;
    v816 = 0u;
    v44 = self->_imageJunkResults;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v813, v902, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v814;
      do
      {
        for (n = 0; n != v46; ++n)
        {
          if (*(_QWORD *)v814 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v813 + 1) + 8 * n), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v813, v902, 16);
      }
      while (v46);
    }

    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("imageJunkResults"));
  }
  if (-[NSMutableArray count](self->_imageSaliencyResults, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageSaliencyResults, "count"));
    v809 = 0u;
    v810 = 0u;
    v811 = 0u;
    v812 = 0u;
    v51 = self->_imageSaliencyResults;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v809, v901, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v810;
      do
      {
        for (ii = 0; ii != v53; ++ii)
        {
          if (*(_QWORD *)v810 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v809 + 1) + 8 * ii), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v809, v901, 16);
      }
      while (v53);
    }

    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("imageSaliencyResults"));
  }
  if (-[NSMutableArray count](self->_imageShotTypeResults, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageShotTypeResults, "count"));
    v805 = 0u;
    v806 = 0u;
    v807 = 0u;
    v808 = 0u;
    v58 = self->_imageShotTypeResults;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v805, v900, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v806;
      do
      {
        for (jj = 0; jj != v60; ++jj)
        {
          if (*(_QWORD *)v806 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v805 + 1) + 8 * jj), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v805, v900, 16);
      }
      while (v60);
    }

    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("imageShotTypeResults"));
  }
  if (-[NSMutableArray count](self->_imagePetsResults, "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imagePetsResults, "count"));
    v801 = 0u;
    v802 = 0u;
    v803 = 0u;
    v804 = 0u;
    v65 = self->_imagePetsResults;
    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v801, v899, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v802;
      do
      {
        for (kk = 0; kk != v67; ++kk)
        {
          if (*(_QWORD *)v802 != v68)
            objc_enumerationMutation(v65);
          objc_msgSend(*(id *)(*((_QWORD *)&v801 + 1) + 8 * kk), "dictionaryRepresentation");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v70);

        }
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v801, v899, 16);
      }
      while (v67);
    }

    objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("imagePetsResults"));
  }
  if (-[NSMutableArray count](self->_imagePetsFaceResults, "count"))
  {
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imagePetsFaceResults, "count"));
    v797 = 0u;
    v798 = 0u;
    v799 = 0u;
    v800 = 0u;
    v72 = self->_imagePetsFaceResults;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v797, v898, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v798;
      do
      {
        for (mm = 0; mm != v74; ++mm)
        {
          if (*(_QWORD *)v798 != v75)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v797 + 1) + 8 * mm), "dictionaryRepresentation");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v77);

        }
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v797, v898, 16);
      }
      while (v74);
    }

    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("imagePetsFaceResults"));
  }
  if (-[NSMutableArray count](self->_imageSceneprintResults, "count"))
  {
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageSceneprintResults, "count"));
    v793 = 0u;
    v794 = 0u;
    v795 = 0u;
    v796 = 0u;
    v79 = self->_imageSceneprintResults;
    v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v793, v897, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v794;
      do
      {
        for (nn = 0; nn != v81; ++nn)
        {
          if (*(_QWORD *)v794 != v82)
            objc_enumerationMutation(v79);
          objc_msgSend(*(id *)(*((_QWORD *)&v793 + 1) + 8 * nn), "dictionaryRepresentation");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObject:", v84);

        }
        v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v793, v897, 16);
      }
      while (v81);
    }

    objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("imageSceneprintResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoEffectsResults, "count"))
  {
    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoEffectsResults, "count"));
    v789 = 0u;
    v790 = 0u;
    v791 = 0u;
    v792 = 0u;
    v86 = self->_livePhotoEffectsResults;
    v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v789, v896, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v790;
      do
      {
        for (i1 = 0; i1 != v88; ++i1)
        {
          if (*(_QWORD *)v790 != v89)
            objc_enumerationMutation(v86);
          objc_msgSend(*(id *)(*((_QWORD *)&v789 + 1) + 8 * i1), "dictionaryRepresentation");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "addObject:", v91);

        }
        v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v789, v896, 16);
      }
      while (v88);
    }

    objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("livePhotoEffectsResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoRecommendationResults, "count"))
  {
    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoRecommendationResults, "count"));
    v785 = 0u;
    v786 = 0u;
    v787 = 0u;
    v788 = 0u;
    v93 = self->_livePhotoRecommendationResults;
    v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v785, v895, 16);
    if (v94)
    {
      v95 = v94;
      v96 = *(_QWORD *)v786;
      do
      {
        for (i2 = 0; i2 != v95; ++i2)
        {
          if (*(_QWORD *)v786 != v96)
            objc_enumerationMutation(v93);
          objc_msgSend(*(id *)(*((_QWORD *)&v785 + 1) + 8 * i2), "dictionaryRepresentation");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addObject:", v98);

        }
        v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v785, v895, 16);
      }
      while (v95);
    }

    objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("livePhotoRecommendationResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoSharpnessResults, "count"))
  {
    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoSharpnessResults, "count"));
    v781 = 0u;
    v782 = 0u;
    v783 = 0u;
    v784 = 0u;
    v100 = self->_livePhotoSharpnessResults;
    v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v781, v894, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v782;
      do
      {
        for (i3 = 0; i3 != v102; ++i3)
        {
          if (*(_QWORD *)v782 != v103)
            objc_enumerationMutation(v100);
          objc_msgSend(*(id *)(*((_QWORD *)&v781 + 1) + 8 * i3), "dictionaryRepresentation");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v105);

        }
        v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v781, v894, 16);
      }
      while (v102);
    }

    objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("livePhotoSharpnessResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoKeyFrameResults, "count"))
  {
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoKeyFrameResults, "count"));
    v777 = 0u;
    v778 = 0u;
    v779 = 0u;
    v780 = 0u;
    v107 = self->_livePhotoKeyFrameResults;
    v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v777, v893, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v778;
      do
      {
        for (i4 = 0; i4 != v109; ++i4)
        {
          if (*(_QWORD *)v778 != v110)
            objc_enumerationMutation(v107);
          objc_msgSend(*(id *)(*((_QWORD *)&v777 + 1) + 8 * i4), "dictionaryRepresentation");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addObject:", v112);

        }
        v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v777, v893, 16);
      }
      while (v109);
    }

    objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("livePhotoKeyFrameResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoKeyFrameStillResults, "count"))
  {
    v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoKeyFrameStillResults, "count"));
    v773 = 0u;
    v774 = 0u;
    v775 = 0u;
    v776 = 0u;
    v114 = self->_livePhotoKeyFrameStillResults;
    v115 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v773, v892, 16);
    if (v115)
    {
      v116 = v115;
      v117 = *(_QWORD *)v774;
      do
      {
        for (i5 = 0; i5 != v116; ++i5)
        {
          if (*(_QWORD *)v774 != v117)
            objc_enumerationMutation(v114);
          objc_msgSend(*(id *)(*((_QWORD *)&v773 + 1) + 8 * i5), "dictionaryRepresentation");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "addObject:", v119);

        }
        v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v773, v892, 16);
      }
      while (v116);
    }

    objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("livePhotoKeyFrameStillResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoSettlingEffectGatingResults, "count"))
  {
    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoSettlingEffectGatingResults, "count"));
    v769 = 0u;
    v770 = 0u;
    v771 = 0u;
    v772 = 0u;
    v121 = self->_livePhotoSettlingEffectGatingResults;
    v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v121, "countByEnumeratingWithState:objects:count:", &v769, v891, 16);
    if (v122)
    {
      v123 = v122;
      v124 = *(_QWORD *)v770;
      do
      {
        for (i6 = 0; i6 != v123; ++i6)
        {
          if (*(_QWORD *)v770 != v124)
            objc_enumerationMutation(v121);
          objc_msgSend(*(id *)(*((_QWORD *)&v769 + 1) + 8 * i6), "dictionaryRepresentation");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "addObject:", v126);

        }
        v123 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v121, "countByEnumeratingWithState:objects:count:", &v769, v891, 16);
      }
      while (v123);
    }

    objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("livePhotoSettlingEffectGatingResults"));
  }
  if (-[NSMutableArray count](self->_movieActivityLevelResults, "count"))
  {
    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieActivityLevelResults, "count"));
    v765 = 0u;
    v766 = 0u;
    v767 = 0u;
    v768 = 0u;
    v128 = self->_movieActivityLevelResults;
    v129 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v765, v890, 16);
    if (v129)
    {
      v130 = v129;
      v131 = *(_QWORD *)v766;
      do
      {
        for (i7 = 0; i7 != v130; ++i7)
        {
          if (*(_QWORD *)v766 != v131)
            objc_enumerationMutation(v128);
          objc_msgSend(*(id *)(*((_QWORD *)&v765 + 1) + 8 * i7), "dictionaryRepresentation");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "addObject:", v133);

        }
        v130 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v128, "countByEnumeratingWithState:objects:count:", &v765, v890, 16);
      }
      while (v130);
    }

    objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("movieActivityLevelResults"));
  }
  if (-[NSMutableArray count](self->_movieCameraMotionResults, "count"))
  {
    v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieCameraMotionResults, "count"));
    v761 = 0u;
    v762 = 0u;
    v763 = 0u;
    v764 = 0u;
    v135 = self->_movieCameraMotionResults;
    v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v761, v889, 16);
    if (v136)
    {
      v137 = v136;
      v138 = *(_QWORD *)v762;
      do
      {
        for (i8 = 0; i8 != v137; ++i8)
        {
          if (*(_QWORD *)v762 != v138)
            objc_enumerationMutation(v135);
          objc_msgSend(*(id *)(*((_QWORD *)&v761 + 1) + 8 * i8), "dictionaryRepresentation");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "addObject:", v140);

        }
        v137 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v761, v889, 16);
      }
      while (v137);
    }

    objc_msgSend(v3, "setObject:forKey:", v134, CFSTR("movieCameraMotionResults"));
  }
  if (-[NSMutableArray count](self->_movieClassificationResults, "count"))
  {
    v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieClassificationResults, "count"));
    v757 = 0u;
    v758 = 0u;
    v759 = 0u;
    v760 = 0u;
    v142 = self->_movieClassificationResults;
    v143 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v757, v888, 16);
    if (v143)
    {
      v144 = v143;
      v145 = *(_QWORD *)v758;
      do
      {
        for (i9 = 0; i9 != v144; ++i9)
        {
          if (*(_QWORD *)v758 != v145)
            objc_enumerationMutation(v142);
          objc_msgSend(*(id *)(*((_QWORD *)&v757 + 1) + 8 * i9), "dictionaryRepresentation");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "addObject:", v147);

        }
        v144 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v142, "countByEnumeratingWithState:objects:count:", &v757, v888, 16);
      }
      while (v144);
    }

    objc_msgSend(v3, "setObject:forKey:", v141, CFSTR("movieClassificationResults"));
  }
  if (-[NSMutableArray count](self->_movieFaceResults, "count"))
  {
    v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieFaceResults, "count"));
    v753 = 0u;
    v754 = 0u;
    v755 = 0u;
    v756 = 0u;
    v149 = self->_movieFaceResults;
    v150 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v149, "countByEnumeratingWithState:objects:count:", &v753, v887, 16);
    if (v150)
    {
      v151 = v150;
      v152 = *(_QWORD *)v754;
      do
      {
        for (i10 = 0; i10 != v151; ++i10)
        {
          if (*(_QWORD *)v754 != v152)
            objc_enumerationMutation(v149);
          objc_msgSend(*(id *)(*((_QWORD *)&v753 + 1) + 8 * i10), "dictionaryRepresentation");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "addObject:", v154);

        }
        v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v149, "countByEnumeratingWithState:objects:count:", &v753, v887, 16);
      }
      while (v151);
    }

    objc_msgSend(v3, "setObject:forKey:", v148, CFSTR("movieFaceResults"));
  }
  if (-[NSMutableArray count](self->_movieFaceprintResults, "count"))
  {
    v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieFaceprintResults, "count"));
    v749 = 0u;
    v750 = 0u;
    v751 = 0u;
    v752 = 0u;
    v156 = self->_movieFaceprintResults;
    v157 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v749, v886, 16);
    if (v157)
    {
      v158 = v157;
      v159 = *(_QWORD *)v750;
      do
      {
        for (i11 = 0; i11 != v158; ++i11)
        {
          if (*(_QWORD *)v750 != v159)
            objc_enumerationMutation(v156);
          objc_msgSend(*(id *)(*((_QWORD *)&v749 + 1) + 8 * i11), "dictionaryRepresentation");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "addObject:", v161);

        }
        v158 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v156, "countByEnumeratingWithState:objects:count:", &v749, v886, 16);
      }
      while (v158);
    }

    objc_msgSend(v3, "setObject:forKey:", v155, CFSTR("movieFaceprintResults"));
  }
  if (-[NSMutableArray count](self->_movieFeatureResults, "count"))
  {
    v162 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieFeatureResults, "count"));
    v745 = 0u;
    v746 = 0u;
    v747 = 0u;
    v748 = 0u;
    v163 = self->_movieFeatureResults;
    v164 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v163, "countByEnumeratingWithState:objects:count:", &v745, v885, 16);
    if (v164)
    {
      v165 = v164;
      v166 = *(_QWORD *)v746;
      do
      {
        for (i12 = 0; i12 != v165; ++i12)
        {
          if (*(_QWORD *)v746 != v166)
            objc_enumerationMutation(v163);
          objc_msgSend(*(id *)(*((_QWORD *)&v745 + 1) + 8 * i12), "dictionaryRepresentation");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "addObject:", v168);

        }
        v165 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v163, "countByEnumeratingWithState:objects:count:", &v745, v885, 16);
      }
      while (v165);
    }

    objc_msgSend(v3, "setObject:forKey:", v162, CFSTR("movieFeatureResults"));
  }
  if (-[NSMutableArray count](self->_movieFineSubjectMotionResults, "count"))
  {
    v169 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieFineSubjectMotionResults, "count"));
    v741 = 0u;
    v742 = 0u;
    v743 = 0u;
    v744 = 0u;
    v170 = self->_movieFineSubjectMotionResults;
    v171 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v741, v884, 16);
    if (v171)
    {
      v172 = v171;
      v173 = *(_QWORD *)v742;
      do
      {
        for (i13 = 0; i13 != v172; ++i13)
        {
          if (*(_QWORD *)v742 != v173)
            objc_enumerationMutation(v170);
          objc_msgSend(*(id *)(*((_QWORD *)&v741 + 1) + 8 * i13), "dictionaryRepresentation");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "addObject:", v175);

        }
        v172 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v741, v884, 16);
      }
      while (v172);
    }

    objc_msgSend(v3, "setObject:forKey:", v169, CFSTR("movieFineSubjectMotionResults"));
  }
  if (-[NSMutableArray count](self->_movieInterestingnessResults, "count"))
  {
    v176 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieInterestingnessResults, "count"));
    v737 = 0u;
    v738 = 0u;
    v739 = 0u;
    v740 = 0u;
    v177 = self->_movieInterestingnessResults;
    v178 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v177, "countByEnumeratingWithState:objects:count:", &v737, v883, 16);
    if (v178)
    {
      v179 = v178;
      v180 = *(_QWORD *)v738;
      do
      {
        for (i14 = 0; i14 != v179; ++i14)
        {
          if (*(_QWORD *)v738 != v180)
            objc_enumerationMutation(v177);
          objc_msgSend(*(id *)(*((_QWORD *)&v737 + 1) + 8 * i14), "dictionaryRepresentation");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "addObject:", v182);

        }
        v179 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v177, "countByEnumeratingWithState:objects:count:", &v737, v883, 16);
      }
      while (v179);
    }

    objc_msgSend(v3, "setObject:forKey:", v176, CFSTR("movieInterestingnessResults"));
  }
  if (-[NSMutableArray count](self->_movieMovingObjectResults, "count"))
  {
    v183 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieMovingObjectResults, "count"));
    v733 = 0u;
    v734 = 0u;
    v735 = 0u;
    v736 = 0u;
    v184 = self->_movieMovingObjectResults;
    v185 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v733, v882, 16);
    if (v185)
    {
      v186 = v185;
      v187 = *(_QWORD *)v734;
      do
      {
        for (i15 = 0; i15 != v186; ++i15)
        {
          if (*(_QWORD *)v734 != v187)
            objc_enumerationMutation(v184);
          objc_msgSend(*(id *)(*((_QWORD *)&v733 + 1) + 8 * i15), "dictionaryRepresentation");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "addObject:", v189);

        }
        v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v184, "countByEnumeratingWithState:objects:count:", &v733, v882, 16);
      }
      while (v186);
    }

    objc_msgSend(v3, "setObject:forKey:", v183, CFSTR("movieMovingObjectResults"));
  }
  if (-[NSMutableArray count](self->_movieMusicResults, "count"))
  {
    v190 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieMusicResults, "count"));
    v729 = 0u;
    v730 = 0u;
    v731 = 0u;
    v732 = 0u;
    v191 = self->_movieMusicResults;
    v192 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v191, "countByEnumeratingWithState:objects:count:", &v729, v881, 16);
    if (v192)
    {
      v193 = v192;
      v194 = *(_QWORD *)v730;
      do
      {
        for (i16 = 0; i16 != v193; ++i16)
        {
          if (*(_QWORD *)v730 != v194)
            objc_enumerationMutation(v191);
          objc_msgSend(*(id *)(*((_QWORD *)&v729 + 1) + 8 * i16), "dictionaryRepresentation");
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "addObject:", v196);

        }
        v193 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v191, "countByEnumeratingWithState:objects:count:", &v729, v881, 16);
      }
      while (v193);
    }

    objc_msgSend(v3, "setObject:forKey:", v190, CFSTR("movieMusicResults"));
  }
  if (-[NSMutableArray count](self->_movieObstructionResults, "count"))
  {
    v197 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieObstructionResults, "count"));
    v725 = 0u;
    v726 = 0u;
    v727 = 0u;
    v728 = 0u;
    v198 = self->_movieObstructionResults;
    v199 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v725, v880, 16);
    if (v199)
    {
      v200 = v199;
      v201 = *(_QWORD *)v726;
      do
      {
        for (i17 = 0; i17 != v200; ++i17)
        {
          if (*(_QWORD *)v726 != v201)
            objc_enumerationMutation(v198);
          objc_msgSend(*(id *)(*((_QWORD *)&v725 + 1) + 8 * i17), "dictionaryRepresentation");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "addObject:", v203);

        }
        v200 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v198, "countByEnumeratingWithState:objects:count:", &v725, v880, 16);
      }
      while (v200);
    }

    objc_msgSend(v3, "setObject:forKey:", v197, CFSTR("movieObstructionResults"));
  }
  if (-[NSMutableArray count](self->_movieOrientationResults, "count"))
  {
    v204 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieOrientationResults, "count"));
    v721 = 0u;
    v722 = 0u;
    v723 = 0u;
    v724 = 0u;
    v205 = self->_movieOrientationResults;
    v206 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v721, v879, 16);
    if (v206)
    {
      v207 = v206;
      v208 = *(_QWORD *)v722;
      do
      {
        for (i18 = 0; i18 != v207; ++i18)
        {
          if (*(_QWORD *)v722 != v208)
            objc_enumerationMutation(v205);
          objc_msgSend(*(id *)(*((_QWORD *)&v721 + 1) + 8 * i18), "dictionaryRepresentation");
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "addObject:", v210);

        }
        v207 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v721, v879, 16);
      }
      while (v207);
    }

    objc_msgSend(v3, "setObject:forKey:", v204, CFSTR("movieOrientationResults"));
  }
  if (-[NSMutableArray count](self->_moviePreEncodeResults, "count"))
  {
    v211 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_moviePreEncodeResults, "count"));
    v717 = 0u;
    v718 = 0u;
    v719 = 0u;
    v720 = 0u;
    v212 = self->_moviePreEncodeResults;
    v213 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v212, "countByEnumeratingWithState:objects:count:", &v717, v878, 16);
    if (v213)
    {
      v214 = v213;
      v215 = *(_QWORD *)v718;
      do
      {
        for (i19 = 0; i19 != v214; ++i19)
        {
          if (*(_QWORD *)v718 != v215)
            objc_enumerationMutation(v212);
          objc_msgSend(*(id *)(*((_QWORD *)&v717 + 1) + 8 * i19), "dictionaryRepresentation");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v211, "addObject:", v217);

        }
        v214 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v212, "countByEnumeratingWithState:objects:count:", &v717, v878, 16);
      }
      while (v214);
    }

    objc_msgSend(v3, "setObject:forKey:", v211, CFSTR("moviePreEncodeResults"));
  }
  if (-[NSMutableArray count](self->_movieQualityResults, "count"))
  {
    v218 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieQualityResults, "count"));
    v713 = 0u;
    v714 = 0u;
    v715 = 0u;
    v716 = 0u;
    v219 = self->_movieQualityResults;
    v220 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v219, "countByEnumeratingWithState:objects:count:", &v713, v877, 16);
    if (v220)
    {
      v221 = v220;
      v222 = *(_QWORD *)v714;
      do
      {
        for (i20 = 0; i20 != v221; ++i20)
        {
          if (*(_QWORD *)v714 != v222)
            objc_enumerationMutation(v219);
          objc_msgSend(*(id *)(*((_QWORD *)&v713 + 1) + 8 * i20), "dictionaryRepresentation");
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v218, "addObject:", v224);

        }
        v221 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v219, "countByEnumeratingWithState:objects:count:", &v713, v877, 16);
      }
      while (v221);
    }

    objc_msgSend(v3, "setObject:forKey:", v218, CFSTR("movieQualityResults"));
  }
  if (-[NSMutableArray count](self->_movieSaliencyResults, "count"))
  {
    v225 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSaliencyResults, "count"));
    v709 = 0u;
    v710 = 0u;
    v711 = 0u;
    v712 = 0u;
    v226 = self->_movieSaliencyResults;
    v227 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v226, "countByEnumeratingWithState:objects:count:", &v709, v876, 16);
    if (v227)
    {
      v228 = v227;
      v229 = *(_QWORD *)v710;
      do
      {
        for (i21 = 0; i21 != v228; ++i21)
        {
          if (*(_QWORD *)v710 != v229)
            objc_enumerationMutation(v226);
          objc_msgSend(*(id *)(*((_QWORD *)&v709 + 1) + 8 * i21), "dictionaryRepresentation");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v225, "addObject:", v231);

        }
        v228 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v226, "countByEnumeratingWithState:objects:count:", &v709, v876, 16);
      }
      while (v228);
    }

    objc_msgSend(v3, "setObject:forKey:", v225, CFSTR("movieSaliencyResults"));
  }
  if (-[NSMutableArray count](self->_movieSceneResults, "count"))
  {
    v232 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSceneResults, "count"));
    v705 = 0u;
    v706 = 0u;
    v707 = 0u;
    v708 = 0u;
    v233 = self->_movieSceneResults;
    v234 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v233, "countByEnumeratingWithState:objects:count:", &v705, v875, 16);
    if (v234)
    {
      v235 = v234;
      v236 = *(_QWORD *)v706;
      do
      {
        for (i22 = 0; i22 != v235; ++i22)
        {
          if (*(_QWORD *)v706 != v236)
            objc_enumerationMutation(v233);
          objc_msgSend(*(id *)(*((_QWORD *)&v705 + 1) + 8 * i22), "dictionaryRepresentation");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "addObject:", v238);

        }
        v235 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v233, "countByEnumeratingWithState:objects:count:", &v705, v875, 16);
      }
      while (v235);
    }

    objc_msgSend(v3, "setObject:forKey:", v232, CFSTR("movieSceneResults"));
  }
  if (-[NSMutableArray count](self->_movieSceneprintResults, "count"))
  {
    v239 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSceneprintResults, "count"));
    v701 = 0u;
    v702 = 0u;
    v703 = 0u;
    v704 = 0u;
    v240 = self->_movieSceneprintResults;
    v241 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v701, v874, 16);
    if (v241)
    {
      v242 = v241;
      v243 = *(_QWORD *)v702;
      do
      {
        for (i23 = 0; i23 != v242; ++i23)
        {
          if (*(_QWORD *)v702 != v243)
            objc_enumerationMutation(v240);
          objc_msgSend(*(id *)(*((_QWORD *)&v701 + 1) + 8 * i23), "dictionaryRepresentation");
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "addObject:", v245);

        }
        v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v701, v874, 16);
      }
      while (v242);
    }

    objc_msgSend(v3, "setObject:forKey:", v239, CFSTR("movieSceneprintResults"));
  }
  if (-[NSMutableArray count](self->_movieSubjectMotionResults, "count"))
  {
    v246 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSubjectMotionResults, "count"));
    v697 = 0u;
    v698 = 0u;
    v699 = 0u;
    v700 = 0u;
    v247 = self->_movieSubjectMotionResults;
    v248 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v247, "countByEnumeratingWithState:objects:count:", &v697, v873, 16);
    if (v248)
    {
      v249 = v248;
      v250 = *(_QWORD *)v698;
      do
      {
        for (i24 = 0; i24 != v249; ++i24)
        {
          if (*(_QWORD *)v698 != v250)
            objc_enumerationMutation(v247);
          objc_msgSend(*(id *)(*((_QWORD *)&v697 + 1) + 8 * i24), "dictionaryRepresentation");
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v246, "addObject:", v252);

        }
        v249 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v247, "countByEnumeratingWithState:objects:count:", &v697, v873, 16);
      }
      while (v249);
    }

    objc_msgSend(v3, "setObject:forKey:", v246, CFSTR("movieSubjectMotionResults"));
  }
  if (-[NSMutableArray count](self->_movieSubtleMotionResults, "count"))
  {
    v253 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSubtleMotionResults, "count"));
    v693 = 0u;
    v694 = 0u;
    v695 = 0u;
    v696 = 0u;
    v254 = self->_movieSubtleMotionResults;
    v255 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v254, "countByEnumeratingWithState:objects:count:", &v693, v872, 16);
    if (v255)
    {
      v256 = v255;
      v257 = *(_QWORD *)v694;
      do
      {
        for (i25 = 0; i25 != v256; ++i25)
        {
          if (*(_QWORD *)v694 != v257)
            objc_enumerationMutation(v254);
          objc_msgSend(*(id *)(*((_QWORD *)&v693 + 1) + 8 * i25), "dictionaryRepresentation");
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "addObject:", v259);

        }
        v256 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v254, "countByEnumeratingWithState:objects:count:", &v693, v872, 16);
      }
      while (v256);
    }

    objc_msgSend(v3, "setObject:forKey:", v253, CFSTR("movieSubtleMotionResults"));
  }
  if (-[NSMutableArray count](self->_movieUtteranceResults, "count"))
  {
    v260 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieUtteranceResults, "count"));
    v689 = 0u;
    v690 = 0u;
    v691 = 0u;
    v692 = 0u;
    v261 = self->_movieUtteranceResults;
    v262 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v261, "countByEnumeratingWithState:objects:count:", &v689, v871, 16);
    if (v262)
    {
      v263 = v262;
      v264 = *(_QWORD *)v690;
      do
      {
        for (i26 = 0; i26 != v263; ++i26)
        {
          if (*(_QWORD *)v690 != v264)
            objc_enumerationMutation(v261);
          objc_msgSend(*(id *)(*((_QWORD *)&v689 + 1) + 8 * i26), "dictionaryRepresentation");
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v260, "addObject:", v266);

        }
        v263 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v261, "countByEnumeratingWithState:objects:count:", &v689, v871, 16);
      }
      while (v263);
    }

    objc_msgSend(v3, "setObject:forKey:", v260, CFSTR("movieUtteranceResults"));
  }
  if (-[NSMutableArray count](self->_movieVoiceResults, "count"))
  {
    v267 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieVoiceResults, "count"));
    v685 = 0u;
    v686 = 0u;
    v687 = 0u;
    v688 = 0u;
    v268 = self->_movieVoiceResults;
    v269 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v268, "countByEnumeratingWithState:objects:count:", &v685, v870, 16);
    if (v269)
    {
      v270 = v269;
      v271 = *(_QWORD *)v686;
      do
      {
        for (i27 = 0; i27 != v270; ++i27)
        {
          if (*(_QWORD *)v686 != v271)
            objc_enumerationMutation(v268);
          objc_msgSend(*(id *)(*((_QWORD *)&v685 + 1) + 8 * i27), "dictionaryRepresentation");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "addObject:", v273);

        }
        v270 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v268, "countByEnumeratingWithState:objects:count:", &v685, v870, 16);
      }
      while (v270);
    }

    objc_msgSend(v3, "setObject:forKey:", v267, CFSTR("movieVoiceResults"));
  }
  if (-[NSMutableArray count](self->_movieSummaryResults, "count"))
  {
    v274 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSummaryResults, "count"));
    v681 = 0u;
    v682 = 0u;
    v683 = 0u;
    v684 = 0u;
    v275 = self->_movieSummaryResults;
    v276 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v681, v869, 16);
    if (v276)
    {
      v277 = v276;
      v278 = *(_QWORD *)v682;
      do
      {
        for (i28 = 0; i28 != v277; ++i28)
        {
          if (*(_QWORD *)v682 != v278)
            objc_enumerationMutation(v275);
          objc_msgSend(*(id *)(*((_QWORD *)&v681 + 1) + 8 * i28), "dictionaryRepresentation");
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v274, "addObject:", v280);

        }
        v277 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v681, v869, 16);
      }
      while (v277);
    }

    objc_msgSend(v3, "setObject:forKey:", v274, CFSTR("movieSummaryResults"));
  }
  if (-[NSMutableArray count](self->_movieHighlightResults, "count"))
  {
    v281 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieHighlightResults, "count"));
    v677 = 0u;
    v678 = 0u;
    v679 = 0u;
    v680 = 0u;
    v282 = self->_movieHighlightResults;
    v283 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v282, "countByEnumeratingWithState:objects:count:", &v677, v868, 16);
    if (v283)
    {
      v284 = v283;
      v285 = *(_QWORD *)v678;
      do
      {
        for (i29 = 0; i29 != v284; ++i29)
        {
          if (*(_QWORD *)v678 != v285)
            objc_enumerationMutation(v282);
          objc_msgSend(*(id *)(*((_QWORD *)&v677 + 1) + 8 * i29), "dictionaryRepresentation");
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v281, "addObject:", v287);

        }
        v284 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v282, "countByEnumeratingWithState:objects:count:", &v677, v868, 16);
      }
      while (v284);
    }

    objc_msgSend(v3, "setObject:forKey:", v281, CFSTR("movieHighlightResults"));
  }
  if (-[NSMutableArray count](self->_imageExposureResults, "count"))
  {
    v288 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageExposureResults, "count"));
    v673 = 0u;
    v674 = 0u;
    v675 = 0u;
    v676 = 0u;
    v289 = self->_imageExposureResults;
    v290 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v289, "countByEnumeratingWithState:objects:count:", &v673, v867, 16);
    if (v290)
    {
      v291 = v290;
      v292 = *(_QWORD *)v674;
      do
      {
        for (i30 = 0; i30 != v291; ++i30)
        {
          if (*(_QWORD *)v674 != v292)
            objc_enumerationMutation(v289);
          objc_msgSend(*(id *)(*((_QWORD *)&v673 + 1) + 8 * i30), "dictionaryRepresentation");
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v288, "addObject:", v294);

        }
        v291 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v289, "countByEnumeratingWithState:objects:count:", &v673, v867, 16);
      }
      while (v291);
    }

    objc_msgSend(v3, "setObject:forKey:", v288, CFSTR("imageExposureResults"));
  }
  if (-[NSMutableArray count](self->_imageHumanPoseResults, "count"))
  {
    v295 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageHumanPoseResults, "count"));
    v669 = 0u;
    v670 = 0u;
    v671 = 0u;
    v672 = 0u;
    v296 = self->_imageHumanPoseResults;
    v297 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v296, "countByEnumeratingWithState:objects:count:", &v669, v866, 16);
    if (v297)
    {
      v298 = v297;
      v299 = *(_QWORD *)v670;
      do
      {
        for (i31 = 0; i31 != v298; ++i31)
        {
          if (*(_QWORD *)v670 != v299)
            objc_enumerationMutation(v296);
          objc_msgSend(*(id *)(*((_QWORD *)&v669 + 1) + 8 * i31), "dictionaryRepresentation");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "addObject:", v301);

        }
        v298 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v296, "countByEnumeratingWithState:objects:count:", &v669, v866, 16);
      }
      while (v298);
    }

    objc_msgSend(v3, "setObject:forKey:", v295, CFSTR("imageHumanPoseResults"));
  }
  if (-[NSMutableArray count](self->_movieHumanPoseResults, "count"))
  {
    v302 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanPoseResults, "count"));
    v665 = 0u;
    v666 = 0u;
    v667 = 0u;
    v668 = 0u;
    v303 = self->_movieHumanPoseResults;
    v304 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v303, "countByEnumeratingWithState:objects:count:", &v665, v865, 16);
    if (v304)
    {
      v305 = v304;
      v306 = *(_QWORD *)v666;
      do
      {
        for (i32 = 0; i32 != v305; ++i32)
        {
          if (*(_QWORD *)v666 != v306)
            objc_enumerationMutation(v303);
          objc_msgSend(*(id *)(*((_QWORD *)&v665 + 1) + 8 * i32), "dictionaryRepresentation");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v302, "addObject:", v308);

        }
        v305 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v303, "countByEnumeratingWithState:objects:count:", &v665, v865, 16);
      }
      while (v305);
    }

    objc_msgSend(v3, "setObject:forKey:", v302, CFSTR("movieHumanPoseResults"));
  }
  if (-[NSMutableArray count](self->_movieApplauseResults, "count"))
  {
    v309 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieApplauseResults, "count"));
    v661 = 0u;
    v662 = 0u;
    v663 = 0u;
    v664 = 0u;
    v310 = self->_movieApplauseResults;
    v311 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v661, v864, 16);
    if (v311)
    {
      v312 = v311;
      v313 = *(_QWORD *)v662;
      do
      {
        for (i33 = 0; i33 != v312; ++i33)
        {
          if (*(_QWORD *)v662 != v313)
            objc_enumerationMutation(v310);
          objc_msgSend(*(id *)(*((_QWORD *)&v661 + 1) + 8 * i33), "dictionaryRepresentation");
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "addObject:", v315);

        }
        v312 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v661, v864, 16);
      }
      while (v312);
    }

    objc_msgSend(v3, "setObject:forKey:", v309, CFSTR("movieApplauseResults"));
  }
  if (-[NSMutableArray count](self->_movieBabbleResults, "count"))
  {
    v316 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieBabbleResults, "count"));
    v657 = 0u;
    v658 = 0u;
    v659 = 0u;
    v660 = 0u;
    v317 = self->_movieBabbleResults;
    v318 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v317, "countByEnumeratingWithState:objects:count:", &v657, v863, 16);
    if (v318)
    {
      v319 = v318;
      v320 = *(_QWORD *)v658;
      do
      {
        for (i34 = 0; i34 != v319; ++i34)
        {
          if (*(_QWORD *)v658 != v320)
            objc_enumerationMutation(v317);
          objc_msgSend(*(id *)(*((_QWORD *)&v657 + 1) + 8 * i34), "dictionaryRepresentation");
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v316, "addObject:", v322);

        }
        v319 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v317, "countByEnumeratingWithState:objects:count:", &v657, v863, 16);
      }
      while (v319);
    }

    objc_msgSend(v3, "setObject:forKey:", v316, CFSTR("movieBabbleResults"));
  }
  if (-[NSMutableArray count](self->_movieCheeringResults, "count"))
  {
    v323 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieCheeringResults, "count"));
    v653 = 0u;
    v654 = 0u;
    v655 = 0u;
    v656 = 0u;
    v324 = self->_movieCheeringResults;
    v325 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v324, "countByEnumeratingWithState:objects:count:", &v653, v862, 16);
    if (v325)
    {
      v326 = v325;
      v327 = *(_QWORD *)v654;
      do
      {
        for (i35 = 0; i35 != v326; ++i35)
        {
          if (*(_QWORD *)v654 != v327)
            objc_enumerationMutation(v324);
          objc_msgSend(*(id *)(*((_QWORD *)&v653 + 1) + 8 * i35), "dictionaryRepresentation");
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "addObject:", v329);

        }
        v326 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v324, "countByEnumeratingWithState:objects:count:", &v653, v862, 16);
      }
      while (v326);
    }

    objc_msgSend(v3, "setObject:forKey:", v323, CFSTR("movieCheeringResults"));
  }
  if (-[NSMutableArray count](self->_movieLaughterResults, "count"))
  {
    v330 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieLaughterResults, "count"));
    v649 = 0u;
    v650 = 0u;
    v651 = 0u;
    v652 = 0u;
    v331 = self->_movieLaughterResults;
    v332 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v649, v861, 16);
    if (v332)
    {
      v333 = v332;
      v334 = *(_QWORD *)v650;
      do
      {
        for (i36 = 0; i36 != v333; ++i36)
        {
          if (*(_QWORD *)v650 != v334)
            objc_enumerationMutation(v331);
          objc_msgSend(*(id *)(*((_QWORD *)&v649 + 1) + 8 * i36), "dictionaryRepresentation");
          v336 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v330, "addObject:", v336);

        }
        v333 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v649, v861, 16);
      }
      while (v333);
    }

    objc_msgSend(v3, "setObject:forKey:", v330, CFSTR("movieLaughterResults"));
  }
  if (-[NSMutableArray count](self->_movieHumanActionResults, "count"))
  {
    v337 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanActionResults, "count"));
    v645 = 0u;
    v646 = 0u;
    v647 = 0u;
    v648 = 0u;
    v338 = self->_movieHumanActionResults;
    v339 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v338, "countByEnumeratingWithState:objects:count:", &v645, v860, 16);
    if (v339)
    {
      v340 = v339;
      v341 = *(_QWORD *)v646;
      do
      {
        for (i37 = 0; i37 != v340; ++i37)
        {
          if (*(_QWORD *)v646 != v341)
            objc_enumerationMutation(v338);
          objc_msgSend(*(id *)(*((_QWORD *)&v645 + 1) + 8 * i37), "dictionaryRepresentation");
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v337, "addObject:", v343);

        }
        v340 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v338, "countByEnumeratingWithState:objects:count:", &v645, v860, 16);
      }
      while (v340);
    }

    objc_msgSend(v3, "setObject:forKey:", v337, CFSTR("movieHumanActionResults"));
  }
  if (-[NSMutableArray count](self->_movieLoudnessResults, "count"))
  {
    v344 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieLoudnessResults, "count"));
    v641 = 0u;
    v642 = 0u;
    v643 = 0u;
    v644 = 0u;
    v345 = self->_movieLoudnessResults;
    v346 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v641, v859, 16);
    if (v346)
    {
      v347 = v346;
      v348 = *(_QWORD *)v642;
      do
      {
        for (i38 = 0; i38 != v347; ++i38)
        {
          if (*(_QWORD *)v642 != v348)
            objc_enumerationMutation(v345);
          objc_msgSend(*(id *)(*((_QWORD *)&v641 + 1) + 8 * i38), "dictionaryRepresentation");
          v350 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v344, "addObject:", v350);

        }
        v347 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v641, v859, 16);
      }
      while (v347);
    }

    objc_msgSend(v3, "setObject:forKey:", v344, CFSTR("movieLoudnessResults"));
  }
  if (-[NSMutableArray count](self->_moviePetsResults, "count"))
  {
    v351 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_moviePetsResults, "count"));
    v637 = 0u;
    v638 = 0u;
    v639 = 0u;
    v640 = 0u;
    v352 = self->_moviePetsResults;
    v353 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v352, "countByEnumeratingWithState:objects:count:", &v637, v858, 16);
    if (v353)
    {
      v354 = v353;
      v355 = *(_QWORD *)v638;
      do
      {
        for (i39 = 0; i39 != v354; ++i39)
        {
          if (*(_QWORD *)v638 != v355)
            objc_enumerationMutation(v352);
          objc_msgSend(*(id *)(*((_QWORD *)&v637 + 1) + 8 * i39), "dictionaryRepresentation");
          v357 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "addObject:", v357);

        }
        v354 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v352, "countByEnumeratingWithState:objects:count:", &v637, v858, 16);
      }
      while (v354);
    }

    objc_msgSend(v3, "setObject:forKey:", v351, CFSTR("moviePetsResults"));
  }
  if (-[NSMutableArray count](self->_moviePetsFaceResults, "count"))
  {
    v358 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_moviePetsFaceResults, "count"));
    v633 = 0u;
    v634 = 0u;
    v635 = 0u;
    v636 = 0u;
    v359 = self->_moviePetsFaceResults;
    v360 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v359, "countByEnumeratingWithState:objects:count:", &v633, v857, 16);
    if (v360)
    {
      v361 = v360;
      v362 = *(_QWORD *)v634;
      do
      {
        for (i40 = 0; i40 != v361; ++i40)
        {
          if (*(_QWORD *)v634 != v362)
            objc_enumerationMutation(v359);
          objc_msgSend(*(id *)(*((_QWORD *)&v633 + 1) + 8 * i40), "dictionaryRepresentation");
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v358, "addObject:", v364);

        }
        v361 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v359, "countByEnumeratingWithState:objects:count:", &v633, v857, 16);
      }
      while (v361);
    }

    objc_msgSend(v3, "setObject:forKey:", v358, CFSTR("moviePetsFaceResults"));
  }
  if (-[NSMutableArray count](self->_movieStabilizationResults, "count"))
  {
    v365 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieStabilizationResults, "count"));
    v629 = 0u;
    v630 = 0u;
    v631 = 0u;
    v632 = 0u;
    v366 = self->_movieStabilizationResults;
    v367 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v366, "countByEnumeratingWithState:objects:count:", &v629, v856, 16);
    if (v367)
    {
      v368 = v367;
      v369 = *(_QWORD *)v630;
      do
      {
        for (i41 = 0; i41 != v368; ++i41)
        {
          if (*(_QWORD *)v630 != v369)
            objc_enumerationMutation(v366);
          objc_msgSend(*(id *)(*((_QWORD *)&v629 + 1) + 8 * i41), "dictionaryRepresentation");
          v371 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v365, "addObject:", v371);

        }
        v368 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v366, "countByEnumeratingWithState:objects:count:", &v629, v856, 16);
      }
      while (v368);
    }

    objc_msgSend(v3, "setObject:forKey:", v365, CFSTR("movieStabilizationResults"));
  }
  if (-[NSMutableArray count](self->_movieHighlightScoreResults, "count"))
  {
    v372 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieHighlightScoreResults, "count"));
    v625 = 0u;
    v626 = 0u;
    v627 = 0u;
    v628 = 0u;
    v373 = self->_movieHighlightScoreResults;
    v374 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v373, "countByEnumeratingWithState:objects:count:", &v625, v855, 16);
    if (v374)
    {
      v375 = v374;
      v376 = *(_QWORD *)v626;
      do
      {
        for (i42 = 0; i42 != v375; ++i42)
        {
          if (*(_QWORD *)v626 != v376)
            objc_enumerationMutation(v373);
          objc_msgSend(*(id *)(*((_QWORD *)&v625 + 1) + 8 * i42), "dictionaryRepresentation");
          v378 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v372, "addObject:", v378);

        }
        v375 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v373, "countByEnumeratingWithState:objects:count:", &v625, v855, 16);
      }
      while (v375);
    }

    objc_msgSend(v3, "setObject:forKey:", v372, CFSTR("movieHighlightScoreResults"));
  }
  if (-[NSMutableArray count](self->_livePhotoHumanActionClassificationResults, "count"))
  {
    v379 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_livePhotoHumanActionClassificationResults, "count"));
    v621 = 0u;
    v622 = 0u;
    v623 = 0u;
    v624 = 0u;
    v380 = self->_livePhotoHumanActionClassificationResults;
    v381 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v380, "countByEnumeratingWithState:objects:count:", &v621, v854, 16);
    if (v381)
    {
      v382 = v381;
      v383 = *(_QWORD *)v622;
      do
      {
        for (i43 = 0; i43 != v382; ++i43)
        {
          if (*(_QWORD *)v622 != v383)
            objc_enumerationMutation(v380);
          objc_msgSend(*(id *)(*((_QWORD *)&v621 + 1) + 8 * i43), "dictionaryRepresentation");
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v379, "addObject:", v385);

        }
        v382 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v380, "countByEnumeratingWithState:objects:count:", &v621, v854, 16);
      }
      while (v382);
    }

    objc_msgSend(v3, "setObject:forKey:", v379, CFSTR("livePhotoHumanActionClassificationResults"));
  }
  if (-[NSMutableArray count](self->_movieAudioQualityResults, "count"))
  {
    v386 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieAudioQualityResults, "count"));
    v617 = 0u;
    v618 = 0u;
    v619 = 0u;
    v620 = 0u;
    v387 = self->_movieAudioQualityResults;
    v388 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v387, "countByEnumeratingWithState:objects:count:", &v617, v853, 16);
    if (v388)
    {
      v389 = v388;
      v390 = *(_QWORD *)v618;
      do
      {
        for (i44 = 0; i44 != v389; ++i44)
        {
          if (*(_QWORD *)v618 != v390)
            objc_enumerationMutation(v387);
          objc_msgSend(*(id *)(*((_QWORD *)&v617 + 1) + 8 * i44), "dictionaryRepresentation");
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v386, "addObject:", v392);

        }
        v389 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v387, "countByEnumeratingWithState:objects:count:", &v617, v853, 16);
      }
      while (v389);
    }

    objc_msgSend(v3, "setObject:forKey:", v386, CFSTR("movieAudioQualityResults"));
  }
  if (-[NSMutableArray count](self->_movieSafetyResults, "count"))
  {
    v393 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieSafetyResults, "count"));
    v613 = 0u;
    v614 = 0u;
    v615 = 0u;
    v616 = 0u;
    v394 = self->_movieSafetyResults;
    v395 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v394, "countByEnumeratingWithState:objects:count:", &v613, v852, 16);
    if (v395)
    {
      v396 = v395;
      v397 = *(_QWORD *)v614;
      do
      {
        for (i45 = 0; i45 != v396; ++i45)
        {
          if (*(_QWORD *)v614 != v397)
            objc_enumerationMutation(v394);
          objc_msgSend(*(id *)(*((_QWORD *)&v613 + 1) + 8 * i45), "dictionaryRepresentation");
          v399 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v393, "addObject:", v399);

        }
        v396 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v394, "countByEnumeratingWithState:objects:count:", &v613, v852, 16);
      }
      while (v396);
    }

    objc_msgSend(v3, "setObject:forKey:", v393, CFSTR("movieSafetyResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieClassificationResults, "count"))
  {
    v400 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieClassificationResults, "count"));
    v609 = 0u;
    v610 = 0u;
    v611 = 0u;
    v612 = 0u;
    v401 = self->_filesystemMovieClassificationResults;
    v402 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v401, "countByEnumeratingWithState:objects:count:", &v609, v851, 16);
    if (v402)
    {
      v403 = v402;
      v404 = *(_QWORD *)v610;
      do
      {
        for (i46 = 0; i46 != v403; ++i46)
        {
          if (*(_QWORD *)v610 != v404)
            objc_enumerationMutation(v401);
          objc_msgSend(*(id *)(*((_QWORD *)&v609 + 1) + 8 * i46), "dictionaryRepresentation");
          v406 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v400, "addObject:", v406);

        }
        v403 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v401, "countByEnumeratingWithState:objects:count:", &v609, v851, 16);
      }
      while (v403);
    }

    objc_msgSend(v3, "setObject:forKey:", v400, CFSTR("filesystemMovieClassificationResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieHumanActionClassificationResults, "count"))
  {
    v407 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieHumanActionClassificationResults, "count"));
    v605 = 0u;
    v606 = 0u;
    v607 = 0u;
    v608 = 0u;
    v408 = self->_filesystemMovieHumanActionClassificationResults;
    v409 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v408, "countByEnumeratingWithState:objects:count:", &v605, v850, 16);
    if (v409)
    {
      v410 = v409;
      v411 = *(_QWORD *)v606;
      do
      {
        for (i47 = 0; i47 != v410; ++i47)
        {
          if (*(_QWORD *)v606 != v411)
            objc_enumerationMutation(v408);
          objc_msgSend(*(id *)(*((_QWORD *)&v605 + 1) + 8 * i47), "dictionaryRepresentation");
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v407, "addObject:", v413);

        }
        v410 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v408, "countByEnumeratingWithState:objects:count:", &v605, v850, 16);
      }
      while (v410);
    }

    objc_msgSend(v3, "setObject:forKey:", v407, CFSTR("filesystemMovieHumanActionClassificationResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieApplauseResults, "count"))
  {
    v414 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieApplauseResults, "count"));
    v601 = 0u;
    v602 = 0u;
    v603 = 0u;
    v604 = 0u;
    v415 = self->_filesystemMovieApplauseResults;
    v416 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v415, "countByEnumeratingWithState:objects:count:", &v601, v849, 16);
    if (v416)
    {
      v417 = v416;
      v418 = *(_QWORD *)v602;
      do
      {
        for (i48 = 0; i48 != v417; ++i48)
        {
          if (*(_QWORD *)v602 != v418)
            objc_enumerationMutation(v415);
          objc_msgSend(*(id *)(*((_QWORD *)&v601 + 1) + 8 * i48), "dictionaryRepresentation");
          v420 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v414, "addObject:", v420);

        }
        v417 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v415, "countByEnumeratingWithState:objects:count:", &v601, v849, 16);
      }
      while (v417);
    }

    objc_msgSend(v3, "setObject:forKey:", v414, CFSTR("filesystemMovieApplauseResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieBabbleResults, "count"))
  {
    v421 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieBabbleResults, "count"));
    v597 = 0u;
    v598 = 0u;
    v599 = 0u;
    v600 = 0u;
    v422 = self->_filesystemMovieBabbleResults;
    v423 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v422, "countByEnumeratingWithState:objects:count:", &v597, v848, 16);
    if (v423)
    {
      v424 = v423;
      v425 = *(_QWORD *)v598;
      do
      {
        for (i49 = 0; i49 != v424; ++i49)
        {
          if (*(_QWORD *)v598 != v425)
            objc_enumerationMutation(v422);
          objc_msgSend(*(id *)(*((_QWORD *)&v597 + 1) + 8 * i49), "dictionaryRepresentation");
          v427 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v421, "addObject:", v427);

        }
        v424 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v422, "countByEnumeratingWithState:objects:count:", &v597, v848, 16);
      }
      while (v424);
    }

    objc_msgSend(v3, "setObject:forKey:", v421, CFSTR("filesystemMovieBabbleResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieCheeringResults, "count"))
  {
    v428 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieCheeringResults, "count"));
    v593 = 0u;
    v594 = 0u;
    v595 = 0u;
    v596 = 0u;
    v429 = self->_filesystemMovieCheeringResults;
    v430 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v429, "countByEnumeratingWithState:objects:count:", &v593, v847, 16);
    if (v430)
    {
      v431 = v430;
      v432 = *(_QWORD *)v594;
      do
      {
        for (i50 = 0; i50 != v431; ++i50)
        {
          if (*(_QWORD *)v594 != v432)
            objc_enumerationMutation(v429);
          objc_msgSend(*(id *)(*((_QWORD *)&v593 + 1) + 8 * i50), "dictionaryRepresentation");
          v434 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v428, "addObject:", v434);

        }
        v431 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v429, "countByEnumeratingWithState:objects:count:", &v593, v847, 16);
      }
      while (v431);
    }

    objc_msgSend(v3, "setObject:forKey:", v428, CFSTR("filesystemMovieCheeringResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieLaughterResults, "count"))
  {
    v435 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieLaughterResults, "count"));
    v589 = 0u;
    v590 = 0u;
    v591 = 0u;
    v592 = 0u;
    v436 = self->_filesystemMovieLaughterResults;
    v437 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v436, "countByEnumeratingWithState:objects:count:", &v589, v846, 16);
    if (v437)
    {
      v438 = v437;
      v439 = *(_QWORD *)v590;
      do
      {
        for (i51 = 0; i51 != v438; ++i51)
        {
          if (*(_QWORD *)v590 != v439)
            objc_enumerationMutation(v436);
          objc_msgSend(*(id *)(*((_QWORD *)&v589 + 1) + 8 * i51), "dictionaryRepresentation");
          v441 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v435, "addObject:", v441);

        }
        v438 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v436, "countByEnumeratingWithState:objects:count:", &v589, v846, 16);
      }
      while (v438);
    }

    objc_msgSend(v3, "setObject:forKey:", v435, CFSTR("filesystemMovieLaughterResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieMusicResults, "count"))
  {
    v442 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieMusicResults, "count"));
    v585 = 0u;
    v586 = 0u;
    v587 = 0u;
    v588 = 0u;
    v443 = self->_filesystemMovieMusicResults;
    v444 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v443, "countByEnumeratingWithState:objects:count:", &v585, v845, 16);
    if (v444)
    {
      v445 = v444;
      v446 = *(_QWORD *)v586;
      do
      {
        for (i52 = 0; i52 != v445; ++i52)
        {
          if (*(_QWORD *)v586 != v446)
            objc_enumerationMutation(v443);
          objc_msgSend(*(id *)(*((_QWORD *)&v585 + 1) + 8 * i52), "dictionaryRepresentation");
          v448 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v442, "addObject:", v448);

        }
        v445 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v443, "countByEnumeratingWithState:objects:count:", &v585, v845, 16);
      }
      while (v445);
    }

    objc_msgSend(v3, "setObject:forKey:", v442, CFSTR("filesystemMovieMusicResults"));
  }
  if (-[NSMutableArray count](self->_filesystemMovieVoiceResults, "count"))
  {
    v449 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filesystemMovieVoiceResults, "count"));
    v581 = 0u;
    v582 = 0u;
    v583 = 0u;
    v584 = 0u;
    v450 = self->_filesystemMovieVoiceResults;
    v451 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v581, v844, 16);
    if (v451)
    {
      v452 = v451;
      v453 = *(_QWORD *)v582;
      do
      {
        for (i53 = 0; i53 != v452; ++i53)
        {
          if (*(_QWORD *)v582 != v453)
            objc_enumerationMutation(v450);
          objc_msgSend(*(id *)(*((_QWORD *)&v581 + 1) + 8 * i53), "dictionaryRepresentation");
          v455 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v449, "addObject:", v455);

        }
        v452 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v450, "countByEnumeratingWithState:objects:count:", &v581, v844, 16);
      }
      while (v452);
    }

    objc_msgSend(v3, "setObject:forKey:", v449, CFSTR("filesystemMovieVoiceResults"));
  }
  if (-[NSMutableArray count](self->_animatedStickerResults, "count"))
  {
    v456 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_animatedStickerResults, "count"));
    v577 = 0u;
    v578 = 0u;
    v579 = 0u;
    v580 = 0u;
    v457 = self->_animatedStickerResults;
    v458 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v457, "countByEnumeratingWithState:objects:count:", &v577, v843, 16);
    if (v458)
    {
      v459 = v458;
      v460 = *(_QWORD *)v578;
      do
      {
        for (i54 = 0; i54 != v459; ++i54)
        {
          if (*(_QWORD *)v578 != v460)
            objc_enumerationMutation(v457);
          objc_msgSend(*(id *)(*((_QWORD *)&v577 + 1) + 8 * i54), "dictionaryRepresentation");
          v462 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v456, "addObject:", v462);

        }
        v459 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v457, "countByEnumeratingWithState:objects:count:", &v577, v843, 16);
      }
      while (v459);
    }

    objc_msgSend(v3, "setObject:forKey:", v456, CFSTR("animatedStickerResults"));
  }
  if (-[NSMutableArray count](self->_movieTorsoResults, "count"))
  {
    v463 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieTorsoResults, "count"));
    v573 = 0u;
    v574 = 0u;
    v575 = 0u;
    v576 = 0u;
    v464 = self->_movieTorsoResults;
    v465 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v464, "countByEnumeratingWithState:objects:count:", &v573, v842, 16);
    if (v465)
    {
      v466 = v465;
      v467 = *(_QWORD *)v574;
      do
      {
        for (i55 = 0; i55 != v466; ++i55)
        {
          if (*(_QWORD *)v574 != v467)
            objc_enumerationMutation(v464);
          objc_msgSend(*(id *)(*((_QWORD *)&v573 + 1) + 8 * i55), "dictionaryRepresentation");
          v469 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v463, "addObject:", v469);

        }
        v466 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v464, "countByEnumeratingWithState:objects:count:", &v573, v842, 16);
      }
      while (v466);
    }

    objc_msgSend(v3, "setObject:forKey:", v463, CFSTR("movieTorsoResults"));
  }
  if (-[NSMutableArray count](self->_movieHumanActionClassificationResults, "count"))
  {
    v470 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_movieHumanActionClassificationResults, "count"));
    v569 = 0u;
    v570 = 0u;
    v571 = 0u;
    v572 = 0u;
    v471 = self->_movieHumanActionClassificationResults;
    v472 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v471, "countByEnumeratingWithState:objects:count:", &v569, v841, 16);
    if (v472)
    {
      v473 = v472;
      v474 = *(_QWORD *)v570;
      do
      {
        for (i56 = 0; i56 != v473; ++i56)
        {
          if (*(_QWORD *)v570 != v474)
            objc_enumerationMutation(v471);
          objc_msgSend(*(id *)(*((_QWORD *)&v569 + 1) + 8 * i56), "dictionaryRepresentation");
          v476 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v470, "addObject:", v476);

        }
        v473 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v471, "countByEnumeratingWithState:objects:count:", &v569, v841, 16);
      }
      while (v473);
    }

    objc_msgSend(v3, "setObject:forKey:", v470, CFSTR("movieHumanActionClassificationResults"));
  }
  if (-[NSMutableArray count](self->_videoEmbeddingResults, "count"))
  {
    v477 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoEmbeddingResults, "count"));
    v565 = 0u;
    v566 = 0u;
    v567 = 0u;
    v568 = 0u;
    v478 = self->_videoEmbeddingResults;
    v479 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v478, "countByEnumeratingWithState:objects:count:", &v565, v840, 16);
    if (v479)
    {
      v480 = v479;
      v481 = *(_QWORD *)v566;
      do
      {
        for (i57 = 0; i57 != v480; ++i57)
        {
          if (*(_QWORD *)v566 != v481)
            objc_enumerationMutation(v478);
          objc_msgSend(*(id *)(*((_QWORD *)&v565 + 1) + 8 * i57), "dictionaryRepresentation");
          v483 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v477, "addObject:", v483);

        }
        v480 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v478, "countByEnumeratingWithState:objects:count:", &v565, v840, 16);
      }
      while (v480);
    }

    objc_msgSend(v3, "setObject:forKey:", v477, CFSTR("videoEmbeddingResults"));
  }
  if (-[NSMutableArray count](self->_summarizedEmbeddingResults, "count"))
  {
    v484 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_summarizedEmbeddingResults, "count"));
    v561 = 0u;
    v562 = 0u;
    v563 = 0u;
    v564 = 0u;
    v485 = self->_summarizedEmbeddingResults;
    v486 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v485, "countByEnumeratingWithState:objects:count:", &v561, v839, 16);
    if (v486)
    {
      v487 = v486;
      v488 = *(_QWORD *)v562;
      do
      {
        for (i58 = 0; i58 != v487; ++i58)
        {
          if (*(_QWORD *)v562 != v488)
            objc_enumerationMutation(v485);
          objc_msgSend(*(id *)(*((_QWORD *)&v561 + 1) + 8 * i58), "dictionaryRepresentation");
          v490 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v484, "addObject:", v490);

        }
        v487 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v485, "countByEnumeratingWithState:objects:count:", &v561, v839, 16);
      }
      while (v487);
    }

    objc_msgSend(v3, "setObject:forKey:", v484, CFSTR("summarizedEmbeddingResults"));
  }
  if (-[NSMutableArray count](self->_audioFusedVideoEmbeddingResults, "count"))
  {
    v491 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_audioFusedVideoEmbeddingResults, "count"));
    v557 = 0u;
    v558 = 0u;
    v559 = 0u;
    v560 = 0u;
    v492 = self->_audioFusedVideoEmbeddingResults;
    v493 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v492, "countByEnumeratingWithState:objects:count:", &v557, v838, 16);
    if (v493)
    {
      v494 = v493;
      v495 = *(_QWORD *)v558;
      do
      {
        for (i59 = 0; i59 != v494; ++i59)
        {
          if (*(_QWORD *)v558 != v495)
            objc_enumerationMutation(v492);
          objc_msgSend(*(id *)(*((_QWORD *)&v557 + 1) + 8 * i59), "dictionaryRepresentation");
          v497 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v491, "addObject:", v497);

        }
        v494 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v492, "countByEnumeratingWithState:objects:count:", &v557, v838, 16);
      }
      while (v494);
    }

    objc_msgSend(v3, "setObject:forKey:", v491, CFSTR("audioFusedVideoEmbeddingResults"));
  }
  if (-[NSMutableArray count](self->_imageEmbeddingResults, "count"))
  {
    v498 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageEmbeddingResults, "count"));
    v553 = 0u;
    v554 = 0u;
    v555 = 0u;
    v556 = 0u;
    v499 = self->_imageEmbeddingResults;
    v500 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v499, "countByEnumeratingWithState:objects:count:", &v553, v837, 16);
    if (v500)
    {
      v501 = v500;
      v502 = *(_QWORD *)v554;
      do
      {
        for (i60 = 0; i60 != v501; ++i60)
        {
          if (*(_QWORD *)v554 != v502)
            objc_enumerationMutation(v499);
          objc_msgSend(*(id *)(*((_QWORD *)&v553 + 1) + 8 * i60), "dictionaryRepresentation");
          v504 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v498, "addObject:", v504);

        }
        v501 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v499, "countByEnumeratingWithState:objects:count:", &v553, v837, 16);
      }
      while (v501);
    }

    objc_msgSend(v3, "setObject:forKey:", v498, CFSTR("imageEmbeddingResults"));
  }
  if (-[NSMutableArray count](self->_imageCaptionResults, "count"))
  {
    v505 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_imageCaptionResults, "count"));
    v549 = 0u;
    v550 = 0u;
    v551 = 0u;
    v552 = 0u;
    v506 = self->_imageCaptionResults;
    v507 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v506, "countByEnumeratingWithState:objects:count:", &v549, v836, 16);
    if (v507)
    {
      v508 = v507;
      v509 = *(_QWORD *)v550;
      do
      {
        for (i61 = 0; i61 != v508; ++i61)
        {
          if (*(_QWORD *)v550 != v509)
            objc_enumerationMutation(v506);
          objc_msgSend(*(id *)(*((_QWORD *)&v549 + 1) + 8 * i61), "dictionaryRepresentation");
          v511 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v505, "addObject:", v511);

        }
        v508 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v506, "countByEnumeratingWithState:objects:count:", &v549, v836, 16);
      }
      while (v508);
    }

    objc_msgSend(v3, "setObject:forKey:", v505, CFSTR("imageCaptionResults"));
  }
  if (-[NSMutableArray count](self->_videoCaptionResults, "count"))
  {
    v512 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoCaptionResults, "count"));
    v545 = 0u;
    v546 = 0u;
    v547 = 0u;
    v548 = 0u;
    v513 = self->_videoCaptionResults;
    v514 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v513, "countByEnumeratingWithState:objects:count:", &v545, v835, 16);
    if (v514)
    {
      v515 = v514;
      v516 = *(_QWORD *)v546;
      do
      {
        for (i62 = 0; i62 != v515; ++i62)
        {
          if (*(_QWORD *)v546 != v516)
            objc_enumerationMutation(v513);
          objc_msgSend(*(id *)(*((_QWORD *)&v545 + 1) + 8 * i62), "dictionaryRepresentation");
          v518 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v512, "addObject:", v518);

        }
        v515 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v513, "countByEnumeratingWithState:objects:count:", &v545, v835, 16);
      }
      while (v515);
    }

    objc_msgSend(v3, "setObject:forKey:", v512, CFSTR("videoCaptionResults"));
  }
  if (-[NSMutableArray count](self->_videoCaptionPreferenceResults, "count"))
  {
    v519 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoCaptionPreferenceResults, "count"));
    v541 = 0u;
    v542 = 0u;
    v543 = 0u;
    v544 = 0u;
    v520 = self->_videoCaptionPreferenceResults;
    v521 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v520, "countByEnumeratingWithState:objects:count:", &v541, v834, 16);
    if (v521)
    {
      v522 = v521;
      v523 = *(_QWORD *)v542;
      do
      {
        for (i63 = 0; i63 != v522; ++i63)
        {
          if (*(_QWORD *)v542 != v523)
            objc_enumerationMutation(v520);
          objc_msgSend(*(id *)(*((_QWORD *)&v541 + 1) + 8 * i63), "dictionaryRepresentation");
          v525 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v519, "addObject:", v525);

        }
        v522 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v520, "countByEnumeratingWithState:objects:count:", &v541, v834, 16);
      }
      while (v522);
    }

    objc_msgSend(v3, "setObject:forKey:", v519, CFSTR("videoCaptionPreferenceResults"));
  }
  if (-[NSMutableArray count](self->_videoSegmentCaptionResults, "count"))
  {
    v526 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoSegmentCaptionResults, "count"));
    v537 = 0u;
    v538 = 0u;
    v539 = 0u;
    v540 = 0u;
    v527 = self->_videoSegmentCaptionResults;
    v528 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v527, "countByEnumeratingWithState:objects:count:", &v537, v833, 16);
    if (v528)
    {
      v529 = v528;
      v530 = *(_QWORD *)v538;
      do
      {
        for (i64 = 0; i64 != v529; ++i64)
        {
          if (*(_QWORD *)v538 != v530)
            objc_enumerationMutation(v527);
          objc_msgSend(*(id *)(*((_QWORD *)&v537 + 1) + 8 * i64), "dictionaryRepresentation", (_QWORD)v537);
          v532 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v526, "addObject:", v532);

        }
        v529 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v527, "countByEnumeratingWithState:objects:count:", &v537, v833, 16);
      }
      while (v529);
    }

    objc_msgSend(v3, "setObject:forKey:", v526, CFSTR("videoSegmentCaptionResults"));
  }
  v533 = v3;

  return v533;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoAssetAnalysisReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSMutableArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSMutableArray *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSMutableArray *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSMutableArray *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSMutableArray *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSMutableArray *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSMutableArray *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSMutableArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSMutableArray *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSMutableArray *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSMutableArray *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSMutableArray *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSMutableArray *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSMutableArray *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSMutableArray *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  NSMutableArray *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSMutableArray *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSMutableArray *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  NSMutableArray *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSMutableArray *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  NSMutableArray *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSMutableArray *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  NSMutableArray *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  NSMutableArray *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSMutableArray *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  NSMutableArray *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  NSMutableArray *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  NSMutableArray *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  NSMutableArray *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  NSMutableArray *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  NSMutableArray *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  NSMutableArray *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  NSMutableArray *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  NSMutableArray *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  NSMutableArray *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  NSMutableArray *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  NSMutableArray *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  NSMutableArray *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  NSMutableArray *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  NSMutableArray *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  NSMutableArray *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  NSMutableArray *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  NSMutableArray *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  NSMutableArray *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  NSMutableArray *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  NSMutableArray *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  NSMutableArray *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  NSMutableArray *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  NSMutableArray *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  NSMutableArray *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  NSMutableArray *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  NSMutableArray *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  NSMutableArray *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  NSMutableArray *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  _BYTE v671[128];
  _BYTE v672[128];
  _BYTE v673[128];
  _BYTE v674[128];
  _BYTE v675[128];
  _BYTE v676[128];
  _BYTE v677[128];
  _BYTE v678[128];
  _BYTE v679[128];
  _BYTE v680[128];
  _BYTE v681[128];
  _BYTE v682[128];
  _BYTE v683[128];
  _BYTE v684[128];
  _BYTE v685[128];
  _BYTE v686[128];
  _BYTE v687[128];
  _BYTE v688[128];
  _BYTE v689[128];
  _BYTE v690[128];
  _BYTE v691[128];
  _BYTE v692[128];
  _BYTE v693[128];
  _BYTE v694[128];
  _BYTE v695[128];
  _BYTE v696[128];
  _BYTE v697[128];
  _BYTE v698[128];
  _BYTE v699[128];
  _BYTE v700[128];
  _BYTE v701[128];
  _BYTE v702[128];
  _BYTE v703[128];
  _BYTE v704[128];
  _BYTE v705[128];
  _BYTE v706[128];
  _BYTE v707[128];
  _BYTE v708[128];
  _BYTE v709[128];
  _BYTE v710[128];
  _BYTE v711[128];
  _BYTE v712[128];
  _BYTE v713[128];
  _BYTE v714[128];
  _BYTE v715[128];
  _BYTE v716[128];
  _BYTE v717[128];
  _BYTE v718[128];
  _BYTE v719[128];
  _BYTE v720[128];
  _BYTE v721[128];
  _BYTE v722[128];
  _BYTE v723[128];
  _BYTE v724[128];
  _BYTE v725[128];
  _BYTE v726[128];
  _BYTE v727[128];
  _BYTE v728[128];
  _BYTE v729[128];
  _BYTE v730[128];
  _BYTE v731[128];
  _BYTE v732[128];
  _BYTE v733[128];
  _BYTE v734[128];
  _BYTE v735[128];
  _BYTE v736[128];
  _BYTE v737[128];
  _BYTE v738[128];
  _BYTE v739[128];
  _BYTE v740[128];
  _BYTE v741[128];
  _BYTE v742[128];
  _BYTE v743[128];
  _BYTE v744[128];
  uint64_t v745;

  v745 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  if (self->_assetMasterFingerprint)
    PBDataWriterWriteStringField();
  if (self->_assetAdjustedFingerprint)
    PBDataWriterWriteStringField();
  v670 = 0u;
  v669 = 0u;
  v668 = 0u;
  v667 = 0u;
  v5 = self->_imageBlurResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v667, v744, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v668;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v668 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v667, v744, 16);
    }
    while (v7);
  }

  v666 = 0u;
  v665 = 0u;
  v664 = 0u;
  v663 = 0u;
  v10 = self->_imageCompositionResults;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v663, v743, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v664;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v664 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v663, v743, 16);
    }
    while (v12);
  }

  v662 = 0u;
  v661 = 0u;
  v660 = 0u;
  v659 = 0u;
  v15 = self->_imageFaceResults;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v659, v742, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v660;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v660 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v659, v742, 16);
    }
    while (v17);
  }

  v658 = 0u;
  v657 = 0u;
  v656 = 0u;
  v655 = 0u;
  v20 = self->_imageFeatureResults;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v655, v741, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v656;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v656 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v655, v741, 16);
    }
    while (v22);
  }

  v654 = 0u;
  v653 = 0u;
  v652 = 0u;
  v651 = 0u;
  v25 = self->_imageJunkResults;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v651, v740, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v652;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v652 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v651, v740, 16);
    }
    while (v27);
  }

  v650 = 0u;
  v649 = 0u;
  v648 = 0u;
  v647 = 0u;
  v30 = self->_imageSaliencyResults;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v647, v739, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v648;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v648 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v647, v739, 16);
    }
    while (v32);
  }

  v646 = 0u;
  v645 = 0u;
  v644 = 0u;
  v643 = 0u;
  v35 = self->_imageShotTypeResults;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v643, v738, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v644;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v644 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v643, v738, 16);
    }
    while (v37);
  }

  v642 = 0u;
  v641 = 0u;
  v640 = 0u;
  v639 = 0u;
  v40 = self->_livePhotoRecommendationResults;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v639, v737, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v640;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v640 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v639, v737, 16);
    }
    while (v42);
  }

  v638 = 0u;
  v637 = 0u;
  v636 = 0u;
  v635 = 0u;
  v45 = self->_livePhotoSharpnessResults;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v635, v736, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v636;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v636 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v635, v736, 16);
    }
    while (v47);
  }

  v634 = 0u;
  v633 = 0u;
  v632 = 0u;
  v631 = 0u;
  v50 = self->_movieActivityLevelResults;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v631, v735, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v632;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v632 != v53)
          objc_enumerationMutation(v50);
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v631, v735, 16);
    }
    while (v52);
  }

  v630 = 0u;
  v629 = 0u;
  v628 = 0u;
  v627 = 0u;
  v55 = self->_movieCameraMotionResults;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v627, v734, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v628;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v628 != v58)
          objc_enumerationMutation(v55);
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v627, v734, 16);
    }
    while (v57);
  }

  v626 = 0u;
  v625 = 0u;
  v624 = 0u;
  v623 = 0u;
  v60 = self->_movieClassificationResults;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v623, v733, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v624;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v624 != v63)
          objc_enumerationMutation(v60);
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v623, v733, 16);
    }
    while (v62);
  }

  v622 = 0u;
  v621 = 0u;
  v620 = 0u;
  v619 = 0u;
  v65 = self->_movieFaceResults;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v619, v732, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v620;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v620 != v68)
          objc_enumerationMutation(v65);
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v619, v732, 16);
    }
    while (v67);
  }

  v618 = 0u;
  v617 = 0u;
  v616 = 0u;
  v615 = 0u;
  v70 = self->_movieFaceprintResults;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v615, v731, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v616;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v616 != v73)
          objc_enumerationMutation(v70);
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v615, v731, 16);
    }
    while (v72);
  }

  v614 = 0u;
  v613 = 0u;
  v612 = 0u;
  v611 = 0u;
  v75 = self->_movieFeatureResults;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v611, v730, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v612;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v612 != v78)
          objc_enumerationMutation(v75);
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v611, v730, 16);
    }
    while (v77);
  }

  v610 = 0u;
  v609 = 0u;
  v608 = 0u;
  v607 = 0u;
  v80 = self->_movieFineSubjectMotionResults;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v607, v729, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v608;
    do
    {
      v84 = 0;
      do
      {
        if (*(_QWORD *)v608 != v83)
          objc_enumerationMutation(v80);
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v607, v729, 16);
    }
    while (v82);
  }

  v606 = 0u;
  v605 = 0u;
  v604 = 0u;
  v603 = 0u;
  v85 = self->_movieInterestingnessResults;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v603, v728, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v604;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v604 != v88)
          objc_enumerationMutation(v85);
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v603, v728, 16);
    }
    while (v87);
  }

  v602 = 0u;
  v601 = 0u;
  v600 = 0u;
  v599 = 0u;
  v90 = self->_movieMovingObjectResults;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v599, v727, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v600;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v600 != v93)
          objc_enumerationMutation(v90);
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v599, v727, 16);
    }
    while (v92);
  }

  v598 = 0u;
  v597 = 0u;
  v596 = 0u;
  v595 = 0u;
  v95 = self->_movieMusicResults;
  v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v595, v726, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v596;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v596 != v98)
          objc_enumerationMutation(v95);
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v595, v726, 16);
    }
    while (v97);
  }

  v594 = 0u;
  v593 = 0u;
  v592 = 0u;
  v591 = 0u;
  v100 = self->_movieObstructionResults;
  v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v591, v725, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v592;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v592 != v103)
          objc_enumerationMutation(v100);
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v591, v725, 16);
    }
    while (v102);
  }

  v590 = 0u;
  v589 = 0u;
  v588 = 0u;
  v587 = 0u;
  v105 = self->_movieOrientationResults;
  v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v587, v724, 16);
  if (v106)
  {
    v107 = v106;
    v108 = *(_QWORD *)v588;
    do
    {
      v109 = 0;
      do
      {
        if (*(_QWORD *)v588 != v108)
          objc_enumerationMutation(v105);
        PBDataWriterWriteSubmessage();
        ++v109;
      }
      while (v107 != v109);
      v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v587, v724, 16);
    }
    while (v107);
  }

  v586 = 0u;
  v585 = 0u;
  v584 = 0u;
  v583 = 0u;
  v110 = self->_moviePreEncodeResults;
  v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v583, v723, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v584;
    do
    {
      v114 = 0;
      do
      {
        if (*(_QWORD *)v584 != v113)
          objc_enumerationMutation(v110);
        PBDataWriterWriteSubmessage();
        ++v114;
      }
      while (v112 != v114);
      v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v583, v723, 16);
    }
    while (v112);
  }

  v582 = 0u;
  v581 = 0u;
  v580 = 0u;
  v579 = 0u;
  v115 = self->_movieQualityResults;
  v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v579, v722, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v580;
    do
    {
      v119 = 0;
      do
      {
        if (*(_QWORD *)v580 != v118)
          objc_enumerationMutation(v115);
        PBDataWriterWriteSubmessage();
        ++v119;
      }
      while (v117 != v119);
      v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v579, v722, 16);
    }
    while (v117);
  }

  v578 = 0u;
  v577 = 0u;
  v576 = 0u;
  v575 = 0u;
  v120 = self->_movieSaliencyResults;
  v121 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v575, v721, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v576;
    do
    {
      v124 = 0;
      do
      {
        if (*(_QWORD *)v576 != v123)
          objc_enumerationMutation(v120);
        PBDataWriterWriteSubmessage();
        ++v124;
      }
      while (v122 != v124);
      v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v575, v721, 16);
    }
    while (v122);
  }

  v574 = 0u;
  v573 = 0u;
  v572 = 0u;
  v571 = 0u;
  v125 = self->_movieSceneResults;
  v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v571, v720, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v572;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v572 != v128)
          objc_enumerationMutation(v125);
        PBDataWriterWriteSubmessage();
        ++v129;
      }
      while (v127 != v129);
      v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v571, v720, 16);
    }
    while (v127);
  }

  v570 = 0u;
  v569 = 0u;
  v568 = 0u;
  v567 = 0u;
  v130 = self->_movieSubjectMotionResults;
  v131 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v567, v719, 16);
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v568;
    do
    {
      v134 = 0;
      do
      {
        if (*(_QWORD *)v568 != v133)
          objc_enumerationMutation(v130);
        PBDataWriterWriteSubmessage();
        ++v134;
      }
      while (v132 != v134);
      v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v567, v719, 16);
    }
    while (v132);
  }

  v566 = 0u;
  v565 = 0u;
  v564 = 0u;
  v563 = 0u;
  v135 = self->_movieUtteranceResults;
  v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v563, v718, 16);
  if (v136)
  {
    v137 = v136;
    v138 = *(_QWORD *)v564;
    do
    {
      v139 = 0;
      do
      {
        if (*(_QWORD *)v564 != v138)
          objc_enumerationMutation(v135);
        PBDataWriterWriteSubmessage();
        ++v139;
      }
      while (v137 != v139);
      v137 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v135, "countByEnumeratingWithState:objects:count:", &v563, v718, 16);
    }
    while (v137);
  }

  v562 = 0u;
  v561 = 0u;
  v560 = 0u;
  v559 = 0u;
  v140 = self->_movieVoiceResults;
  v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v559, v717, 16);
  if (v141)
  {
    v142 = v141;
    v143 = *(_QWORD *)v560;
    do
    {
      v144 = 0;
      do
      {
        if (*(_QWORD *)v560 != v143)
          objc_enumerationMutation(v140);
        PBDataWriterWriteSubmessage();
        ++v144;
      }
      while (v142 != v144);
      v142 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v140, "countByEnumeratingWithState:objects:count:", &v559, v717, 16);
    }
    while (v142);
  }

  v558 = 0u;
  v557 = 0u;
  v556 = 0u;
  v555 = 0u;
  v145 = self->_imagePetsResults;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v555, v716, 16);
  if (v146)
  {
    v147 = v146;
    v148 = *(_QWORD *)v556;
    do
    {
      v149 = 0;
      do
      {
        if (*(_QWORD *)v556 != v148)
          objc_enumerationMutation(v145);
        PBDataWriterWriteSubmessage();
        ++v149;
      }
      while (v147 != v149);
      v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v555, v716, 16);
    }
    while (v147);
  }

  v554 = 0u;
  v553 = 0u;
  v552 = 0u;
  v551 = 0u;
  v150 = self->_movieSummaryResults;
  v151 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v551, v715, 16);
  if (v151)
  {
    v152 = v151;
    v153 = *(_QWORD *)v552;
    do
    {
      v154 = 0;
      do
      {
        if (*(_QWORD *)v552 != v153)
          objc_enumerationMutation(v150);
        PBDataWriterWriteSubmessage();
        ++v154;
      }
      while (v152 != v154);
      v152 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v150, "countByEnumeratingWithState:objects:count:", &v551, v715, 16);
    }
    while (v152);
  }

  v550 = 0u;
  v549 = 0u;
  v548 = 0u;
  v547 = 0u;
  v155 = self->_movieHighlightResults;
  v156 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v547, v714, 16);
  if (v156)
  {
    v157 = v156;
    v158 = *(_QWORD *)v548;
    do
    {
      v159 = 0;
      do
      {
        if (*(_QWORD *)v548 != v158)
          objc_enumerationMutation(v155);
        PBDataWriterWriteSubmessage();
        ++v159;
      }
      while (v157 != v159);
      v157 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v155, "countByEnumeratingWithState:objects:count:", &v547, v714, 16);
    }
    while (v157);
  }

  v546 = 0u;
  v545 = 0u;
  v544 = 0u;
  v543 = 0u;
  v160 = self->_imageExposureResults;
  v161 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v543, v713, 16);
  if (v161)
  {
    v162 = v161;
    v163 = *(_QWORD *)v544;
    do
    {
      v164 = 0;
      do
      {
        if (*(_QWORD *)v544 != v163)
          objc_enumerationMutation(v160);
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      v162 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v160, "countByEnumeratingWithState:objects:count:", &v543, v713, 16);
    }
    while (v162);
  }

  v542 = 0u;
  v541 = 0u;
  v540 = 0u;
  v539 = 0u;
  v165 = self->_livePhotoEffectsResults;
  v166 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v539, v712, 16);
  if (v166)
  {
    v167 = v166;
    v168 = *(_QWORD *)v540;
    do
    {
      v169 = 0;
      do
      {
        if (*(_QWORD *)v540 != v168)
          objc_enumerationMutation(v165);
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v165, "countByEnumeratingWithState:objects:count:", &v539, v712, 16);
    }
    while (v167);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v538 = 0u;
  v537 = 0u;
  v536 = 0u;
  v535 = 0u;
  v170 = self->_imagePetsFaceResults;
  v171 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v535, v711, 16);
  if (v171)
  {
    v172 = v171;
    v173 = *(_QWORD *)v536;
    do
    {
      v174 = 0;
      do
      {
        if (*(_QWORD *)v536 != v173)
          objc_enumerationMutation(v170);
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      v172 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v170, "countByEnumeratingWithState:objects:count:", &v535, v711, 16);
    }
    while (v172);
  }

  v534 = 0u;
  v533 = 0u;
  v532 = 0u;
  v531 = 0u;
  v175 = self->_imageSceneprintResults;
  v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v531, v710, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v532;
    do
    {
      v179 = 0;
      do
      {
        if (*(_QWORD *)v532 != v178)
          objc_enumerationMutation(v175);
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      v177 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v531, v710, 16);
    }
    while (v177);
  }

  v530 = 0u;
  v529 = 0u;
  v528 = 0u;
  v527 = 0u;
  v180 = self->_movieSceneprintResults;
  v181 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v527, v709, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v528;
    do
    {
      v184 = 0;
      do
      {
        if (*(_QWORD *)v528 != v183)
          objc_enumerationMutation(v180);
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      v182 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v180, "countByEnumeratingWithState:objects:count:", &v527, v709, 16);
    }
    while (v182);
  }

  v526 = 0u;
  v525 = 0u;
  v524 = 0u;
  v523 = 0u;
  v185 = self->_imageHumanPoseResults;
  v186 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v523, v708, 16);
  if (v186)
  {
    v187 = v186;
    v188 = *(_QWORD *)v524;
    do
    {
      v189 = 0;
      do
      {
        if (*(_QWORD *)v524 != v188)
          objc_enumerationMutation(v185);
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      v187 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v185, "countByEnumeratingWithState:objects:count:", &v523, v708, 16);
    }
    while (v187);
  }

  v522 = 0u;
  v521 = 0u;
  v520 = 0u;
  v519 = 0u;
  v190 = self->_movieHumanPoseResults;
  v191 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v519, v707, 16);
  if (v191)
  {
    v192 = v191;
    v193 = *(_QWORD *)v520;
    do
    {
      v194 = 0;
      do
      {
        if (*(_QWORD *)v520 != v193)
          objc_enumerationMutation(v190);
        PBDataWriterWriteSubmessage();
        ++v194;
      }
      while (v192 != v194);
      v192 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v519, v707, 16);
    }
    while (v192);
  }

  v518 = 0u;
  v517 = 0u;
  v516 = 0u;
  v515 = 0u;
  v195 = self->_movieApplauseResults;
  v196 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v195, "countByEnumeratingWithState:objects:count:", &v515, v706, 16);
  if (v196)
  {
    v197 = v196;
    v198 = *(_QWORD *)v516;
    do
    {
      v199 = 0;
      do
      {
        if (*(_QWORD *)v516 != v198)
          objc_enumerationMutation(v195);
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      v197 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v195, "countByEnumeratingWithState:objects:count:", &v515, v706, 16);
    }
    while (v197);
  }

  v514 = 0u;
  v513 = 0u;
  v512 = 0u;
  v511 = 0u;
  v200 = self->_movieBabbleResults;
  v201 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v511, v705, 16);
  if (v201)
  {
    v202 = v201;
    v203 = *(_QWORD *)v512;
    do
    {
      v204 = 0;
      do
      {
        if (*(_QWORD *)v512 != v203)
          objc_enumerationMutation(v200);
        PBDataWriterWriteSubmessage();
        ++v204;
      }
      while (v202 != v204);
      v202 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v200, "countByEnumeratingWithState:objects:count:", &v511, v705, 16);
    }
    while (v202);
  }

  v510 = 0u;
  v509 = 0u;
  v508 = 0u;
  v507 = 0u;
  v205 = self->_movieCheeringResults;
  v206 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v507, v704, 16);
  if (v206)
  {
    v207 = v206;
    v208 = *(_QWORD *)v508;
    do
    {
      v209 = 0;
      do
      {
        if (*(_QWORD *)v508 != v208)
          objc_enumerationMutation(v205);
        PBDataWriterWriteSubmessage();
        ++v209;
      }
      while (v207 != v209);
      v207 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v507, v704, 16);
    }
    while (v207);
  }

  v506 = 0u;
  v505 = 0u;
  v504 = 0u;
  v503 = 0u;
  v210 = self->_movieLaughterResults;
  v211 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v503, v703, 16);
  if (v211)
  {
    v212 = v211;
    v213 = *(_QWORD *)v504;
    do
    {
      v214 = 0;
      do
      {
        if (*(_QWORD *)v504 != v213)
          objc_enumerationMutation(v210);
        PBDataWriterWriteSubmessage();
        ++v214;
      }
      while (v212 != v214);
      v212 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v210, "countByEnumeratingWithState:objects:count:", &v503, v703, 16);
    }
    while (v212);
  }

  v502 = 0u;
  v501 = 0u;
  v500 = 0u;
  v499 = 0u;
  v215 = self->_livePhotoKeyFrameResults;
  v216 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v499, v702, 16);
  if (v216)
  {
    v217 = v216;
    v218 = *(_QWORD *)v500;
    do
    {
      v219 = 0;
      do
      {
        if (*(_QWORD *)v500 != v218)
          objc_enumerationMutation(v215);
        PBDataWriterWriteSubmessage();
        ++v219;
      }
      while (v217 != v219);
      v217 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v215, "countByEnumeratingWithState:objects:count:", &v499, v702, 16);
    }
    while (v217);
  }

  v498 = 0u;
  v497 = 0u;
  v496 = 0u;
  v495 = 0u;
  v220 = self->_livePhotoKeyFrameStillResults;
  v221 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v220, "countByEnumeratingWithState:objects:count:", &v495, v701, 16);
  if (v221)
  {
    v222 = v221;
    v223 = *(_QWORD *)v496;
    do
    {
      v224 = 0;
      do
      {
        if (*(_QWORD *)v496 != v223)
          objc_enumerationMutation(v220);
        PBDataWriterWriteSubmessage();
        ++v224;
      }
      while (v222 != v224);
      v222 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v220, "countByEnumeratingWithState:objects:count:", &v495, v701, 16);
    }
    while (v222);
  }

  v494 = 0u;
  v493 = 0u;
  v492 = 0u;
  v491 = 0u;
  v225 = self->_movieHumanActionResults;
  v226 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v491, v700, 16);
  if (v226)
  {
    v227 = v226;
    v228 = *(_QWORD *)v492;
    do
    {
      v229 = 0;
      do
      {
        if (*(_QWORD *)v492 != v228)
          objc_enumerationMutation(v225);
        PBDataWriterWriteSubmessage();
        ++v229;
      }
      while (v227 != v229);
      v227 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v225, "countByEnumeratingWithState:objects:count:", &v491, v700, 16);
    }
    while (v227);
  }

  v490 = 0u;
  v489 = 0u;
  v488 = 0u;
  v487 = 0u;
  v230 = self->_movieSubtleMotionResults;
  v231 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v230, "countByEnumeratingWithState:objects:count:", &v487, v699, 16);
  if (v231)
  {
    v232 = v231;
    v233 = *(_QWORD *)v488;
    do
    {
      v234 = 0;
      do
      {
        if (*(_QWORD *)v488 != v233)
          objc_enumerationMutation(v230);
        PBDataWriterWriteSubmessage();
        ++v234;
      }
      while (v232 != v234);
      v232 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v230, "countByEnumeratingWithState:objects:count:", &v487, v699, 16);
    }
    while (v232);
  }

  v486 = 0u;
  v485 = 0u;
  v484 = 0u;
  v483 = 0u;
  v235 = self->_movieLoudnessResults;
  v236 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v483, v698, 16);
  if (v236)
  {
    v237 = v236;
    v238 = *(_QWORD *)v484;
    do
    {
      v239 = 0;
      do
      {
        if (*(_QWORD *)v484 != v238)
          objc_enumerationMutation(v235);
        PBDataWriterWriteSubmessage();
        ++v239;
      }
      while (v237 != v239);
      v237 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v483, v698, 16);
    }
    while (v237);
  }

  v482 = 0u;
  v481 = 0u;
  v480 = 0u;
  v479 = 0u;
  v240 = self->_moviePetsResults;
  v241 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v479, v697, 16);
  if (v241)
  {
    v242 = v241;
    v243 = *(_QWORD *)v480;
    do
    {
      v244 = 0;
      do
      {
        if (*(_QWORD *)v480 != v243)
          objc_enumerationMutation(v240);
        PBDataWriterWriteSubmessage();
        ++v244;
      }
      while (v242 != v244);
      v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v240, "countByEnumeratingWithState:objects:count:", &v479, v697, 16);
    }
    while (v242);
  }

  v478 = 0u;
  v477 = 0u;
  v476 = 0u;
  v475 = 0u;
  v245 = self->_moviePetsFaceResults;
  v246 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v245, "countByEnumeratingWithState:objects:count:", &v475, v696, 16);
  if (v246)
  {
    v247 = v246;
    v248 = *(_QWORD *)v476;
    do
    {
      v249 = 0;
      do
      {
        if (*(_QWORD *)v476 != v248)
          objc_enumerationMutation(v245);
        PBDataWriterWriteSubmessage();
        ++v249;
      }
      while (v247 != v249);
      v247 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v245, "countByEnumeratingWithState:objects:count:", &v475, v696, 16);
    }
    while (v247);
  }

  v474 = 0u;
  v473 = 0u;
  v472 = 0u;
  v471 = 0u;
  v250 = self->_movieStabilizationResults;
  v251 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v471, v695, 16);
  if (v251)
  {
    v252 = v251;
    v253 = *(_QWORD *)v472;
    do
    {
      v254 = 0;
      do
      {
        if (*(_QWORD *)v472 != v253)
          objc_enumerationMutation(v250);
        PBDataWriterWriteSubmessage();
        ++v254;
      }
      while (v252 != v254);
      v252 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v250, "countByEnumeratingWithState:objects:count:", &v471, v695, 16);
    }
    while (v252);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  v470 = 0u;
  v469 = 0u;
  v468 = 0u;
  v467 = 0u;
  v255 = self->_movieHighlightScoreResults;
  v256 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v255, "countByEnumeratingWithState:objects:count:", &v467, v694, 16);
  if (v256)
  {
    v257 = v256;
    v258 = *(_QWORD *)v468;
    do
    {
      v259 = 0;
      do
      {
        if (*(_QWORD *)v468 != v258)
          objc_enumerationMutation(v255);
        PBDataWriterWriteSubmessage();
        ++v259;
      }
      while (v257 != v259);
      v257 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v255, "countByEnumeratingWithState:objects:count:", &v467, v694, 16);
    }
    while (v257);
  }

  v466 = 0u;
  v465 = 0u;
  v464 = 0u;
  v463 = 0u;
  v260 = self->_livePhotoHumanActionClassificationResults;
  v261 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v463, v693, 16);
  if (v261)
  {
    v262 = v261;
    v263 = *(_QWORD *)v464;
    do
    {
      v264 = 0;
      do
      {
        if (*(_QWORD *)v464 != v263)
          objc_enumerationMutation(v260);
        PBDataWriterWriteSubmessage();
        ++v264;
      }
      while (v262 != v264);
      v262 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v260, "countByEnumeratingWithState:objects:count:", &v463, v693, 16);
    }
    while (v262);
  }

  v462 = 0u;
  v461 = 0u;
  v460 = 0u;
  v459 = 0u;
  v265 = self->_movieAudioQualityResults;
  v266 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v459, v692, 16);
  if (v266)
  {
    v267 = v266;
    v268 = *(_QWORD *)v460;
    do
    {
      v269 = 0;
      do
      {
        if (*(_QWORD *)v460 != v268)
          objc_enumerationMutation(v265);
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      v267 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v459, v692, 16);
    }
    while (v267);
  }

  v458 = 0u;
  v457 = 0u;
  v456 = 0u;
  v455 = 0u;
  v270 = self->_movieSafetyResults;
  v271 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v455, v691, 16);
  if (v271)
  {
    v272 = v271;
    v273 = *(_QWORD *)v456;
    do
    {
      v274 = 0;
      do
      {
        if (*(_QWORD *)v456 != v273)
          objc_enumerationMutation(v270);
        PBDataWriterWriteSubmessage();
        ++v274;
      }
      while (v272 != v274);
      v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v455, v691, 16);
    }
    while (v272);
  }

  v454 = 0u;
  v453 = 0u;
  v452 = 0u;
  v451 = 0u;
  v275 = self->_filesystemMovieClassificationResults;
  v276 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v451, v690, 16);
  if (v276)
  {
    v277 = v276;
    v278 = *(_QWORD *)v452;
    do
    {
      v279 = 0;
      do
      {
        if (*(_QWORD *)v452 != v278)
          objc_enumerationMutation(v275);
        PBDataWriterWriteSubmessage();
        ++v279;
      }
      while (v277 != v279);
      v277 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v275, "countByEnumeratingWithState:objects:count:", &v451, v690, 16);
    }
    while (v277);
  }

  v450 = 0u;
  v449 = 0u;
  v448 = 0u;
  v447 = 0u;
  v280 = self->_filesystemMovieHumanActionClassificationResults;
  v281 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v280, "countByEnumeratingWithState:objects:count:", &v447, v689, 16);
  if (v281)
  {
    v282 = v281;
    v283 = *(_QWORD *)v448;
    do
    {
      v284 = 0;
      do
      {
        if (*(_QWORD *)v448 != v283)
          objc_enumerationMutation(v280);
        PBDataWriterWriteSubmessage();
        ++v284;
      }
      while (v282 != v284);
      v282 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v280, "countByEnumeratingWithState:objects:count:", &v447, v689, 16);
    }
    while (v282);
  }

  v446 = 0u;
  v445 = 0u;
  v444 = 0u;
  v443 = 0u;
  v285 = self->_filesystemMovieApplauseResults;
  v286 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v443, v688, 16);
  if (v286)
  {
    v287 = v286;
    v288 = *(_QWORD *)v444;
    do
    {
      v289 = 0;
      do
      {
        if (*(_QWORD *)v444 != v288)
          objc_enumerationMutation(v285);
        PBDataWriterWriteSubmessage();
        ++v289;
      }
      while (v287 != v289);
      v287 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v285, "countByEnumeratingWithState:objects:count:", &v443, v688, 16);
    }
    while (v287);
  }

  v442 = 0u;
  v441 = 0u;
  v440 = 0u;
  v439 = 0u;
  v290 = self->_filesystemMovieBabbleResults;
  v291 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v290, "countByEnumeratingWithState:objects:count:", &v439, v687, 16);
  if (v291)
  {
    v292 = v291;
    v293 = *(_QWORD *)v440;
    do
    {
      v294 = 0;
      do
      {
        if (*(_QWORD *)v440 != v293)
          objc_enumerationMutation(v290);
        PBDataWriterWriteSubmessage();
        ++v294;
      }
      while (v292 != v294);
      v292 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v290, "countByEnumeratingWithState:objects:count:", &v439, v687, 16);
    }
    while (v292);
  }

  v437 = 0u;
  v438 = 0u;
  v435 = 0u;
  v436 = 0u;
  v295 = self->_filesystemMovieCheeringResults;
  v296 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v435, v686, 16);
  if (v296)
  {
    v297 = v296;
    v298 = *(_QWORD *)v436;
    do
    {
      v299 = 0;
      do
      {
        if (*(_QWORD *)v436 != v298)
          objc_enumerationMutation(v295);
        PBDataWriterWriteSubmessage();
        ++v299;
      }
      while (v297 != v299);
      v297 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v435, v686, 16);
    }
    while (v297);
  }

  v433 = 0u;
  v434 = 0u;
  v431 = 0u;
  v432 = 0u;
  v300 = self->_filesystemMovieLaughterResults;
  v301 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v431, v685, 16);
  if (v301)
  {
    v302 = v301;
    v303 = *(_QWORD *)v432;
    do
    {
      v304 = 0;
      do
      {
        if (*(_QWORD *)v432 != v303)
          objc_enumerationMutation(v300);
        PBDataWriterWriteSubmessage();
        ++v304;
      }
      while (v302 != v304);
      v302 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v300, "countByEnumeratingWithState:objects:count:", &v431, v685, 16);
    }
    while (v302);
  }

  v429 = 0u;
  v430 = 0u;
  v427 = 0u;
  v428 = 0u;
  v305 = self->_filesystemMovieMusicResults;
  v306 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v305, "countByEnumeratingWithState:objects:count:", &v427, v684, 16);
  if (v306)
  {
    v307 = v306;
    v308 = *(_QWORD *)v428;
    do
    {
      v309 = 0;
      do
      {
        if (*(_QWORD *)v428 != v308)
          objc_enumerationMutation(v305);
        PBDataWriterWriteSubmessage();
        ++v309;
      }
      while (v307 != v309);
      v307 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v305, "countByEnumeratingWithState:objects:count:", &v427, v684, 16);
    }
    while (v307);
  }

  v425 = 0u;
  v426 = 0u;
  v423 = 0u;
  v424 = 0u;
  v310 = self->_filesystemMovieVoiceResults;
  v311 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v423, v683, 16);
  if (v311)
  {
    v312 = v311;
    v313 = *(_QWORD *)v424;
    do
    {
      v314 = 0;
      do
      {
        if (*(_QWORD *)v424 != v313)
          objc_enumerationMutation(v310);
        PBDataWriterWriteSubmessage();
        ++v314;
      }
      while (v312 != v314);
      v312 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v310, "countByEnumeratingWithState:objects:count:", &v423, v683, 16);
    }
    while (v312);
  }

  v421 = 0u;
  v422 = 0u;
  v419 = 0u;
  v420 = 0u;
  v315 = self->_animatedStickerResults;
  v316 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v315, "countByEnumeratingWithState:objects:count:", &v419, v682, 16);
  if (v316)
  {
    v317 = v316;
    v318 = *(_QWORD *)v420;
    do
    {
      v319 = 0;
      do
      {
        if (*(_QWORD *)v420 != v318)
          objc_enumerationMutation(v315);
        PBDataWriterWriteSubmessage();
        ++v319;
      }
      while (v317 != v319);
      v317 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v315, "countByEnumeratingWithState:objects:count:", &v419, v682, 16);
    }
    while (v317);
  }

  v417 = 0u;
  v418 = 0u;
  v415 = 0u;
  v416 = 0u;
  v320 = self->_livePhotoSettlingEffectGatingResults;
  v321 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v415, v681, 16);
  if (v321)
  {
    v322 = v321;
    v323 = *(_QWORD *)v416;
    do
    {
      v324 = 0;
      do
      {
        if (*(_QWORD *)v416 != v323)
          objc_enumerationMutation(v320);
        PBDataWriterWriteSubmessage();
        ++v324;
      }
      while (v322 != v324);
      v322 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v320, "countByEnumeratingWithState:objects:count:", &v415, v681, 16);
    }
    while (v322);
  }

  if (self->_assetCloudIdentifier)
    PBDataWriterWriteStringField();
  v413 = 0u;
  v414 = 0u;
  v411 = 0u;
  v412 = 0u;
  v325 = self->_movieTorsoResults;
  v326 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v411, v680, 16);
  if (v326)
  {
    v327 = v326;
    v328 = *(_QWORD *)v412;
    do
    {
      v329 = 0;
      do
      {
        if (*(_QWORD *)v412 != v328)
          objc_enumerationMutation(v325);
        PBDataWriterWriteSubmessage();
        ++v329;
      }
      while (v327 != v329);
      v327 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v411, v680, 16);
    }
    while (v327);
  }

  v409 = 0u;
  v410 = 0u;
  v407 = 0u;
  v408 = 0u;
  v330 = self->_movieHumanActionClassificationResults;
  v331 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v407, v679, 16);
  if (v331)
  {
    v332 = v331;
    v333 = *(_QWORD *)v408;
    do
    {
      v334 = 0;
      do
      {
        if (*(_QWORD *)v408 != v333)
          objc_enumerationMutation(v330);
        PBDataWriterWriteSubmessage();
        ++v334;
      }
      while (v332 != v334);
      v332 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v330, "countByEnumeratingWithState:objects:count:", &v407, v679, 16);
    }
    while (v332);
  }

  v405 = 0u;
  v406 = 0u;
  v403 = 0u;
  v404 = 0u;
  v335 = self->_videoEmbeddingResults;
  v336 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v335, "countByEnumeratingWithState:objects:count:", &v403, v678, 16);
  if (v336)
  {
    v337 = v336;
    v338 = *(_QWORD *)v404;
    do
    {
      v339 = 0;
      do
      {
        if (*(_QWORD *)v404 != v338)
          objc_enumerationMutation(v335);
        PBDataWriterWriteSubmessage();
        ++v339;
      }
      while (v337 != v339);
      v337 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v335, "countByEnumeratingWithState:objects:count:", &v403, v678, 16);
    }
    while (v337);
  }

  v401 = 0u;
  v402 = 0u;
  v399 = 0u;
  v400 = 0u;
  v340 = self->_summarizedEmbeddingResults;
  v341 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v340, "countByEnumeratingWithState:objects:count:", &v399, v677, 16);
  if (v341)
  {
    v342 = v341;
    v343 = *(_QWORD *)v400;
    do
    {
      v344 = 0;
      do
      {
        if (*(_QWORD *)v400 != v343)
          objc_enumerationMutation(v340);
        PBDataWriterWriteSubmessage();
        ++v344;
      }
      while (v342 != v344);
      v342 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v340, "countByEnumeratingWithState:objects:count:", &v399, v677, 16);
    }
    while (v342);
  }

  v397 = 0u;
  v398 = 0u;
  v395 = 0u;
  v396 = 0u;
  v345 = self->_audioFusedVideoEmbeddingResults;
  v346 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v395, v676, 16);
  if (v346)
  {
    v347 = v346;
    v348 = *(_QWORD *)v396;
    do
    {
      v349 = 0;
      do
      {
        if (*(_QWORD *)v396 != v348)
          objc_enumerationMutation(v345);
        PBDataWriterWriteSubmessage();
        ++v349;
      }
      while (v347 != v349);
      v347 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v345, "countByEnumeratingWithState:objects:count:", &v395, v676, 16);
    }
    while (v347);
  }

  v393 = 0u;
  v394 = 0u;
  v391 = 0u;
  v392 = 0u;
  v350 = self->_imageEmbeddingResults;
  v351 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v350, "countByEnumeratingWithState:objects:count:", &v391, v675, 16);
  if (v351)
  {
    v352 = v351;
    v353 = *(_QWORD *)v392;
    do
    {
      v354 = 0;
      do
      {
        if (*(_QWORD *)v392 != v353)
          objc_enumerationMutation(v350);
        PBDataWriterWriteSubmessage();
        ++v354;
      }
      while (v352 != v354);
      v352 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v350, "countByEnumeratingWithState:objects:count:", &v391, v675, 16);
    }
    while (v352);
  }

  v389 = 0u;
  v390 = 0u;
  v387 = 0u;
  v388 = 0u;
  v355 = self->_imageCaptionResults;
  v356 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v387, v674, 16);
  if (v356)
  {
    v357 = v356;
    v358 = *(_QWORD *)v388;
    do
    {
      v359 = 0;
      do
      {
        if (*(_QWORD *)v388 != v358)
          objc_enumerationMutation(v355);
        PBDataWriterWriteSubmessage();
        ++v359;
      }
      while (v357 != v359);
      v357 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v387, v674, 16);
    }
    while (v357);
  }

  v385 = 0u;
  v386 = 0u;
  v383 = 0u;
  v384 = 0u;
  v360 = self->_videoCaptionResults;
  v361 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v383, v673, 16);
  if (v361)
  {
    v362 = v361;
    v363 = *(_QWORD *)v384;
    do
    {
      v364 = 0;
      do
      {
        if (*(_QWORD *)v384 != v363)
          objc_enumerationMutation(v360);
        PBDataWriterWriteSubmessage();
        ++v364;
      }
      while (v362 != v364);
      v362 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v360, "countByEnumeratingWithState:objects:count:", &v383, v673, 16);
    }
    while (v362);
  }

  v381 = 0u;
  v382 = 0u;
  v379 = 0u;
  v380 = 0u;
  v365 = self->_videoCaptionPreferenceResults;
  v366 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v365, "countByEnumeratingWithState:objects:count:", &v379, v672, 16);
  if (v366)
  {
    v367 = v366;
    v368 = *(_QWORD *)v380;
    do
    {
      v369 = 0;
      do
      {
        if (*(_QWORD *)v380 != v368)
          objc_enumerationMutation(v365);
        PBDataWriterWriteSubmessage();
        ++v369;
      }
      while (v367 != v369);
      v367 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v365, "countByEnumeratingWithState:objects:count:", &v379, v672, 16);
    }
    while (v367);
  }

  v377 = 0u;
  v378 = 0u;
  v375 = 0u;
  v376 = 0u;
  v370 = self->_videoSegmentCaptionResults;
  v371 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v370, "countByEnumeratingWithState:objects:count:", &v375, v671, 16);
  if (v371)
  {
    v372 = v371;
    v373 = *(_QWORD *)v376;
    do
    {
      v374 = 0;
      do
      {
        if (*(_QWORD *)v376 != v373)
          objc_enumerationMutation(v370);
        PBDataWriterWriteSubmessage();
        ++v374;
      }
      while (v372 != v374);
      v372 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v370, "countByEnumeratingWithState:objects:count:", &v375, v671, 16);
    }
    while (v372);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t nn;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t i1;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t i2;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t i3;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t i4;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t i5;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t i6;
  void *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t i7;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t i8;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t i9;
  void *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t i10;
  void *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t i11;
  void *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t i12;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t i13;
  void *v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t i14;
  void *v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t i15;
  void *v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t i16;
  void *v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t i17;
  void *v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t i18;
  void *v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t i19;
  void *v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t i20;
  void *v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t i21;
  void *v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t i22;
  void *v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t i23;
  void *v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t i24;
  void *v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t i25;
  void *v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t i26;
  void *v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t i27;
  void *v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t i28;
  void *v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t i29;
  void *v160;
  unint64_t v161;
  unint64_t v162;
  uint64_t i30;
  void *v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t i31;
  void *v168;
  unint64_t v169;
  unint64_t v170;
  uint64_t i32;
  void *v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t i33;
  void *v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t i34;
  void *v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t i35;
  void *v184;
  unint64_t v185;
  unint64_t v186;
  uint64_t i36;
  void *v188;
  unint64_t v189;
  unint64_t v190;
  uint64_t i37;
  void *v192;
  unint64_t v193;
  unint64_t v194;
  uint64_t i38;
  void *v196;
  unint64_t v197;
  unint64_t v198;
  uint64_t i39;
  void *v200;
  unint64_t v201;
  unint64_t v202;
  uint64_t i40;
  void *v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t i41;
  void *v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t i42;
  void *v212;
  unint64_t v213;
  unint64_t v214;
  uint64_t i43;
  void *v216;
  unint64_t v217;
  unint64_t v218;
  uint64_t i44;
  void *v220;
  unint64_t v221;
  unint64_t v222;
  uint64_t i45;
  void *v224;
  unint64_t v225;
  unint64_t v226;
  uint64_t i46;
  void *v228;
  unint64_t v229;
  unint64_t v230;
  uint64_t i47;
  void *v232;
  unint64_t v233;
  unint64_t v234;
  uint64_t i48;
  void *v236;
  unint64_t v237;
  unint64_t v238;
  uint64_t i49;
  void *v240;
  unint64_t v241;
  unint64_t v242;
  uint64_t i50;
  void *v244;
  unint64_t v245;
  unint64_t v246;
  uint64_t i51;
  void *v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t i52;
  void *v252;
  unint64_t v253;
  unint64_t v254;
  uint64_t i53;
  void *v256;
  unint64_t v257;
  unint64_t v258;
  uint64_t i54;
  void *v260;
  unint64_t v261;
  unint64_t v262;
  uint64_t i55;
  void *v264;
  unint64_t v265;
  unint64_t v266;
  uint64_t i56;
  void *v268;
  unint64_t v269;
  unint64_t v270;
  uint64_t i57;
  void *v272;
  unint64_t v273;
  unint64_t v274;
  uint64_t i58;
  void *v276;
  unint64_t v277;
  unint64_t v278;
  uint64_t i59;
  void *v280;
  unint64_t v281;
  unint64_t v282;
  uint64_t i60;
  void *v284;
  unint64_t v285;
  unint64_t v286;
  uint64_t i61;
  void *v288;
  unint64_t v289;
  unint64_t v290;
  uint64_t i62;
  void *v292;
  unint64_t v293;
  unint64_t v294;
  uint64_t i63;
  void *v296;
  unint64_t v297;
  unint64_t v298;
  uint64_t i64;
  void *v300;
  _QWORD *v301;

  v4 = a3;
  v4[163] = self->_version;
  v4[162] = self->_types;
  v4[40] = self->_flags;
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_date;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_quality;
    *((_BYTE *)v4 + 688) |= 1u;
  }
  v301 = v4;
  objc_msgSend(v4, "setAssetIdentifier:", self->_assetIdentifier);
  v301[1] = *(_QWORD *)&self->_assetModificationDate;
  if (self->_assetMasterFingerprint)
    objc_msgSend(v301, "setAssetMasterFingerprint:");
  if (self->_assetAdjustedFingerprint)
    objc_msgSend(v301, "setAssetAdjustedFingerprint:");
  if (-[VCPProtoAssetAnalysis imageBlurResultsCount](self, "imageBlurResultsCount"))
  {
    objc_msgSend(v301, "clearImageBlurResults");
    v5 = -[VCPProtoAssetAnalysis imageBlurResultsCount](self, "imageBlurResultsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[VCPProtoAssetAnalysis imageBlurResultsAtIndex:](self, "imageBlurResultsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageBlurResults:", v8);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageCompositionResultsCount](self, "imageCompositionResultsCount"))
  {
    objc_msgSend(v301, "clearImageCompositionResults");
    v9 = -[VCPProtoAssetAnalysis imageCompositionResultsCount](self, "imageCompositionResultsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[VCPProtoAssetAnalysis imageCompositionResultsAtIndex:](self, "imageCompositionResultsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageCompositionResults:", v12);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageFaceResultsCount](self, "imageFaceResultsCount"))
  {
    objc_msgSend(v301, "clearImageFaceResults");
    v13 = -[VCPProtoAssetAnalysis imageFaceResultsCount](self, "imageFaceResultsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[VCPProtoAssetAnalysis imageFaceResultsAtIndex:](self, "imageFaceResultsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageFaceResults:", v16);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageFeatureResultsCount](self, "imageFeatureResultsCount"))
  {
    objc_msgSend(v301, "clearImageFeatureResults");
    v17 = -[VCPProtoAssetAnalysis imageFeatureResultsCount](self, "imageFeatureResultsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[VCPProtoAssetAnalysis imageFeatureResultsAtIndex:](self, "imageFeatureResultsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageFeatureResults:", v20);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageJunkResultsCount](self, "imageJunkResultsCount"))
  {
    objc_msgSend(v301, "clearImageJunkResults");
    v21 = -[VCPProtoAssetAnalysis imageJunkResultsCount](self, "imageJunkResultsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[VCPProtoAssetAnalysis imageJunkResultsAtIndex:](self, "imageJunkResultsAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageJunkResults:", v24);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageSaliencyResultsCount](self, "imageSaliencyResultsCount"))
  {
    objc_msgSend(v301, "clearImageSaliencyResults");
    v25 = -[VCPProtoAssetAnalysis imageSaliencyResultsCount](self, "imageSaliencyResultsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[VCPProtoAssetAnalysis imageSaliencyResultsAtIndex:](self, "imageSaliencyResultsAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageSaliencyResults:", v28);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageShotTypeResultsCount](self, "imageShotTypeResultsCount"))
  {
    objc_msgSend(v301, "clearImageShotTypeResults");
    v29 = -[VCPProtoAssetAnalysis imageShotTypeResultsCount](self, "imageShotTypeResultsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[VCPProtoAssetAnalysis imageShotTypeResultsAtIndex:](self, "imageShotTypeResultsAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageShotTypeResults:", v32);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoRecommendationResultsCount](self, "livePhotoRecommendationResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoRecommendationResults");
    v33 = -[VCPProtoAssetAnalysis livePhotoRecommendationResultsCount](self, "livePhotoRecommendationResultsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[VCPProtoAssetAnalysis livePhotoRecommendationResultsAtIndex:](self, "livePhotoRecommendationResultsAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoRecommendationResults:", v36);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoSharpnessResultsCount](self, "livePhotoSharpnessResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoSharpnessResults");
    v37 = -[VCPProtoAssetAnalysis livePhotoSharpnessResultsCount](self, "livePhotoSharpnessResultsCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[VCPProtoAssetAnalysis livePhotoSharpnessResultsAtIndex:](self, "livePhotoSharpnessResultsAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoSharpnessResults:", v40);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieActivityLevelResultsCount](self, "movieActivityLevelResultsCount"))
  {
    objc_msgSend(v301, "clearMovieActivityLevelResults");
    v41 = -[VCPProtoAssetAnalysis movieActivityLevelResultsCount](self, "movieActivityLevelResultsCount");
    if (v41)
    {
      v42 = v41;
      for (nn = 0; nn != v42; ++nn)
      {
        -[VCPProtoAssetAnalysis movieActivityLevelResultsAtIndex:](self, "movieActivityLevelResultsAtIndex:", nn);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieActivityLevelResults:", v44);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieCameraMotionResultsCount](self, "movieCameraMotionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieCameraMotionResults");
    v45 = -[VCPProtoAssetAnalysis movieCameraMotionResultsCount](self, "movieCameraMotionResultsCount");
    if (v45)
    {
      v46 = v45;
      for (i1 = 0; i1 != v46; ++i1)
      {
        -[VCPProtoAssetAnalysis movieCameraMotionResultsAtIndex:](self, "movieCameraMotionResultsAtIndex:", i1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieCameraMotionResults:", v48);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieClassificationResultsCount](self, "movieClassificationResultsCount"))
  {
    objc_msgSend(v301, "clearMovieClassificationResults");
    v49 = -[VCPProtoAssetAnalysis movieClassificationResultsCount](self, "movieClassificationResultsCount");
    if (v49)
    {
      v50 = v49;
      for (i2 = 0; i2 != v50; ++i2)
      {
        -[VCPProtoAssetAnalysis movieClassificationResultsAtIndex:](self, "movieClassificationResultsAtIndex:", i2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieClassificationResults:", v52);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieFaceResultsCount](self, "movieFaceResultsCount"))
  {
    objc_msgSend(v301, "clearMovieFaceResults");
    v53 = -[VCPProtoAssetAnalysis movieFaceResultsCount](self, "movieFaceResultsCount");
    if (v53)
    {
      v54 = v53;
      for (i3 = 0; i3 != v54; ++i3)
      {
        -[VCPProtoAssetAnalysis movieFaceResultsAtIndex:](self, "movieFaceResultsAtIndex:", i3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieFaceResults:", v56);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieFaceprintResultsCount](self, "movieFaceprintResultsCount"))
  {
    objc_msgSend(v301, "clearMovieFaceprintResults");
    v57 = -[VCPProtoAssetAnalysis movieFaceprintResultsCount](self, "movieFaceprintResultsCount");
    if (v57)
    {
      v58 = v57;
      for (i4 = 0; i4 != v58; ++i4)
      {
        -[VCPProtoAssetAnalysis movieFaceprintResultsAtIndex:](self, "movieFaceprintResultsAtIndex:", i4);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieFaceprintResults:", v60);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieFeatureResultsCount](self, "movieFeatureResultsCount"))
  {
    objc_msgSend(v301, "clearMovieFeatureResults");
    v61 = -[VCPProtoAssetAnalysis movieFeatureResultsCount](self, "movieFeatureResultsCount");
    if (v61)
    {
      v62 = v61;
      for (i5 = 0; i5 != v62; ++i5)
      {
        -[VCPProtoAssetAnalysis movieFeatureResultsAtIndex:](self, "movieFeatureResultsAtIndex:", i5);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieFeatureResults:", v64);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieFineSubjectMotionResultsCount](self, "movieFineSubjectMotionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieFineSubjectMotionResults");
    v65 = -[VCPProtoAssetAnalysis movieFineSubjectMotionResultsCount](self, "movieFineSubjectMotionResultsCount");
    if (v65)
    {
      v66 = v65;
      for (i6 = 0; i6 != v66; ++i6)
      {
        -[VCPProtoAssetAnalysis movieFineSubjectMotionResultsAtIndex:](self, "movieFineSubjectMotionResultsAtIndex:", i6);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieFineSubjectMotionResults:", v68);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieInterestingnessResultsCount](self, "movieInterestingnessResultsCount"))
  {
    objc_msgSend(v301, "clearMovieInterestingnessResults");
    v69 = -[VCPProtoAssetAnalysis movieInterestingnessResultsCount](self, "movieInterestingnessResultsCount");
    if (v69)
    {
      v70 = v69;
      for (i7 = 0; i7 != v70; ++i7)
      {
        -[VCPProtoAssetAnalysis movieInterestingnessResultsAtIndex:](self, "movieInterestingnessResultsAtIndex:", i7);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieInterestingnessResults:", v72);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieMovingObjectResultsCount](self, "movieMovingObjectResultsCount"))
  {
    objc_msgSend(v301, "clearMovieMovingObjectResults");
    v73 = -[VCPProtoAssetAnalysis movieMovingObjectResultsCount](self, "movieMovingObjectResultsCount");
    if (v73)
    {
      v74 = v73;
      for (i8 = 0; i8 != v74; ++i8)
      {
        -[VCPProtoAssetAnalysis movieMovingObjectResultsAtIndex:](self, "movieMovingObjectResultsAtIndex:", i8);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieMovingObjectResults:", v76);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieMusicResultsCount](self, "movieMusicResultsCount"))
  {
    objc_msgSend(v301, "clearMovieMusicResults");
    v77 = -[VCPProtoAssetAnalysis movieMusicResultsCount](self, "movieMusicResultsCount");
    if (v77)
    {
      v78 = v77;
      for (i9 = 0; i9 != v78; ++i9)
      {
        -[VCPProtoAssetAnalysis movieMusicResultsAtIndex:](self, "movieMusicResultsAtIndex:", i9);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieMusicResults:", v80);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieObstructionResultsCount](self, "movieObstructionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieObstructionResults");
    v81 = -[VCPProtoAssetAnalysis movieObstructionResultsCount](self, "movieObstructionResultsCount");
    if (v81)
    {
      v82 = v81;
      for (i10 = 0; i10 != v82; ++i10)
      {
        -[VCPProtoAssetAnalysis movieObstructionResultsAtIndex:](self, "movieObstructionResultsAtIndex:", i10);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieObstructionResults:", v84);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieOrientationResultsCount](self, "movieOrientationResultsCount"))
  {
    objc_msgSend(v301, "clearMovieOrientationResults");
    v85 = -[VCPProtoAssetAnalysis movieOrientationResultsCount](self, "movieOrientationResultsCount");
    if (v85)
    {
      v86 = v85;
      for (i11 = 0; i11 != v86; ++i11)
      {
        -[VCPProtoAssetAnalysis movieOrientationResultsAtIndex:](self, "movieOrientationResultsAtIndex:", i11);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieOrientationResults:", v88);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis moviePreEncodeResultsCount](self, "moviePreEncodeResultsCount"))
  {
    objc_msgSend(v301, "clearMoviePreEncodeResults");
    v89 = -[VCPProtoAssetAnalysis moviePreEncodeResultsCount](self, "moviePreEncodeResultsCount");
    if (v89)
    {
      v90 = v89;
      for (i12 = 0; i12 != v90; ++i12)
      {
        -[VCPProtoAssetAnalysis moviePreEncodeResultsAtIndex:](self, "moviePreEncodeResultsAtIndex:", i12);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMoviePreEncodeResults:", v92);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieQualityResultsCount](self, "movieQualityResultsCount"))
  {
    objc_msgSend(v301, "clearMovieQualityResults");
    v93 = -[VCPProtoAssetAnalysis movieQualityResultsCount](self, "movieQualityResultsCount");
    if (v93)
    {
      v94 = v93;
      for (i13 = 0; i13 != v94; ++i13)
      {
        -[VCPProtoAssetAnalysis movieQualityResultsAtIndex:](self, "movieQualityResultsAtIndex:", i13);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieQualityResults:", v96);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSaliencyResultsCount](self, "movieSaliencyResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSaliencyResults");
    v97 = -[VCPProtoAssetAnalysis movieSaliencyResultsCount](self, "movieSaliencyResultsCount");
    if (v97)
    {
      v98 = v97;
      for (i14 = 0; i14 != v98; ++i14)
      {
        -[VCPProtoAssetAnalysis movieSaliencyResultsAtIndex:](self, "movieSaliencyResultsAtIndex:", i14);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSaliencyResults:", v100);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSceneResultsCount](self, "movieSceneResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSceneResults");
    v101 = -[VCPProtoAssetAnalysis movieSceneResultsCount](self, "movieSceneResultsCount");
    if (v101)
    {
      v102 = v101;
      for (i15 = 0; i15 != v102; ++i15)
      {
        -[VCPProtoAssetAnalysis movieSceneResultsAtIndex:](self, "movieSceneResultsAtIndex:", i15);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSceneResults:", v104);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSubjectMotionResultsCount](self, "movieSubjectMotionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSubjectMotionResults");
    v105 = -[VCPProtoAssetAnalysis movieSubjectMotionResultsCount](self, "movieSubjectMotionResultsCount");
    if (v105)
    {
      v106 = v105;
      for (i16 = 0; i16 != v106; ++i16)
      {
        -[VCPProtoAssetAnalysis movieSubjectMotionResultsAtIndex:](self, "movieSubjectMotionResultsAtIndex:", i16);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSubjectMotionResults:", v108);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieUtteranceResultsCount](self, "movieUtteranceResultsCount"))
  {
    objc_msgSend(v301, "clearMovieUtteranceResults");
    v109 = -[VCPProtoAssetAnalysis movieUtteranceResultsCount](self, "movieUtteranceResultsCount");
    if (v109)
    {
      v110 = v109;
      for (i17 = 0; i17 != v110; ++i17)
      {
        -[VCPProtoAssetAnalysis movieUtteranceResultsAtIndex:](self, "movieUtteranceResultsAtIndex:", i17);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieUtteranceResults:", v112);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieVoiceResultsCount](self, "movieVoiceResultsCount"))
  {
    objc_msgSend(v301, "clearMovieVoiceResults");
    v113 = -[VCPProtoAssetAnalysis movieVoiceResultsCount](self, "movieVoiceResultsCount");
    if (v113)
    {
      v114 = v113;
      for (i18 = 0; i18 != v114; ++i18)
      {
        -[VCPProtoAssetAnalysis movieVoiceResultsAtIndex:](self, "movieVoiceResultsAtIndex:", i18);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieVoiceResults:", v116);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imagePetsResultsCount](self, "imagePetsResultsCount"))
  {
    objc_msgSend(v301, "clearImagePetsResults");
    v117 = -[VCPProtoAssetAnalysis imagePetsResultsCount](self, "imagePetsResultsCount");
    if (v117)
    {
      v118 = v117;
      for (i19 = 0; i19 != v118; ++i19)
      {
        -[VCPProtoAssetAnalysis imagePetsResultsAtIndex:](self, "imagePetsResultsAtIndex:", i19);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImagePetsResults:", v120);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSummaryResultsCount](self, "movieSummaryResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSummaryResults");
    v121 = -[VCPProtoAssetAnalysis movieSummaryResultsCount](self, "movieSummaryResultsCount");
    if (v121)
    {
      v122 = v121;
      for (i20 = 0; i20 != v122; ++i20)
      {
        -[VCPProtoAssetAnalysis movieSummaryResultsAtIndex:](self, "movieSummaryResultsAtIndex:", i20);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSummaryResults:", v124);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieHighlightResultsCount](self, "movieHighlightResultsCount"))
  {
    objc_msgSend(v301, "clearMovieHighlightResults");
    v125 = -[VCPProtoAssetAnalysis movieHighlightResultsCount](self, "movieHighlightResultsCount");
    if (v125)
    {
      v126 = v125;
      for (i21 = 0; i21 != v126; ++i21)
      {
        -[VCPProtoAssetAnalysis movieHighlightResultsAtIndex:](self, "movieHighlightResultsAtIndex:", i21);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieHighlightResults:", v128);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageExposureResultsCount](self, "imageExposureResultsCount"))
  {
    objc_msgSend(v301, "clearImageExposureResults");
    v129 = -[VCPProtoAssetAnalysis imageExposureResultsCount](self, "imageExposureResultsCount");
    if (v129)
    {
      v130 = v129;
      for (i22 = 0; i22 != v130; ++i22)
      {
        -[VCPProtoAssetAnalysis imageExposureResultsAtIndex:](self, "imageExposureResultsAtIndex:", i22);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageExposureResults:", v132);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoEffectsResultsCount](self, "livePhotoEffectsResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoEffectsResults");
    v133 = -[VCPProtoAssetAnalysis livePhotoEffectsResultsCount](self, "livePhotoEffectsResultsCount");
    if (v133)
    {
      v134 = v133;
      for (i23 = 0; i23 != v134; ++i23)
      {
        -[VCPProtoAssetAnalysis livePhotoEffectsResultsAtIndex:](self, "livePhotoEffectsResultsAtIndex:", i23);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoEffectsResults:", v136);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v301[4] = self->_statsFlags;
    *((_BYTE *)v301 + 688) |= 2u;
  }
  if (-[VCPProtoAssetAnalysis imagePetsFaceResultsCount](self, "imagePetsFaceResultsCount"))
  {
    objc_msgSend(v301, "clearImagePetsFaceResults");
    v137 = -[VCPProtoAssetAnalysis imagePetsFaceResultsCount](self, "imagePetsFaceResultsCount");
    if (v137)
    {
      v138 = v137;
      for (i24 = 0; i24 != v138; ++i24)
      {
        -[VCPProtoAssetAnalysis imagePetsFaceResultsAtIndex:](self, "imagePetsFaceResultsAtIndex:", i24);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImagePetsFaceResults:", v140);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageSceneprintResultsCount](self, "imageSceneprintResultsCount"))
  {
    objc_msgSend(v301, "clearImageSceneprintResults");
    v141 = -[VCPProtoAssetAnalysis imageSceneprintResultsCount](self, "imageSceneprintResultsCount");
    if (v141)
    {
      v142 = v141;
      for (i25 = 0; i25 != v142; ++i25)
      {
        -[VCPProtoAssetAnalysis imageSceneprintResultsAtIndex:](self, "imageSceneprintResultsAtIndex:", i25);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageSceneprintResults:", v144);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSceneprintResultsCount](self, "movieSceneprintResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSceneprintResults");
    v145 = -[VCPProtoAssetAnalysis movieSceneprintResultsCount](self, "movieSceneprintResultsCount");
    if (v145)
    {
      v146 = v145;
      for (i26 = 0; i26 != v146; ++i26)
      {
        -[VCPProtoAssetAnalysis movieSceneprintResultsAtIndex:](self, "movieSceneprintResultsAtIndex:", i26);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSceneprintResults:", v148);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageHumanPoseResultsCount](self, "imageHumanPoseResultsCount"))
  {
    objc_msgSend(v301, "clearImageHumanPoseResults");
    v149 = -[VCPProtoAssetAnalysis imageHumanPoseResultsCount](self, "imageHumanPoseResultsCount");
    if (v149)
    {
      v150 = v149;
      for (i27 = 0; i27 != v150; ++i27)
      {
        -[VCPProtoAssetAnalysis imageHumanPoseResultsAtIndex:](self, "imageHumanPoseResultsAtIndex:", i27);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageHumanPoseResults:", v152);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieHumanPoseResultsCount](self, "movieHumanPoseResultsCount"))
  {
    objc_msgSend(v301, "clearMovieHumanPoseResults");
    v153 = -[VCPProtoAssetAnalysis movieHumanPoseResultsCount](self, "movieHumanPoseResultsCount");
    if (v153)
    {
      v154 = v153;
      for (i28 = 0; i28 != v154; ++i28)
      {
        -[VCPProtoAssetAnalysis movieHumanPoseResultsAtIndex:](self, "movieHumanPoseResultsAtIndex:", i28);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieHumanPoseResults:", v156);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieApplauseResultsCount](self, "movieApplauseResultsCount"))
  {
    objc_msgSend(v301, "clearMovieApplauseResults");
    v157 = -[VCPProtoAssetAnalysis movieApplauseResultsCount](self, "movieApplauseResultsCount");
    if (v157)
    {
      v158 = v157;
      for (i29 = 0; i29 != v158; ++i29)
      {
        -[VCPProtoAssetAnalysis movieApplauseResultsAtIndex:](self, "movieApplauseResultsAtIndex:", i29);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieApplauseResults:", v160);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieBabbleResultsCount](self, "movieBabbleResultsCount"))
  {
    objc_msgSend(v301, "clearMovieBabbleResults");
    v161 = -[VCPProtoAssetAnalysis movieBabbleResultsCount](self, "movieBabbleResultsCount");
    if (v161)
    {
      v162 = v161;
      for (i30 = 0; i30 != v162; ++i30)
      {
        -[VCPProtoAssetAnalysis movieBabbleResultsAtIndex:](self, "movieBabbleResultsAtIndex:", i30);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieBabbleResults:", v164);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieCheeringResultsCount](self, "movieCheeringResultsCount"))
  {
    objc_msgSend(v301, "clearMovieCheeringResults");
    v165 = -[VCPProtoAssetAnalysis movieCheeringResultsCount](self, "movieCheeringResultsCount");
    if (v165)
    {
      v166 = v165;
      for (i31 = 0; i31 != v166; ++i31)
      {
        -[VCPProtoAssetAnalysis movieCheeringResultsAtIndex:](self, "movieCheeringResultsAtIndex:", i31);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieCheeringResults:", v168);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieLaughterResultsCount](self, "movieLaughterResultsCount"))
  {
    objc_msgSend(v301, "clearMovieLaughterResults");
    v169 = -[VCPProtoAssetAnalysis movieLaughterResultsCount](self, "movieLaughterResultsCount");
    if (v169)
    {
      v170 = v169;
      for (i32 = 0; i32 != v170; ++i32)
      {
        -[VCPProtoAssetAnalysis movieLaughterResultsAtIndex:](self, "movieLaughterResultsAtIndex:", i32);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieLaughterResults:", v172);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoKeyFrameResultsCount](self, "livePhotoKeyFrameResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoKeyFrameResults");
    v173 = -[VCPProtoAssetAnalysis livePhotoKeyFrameResultsCount](self, "livePhotoKeyFrameResultsCount");
    if (v173)
    {
      v174 = v173;
      for (i33 = 0; i33 != v174; ++i33)
      {
        -[VCPProtoAssetAnalysis livePhotoKeyFrameResultsAtIndex:](self, "livePhotoKeyFrameResultsAtIndex:", i33);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoKeyFrameResults:", v176);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoKeyFrameStillResultsCount](self, "livePhotoKeyFrameStillResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoKeyFrameStillResults");
    v177 = -[VCPProtoAssetAnalysis livePhotoKeyFrameStillResultsCount](self, "livePhotoKeyFrameStillResultsCount");
    if (v177)
    {
      v178 = v177;
      for (i34 = 0; i34 != v178; ++i34)
      {
        -[VCPProtoAssetAnalysis livePhotoKeyFrameStillResultsAtIndex:](self, "livePhotoKeyFrameStillResultsAtIndex:", i34);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoKeyFrameStillResults:", v180);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieHumanActionResultsCount](self, "movieHumanActionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieHumanActionResults");
    v181 = -[VCPProtoAssetAnalysis movieHumanActionResultsCount](self, "movieHumanActionResultsCount");
    if (v181)
    {
      v182 = v181;
      for (i35 = 0; i35 != v182; ++i35)
      {
        -[VCPProtoAssetAnalysis movieHumanActionResultsAtIndex:](self, "movieHumanActionResultsAtIndex:", i35);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieHumanActionResults:", v184);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSubtleMotionResultsCount](self, "movieSubtleMotionResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSubtleMotionResults");
    v185 = -[VCPProtoAssetAnalysis movieSubtleMotionResultsCount](self, "movieSubtleMotionResultsCount");
    if (v185)
    {
      v186 = v185;
      for (i36 = 0; i36 != v186; ++i36)
      {
        -[VCPProtoAssetAnalysis movieSubtleMotionResultsAtIndex:](self, "movieSubtleMotionResultsAtIndex:", i36);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSubtleMotionResults:", v188);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieLoudnessResultsCount](self, "movieLoudnessResultsCount"))
  {
    objc_msgSend(v301, "clearMovieLoudnessResults");
    v189 = -[VCPProtoAssetAnalysis movieLoudnessResultsCount](self, "movieLoudnessResultsCount");
    if (v189)
    {
      v190 = v189;
      for (i37 = 0; i37 != v190; ++i37)
      {
        -[VCPProtoAssetAnalysis movieLoudnessResultsAtIndex:](self, "movieLoudnessResultsAtIndex:", i37);
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieLoudnessResults:", v192);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis moviePetsResultsCount](self, "moviePetsResultsCount"))
  {
    objc_msgSend(v301, "clearMoviePetsResults");
    v193 = -[VCPProtoAssetAnalysis moviePetsResultsCount](self, "moviePetsResultsCount");
    if (v193)
    {
      v194 = v193;
      for (i38 = 0; i38 != v194; ++i38)
      {
        -[VCPProtoAssetAnalysis moviePetsResultsAtIndex:](self, "moviePetsResultsAtIndex:", i38);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMoviePetsResults:", v196);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis moviePetsFaceResultsCount](self, "moviePetsFaceResultsCount"))
  {
    objc_msgSend(v301, "clearMoviePetsFaceResults");
    v197 = -[VCPProtoAssetAnalysis moviePetsFaceResultsCount](self, "moviePetsFaceResultsCount");
    if (v197)
    {
      v198 = v197;
      for (i39 = 0; i39 != v198; ++i39)
      {
        -[VCPProtoAssetAnalysis moviePetsFaceResultsAtIndex:](self, "moviePetsFaceResultsAtIndex:", i39);
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMoviePetsFaceResults:", v200);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieStabilizationResultsCount](self, "movieStabilizationResultsCount"))
  {
    objc_msgSend(v301, "clearMovieStabilizationResults");
    v201 = -[VCPProtoAssetAnalysis movieStabilizationResultsCount](self, "movieStabilizationResultsCount");
    if (v201)
    {
      v202 = v201;
      for (i40 = 0; i40 != v202; ++i40)
      {
        -[VCPProtoAssetAnalysis movieStabilizationResultsAtIndex:](self, "movieStabilizationResultsAtIndex:", i40);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieStabilizationResults:", v204);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v301[5] = self->_typesWide;
    *((_BYTE *)v301 + 688) |= 4u;
  }
  if (-[VCPProtoAssetAnalysis movieHighlightScoreResultsCount](self, "movieHighlightScoreResultsCount"))
  {
    objc_msgSend(v301, "clearMovieHighlightScoreResults");
    v205 = -[VCPProtoAssetAnalysis movieHighlightScoreResultsCount](self, "movieHighlightScoreResultsCount");
    if (v205)
    {
      v206 = v205;
      for (i41 = 0; i41 != v206; ++i41)
      {
        -[VCPProtoAssetAnalysis movieHighlightScoreResultsAtIndex:](self, "movieHighlightScoreResultsAtIndex:", i41);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieHighlightScoreResults:", v208);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoHumanActionClassificationResultsCount](self, "livePhotoHumanActionClassificationResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoHumanActionClassificationResults");
    v209 = -[VCPProtoAssetAnalysis livePhotoHumanActionClassificationResultsCount](self, "livePhotoHumanActionClassificationResultsCount");
    if (v209)
    {
      v210 = v209;
      for (i42 = 0; i42 != v210; ++i42)
      {
        -[VCPProtoAssetAnalysis livePhotoHumanActionClassificationResultsAtIndex:](self, "livePhotoHumanActionClassificationResultsAtIndex:", i42);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoHumanActionClassificationResults:", v212);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieAudioQualityResultsCount](self, "movieAudioQualityResultsCount"))
  {
    objc_msgSend(v301, "clearMovieAudioQualityResults");
    v213 = -[VCPProtoAssetAnalysis movieAudioQualityResultsCount](self, "movieAudioQualityResultsCount");
    if (v213)
    {
      v214 = v213;
      for (i43 = 0; i43 != v214; ++i43)
      {
        -[VCPProtoAssetAnalysis movieAudioQualityResultsAtIndex:](self, "movieAudioQualityResultsAtIndex:", i43);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieAudioQualityResults:", v216);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieSafetyResultsCount](self, "movieSafetyResultsCount"))
  {
    objc_msgSend(v301, "clearMovieSafetyResults");
    v217 = -[VCPProtoAssetAnalysis movieSafetyResultsCount](self, "movieSafetyResultsCount");
    if (v217)
    {
      v218 = v217;
      for (i44 = 0; i44 != v218; ++i44)
      {
        -[VCPProtoAssetAnalysis movieSafetyResultsAtIndex:](self, "movieSafetyResultsAtIndex:", i44);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieSafetyResults:", v220);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieClassificationResultsCount](self, "filesystemMovieClassificationResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieClassificationResults");
    v221 = -[VCPProtoAssetAnalysis filesystemMovieClassificationResultsCount](self, "filesystemMovieClassificationResultsCount");
    if (v221)
    {
      v222 = v221;
      for (i45 = 0; i45 != v222; ++i45)
      {
        -[VCPProtoAssetAnalysis filesystemMovieClassificationResultsAtIndex:](self, "filesystemMovieClassificationResultsAtIndex:", i45);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieClassificationResults:", v224);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieHumanActionClassificationResultsCount](self, "filesystemMovieHumanActionClassificationResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieHumanActionClassificationResults");
    v225 = -[VCPProtoAssetAnalysis filesystemMovieHumanActionClassificationResultsCount](self, "filesystemMovieHumanActionClassificationResultsCount");
    if (v225)
    {
      v226 = v225;
      for (i46 = 0; i46 != v226; ++i46)
      {
        -[VCPProtoAssetAnalysis filesystemMovieHumanActionClassificationResultsAtIndex:](self, "filesystemMovieHumanActionClassificationResultsAtIndex:", i46);
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieHumanActionClassificationResults:", v228);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieApplauseResultsCount](self, "filesystemMovieApplauseResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieApplauseResults");
    v229 = -[VCPProtoAssetAnalysis filesystemMovieApplauseResultsCount](self, "filesystemMovieApplauseResultsCount");
    if (v229)
    {
      v230 = v229;
      for (i47 = 0; i47 != v230; ++i47)
      {
        -[VCPProtoAssetAnalysis filesystemMovieApplauseResultsAtIndex:](self, "filesystemMovieApplauseResultsAtIndex:", i47);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieApplauseResults:", v232);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieBabbleResultsCount](self, "filesystemMovieBabbleResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieBabbleResults");
    v233 = -[VCPProtoAssetAnalysis filesystemMovieBabbleResultsCount](self, "filesystemMovieBabbleResultsCount");
    if (v233)
    {
      v234 = v233;
      for (i48 = 0; i48 != v234; ++i48)
      {
        -[VCPProtoAssetAnalysis filesystemMovieBabbleResultsAtIndex:](self, "filesystemMovieBabbleResultsAtIndex:", i48);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieBabbleResults:", v236);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieCheeringResultsCount](self, "filesystemMovieCheeringResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieCheeringResults");
    v237 = -[VCPProtoAssetAnalysis filesystemMovieCheeringResultsCount](self, "filesystemMovieCheeringResultsCount");
    if (v237)
    {
      v238 = v237;
      for (i49 = 0; i49 != v238; ++i49)
      {
        -[VCPProtoAssetAnalysis filesystemMovieCheeringResultsAtIndex:](self, "filesystemMovieCheeringResultsAtIndex:", i49);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieCheeringResults:", v240);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieLaughterResultsCount](self, "filesystemMovieLaughterResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieLaughterResults");
    v241 = -[VCPProtoAssetAnalysis filesystemMovieLaughterResultsCount](self, "filesystemMovieLaughterResultsCount");
    if (v241)
    {
      v242 = v241;
      for (i50 = 0; i50 != v242; ++i50)
      {
        -[VCPProtoAssetAnalysis filesystemMovieLaughterResultsAtIndex:](self, "filesystemMovieLaughterResultsAtIndex:", i50);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieLaughterResults:", v244);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieMusicResultsCount](self, "filesystemMovieMusicResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieMusicResults");
    v245 = -[VCPProtoAssetAnalysis filesystemMovieMusicResultsCount](self, "filesystemMovieMusicResultsCount");
    if (v245)
    {
      v246 = v245;
      for (i51 = 0; i51 != v246; ++i51)
      {
        -[VCPProtoAssetAnalysis filesystemMovieMusicResultsAtIndex:](self, "filesystemMovieMusicResultsAtIndex:", i51);
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieMusicResults:", v248);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis filesystemMovieVoiceResultsCount](self, "filesystemMovieVoiceResultsCount"))
  {
    objc_msgSend(v301, "clearFilesystemMovieVoiceResults");
    v249 = -[VCPProtoAssetAnalysis filesystemMovieVoiceResultsCount](self, "filesystemMovieVoiceResultsCount");
    if (v249)
    {
      v250 = v249;
      for (i52 = 0; i52 != v250; ++i52)
      {
        -[VCPProtoAssetAnalysis filesystemMovieVoiceResultsAtIndex:](self, "filesystemMovieVoiceResultsAtIndex:", i52);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addFilesystemMovieVoiceResults:", v252);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis animatedStickerResultsCount](self, "animatedStickerResultsCount"))
  {
    objc_msgSend(v301, "clearAnimatedStickerResults");
    v253 = -[VCPProtoAssetAnalysis animatedStickerResultsCount](self, "animatedStickerResultsCount");
    if (v253)
    {
      v254 = v253;
      for (i53 = 0; i53 != v254; ++i53)
      {
        -[VCPProtoAssetAnalysis animatedStickerResultsAtIndex:](self, "animatedStickerResultsAtIndex:", i53);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addAnimatedStickerResults:", v256);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis livePhotoSettlingEffectGatingResultsCount](self, "livePhotoSettlingEffectGatingResultsCount"))
  {
    objc_msgSend(v301, "clearLivePhotoSettlingEffectGatingResults");
    v257 = -[VCPProtoAssetAnalysis livePhotoSettlingEffectGatingResultsCount](self, "livePhotoSettlingEffectGatingResultsCount");
    if (v257)
    {
      v258 = v257;
      for (i54 = 0; i54 != v258; ++i54)
      {
        -[VCPProtoAssetAnalysis livePhotoSettlingEffectGatingResultsAtIndex:](self, "livePhotoSettlingEffectGatingResultsAtIndex:", i54);
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addLivePhotoSettlingEffectGatingResults:", v260);

      }
    }
  }
  if (self->_assetCloudIdentifier)
    objc_msgSend(v301, "setAssetCloudIdentifier:");
  if (-[VCPProtoAssetAnalysis movieTorsoResultsCount](self, "movieTorsoResultsCount"))
  {
    objc_msgSend(v301, "clearMovieTorsoResults");
    v261 = -[VCPProtoAssetAnalysis movieTorsoResultsCount](self, "movieTorsoResultsCount");
    if (v261)
    {
      v262 = v261;
      for (i55 = 0; i55 != v262; ++i55)
      {
        -[VCPProtoAssetAnalysis movieTorsoResultsAtIndex:](self, "movieTorsoResultsAtIndex:", i55);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieTorsoResults:", v264);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis movieHumanActionClassificationResultsCount](self, "movieHumanActionClassificationResultsCount"))
  {
    objc_msgSend(v301, "clearMovieHumanActionClassificationResults");
    v265 = -[VCPProtoAssetAnalysis movieHumanActionClassificationResultsCount](self, "movieHumanActionClassificationResultsCount");
    if (v265)
    {
      v266 = v265;
      for (i56 = 0; i56 != v266; ++i56)
      {
        -[VCPProtoAssetAnalysis movieHumanActionClassificationResultsAtIndex:](self, "movieHumanActionClassificationResultsAtIndex:", i56);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addMovieHumanActionClassificationResults:", v268);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis videoEmbeddingResultsCount](self, "videoEmbeddingResultsCount"))
  {
    objc_msgSend(v301, "clearVideoEmbeddingResults");
    v269 = -[VCPProtoAssetAnalysis videoEmbeddingResultsCount](self, "videoEmbeddingResultsCount");
    if (v269)
    {
      v270 = v269;
      for (i57 = 0; i57 != v270; ++i57)
      {
        -[VCPProtoAssetAnalysis videoEmbeddingResultsAtIndex:](self, "videoEmbeddingResultsAtIndex:", i57);
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addVideoEmbeddingResults:", v272);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis summarizedEmbeddingResultsCount](self, "summarizedEmbeddingResultsCount"))
  {
    objc_msgSend(v301, "clearSummarizedEmbeddingResults");
    v273 = -[VCPProtoAssetAnalysis summarizedEmbeddingResultsCount](self, "summarizedEmbeddingResultsCount");
    if (v273)
    {
      v274 = v273;
      for (i58 = 0; i58 != v274; ++i58)
      {
        -[VCPProtoAssetAnalysis summarizedEmbeddingResultsAtIndex:](self, "summarizedEmbeddingResultsAtIndex:", i58);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addSummarizedEmbeddingResults:", v276);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis audioFusedVideoEmbeddingResultsCount](self, "audioFusedVideoEmbeddingResultsCount"))
  {
    objc_msgSend(v301, "clearAudioFusedVideoEmbeddingResults");
    v277 = -[VCPProtoAssetAnalysis audioFusedVideoEmbeddingResultsCount](self, "audioFusedVideoEmbeddingResultsCount");
    if (v277)
    {
      v278 = v277;
      for (i59 = 0; i59 != v278; ++i59)
      {
        -[VCPProtoAssetAnalysis audioFusedVideoEmbeddingResultsAtIndex:](self, "audioFusedVideoEmbeddingResultsAtIndex:", i59);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addAudioFusedVideoEmbeddingResults:", v280);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageEmbeddingResultsCount](self, "imageEmbeddingResultsCount"))
  {
    objc_msgSend(v301, "clearImageEmbeddingResults");
    v281 = -[VCPProtoAssetAnalysis imageEmbeddingResultsCount](self, "imageEmbeddingResultsCount");
    if (v281)
    {
      v282 = v281;
      for (i60 = 0; i60 != v282; ++i60)
      {
        -[VCPProtoAssetAnalysis imageEmbeddingResultsAtIndex:](self, "imageEmbeddingResultsAtIndex:", i60);
        v284 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageEmbeddingResults:", v284);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis imageCaptionResultsCount](self, "imageCaptionResultsCount"))
  {
    objc_msgSend(v301, "clearImageCaptionResults");
    v285 = -[VCPProtoAssetAnalysis imageCaptionResultsCount](self, "imageCaptionResultsCount");
    if (v285)
    {
      v286 = v285;
      for (i61 = 0; i61 != v286; ++i61)
      {
        -[VCPProtoAssetAnalysis imageCaptionResultsAtIndex:](self, "imageCaptionResultsAtIndex:", i61);
        v288 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addImageCaptionResults:", v288);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis videoCaptionResultsCount](self, "videoCaptionResultsCount"))
  {
    objc_msgSend(v301, "clearVideoCaptionResults");
    v289 = -[VCPProtoAssetAnalysis videoCaptionResultsCount](self, "videoCaptionResultsCount");
    if (v289)
    {
      v290 = v289;
      for (i62 = 0; i62 != v290; ++i62)
      {
        -[VCPProtoAssetAnalysis videoCaptionResultsAtIndex:](self, "videoCaptionResultsAtIndex:", i62);
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addVideoCaptionResults:", v292);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis videoCaptionPreferenceResultsCount](self, "videoCaptionPreferenceResultsCount"))
  {
    objc_msgSend(v301, "clearVideoCaptionPreferenceResults");
    v293 = -[VCPProtoAssetAnalysis videoCaptionPreferenceResultsCount](self, "videoCaptionPreferenceResultsCount");
    if (v293)
    {
      v294 = v293;
      for (i63 = 0; i63 != v294; ++i63)
      {
        -[VCPProtoAssetAnalysis videoCaptionPreferenceResultsAtIndex:](self, "videoCaptionPreferenceResultsAtIndex:", i63);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addVideoCaptionPreferenceResults:", v296);

      }
    }
  }
  if (-[VCPProtoAssetAnalysis videoSegmentCaptionResultsCount](self, "videoSegmentCaptionResultsCount"))
  {
    objc_msgSend(v301, "clearVideoSegmentCaptionResults");
    v297 = -[VCPProtoAssetAnalysis videoSegmentCaptionResultsCount](self, "videoSegmentCaptionResultsCount");
    if (v297)
    {
      v298 = v297;
      for (i64 = 0; i64 != v298; ++i64)
      {
        -[VCPProtoAssetAnalysis videoSegmentCaptionResultsAtIndex:](self, "videoSegmentCaptionResultsAtIndex:", i64);
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v301, "addVideoSegmentCaptionResults:", v300);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSMutableArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSMutableArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  NSMutableArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSMutableArray *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  NSMutableArray *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  NSMutableArray *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  NSMutableArray *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  NSMutableArray *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  NSMutableArray *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  NSMutableArray *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  NSMutableArray *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  NSMutableArray *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  NSMutableArray *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  NSMutableArray *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  NSMutableArray *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  NSMutableArray *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  NSMutableArray *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  NSMutableArray *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  NSMutableArray *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  NSMutableArray *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  NSMutableArray *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  NSMutableArray *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  NSMutableArray *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  NSMutableArray *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  NSMutableArray *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  NSMutableArray *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  NSMutableArray *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  NSMutableArray *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  NSMutableArray *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  NSMutableArray *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  NSMutableArray *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  NSMutableArray *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  NSMutableArray *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  NSMutableArray *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  NSMutableArray *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  NSMutableArray *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  NSMutableArray *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  NSMutableArray *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  NSMutableArray *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  NSMutableArray *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  NSMutableArray *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  NSMutableArray *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  NSMutableArray *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  NSMutableArray *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  NSMutableArray *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  NSMutableArray *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  NSMutableArray *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  NSMutableArray *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  NSMutableArray *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  NSMutableArray *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  NSMutableArray *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  void *v384;
  NSMutableArray *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  NSMutableArray *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  uint64_t v397;
  void *v398;
  NSMutableArray *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  NSMutableArray *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  NSMutableArray *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  NSMutableArray *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  void *v422;
  NSMutableArray *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  NSMutableArray *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  NSMutableArray *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  NSMutableArray *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  NSMutableArray *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  void *v452;
  NSMutableArray *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  id v459;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  __int128 v683;
  __int128 v684;
  __int128 v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  __int128 v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  __int128 v746;
  __int128 v747;
  __int128 v748;
  __int128 v749;
  __int128 v750;
  __int128 v751;
  __int128 v752;
  __int128 v753;
  __int128 v754;
  __int128 v755;
  __int128 v756;
  _BYTE v757[128];
  _BYTE v758[128];
  _BYTE v759[128];
  _BYTE v760[128];
  _BYTE v761[128];
  _BYTE v762[128];
  _BYTE v763[128];
  _BYTE v764[128];
  _BYTE v765[128];
  _BYTE v766[128];
  _BYTE v767[128];
  _BYTE v768[128];
  _BYTE v769[128];
  _BYTE v770[128];
  _BYTE v771[128];
  _BYTE v772[128];
  _BYTE v773[128];
  _BYTE v774[128];
  _BYTE v775[128];
  _BYTE v776[128];
  _BYTE v777[128];
  _BYTE v778[128];
  _BYTE v779[128];
  _BYTE v780[128];
  _BYTE v781[128];
  _BYTE v782[128];
  _BYTE v783[128];
  _BYTE v784[128];
  _BYTE v785[128];
  _BYTE v786[128];
  _BYTE v787[128];
  _BYTE v788[128];
  _BYTE v789[128];
  _BYTE v790[128];
  _BYTE v791[128];
  _BYTE v792[128];
  _BYTE v793[128];
  _BYTE v794[128];
  _BYTE v795[128];
  _BYTE v796[128];
  _BYTE v797[128];
  _BYTE v798[128];
  _BYTE v799[128];
  _BYTE v800[128];
  _BYTE v801[128];
  _BYTE v802[128];
  _BYTE v803[128];
  _BYTE v804[128];
  _BYTE v805[128];
  _BYTE v806[128];
  _BYTE v807[128];
  _BYTE v808[128];
  _BYTE v809[128];
  _BYTE v810[128];
  _BYTE v811[128];
  _BYTE v812[128];
  _BYTE v813[128];
  _BYTE v814[128];
  _BYTE v815[128];
  _BYTE v816[128];
  _BYTE v817[128];
  _BYTE v818[128];
  _BYTE v819[128];
  _BYTE v820[128];
  _BYTE v821[128];
  _BYTE v822[128];
  _BYTE v823[128];
  _BYTE v824[128];
  _BYTE v825[128];
  _BYTE v826[128];
  _BYTE v827[128];
  _BYTE v828[128];
  _BYTE v829[128];
  _BYTE v830[128];
  uint64_t v831;

  v831 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  *(_DWORD *)(v5 + 652) = self->_version;
  *(_DWORD *)(v5 + 648) = self->_types;
  *(_DWORD *)(v5 + 160) = self->_flags;
  *(double *)(v5 + 16) = self->_date;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_quality;
    *(_BYTE *)(v5 + 688) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_assetIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v7;

  *(double *)(v6 + 8) = self->_assetModificationDate;
  v9 = -[NSString copyWithZone:](self->_assetMasterFingerprint, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_assetAdjustedFingerprint, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v11;

  v756 = 0u;
  v755 = 0u;
  v754 = 0u;
  v753 = 0u;
  v13 = self->_imageBlurResults;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v753, v830, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v754;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v754 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v753 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageBlurResults:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v753, v830, 16);
    }
    while (v15);
  }

  v752 = 0u;
  v751 = 0u;
  v750 = 0u;
  v749 = 0u;
  v19 = self->_imageCompositionResults;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v749, v829, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v750;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v750 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v749 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageCompositionResults:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v749, v829, 16);
    }
    while (v21);
  }

  v748 = 0u;
  v747 = 0u;
  v746 = 0u;
  v745 = 0u;
  v25 = self->_imageFaceResults;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v745, v828, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v746;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v746 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v745 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageFaceResults:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v745, v828, 16);
    }
    while (v27);
  }

  v744 = 0u;
  v743 = 0u;
  v742 = 0u;
  v741 = 0u;
  v31 = self->_imageFeatureResults;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v741, v827, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v742;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v742 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v741 + 1) + 8 * v35), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageFeatureResults:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v741, v827, 16);
    }
    while (v33);
  }

  v740 = 0u;
  v739 = 0u;
  v738 = 0u;
  v737 = 0u;
  v37 = self->_imageJunkResults;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v737, v826, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v738;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v738 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v737 + 1) + 8 * v41), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageJunkResults:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v737, v826, 16);
    }
    while (v39);
  }

  v736 = 0u;
  v735 = 0u;
  v734 = 0u;
  v733 = 0u;
  v43 = self->_imageSaliencyResults;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v733, v825, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v734;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v734 != v46)
          objc_enumerationMutation(v43);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v733 + 1) + 8 * v47), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageSaliencyResults:", v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v733, v825, 16);
    }
    while (v45);
  }

  v732 = 0u;
  v731 = 0u;
  v730 = 0u;
  v729 = 0u;
  v49 = self->_imageShotTypeResults;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v729, v824, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v730;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v730 != v52)
          objc_enumerationMutation(v49);
        v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v729 + 1) + 8 * v53), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageShotTypeResults:", v54);

        ++v53;
      }
      while (v51 != v53);
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v729, v824, 16);
    }
    while (v51);
  }

  v728 = 0u;
  v727 = 0u;
  v726 = 0u;
  v725 = 0u;
  v55 = self->_livePhotoRecommendationResults;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v725, v823, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v726;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v726 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v725 + 1) + 8 * v59), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoRecommendationResults:", v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v725, v823, 16);
    }
    while (v57);
  }

  v724 = 0u;
  v723 = 0u;
  v722 = 0u;
  v721 = 0u;
  v61 = self->_livePhotoSharpnessResults;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v721, v822, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v722;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v722 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v721 + 1) + 8 * v65), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoSharpnessResults:", v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v721, v822, 16);
    }
    while (v63);
  }

  v720 = 0u;
  v719 = 0u;
  v718 = 0u;
  v717 = 0u;
  v67 = self->_movieActivityLevelResults;
  v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v717, v821, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v718;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v718 != v70)
          objc_enumerationMutation(v67);
        v72 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v717 + 1) + 8 * v71), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieActivityLevelResults:", v72);

        ++v71;
      }
      while (v69 != v71);
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v717, v821, 16);
    }
    while (v69);
  }

  v716 = 0u;
  v715 = 0u;
  v714 = 0u;
  v713 = 0u;
  v73 = self->_movieCameraMotionResults;
  v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v713, v820, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v714;
    do
    {
      v77 = 0;
      do
      {
        if (*(_QWORD *)v714 != v76)
          objc_enumerationMutation(v73);
        v78 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v713 + 1) + 8 * v77), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieCameraMotionResults:", v78);

        ++v77;
      }
      while (v75 != v77);
      v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v713, v820, 16);
    }
    while (v75);
  }

  v712 = 0u;
  v711 = 0u;
  v710 = 0u;
  v709 = 0u;
  v79 = self->_movieClassificationResults;
  v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v709, v819, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v710;
    do
    {
      v83 = 0;
      do
      {
        if (*(_QWORD *)v710 != v82)
          objc_enumerationMutation(v79);
        v84 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v709 + 1) + 8 * v83), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieClassificationResults:", v84);

        ++v83;
      }
      while (v81 != v83);
      v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v709, v819, 16);
    }
    while (v81);
  }

  v708 = 0u;
  v707 = 0u;
  v706 = 0u;
  v705 = 0u;
  v85 = self->_movieFaceResults;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v705, v818, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v706;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v706 != v88)
          objc_enumerationMutation(v85);
        v90 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v705 + 1) + 8 * v89), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieFaceResults:", v90);

        ++v89;
      }
      while (v87 != v89);
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v705, v818, 16);
    }
    while (v87);
  }

  v704 = 0u;
  v703 = 0u;
  v702 = 0u;
  v701 = 0u;
  v91 = self->_movieFaceprintResults;
  v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v701, v817, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v702;
    do
    {
      v95 = 0;
      do
      {
        if (*(_QWORD *)v702 != v94)
          objc_enumerationMutation(v91);
        v96 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v701 + 1) + 8 * v95), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieFaceprintResults:", v96);

        ++v95;
      }
      while (v93 != v95);
      v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v701, v817, 16);
    }
    while (v93);
  }

  v700 = 0u;
  v699 = 0u;
  v698 = 0u;
  v697 = 0u;
  v97 = self->_movieFeatureResults;
  v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v697, v816, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v698;
    do
    {
      v101 = 0;
      do
      {
        if (*(_QWORD *)v698 != v100)
          objc_enumerationMutation(v97);
        v102 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v697 + 1) + 8 * v101), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieFeatureResults:", v102);

        ++v101;
      }
      while (v99 != v101);
      v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v697, v816, 16);
    }
    while (v99);
  }

  v696 = 0u;
  v695 = 0u;
  v694 = 0u;
  v693 = 0u;
  v103 = self->_movieFineSubjectMotionResults;
  v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v693, v815, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v694;
    do
    {
      v107 = 0;
      do
      {
        if (*(_QWORD *)v694 != v106)
          objc_enumerationMutation(v103);
        v108 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v693 + 1) + 8 * v107), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieFineSubjectMotionResults:", v108);

        ++v107;
      }
      while (v105 != v107);
      v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v693, v815, 16);
    }
    while (v105);
  }

  v692 = 0u;
  v691 = 0u;
  v690 = 0u;
  v689 = 0u;
  v109 = self->_movieInterestingnessResults;
  v110 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v689, v814, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v690;
    do
    {
      v113 = 0;
      do
      {
        if (*(_QWORD *)v690 != v112)
          objc_enumerationMutation(v109);
        v114 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v689 + 1) + 8 * v113), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieInterestingnessResults:", v114);

        ++v113;
      }
      while (v111 != v113);
      v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v109, "countByEnumeratingWithState:objects:count:", &v689, v814, 16);
    }
    while (v111);
  }

  v688 = 0u;
  v687 = 0u;
  v686 = 0u;
  v685 = 0u;
  v115 = self->_movieMovingObjectResults;
  v116 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v685, v813, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v686;
    do
    {
      v119 = 0;
      do
      {
        if (*(_QWORD *)v686 != v118)
          objc_enumerationMutation(v115);
        v120 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v685 + 1) + 8 * v119), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieMovingObjectResults:", v120);

        ++v119;
      }
      while (v117 != v119);
      v117 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v685, v813, 16);
    }
    while (v117);
  }

  v684 = 0u;
  v683 = 0u;
  v682 = 0u;
  v681 = 0u;
  v121 = self->_movieMusicResults;
  v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v121, "countByEnumeratingWithState:objects:count:", &v681, v812, 16);
  if (v122)
  {
    v123 = v122;
    v124 = *(_QWORD *)v682;
    do
    {
      v125 = 0;
      do
      {
        if (*(_QWORD *)v682 != v124)
          objc_enumerationMutation(v121);
        v126 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v681 + 1) + 8 * v125), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieMusicResults:", v126);

        ++v125;
      }
      while (v123 != v125);
      v123 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v121, "countByEnumeratingWithState:objects:count:", &v681, v812, 16);
    }
    while (v123);
  }

  v680 = 0u;
  v679 = 0u;
  v678 = 0u;
  v677 = 0u;
  v127 = self->_movieObstructionResults;
  v128 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v677, v811, 16);
  if (v128)
  {
    v129 = v128;
    v130 = *(_QWORD *)v678;
    do
    {
      v131 = 0;
      do
      {
        if (*(_QWORD *)v678 != v130)
          objc_enumerationMutation(v127);
        v132 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v677 + 1) + 8 * v131), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieObstructionResults:", v132);

        ++v131;
      }
      while (v129 != v131);
      v129 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v677, v811, 16);
    }
    while (v129);
  }

  v676 = 0u;
  v675 = 0u;
  v674 = 0u;
  v673 = 0u;
  v133 = self->_movieOrientationResults;
  v134 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v673, v810, 16);
  if (v134)
  {
    v135 = v134;
    v136 = *(_QWORD *)v674;
    do
    {
      v137 = 0;
      do
      {
        if (*(_QWORD *)v674 != v136)
          objc_enumerationMutation(v133);
        v138 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v673 + 1) + 8 * v137), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieOrientationResults:", v138);

        ++v137;
      }
      while (v135 != v137);
      v135 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v133, "countByEnumeratingWithState:objects:count:", &v673, v810, 16);
    }
    while (v135);
  }

  v672 = 0u;
  v671 = 0u;
  v670 = 0u;
  v669 = 0u;
  v139 = self->_moviePreEncodeResults;
  v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v139, "countByEnumeratingWithState:objects:count:", &v669, v809, 16);
  if (v140)
  {
    v141 = v140;
    v142 = *(_QWORD *)v670;
    do
    {
      v143 = 0;
      do
      {
        if (*(_QWORD *)v670 != v142)
          objc_enumerationMutation(v139);
        v144 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v669 + 1) + 8 * v143), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMoviePreEncodeResults:", v144);

        ++v143;
      }
      while (v141 != v143);
      v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v139, "countByEnumeratingWithState:objects:count:", &v669, v809, 16);
    }
    while (v141);
  }

  v668 = 0u;
  v667 = 0u;
  v666 = 0u;
  v665 = 0u;
  v145 = self->_movieQualityResults;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v665, v808, 16);
  if (v146)
  {
    v147 = v146;
    v148 = *(_QWORD *)v666;
    do
    {
      v149 = 0;
      do
      {
        if (*(_QWORD *)v666 != v148)
          objc_enumerationMutation(v145);
        v150 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v665 + 1) + 8 * v149), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieQualityResults:", v150);

        ++v149;
      }
      while (v147 != v149);
      v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v665, v808, 16);
    }
    while (v147);
  }

  v664 = 0u;
  v663 = 0u;
  v662 = 0u;
  v661 = 0u;
  v151 = self->_movieSaliencyResults;
  v152 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v661, v807, 16);
  if (v152)
  {
    v153 = v152;
    v154 = *(_QWORD *)v662;
    do
    {
      v155 = 0;
      do
      {
        if (*(_QWORD *)v662 != v154)
          objc_enumerationMutation(v151);
        v156 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v661 + 1) + 8 * v155), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSaliencyResults:", v156);

        ++v155;
      }
      while (v153 != v155);
      v153 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v151, "countByEnumeratingWithState:objects:count:", &v661, v807, 16);
    }
    while (v153);
  }

  v660 = 0u;
  v659 = 0u;
  v658 = 0u;
  v657 = 0u;
  v157 = self->_movieSceneResults;
  v158 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v157, "countByEnumeratingWithState:objects:count:", &v657, v806, 16);
  if (v158)
  {
    v159 = v158;
    v160 = *(_QWORD *)v658;
    do
    {
      v161 = 0;
      do
      {
        if (*(_QWORD *)v658 != v160)
          objc_enumerationMutation(v157);
        v162 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v657 + 1) + 8 * v161), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSceneResults:", v162);

        ++v161;
      }
      while (v159 != v161);
      v159 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v157, "countByEnumeratingWithState:objects:count:", &v657, v806, 16);
    }
    while (v159);
  }

  v656 = 0u;
  v655 = 0u;
  v654 = 0u;
  v653 = 0u;
  v163 = self->_movieSubjectMotionResults;
  v164 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v163, "countByEnumeratingWithState:objects:count:", &v653, v805, 16);
  if (v164)
  {
    v165 = v164;
    v166 = *(_QWORD *)v654;
    do
    {
      v167 = 0;
      do
      {
        if (*(_QWORD *)v654 != v166)
          objc_enumerationMutation(v163);
        v168 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v653 + 1) + 8 * v167), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSubjectMotionResults:", v168);

        ++v167;
      }
      while (v165 != v167);
      v165 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v163, "countByEnumeratingWithState:objects:count:", &v653, v805, 16);
    }
    while (v165);
  }

  v652 = 0u;
  v651 = 0u;
  v650 = 0u;
  v649 = 0u;
  v169 = self->_movieUtteranceResults;
  v170 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v169, "countByEnumeratingWithState:objects:count:", &v649, v804, 16);
  if (v170)
  {
    v171 = v170;
    v172 = *(_QWORD *)v650;
    do
    {
      v173 = 0;
      do
      {
        if (*(_QWORD *)v650 != v172)
          objc_enumerationMutation(v169);
        v174 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v649 + 1) + 8 * v173), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieUtteranceResults:", v174);

        ++v173;
      }
      while (v171 != v173);
      v171 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v169, "countByEnumeratingWithState:objects:count:", &v649, v804, 16);
    }
    while (v171);
  }

  v648 = 0u;
  v647 = 0u;
  v646 = 0u;
  v645 = 0u;
  v175 = self->_movieVoiceResults;
  v176 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v645, v803, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v646;
    do
    {
      v179 = 0;
      do
      {
        if (*(_QWORD *)v646 != v178)
          objc_enumerationMutation(v175);
        v180 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v645 + 1) + 8 * v179), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieVoiceResults:", v180);

        ++v179;
      }
      while (v177 != v179);
      v177 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v175, "countByEnumeratingWithState:objects:count:", &v645, v803, 16);
    }
    while (v177);
  }

  v644 = 0u;
  v643 = 0u;
  v642 = 0u;
  v641 = 0u;
  v181 = self->_imagePetsResults;
  v182 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v181, "countByEnumeratingWithState:objects:count:", &v641, v802, 16);
  if (v182)
  {
    v183 = v182;
    v184 = *(_QWORD *)v642;
    do
    {
      v185 = 0;
      do
      {
        if (*(_QWORD *)v642 != v184)
          objc_enumerationMutation(v181);
        v186 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v641 + 1) + 8 * v185), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImagePetsResults:", v186);

        ++v185;
      }
      while (v183 != v185);
      v183 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v181, "countByEnumeratingWithState:objects:count:", &v641, v802, 16);
    }
    while (v183);
  }

  v640 = 0u;
  v639 = 0u;
  v638 = 0u;
  v637 = 0u;
  v187 = self->_movieSummaryResults;
  v188 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v187, "countByEnumeratingWithState:objects:count:", &v637, v801, 16);
  if (v188)
  {
    v189 = v188;
    v190 = *(_QWORD *)v638;
    do
    {
      v191 = 0;
      do
      {
        if (*(_QWORD *)v638 != v190)
          objc_enumerationMutation(v187);
        v192 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v637 + 1) + 8 * v191), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSummaryResults:", v192);

        ++v191;
      }
      while (v189 != v191);
      v189 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v187, "countByEnumeratingWithState:objects:count:", &v637, v801, 16);
    }
    while (v189);
  }

  v636 = 0u;
  v635 = 0u;
  v634 = 0u;
  v633 = 0u;
  v193 = self->_movieHighlightResults;
  v194 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v193, "countByEnumeratingWithState:objects:count:", &v633, v800, 16);
  if (v194)
  {
    v195 = v194;
    v196 = *(_QWORD *)v634;
    do
    {
      v197 = 0;
      do
      {
        if (*(_QWORD *)v634 != v196)
          objc_enumerationMutation(v193);
        v198 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v633 + 1) + 8 * v197), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieHighlightResults:", v198);

        ++v197;
      }
      while (v195 != v197);
      v195 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v193, "countByEnumeratingWithState:objects:count:", &v633, v800, 16);
    }
    while (v195);
  }

  v632 = 0u;
  v631 = 0u;
  v630 = 0u;
  v629 = 0u;
  v199 = self->_imageExposureResults;
  v200 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v199, "countByEnumeratingWithState:objects:count:", &v629, v799, 16);
  if (v200)
  {
    v201 = v200;
    v202 = *(_QWORD *)v630;
    do
    {
      v203 = 0;
      do
      {
        if (*(_QWORD *)v630 != v202)
          objc_enumerationMutation(v199);
        v204 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v629 + 1) + 8 * v203), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageExposureResults:", v204);

        ++v203;
      }
      while (v201 != v203);
      v201 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v199, "countByEnumeratingWithState:objects:count:", &v629, v799, 16);
    }
    while (v201);
  }

  v628 = 0u;
  v627 = 0u;
  v626 = 0u;
  v625 = 0u;
  v205 = self->_livePhotoEffectsResults;
  v206 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v625, v798, 16);
  if (v206)
  {
    v207 = v206;
    v208 = *(_QWORD *)v626;
    do
    {
      v209 = 0;
      do
      {
        if (*(_QWORD *)v626 != v208)
          objc_enumerationMutation(v205);
        v210 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v625 + 1) + 8 * v209), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoEffectsResults:", v210);

        ++v209;
      }
      while (v207 != v209);
      v207 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v205, "countByEnumeratingWithState:objects:count:", &v625, v798, 16);
    }
    while (v207);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_statsFlags;
    *(_BYTE *)(v6 + 688) |= 2u;
  }
  v624 = 0u;
  v623 = 0u;
  v622 = 0u;
  v621 = 0u;
  v211 = self->_imagePetsFaceResults;
  v212 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v211, "countByEnumeratingWithState:objects:count:", &v621, v797, 16);
  if (v212)
  {
    v213 = v212;
    v214 = *(_QWORD *)v622;
    do
    {
      v215 = 0;
      do
      {
        if (*(_QWORD *)v622 != v214)
          objc_enumerationMutation(v211);
        v216 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v621 + 1) + 8 * v215), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImagePetsFaceResults:", v216);

        ++v215;
      }
      while (v213 != v215);
      v213 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v211, "countByEnumeratingWithState:objects:count:", &v621, v797, 16);
    }
    while (v213);
  }

  v620 = 0u;
  v619 = 0u;
  v618 = 0u;
  v617 = 0u;
  v217 = self->_imageSceneprintResults;
  v218 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v217, "countByEnumeratingWithState:objects:count:", &v617, v796, 16);
  if (v218)
  {
    v219 = v218;
    v220 = *(_QWORD *)v618;
    do
    {
      v221 = 0;
      do
      {
        if (*(_QWORD *)v618 != v220)
          objc_enumerationMutation(v217);
        v222 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v617 + 1) + 8 * v221), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageSceneprintResults:", v222);

        ++v221;
      }
      while (v219 != v221);
      v219 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v217, "countByEnumeratingWithState:objects:count:", &v617, v796, 16);
    }
    while (v219);
  }

  v616 = 0u;
  v615 = 0u;
  v614 = 0u;
  v613 = 0u;
  v223 = self->_movieSceneprintResults;
  v224 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v223, "countByEnumeratingWithState:objects:count:", &v613, v795, 16);
  if (v224)
  {
    v225 = v224;
    v226 = *(_QWORD *)v614;
    do
    {
      v227 = 0;
      do
      {
        if (*(_QWORD *)v614 != v226)
          objc_enumerationMutation(v223);
        v228 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v613 + 1) + 8 * v227), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSceneprintResults:", v228);

        ++v227;
      }
      while (v225 != v227);
      v225 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v223, "countByEnumeratingWithState:objects:count:", &v613, v795, 16);
    }
    while (v225);
  }

  v612 = 0u;
  v611 = 0u;
  v610 = 0u;
  v609 = 0u;
  v229 = self->_imageHumanPoseResults;
  v230 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v229, "countByEnumeratingWithState:objects:count:", &v609, v794, 16);
  if (v230)
  {
    v231 = v230;
    v232 = *(_QWORD *)v610;
    do
    {
      v233 = 0;
      do
      {
        if (*(_QWORD *)v610 != v232)
          objc_enumerationMutation(v229);
        v234 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v609 + 1) + 8 * v233), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageHumanPoseResults:", v234);

        ++v233;
      }
      while (v231 != v233);
      v231 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v229, "countByEnumeratingWithState:objects:count:", &v609, v794, 16);
    }
    while (v231);
  }

  v608 = 0u;
  v607 = 0u;
  v606 = 0u;
  v605 = 0u;
  v235 = self->_movieHumanPoseResults;
  v236 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v605, v793, 16);
  if (v236)
  {
    v237 = v236;
    v238 = *(_QWORD *)v606;
    do
    {
      v239 = 0;
      do
      {
        if (*(_QWORD *)v606 != v238)
          objc_enumerationMutation(v235);
        v240 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v605 + 1) + 8 * v239), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieHumanPoseResults:", v240);

        ++v239;
      }
      while (v237 != v239);
      v237 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v235, "countByEnumeratingWithState:objects:count:", &v605, v793, 16);
    }
    while (v237);
  }

  v604 = 0u;
  v603 = 0u;
  v602 = 0u;
  v601 = 0u;
  v241 = self->_movieApplauseResults;
  v242 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v601, v792, 16);
  if (v242)
  {
    v243 = v242;
    v244 = *(_QWORD *)v602;
    do
    {
      v245 = 0;
      do
      {
        if (*(_QWORD *)v602 != v244)
          objc_enumerationMutation(v241);
        v246 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v601 + 1) + 8 * v245), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieApplauseResults:", v246);

        ++v245;
      }
      while (v243 != v245);
      v243 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v241, "countByEnumeratingWithState:objects:count:", &v601, v792, 16);
    }
    while (v243);
  }

  v600 = 0u;
  v599 = 0u;
  v598 = 0u;
  v597 = 0u;
  v247 = self->_movieBabbleResults;
  v248 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v247, "countByEnumeratingWithState:objects:count:", &v597, v791, 16);
  if (v248)
  {
    v249 = v248;
    v250 = *(_QWORD *)v598;
    do
    {
      v251 = 0;
      do
      {
        if (*(_QWORD *)v598 != v250)
          objc_enumerationMutation(v247);
        v252 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v597 + 1) + 8 * v251), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieBabbleResults:", v252);

        ++v251;
      }
      while (v249 != v251);
      v249 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v247, "countByEnumeratingWithState:objects:count:", &v597, v791, 16);
    }
    while (v249);
  }

  v596 = 0u;
  v595 = 0u;
  v594 = 0u;
  v593 = 0u;
  v253 = self->_movieCheeringResults;
  v254 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v253, "countByEnumeratingWithState:objects:count:", &v593, v790, 16);
  if (v254)
  {
    v255 = v254;
    v256 = *(_QWORD *)v594;
    do
    {
      v257 = 0;
      do
      {
        if (*(_QWORD *)v594 != v256)
          objc_enumerationMutation(v253);
        v258 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v593 + 1) + 8 * v257), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieCheeringResults:", v258);

        ++v257;
      }
      while (v255 != v257);
      v255 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v253, "countByEnumeratingWithState:objects:count:", &v593, v790, 16);
    }
    while (v255);
  }

  v592 = 0u;
  v591 = 0u;
  v590 = 0u;
  v589 = 0u;
  v259 = self->_movieLaughterResults;
  v260 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v259, "countByEnumeratingWithState:objects:count:", &v589, v789, 16);
  if (v260)
  {
    v261 = v260;
    v262 = *(_QWORD *)v590;
    do
    {
      v263 = 0;
      do
      {
        if (*(_QWORD *)v590 != v262)
          objc_enumerationMutation(v259);
        v264 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v589 + 1) + 8 * v263), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieLaughterResults:", v264);

        ++v263;
      }
      while (v261 != v263);
      v261 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v259, "countByEnumeratingWithState:objects:count:", &v589, v789, 16);
    }
    while (v261);
  }

  v588 = 0u;
  v587 = 0u;
  v586 = 0u;
  v585 = 0u;
  v265 = self->_livePhotoKeyFrameResults;
  v266 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v585, v788, 16);
  if (v266)
  {
    v267 = v266;
    v268 = *(_QWORD *)v586;
    do
    {
      v269 = 0;
      do
      {
        if (*(_QWORD *)v586 != v268)
          objc_enumerationMutation(v265);
        v270 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v585 + 1) + 8 * v269), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoKeyFrameResults:", v270);

        ++v269;
      }
      while (v267 != v269);
      v267 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v265, "countByEnumeratingWithState:objects:count:", &v585, v788, 16);
    }
    while (v267);
  }

  v584 = 0u;
  v583 = 0u;
  v582 = 0u;
  v581 = 0u;
  v271 = self->_livePhotoKeyFrameStillResults;
  v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v581, v787, 16);
  if (v272)
  {
    v273 = v272;
    v274 = *(_QWORD *)v582;
    do
    {
      v275 = 0;
      do
      {
        if (*(_QWORD *)v582 != v274)
          objc_enumerationMutation(v271);
        v276 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v581 + 1) + 8 * v275), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoKeyFrameStillResults:", v276);

        ++v275;
      }
      while (v273 != v275);
      v273 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v271, "countByEnumeratingWithState:objects:count:", &v581, v787, 16);
    }
    while (v273);
  }

  v580 = 0u;
  v579 = 0u;
  v578 = 0u;
  v577 = 0u;
  v277 = self->_movieHumanActionResults;
  v278 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v277, "countByEnumeratingWithState:objects:count:", &v577, v786, 16);
  if (v278)
  {
    v279 = v278;
    v280 = *(_QWORD *)v578;
    do
    {
      v281 = 0;
      do
      {
        if (*(_QWORD *)v578 != v280)
          objc_enumerationMutation(v277);
        v282 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v577 + 1) + 8 * v281), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieHumanActionResults:", v282);

        ++v281;
      }
      while (v279 != v281);
      v279 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v277, "countByEnumeratingWithState:objects:count:", &v577, v786, 16);
    }
    while (v279);
  }

  v576 = 0u;
  v575 = 0u;
  v574 = 0u;
  v573 = 0u;
  v283 = self->_movieSubtleMotionResults;
  v284 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v283, "countByEnumeratingWithState:objects:count:", &v573, v785, 16);
  if (v284)
  {
    v285 = v284;
    v286 = *(_QWORD *)v574;
    do
    {
      v287 = 0;
      do
      {
        if (*(_QWORD *)v574 != v286)
          objc_enumerationMutation(v283);
        v288 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v573 + 1) + 8 * v287), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSubtleMotionResults:", v288);

        ++v287;
      }
      while (v285 != v287);
      v285 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v283, "countByEnumeratingWithState:objects:count:", &v573, v785, 16);
    }
    while (v285);
  }

  v572 = 0u;
  v571 = 0u;
  v570 = 0u;
  v569 = 0u;
  v289 = self->_movieLoudnessResults;
  v290 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v289, "countByEnumeratingWithState:objects:count:", &v569, v784, 16);
  if (v290)
  {
    v291 = v290;
    v292 = *(_QWORD *)v570;
    do
    {
      v293 = 0;
      do
      {
        if (*(_QWORD *)v570 != v292)
          objc_enumerationMutation(v289);
        v294 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v569 + 1) + 8 * v293), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieLoudnessResults:", v294);

        ++v293;
      }
      while (v291 != v293);
      v291 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v289, "countByEnumeratingWithState:objects:count:", &v569, v784, 16);
    }
    while (v291);
  }

  v568 = 0u;
  v567 = 0u;
  v566 = 0u;
  v565 = 0u;
  v295 = self->_moviePetsResults;
  v296 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v565, v783, 16);
  if (v296)
  {
    v297 = v296;
    v298 = *(_QWORD *)v566;
    do
    {
      v299 = 0;
      do
      {
        if (*(_QWORD *)v566 != v298)
          objc_enumerationMutation(v295);
        v300 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v565 + 1) + 8 * v299), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMoviePetsResults:", v300);

        ++v299;
      }
      while (v297 != v299);
      v297 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v295, "countByEnumeratingWithState:objects:count:", &v565, v783, 16);
    }
    while (v297);
  }

  v564 = 0u;
  v563 = 0u;
  v562 = 0u;
  v561 = 0u;
  v301 = self->_moviePetsFaceResults;
  v302 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v301, "countByEnumeratingWithState:objects:count:", &v561, v782, 16);
  if (v302)
  {
    v303 = v302;
    v304 = *(_QWORD *)v562;
    do
    {
      v305 = 0;
      do
      {
        if (*(_QWORD *)v562 != v304)
          objc_enumerationMutation(v301);
        v306 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v561 + 1) + 8 * v305), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMoviePetsFaceResults:", v306);

        ++v305;
      }
      while (v303 != v305);
      v303 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v301, "countByEnumeratingWithState:objects:count:", &v561, v782, 16);
    }
    while (v303);
  }

  v560 = 0u;
  v559 = 0u;
  v558 = 0u;
  v557 = 0u;
  v307 = self->_movieStabilizationResults;
  v308 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v307, "countByEnumeratingWithState:objects:count:", &v557, v781, 16);
  if (v308)
  {
    v309 = v308;
    v310 = *(_QWORD *)v558;
    do
    {
      v311 = 0;
      do
      {
        if (*(_QWORD *)v558 != v310)
          objc_enumerationMutation(v307);
        v312 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v557 + 1) + 8 * v311), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieStabilizationResults:", v312);

        ++v311;
      }
      while (v309 != v311);
      v309 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v307, "countByEnumeratingWithState:objects:count:", &v557, v781, 16);
    }
    while (v309);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v6 + 40) = self->_typesWide;
    *(_BYTE *)(v6 + 688) |= 4u;
  }
  v556 = 0u;
  v555 = 0u;
  v554 = 0u;
  v553 = 0u;
  v313 = self->_movieHighlightScoreResults;
  v314 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v313, "countByEnumeratingWithState:objects:count:", &v553, v780, 16);
  if (v314)
  {
    v315 = v314;
    v316 = *(_QWORD *)v554;
    do
    {
      v317 = 0;
      do
      {
        if (*(_QWORD *)v554 != v316)
          objc_enumerationMutation(v313);
        v318 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v553 + 1) + 8 * v317), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieHighlightScoreResults:", v318);

        ++v317;
      }
      while (v315 != v317);
      v315 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v313, "countByEnumeratingWithState:objects:count:", &v553, v780, 16);
    }
    while (v315);
  }

  v552 = 0u;
  v551 = 0u;
  v550 = 0u;
  v549 = 0u;
  v319 = self->_livePhotoHumanActionClassificationResults;
  v320 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v319, "countByEnumeratingWithState:objects:count:", &v549, v779, 16);
  if (v320)
  {
    v321 = v320;
    v322 = *(_QWORD *)v550;
    do
    {
      v323 = 0;
      do
      {
        if (*(_QWORD *)v550 != v322)
          objc_enumerationMutation(v319);
        v324 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v549 + 1) + 8 * v323), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoHumanActionClassificationResults:", v324);

        ++v323;
      }
      while (v321 != v323);
      v321 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v319, "countByEnumeratingWithState:objects:count:", &v549, v779, 16);
    }
    while (v321);
  }

  v548 = 0u;
  v547 = 0u;
  v546 = 0u;
  v545 = 0u;
  v325 = self->_movieAudioQualityResults;
  v326 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v545, v778, 16);
  if (v326)
  {
    v327 = v326;
    v328 = *(_QWORD *)v546;
    do
    {
      v329 = 0;
      do
      {
        if (*(_QWORD *)v546 != v328)
          objc_enumerationMutation(v325);
        v330 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v545 + 1) + 8 * v329), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieAudioQualityResults:", v330);

        ++v329;
      }
      while (v327 != v329);
      v327 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v325, "countByEnumeratingWithState:objects:count:", &v545, v778, 16);
    }
    while (v327);
  }

  v544 = 0u;
  v543 = 0u;
  v542 = 0u;
  v541 = 0u;
  v331 = self->_movieSafetyResults;
  v332 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v541, v777, 16);
  if (v332)
  {
    v333 = v332;
    v334 = *(_QWORD *)v542;
    do
    {
      v335 = 0;
      do
      {
        if (*(_QWORD *)v542 != v334)
          objc_enumerationMutation(v331);
        v336 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v541 + 1) + 8 * v335), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieSafetyResults:", v336);

        ++v335;
      }
      while (v333 != v335);
      v333 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v331, "countByEnumeratingWithState:objects:count:", &v541, v777, 16);
    }
    while (v333);
  }

  v540 = 0u;
  v539 = 0u;
  v538 = 0u;
  v537 = 0u;
  v337 = self->_filesystemMovieClassificationResults;
  v338 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v337, "countByEnumeratingWithState:objects:count:", &v537, v776, 16);
  if (v338)
  {
    v339 = v338;
    v340 = *(_QWORD *)v538;
    do
    {
      v341 = 0;
      do
      {
        if (*(_QWORD *)v538 != v340)
          objc_enumerationMutation(v337);
        v342 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v537 + 1) + 8 * v341), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieClassificationResults:", v342);

        ++v341;
      }
      while (v339 != v341);
      v339 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v337, "countByEnumeratingWithState:objects:count:", &v537, v776, 16);
    }
    while (v339);
  }

  v536 = 0u;
  v535 = 0u;
  v534 = 0u;
  v533 = 0u;
  v343 = self->_filesystemMovieHumanActionClassificationResults;
  v344 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v343, "countByEnumeratingWithState:objects:count:", &v533, v775, 16);
  if (v344)
  {
    v345 = v344;
    v346 = *(_QWORD *)v534;
    do
    {
      v347 = 0;
      do
      {
        if (*(_QWORD *)v534 != v346)
          objc_enumerationMutation(v343);
        v348 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v533 + 1) + 8 * v347), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieHumanActionClassificationResults:", v348);

        ++v347;
      }
      while (v345 != v347);
      v345 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v343, "countByEnumeratingWithState:objects:count:", &v533, v775, 16);
    }
    while (v345);
  }

  v532 = 0u;
  v531 = 0u;
  v530 = 0u;
  v529 = 0u;
  v349 = self->_filesystemMovieApplauseResults;
  v350 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v349, "countByEnumeratingWithState:objects:count:", &v529, v774, 16);
  if (v350)
  {
    v351 = v350;
    v352 = *(_QWORD *)v530;
    do
    {
      v353 = 0;
      do
      {
        if (*(_QWORD *)v530 != v352)
          objc_enumerationMutation(v349);
        v354 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v529 + 1) + 8 * v353), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieApplauseResults:", v354);

        ++v353;
      }
      while (v351 != v353);
      v351 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v349, "countByEnumeratingWithState:objects:count:", &v529, v774, 16);
    }
    while (v351);
  }

  v528 = 0u;
  v527 = 0u;
  v526 = 0u;
  v525 = 0u;
  v355 = self->_filesystemMovieBabbleResults;
  v356 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v525, v773, 16);
  if (v356)
  {
    v357 = v356;
    v358 = *(_QWORD *)v526;
    do
    {
      v359 = 0;
      do
      {
        if (*(_QWORD *)v526 != v358)
          objc_enumerationMutation(v355);
        v360 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v525 + 1) + 8 * v359), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieBabbleResults:", v360);

        ++v359;
      }
      while (v357 != v359);
      v357 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v355, "countByEnumeratingWithState:objects:count:", &v525, v773, 16);
    }
    while (v357);
  }

  v523 = 0u;
  v524 = 0u;
  v521 = 0u;
  v522 = 0u;
  v361 = self->_filesystemMovieCheeringResults;
  v362 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v361, "countByEnumeratingWithState:objects:count:", &v521, v772, 16);
  if (v362)
  {
    v363 = v362;
    v364 = *(_QWORD *)v522;
    do
    {
      v365 = 0;
      do
      {
        if (*(_QWORD *)v522 != v364)
          objc_enumerationMutation(v361);
        v366 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v521 + 1) + 8 * v365), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieCheeringResults:", v366);

        ++v365;
      }
      while (v363 != v365);
      v363 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v361, "countByEnumeratingWithState:objects:count:", &v521, v772, 16);
    }
    while (v363);
  }

  v519 = 0u;
  v520 = 0u;
  v517 = 0u;
  v518 = 0u;
  v367 = self->_filesystemMovieLaughterResults;
  v368 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v367, "countByEnumeratingWithState:objects:count:", &v517, v771, 16);
  if (v368)
  {
    v369 = v368;
    v370 = *(_QWORD *)v518;
    do
    {
      v371 = 0;
      do
      {
        if (*(_QWORD *)v518 != v370)
          objc_enumerationMutation(v367);
        v372 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v517 + 1) + 8 * v371), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieLaughterResults:", v372);

        ++v371;
      }
      while (v369 != v371);
      v369 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v367, "countByEnumeratingWithState:objects:count:", &v517, v771, 16);
    }
    while (v369);
  }

  v515 = 0u;
  v516 = 0u;
  v513 = 0u;
  v514 = 0u;
  v373 = self->_filesystemMovieMusicResults;
  v374 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v373, "countByEnumeratingWithState:objects:count:", &v513, v770, 16);
  if (v374)
  {
    v375 = v374;
    v376 = *(_QWORD *)v514;
    do
    {
      v377 = 0;
      do
      {
        if (*(_QWORD *)v514 != v376)
          objc_enumerationMutation(v373);
        v378 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v513 + 1) + 8 * v377), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieMusicResults:", v378);

        ++v377;
      }
      while (v375 != v377);
      v375 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v373, "countByEnumeratingWithState:objects:count:", &v513, v770, 16);
    }
    while (v375);
  }

  v511 = 0u;
  v512 = 0u;
  v509 = 0u;
  v510 = 0u;
  v379 = self->_filesystemMovieVoiceResults;
  v380 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v379, "countByEnumeratingWithState:objects:count:", &v509, v769, 16);
  if (v380)
  {
    v381 = v380;
    v382 = *(_QWORD *)v510;
    do
    {
      v383 = 0;
      do
      {
        if (*(_QWORD *)v510 != v382)
          objc_enumerationMutation(v379);
        v384 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v509 + 1) + 8 * v383), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFilesystemMovieVoiceResults:", v384);

        ++v383;
      }
      while (v381 != v383);
      v381 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v379, "countByEnumeratingWithState:objects:count:", &v509, v769, 16);
    }
    while (v381);
  }

  v507 = 0u;
  v508 = 0u;
  v505 = 0u;
  v506 = 0u;
  v385 = self->_animatedStickerResults;
  v386 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v385, "countByEnumeratingWithState:objects:count:", &v505, v768, 16);
  if (v386)
  {
    v387 = v386;
    v388 = *(_QWORD *)v506;
    do
    {
      v389 = 0;
      do
      {
        if (*(_QWORD *)v506 != v388)
          objc_enumerationMutation(v385);
        v390 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v505 + 1) + 8 * v389), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAnimatedStickerResults:", v390);

        ++v389;
      }
      while (v387 != v389);
      v387 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v385, "countByEnumeratingWithState:objects:count:", &v505, v768, 16);
    }
    while (v387);
  }

  v503 = 0u;
  v504 = 0u;
  v501 = 0u;
  v502 = 0u;
  v391 = self->_livePhotoSettlingEffectGatingResults;
  v392 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v391, "countByEnumeratingWithState:objects:count:", &v501, v767, 16);
  if (v392)
  {
    v393 = v392;
    v394 = *(_QWORD *)v502;
    do
    {
      v395 = 0;
      do
      {
        if (*(_QWORD *)v502 != v394)
          objc_enumerationMutation(v391);
        v396 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v501 + 1) + 8 * v395), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLivePhotoSettlingEffectGatingResults:", v396);

        ++v395;
      }
      while (v393 != v395);
      v393 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v391, "countByEnumeratingWithState:objects:count:", &v501, v767, 16);
    }
    while (v393);
  }

  v397 = -[NSString copyWithZone:](self->_assetCloudIdentifier, "copyWithZone:", a3);
  v398 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v397;

  v499 = 0u;
  v500 = 0u;
  v497 = 0u;
  v498 = 0u;
  v399 = self->_movieTorsoResults;
  v400 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v399, "countByEnumeratingWithState:objects:count:", &v497, v766, 16);
  if (v400)
  {
    v401 = v400;
    v402 = *(_QWORD *)v498;
    do
    {
      v403 = 0;
      do
      {
        if (*(_QWORD *)v498 != v402)
          objc_enumerationMutation(v399);
        v404 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v497 + 1) + 8 * v403), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieTorsoResults:", v404);

        ++v403;
      }
      while (v401 != v403);
      v401 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v399, "countByEnumeratingWithState:objects:count:", &v497, v766, 16);
    }
    while (v401);
  }

  v495 = 0u;
  v496 = 0u;
  v493 = 0u;
  v494 = 0u;
  v405 = self->_movieHumanActionClassificationResults;
  v406 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v405, "countByEnumeratingWithState:objects:count:", &v493, v765, 16);
  if (v406)
  {
    v407 = v406;
    v408 = *(_QWORD *)v494;
    do
    {
      v409 = 0;
      do
      {
        if (*(_QWORD *)v494 != v408)
          objc_enumerationMutation(v405);
        v410 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v493 + 1) + 8 * v409), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addMovieHumanActionClassificationResults:", v410);

        ++v409;
      }
      while (v407 != v409);
      v407 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v405, "countByEnumeratingWithState:objects:count:", &v493, v765, 16);
    }
    while (v407);
  }

  v491 = 0u;
  v492 = 0u;
  v489 = 0u;
  v490 = 0u;
  v411 = self->_videoEmbeddingResults;
  v412 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v411, "countByEnumeratingWithState:objects:count:", &v489, v764, 16);
  if (v412)
  {
    v413 = v412;
    v414 = *(_QWORD *)v490;
    do
    {
      v415 = 0;
      do
      {
        if (*(_QWORD *)v490 != v414)
          objc_enumerationMutation(v411);
        v416 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v489 + 1) + 8 * v415), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addVideoEmbeddingResults:", v416);

        ++v415;
      }
      while (v413 != v415);
      v413 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v411, "countByEnumeratingWithState:objects:count:", &v489, v764, 16);
    }
    while (v413);
  }

  v487 = 0u;
  v488 = 0u;
  v485 = 0u;
  v486 = 0u;
  v417 = self->_summarizedEmbeddingResults;
  v418 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v417, "countByEnumeratingWithState:objects:count:", &v485, v763, 16);
  if (v418)
  {
    v419 = v418;
    v420 = *(_QWORD *)v486;
    do
    {
      v421 = 0;
      do
      {
        if (*(_QWORD *)v486 != v420)
          objc_enumerationMutation(v417);
        v422 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v485 + 1) + 8 * v421), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSummarizedEmbeddingResults:", v422);

        ++v421;
      }
      while (v419 != v421);
      v419 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v417, "countByEnumeratingWithState:objects:count:", &v485, v763, 16);
    }
    while (v419);
  }

  v483 = 0u;
  v484 = 0u;
  v481 = 0u;
  v482 = 0u;
  v423 = self->_audioFusedVideoEmbeddingResults;
  v424 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v423, "countByEnumeratingWithState:objects:count:", &v481, v762, 16);
  if (v424)
  {
    v425 = v424;
    v426 = *(_QWORD *)v482;
    do
    {
      v427 = 0;
      do
      {
        if (*(_QWORD *)v482 != v426)
          objc_enumerationMutation(v423);
        v428 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v481 + 1) + 8 * v427), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAudioFusedVideoEmbeddingResults:", v428);

        ++v427;
      }
      while (v425 != v427);
      v425 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v423, "countByEnumeratingWithState:objects:count:", &v481, v762, 16);
    }
    while (v425);
  }

  v479 = 0u;
  v480 = 0u;
  v477 = 0u;
  v478 = 0u;
  v429 = self->_imageEmbeddingResults;
  v430 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v429, "countByEnumeratingWithState:objects:count:", &v477, v761, 16);
  if (v430)
  {
    v431 = v430;
    v432 = *(_QWORD *)v478;
    do
    {
      v433 = 0;
      do
      {
        if (*(_QWORD *)v478 != v432)
          objc_enumerationMutation(v429);
        v434 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v477 + 1) + 8 * v433), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageEmbeddingResults:", v434);

        ++v433;
      }
      while (v431 != v433);
      v431 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v429, "countByEnumeratingWithState:objects:count:", &v477, v761, 16);
    }
    while (v431);
  }

  v475 = 0u;
  v476 = 0u;
  v473 = 0u;
  v474 = 0u;
  v435 = self->_imageCaptionResults;
  v436 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v435, "countByEnumeratingWithState:objects:count:", &v473, v760, 16);
  if (v436)
  {
    v437 = v436;
    v438 = *(_QWORD *)v474;
    do
    {
      v439 = 0;
      do
      {
        if (*(_QWORD *)v474 != v438)
          objc_enumerationMutation(v435);
        v440 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v473 + 1) + 8 * v439), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addImageCaptionResults:", v440);

        ++v439;
      }
      while (v437 != v439);
      v437 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v435, "countByEnumeratingWithState:objects:count:", &v473, v760, 16);
    }
    while (v437);
  }

  v471 = 0u;
  v472 = 0u;
  v469 = 0u;
  v470 = 0u;
  v441 = self->_videoCaptionResults;
  v442 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v441, "countByEnumeratingWithState:objects:count:", &v469, v759, 16);
  if (v442)
  {
    v443 = v442;
    v444 = *(_QWORD *)v470;
    do
    {
      v445 = 0;
      do
      {
        if (*(_QWORD *)v470 != v444)
          objc_enumerationMutation(v441);
        v446 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v469 + 1) + 8 * v445), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addVideoCaptionResults:", v446);

        ++v445;
      }
      while (v443 != v445);
      v443 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v441, "countByEnumeratingWithState:objects:count:", &v469, v759, 16);
    }
    while (v443);
  }

  v467 = 0u;
  v468 = 0u;
  v465 = 0u;
  v466 = 0u;
  v447 = self->_videoCaptionPreferenceResults;
  v448 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v447, "countByEnumeratingWithState:objects:count:", &v465, v758, 16);
  if (v448)
  {
    v449 = v448;
    v450 = *(_QWORD *)v466;
    do
    {
      v451 = 0;
      do
      {
        if (*(_QWORD *)v466 != v450)
          objc_enumerationMutation(v447);
        v452 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v465 + 1) + 8 * v451), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addVideoCaptionPreferenceResults:", v452);

        ++v451;
      }
      while (v449 != v451);
      v449 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v447, "countByEnumeratingWithState:objects:count:", &v465, v758, 16);
    }
    while (v449);
  }

  v463 = 0u;
  v464 = 0u;
  v461 = 0u;
  v462 = 0u;
  v453 = self->_videoSegmentCaptionResults;
  v454 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v453, "countByEnumeratingWithState:objects:count:", &v461, v757, 16);
  if (v454)
  {
    v455 = v454;
    v456 = *(_QWORD *)v462;
    do
    {
      v457 = 0;
      do
      {
        if (*(_QWORD *)v462 != v456)
          objc_enumerationMutation(v453);
        v458 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v461 + 1) + 8 * v457), "copyWithZone:", a3, (_QWORD)v461);
        objc_msgSend((id)v6, "addVideoSegmentCaptionResults:", v458);

        ++v457;
      }
      while (v455 != v457);
      v455 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v453, "countByEnumeratingWithState:objects:count:", &v461, v757, 16);
    }
    while (v455);
  }

  v459 = (id)v6;
  return v459;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *assetIdentifier;
  NSString *assetMasterFingerprint;
  NSString *assetAdjustedFingerprint;
  NSMutableArray *imageBlurResults;
  NSMutableArray *imageCompositionResults;
  NSMutableArray *imageFaceResults;
  NSMutableArray *imageFeatureResults;
  NSMutableArray *imageJunkResults;
  NSMutableArray *imageSaliencyResults;
  NSMutableArray *imageShotTypeResults;
  NSMutableArray *livePhotoRecommendationResults;
  NSMutableArray *livePhotoSharpnessResults;
  NSMutableArray *movieActivityLevelResults;
  NSMutableArray *movieCameraMotionResults;
  NSMutableArray *movieClassificationResults;
  NSMutableArray *movieFaceResults;
  NSMutableArray *movieFaceprintResults;
  NSMutableArray *movieFeatureResults;
  NSMutableArray *movieFineSubjectMotionResults;
  NSMutableArray *movieInterestingnessResults;
  NSMutableArray *movieMovingObjectResults;
  NSMutableArray *movieMusicResults;
  NSMutableArray *movieObstructionResults;
  NSMutableArray *movieOrientationResults;
  NSMutableArray *moviePreEncodeResults;
  NSMutableArray *movieQualityResults;
  NSMutableArray *movieSaliencyResults;
  NSMutableArray *movieSceneResults;
  NSMutableArray *movieSubjectMotionResults;
  NSMutableArray *movieUtteranceResults;
  NSMutableArray *movieVoiceResults;
  NSMutableArray *imagePetsResults;
  NSMutableArray *movieSummaryResults;
  NSMutableArray *movieHighlightResults;
  NSMutableArray *imageExposureResults;
  NSMutableArray *livePhotoEffectsResults;
  NSMutableArray *imagePetsFaceResults;
  NSMutableArray *imageSceneprintResults;
  NSMutableArray *movieSceneprintResults;
  NSMutableArray *imageHumanPoseResults;
  NSMutableArray *movieHumanPoseResults;
  NSMutableArray *movieApplauseResults;
  NSMutableArray *movieBabbleResults;
  NSMutableArray *movieCheeringResults;
  NSMutableArray *movieLaughterResults;
  NSMutableArray *livePhotoKeyFrameResults;
  NSMutableArray *livePhotoKeyFrameStillResults;
  NSMutableArray *movieHumanActionResults;
  NSMutableArray *movieSubtleMotionResults;
  NSMutableArray *movieLoudnessResults;
  NSMutableArray *moviePetsResults;
  NSMutableArray *moviePetsFaceResults;
  NSMutableArray *movieStabilizationResults;
  NSMutableArray *movieHighlightScoreResults;
  NSMutableArray *livePhotoHumanActionClassificationResults;
  NSMutableArray *movieAudioQualityResults;
  NSMutableArray *movieSafetyResults;
  NSMutableArray *filesystemMovieClassificationResults;
  NSMutableArray *filesystemMovieHumanActionClassificationResults;
  NSMutableArray *filesystemMovieApplauseResults;
  NSMutableArray *filesystemMovieBabbleResults;
  NSMutableArray *filesystemMovieCheeringResults;
  NSMutableArray *filesystemMovieLaughterResults;
  NSMutableArray *filesystemMovieMusicResults;
  NSMutableArray *filesystemMovieVoiceResults;
  NSMutableArray *animatedStickerResults;
  NSMutableArray *livePhotoSettlingEffectGatingResults;
  NSString *assetCloudIdentifier;
  NSMutableArray *movieTorsoResults;
  NSMutableArray *movieHumanActionClassificationResults;
  NSMutableArray *videoEmbeddingResults;
  NSMutableArray *summarizedEmbeddingResults;
  NSMutableArray *audioFusedVideoEmbeddingResults;
  NSMutableArray *imageEmbeddingResults;
  NSMutableArray *imageCaptionResults;
  NSMutableArray *videoCaptionResults;
  NSMutableArray *videoCaptionPreferenceResults;
  NSMutableArray *videoSegmentCaptionResults;
  char v83;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_version != *((_DWORD *)v4 + 163)
    || self->_types != *((_DWORD *)v4 + 162)
    || self->_flags != *((_DWORD *)v4 + 40)
    || self->_date != *((double *)v4 + 2))
  {
    goto LABEL_178;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 688) & 1) == 0 || self->_quality != *((double *)v4 + 3))
      goto LABEL_178;
  }
  else if ((*((_BYTE *)v4 + 688) & 1) != 0)
  {
LABEL_178:
    v83 = 0;
    goto LABEL_179;
  }
  assetIdentifier = self->_assetIdentifier;
  if ((unint64_t)assetIdentifier | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](assetIdentifier, "isEqual:"))
  {
    goto LABEL_178;
  }
  if (self->_assetModificationDate != *((double *)v4 + 1))
    goto LABEL_178;
  assetMasterFingerprint = self->_assetMasterFingerprint;
  if ((unint64_t)assetMasterFingerprint | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](assetMasterFingerprint, "isEqual:"))
      goto LABEL_178;
  }
  assetAdjustedFingerprint = self->_assetAdjustedFingerprint;
  if ((unint64_t)assetAdjustedFingerprint | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](assetAdjustedFingerprint, "isEqual:"))
      goto LABEL_178;
  }
  imageBlurResults = self->_imageBlurResults;
  if ((unint64_t)imageBlurResults | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](imageBlurResults, "isEqual:"))
      goto LABEL_178;
  }
  imageCompositionResults = self->_imageCompositionResults;
  if ((unint64_t)imageCompositionResults | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](imageCompositionResults, "isEqual:"))
      goto LABEL_178;
  }
  imageFaceResults = self->_imageFaceResults;
  if ((unint64_t)imageFaceResults | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](imageFaceResults, "isEqual:"))
      goto LABEL_178;
  }
  imageFeatureResults = self->_imageFeatureResults;
  if ((unint64_t)imageFeatureResults | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](imageFeatureResults, "isEqual:"))
      goto LABEL_178;
  }
  imageJunkResults = self->_imageJunkResults;
  if ((unint64_t)imageJunkResults | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](imageJunkResults, "isEqual:"))
      goto LABEL_178;
  }
  imageSaliencyResults = self->_imageSaliencyResults;
  if ((unint64_t)imageSaliencyResults | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](imageSaliencyResults, "isEqual:"))
      goto LABEL_178;
  }
  imageShotTypeResults = self->_imageShotTypeResults;
  if ((unint64_t)imageShotTypeResults | *((_QWORD *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](imageShotTypeResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoRecommendationResults = self->_livePhotoRecommendationResults;
  if ((unint64_t)livePhotoRecommendationResults | *((_QWORD *)v4 + 39))
  {
    if (!-[NSMutableArray isEqual:](livePhotoRecommendationResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoSharpnessResults = self->_livePhotoSharpnessResults;
  if ((unint64_t)livePhotoSharpnessResults | *((_QWORD *)v4 + 41))
  {
    if (!-[NSMutableArray isEqual:](livePhotoSharpnessResults, "isEqual:"))
      goto LABEL_178;
  }
  movieActivityLevelResults = self->_movieActivityLevelResults;
  if ((unint64_t)movieActivityLevelResults | *((_QWORD *)v4 + 42))
  {
    if (!-[NSMutableArray isEqual:](movieActivityLevelResults, "isEqual:"))
      goto LABEL_178;
  }
  movieCameraMotionResults = self->_movieCameraMotionResults;
  if ((unint64_t)movieCameraMotionResults | *((_QWORD *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](movieCameraMotionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieClassificationResults = self->_movieClassificationResults;
  if ((unint64_t)movieClassificationResults | *((_QWORD *)v4 + 48))
  {
    if (!-[NSMutableArray isEqual:](movieClassificationResults, "isEqual:"))
      goto LABEL_178;
  }
  movieFaceResults = self->_movieFaceResults;
  if ((unint64_t)movieFaceResults | *((_QWORD *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](movieFaceResults, "isEqual:"))
      goto LABEL_178;
  }
  movieFaceprintResults = self->_movieFaceprintResults;
  if ((unint64_t)movieFaceprintResults | *((_QWORD *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](movieFaceprintResults, "isEqual:"))
      goto LABEL_178;
  }
  movieFeatureResults = self->_movieFeatureResults;
  if ((unint64_t)movieFeatureResults | *((_QWORD *)v4 + 51))
  {
    if (!-[NSMutableArray isEqual:](movieFeatureResults, "isEqual:"))
      goto LABEL_178;
  }
  movieFineSubjectMotionResults = self->_movieFineSubjectMotionResults;
  if ((unint64_t)movieFineSubjectMotionResults | *((_QWORD *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](movieFineSubjectMotionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieInterestingnessResults = self->_movieInterestingnessResults;
  if ((unint64_t)movieInterestingnessResults | *((_QWORD *)v4 + 58))
  {
    if (!-[NSMutableArray isEqual:](movieInterestingnessResults, "isEqual:"))
      goto LABEL_178;
  }
  movieMovingObjectResults = self->_movieMovingObjectResults;
  if ((unint64_t)movieMovingObjectResults | *((_QWORD *)v4 + 61))
  {
    if (!-[NSMutableArray isEqual:](movieMovingObjectResults, "isEqual:"))
      goto LABEL_178;
  }
  movieMusicResults = self->_movieMusicResults;
  if ((unint64_t)movieMusicResults | *((_QWORD *)v4 + 62))
  {
    if (!-[NSMutableArray isEqual:](movieMusicResults, "isEqual:"))
      goto LABEL_178;
  }
  movieObstructionResults = self->_movieObstructionResults;
  if ((unint64_t)movieObstructionResults | *((_QWORD *)v4 + 63))
  {
    if (!-[NSMutableArray isEqual:](movieObstructionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieOrientationResults = self->_movieOrientationResults;
  if ((unint64_t)movieOrientationResults | *((_QWORD *)v4 + 64))
  {
    if (!-[NSMutableArray isEqual:](movieOrientationResults, "isEqual:"))
      goto LABEL_178;
  }
  moviePreEncodeResults = self->_moviePreEncodeResults;
  if ((unint64_t)moviePreEncodeResults | *((_QWORD *)v4 + 67))
  {
    if (!-[NSMutableArray isEqual:](moviePreEncodeResults, "isEqual:"))
      goto LABEL_178;
  }
  movieQualityResults = self->_movieQualityResults;
  if ((unint64_t)movieQualityResults | *((_QWORD *)v4 + 68))
  {
    if (!-[NSMutableArray isEqual:](movieQualityResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSaliencyResults = self->_movieSaliencyResults;
  if ((unint64_t)movieSaliencyResults | *((_QWORD *)v4 + 70))
  {
    if (!-[NSMutableArray isEqual:](movieSaliencyResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSceneResults = self->_movieSceneResults;
  if ((unint64_t)movieSceneResults | *((_QWORD *)v4 + 71))
  {
    if (!-[NSMutableArray isEqual:](movieSceneResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSubjectMotionResults = self->_movieSubjectMotionResults;
  if ((unint64_t)movieSubjectMotionResults | *((_QWORD *)v4 + 74))
  {
    if (!-[NSMutableArray isEqual:](movieSubjectMotionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieUtteranceResults = self->_movieUtteranceResults;
  if ((unint64_t)movieUtteranceResults | *((_QWORD *)v4 + 78))
  {
    if (!-[NSMutableArray isEqual:](movieUtteranceResults, "isEqual:"))
      goto LABEL_178;
  }
  movieVoiceResults = self->_movieVoiceResults;
  if ((unint64_t)movieVoiceResults | *((_QWORD *)v4 + 79))
  {
    if (!-[NSMutableArray isEqual:](movieVoiceResults, "isEqual:"))
      goto LABEL_178;
  }
  imagePetsResults = self->_imagePetsResults;
  if ((unint64_t)imagePetsResults | *((_QWORD *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](imagePetsResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSummaryResults = self->_movieSummaryResults;
  if ((unint64_t)movieSummaryResults | *((_QWORD *)v4 + 76))
  {
    if (!-[NSMutableArray isEqual:](movieSummaryResults, "isEqual:"))
      goto LABEL_178;
  }
  movieHighlightResults = self->_movieHighlightResults;
  if ((unint64_t)movieHighlightResults | *((_QWORD *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](movieHighlightResults, "isEqual:"))
      goto LABEL_178;
  }
  imageExposureResults = self->_imageExposureResults;
  if ((unint64_t)imageExposureResults | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](imageExposureResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoEffectsResults = self->_livePhotoEffectsResults;
  if ((unint64_t)livePhotoEffectsResults | *((_QWORD *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](livePhotoEffectsResults, "isEqual:"))
      goto LABEL_178;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 688) & 2) == 0 || self->_statsFlags != *((_QWORD *)v4 + 4))
      goto LABEL_178;
  }
  else if ((*((_BYTE *)v4 + 688) & 2) != 0)
  {
    goto LABEL_178;
  }
  imagePetsFaceResults = self->_imagePetsFaceResults;
  if ((unint64_t)imagePetsFaceResults | *((_QWORD *)v4 + 30)
    && !-[NSMutableArray isEqual:](imagePetsFaceResults, "isEqual:"))
  {
    goto LABEL_178;
  }
  imageSceneprintResults = self->_imageSceneprintResults;
  if ((unint64_t)imageSceneprintResults | *((_QWORD *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](imageSceneprintResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSceneprintResults = self->_movieSceneprintResults;
  if ((unint64_t)movieSceneprintResults | *((_QWORD *)v4 + 72))
  {
    if (!-[NSMutableArray isEqual:](movieSceneprintResults, "isEqual:"))
      goto LABEL_178;
  }
  imageHumanPoseResults = self->_imageHumanPoseResults;
  if ((unint64_t)imageHumanPoseResults | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](imageHumanPoseResults, "isEqual:"))
      goto LABEL_178;
  }
  movieHumanPoseResults = self->_movieHumanPoseResults;
  if ((unint64_t)movieHumanPoseResults | *((_QWORD *)v4 + 57))
  {
    if (!-[NSMutableArray isEqual:](movieHumanPoseResults, "isEqual:"))
      goto LABEL_178;
  }
  movieApplauseResults = self->_movieApplauseResults;
  if ((unint64_t)movieApplauseResults | *((_QWORD *)v4 + 43))
  {
    if (!-[NSMutableArray isEqual:](movieApplauseResults, "isEqual:"))
      goto LABEL_178;
  }
  movieBabbleResults = self->_movieBabbleResults;
  if ((unint64_t)movieBabbleResults | *((_QWORD *)v4 + 45))
  {
    if (!-[NSMutableArray isEqual:](movieBabbleResults, "isEqual:"))
      goto LABEL_178;
  }
  movieCheeringResults = self->_movieCheeringResults;
  if ((unint64_t)movieCheeringResults | *((_QWORD *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](movieCheeringResults, "isEqual:"))
      goto LABEL_178;
  }
  movieLaughterResults = self->_movieLaughterResults;
  if ((unint64_t)movieLaughterResults | *((_QWORD *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](movieLaughterResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoKeyFrameResults = self->_livePhotoKeyFrameResults;
  if ((unint64_t)livePhotoKeyFrameResults | *((_QWORD *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](livePhotoKeyFrameResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoKeyFrameStillResults = self->_livePhotoKeyFrameStillResults;
  if ((unint64_t)livePhotoKeyFrameStillResults | *((_QWORD *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](livePhotoKeyFrameStillResults, "isEqual:"))
      goto LABEL_178;
  }
  movieHumanActionResults = self->_movieHumanActionResults;
  if ((unint64_t)movieHumanActionResults | *((_QWORD *)v4 + 56))
  {
    if (!-[NSMutableArray isEqual:](movieHumanActionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSubtleMotionResults = self->_movieSubtleMotionResults;
  if ((unint64_t)movieSubtleMotionResults | *((_QWORD *)v4 + 75))
  {
    if (!-[NSMutableArray isEqual:](movieSubtleMotionResults, "isEqual:"))
      goto LABEL_178;
  }
  movieLoudnessResults = self->_movieLoudnessResults;
  if ((unint64_t)movieLoudnessResults | *((_QWORD *)v4 + 60))
  {
    if (!-[NSMutableArray isEqual:](movieLoudnessResults, "isEqual:"))
      goto LABEL_178;
  }
  moviePetsResults = self->_moviePetsResults;
  if ((unint64_t)moviePetsResults | *((_QWORD *)v4 + 66))
  {
    if (!-[NSMutableArray isEqual:](moviePetsResults, "isEqual:"))
      goto LABEL_178;
  }
  moviePetsFaceResults = self->_moviePetsFaceResults;
  if ((unint64_t)moviePetsFaceResults | *((_QWORD *)v4 + 65))
  {
    if (!-[NSMutableArray isEqual:](moviePetsFaceResults, "isEqual:"))
      goto LABEL_178;
  }
  movieStabilizationResults = self->_movieStabilizationResults;
  if ((unint64_t)movieStabilizationResults | *((_QWORD *)v4 + 73))
  {
    if (!-[NSMutableArray isEqual:](movieStabilizationResults, "isEqual:"))
      goto LABEL_178;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 688) & 4) == 0 || self->_typesWide != *((_QWORD *)v4 + 5))
      goto LABEL_178;
  }
  else if ((*((_BYTE *)v4 + 688) & 4) != 0)
  {
    goto LABEL_178;
  }
  movieHighlightScoreResults = self->_movieHighlightScoreResults;
  if ((unint64_t)movieHighlightScoreResults | *((_QWORD *)v4 + 54)
    && !-[NSMutableArray isEqual:](movieHighlightScoreResults, "isEqual:"))
  {
    goto LABEL_178;
  }
  livePhotoHumanActionClassificationResults = self->_livePhotoHumanActionClassificationResults;
  if ((unint64_t)livePhotoHumanActionClassificationResults | *((_QWORD *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](livePhotoHumanActionClassificationResults, "isEqual:"))
      goto LABEL_178;
  }
  movieAudioQualityResults = self->_movieAudioQualityResults;
  if ((unint64_t)movieAudioQualityResults | *((_QWORD *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](movieAudioQualityResults, "isEqual:"))
      goto LABEL_178;
  }
  movieSafetyResults = self->_movieSafetyResults;
  if ((unint64_t)movieSafetyResults | *((_QWORD *)v4 + 69))
  {
    if (!-[NSMutableArray isEqual:](movieSafetyResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieClassificationResults = self->_filesystemMovieClassificationResults;
  if ((unint64_t)filesystemMovieClassificationResults | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieClassificationResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieHumanActionClassificationResults = self->_filesystemMovieHumanActionClassificationResults;
  if ((unint64_t)filesystemMovieHumanActionClassificationResults | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieHumanActionClassificationResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieApplauseResults = self->_filesystemMovieApplauseResults;
  if ((unint64_t)filesystemMovieApplauseResults | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieApplauseResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieBabbleResults = self->_filesystemMovieBabbleResults;
  if ((unint64_t)filesystemMovieBabbleResults | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieBabbleResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieCheeringResults = self->_filesystemMovieCheeringResults;
  if ((unint64_t)filesystemMovieCheeringResults | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieCheeringResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieLaughterResults = self->_filesystemMovieLaughterResults;
  if ((unint64_t)filesystemMovieLaughterResults | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieLaughterResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieMusicResults = self->_filesystemMovieMusicResults;
  if ((unint64_t)filesystemMovieMusicResults | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieMusicResults, "isEqual:"))
      goto LABEL_178;
  }
  filesystemMovieVoiceResults = self->_filesystemMovieVoiceResults;
  if ((unint64_t)filesystemMovieVoiceResults | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](filesystemMovieVoiceResults, "isEqual:"))
      goto LABEL_178;
  }
  animatedStickerResults = self->_animatedStickerResults;
  if ((unint64_t)animatedStickerResults | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](animatedStickerResults, "isEqual:"))
      goto LABEL_178;
  }
  livePhotoSettlingEffectGatingResults = self->_livePhotoSettlingEffectGatingResults;
  if ((unint64_t)livePhotoSettlingEffectGatingResults | *((_QWORD *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](livePhotoSettlingEffectGatingResults, "isEqual:"))
      goto LABEL_178;
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:"))
      goto LABEL_178;
  }
  movieTorsoResults = self->_movieTorsoResults;
  if ((unint64_t)movieTorsoResults | *((_QWORD *)v4 + 77))
  {
    if (!-[NSMutableArray isEqual:](movieTorsoResults, "isEqual:"))
      goto LABEL_178;
  }
  movieHumanActionClassificationResults = self->_movieHumanActionClassificationResults;
  if ((unint64_t)movieHumanActionClassificationResults | *((_QWORD *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](movieHumanActionClassificationResults, "isEqual:"))
      goto LABEL_178;
  }
  videoEmbeddingResults = self->_videoEmbeddingResults;
  if ((unint64_t)videoEmbeddingResults | *((_QWORD *)v4 + 84))
  {
    if (!-[NSMutableArray isEqual:](videoEmbeddingResults, "isEqual:"))
      goto LABEL_178;
  }
  summarizedEmbeddingResults = self->_summarizedEmbeddingResults;
  if ((unint64_t)summarizedEmbeddingResults | *((_QWORD *)v4 + 80))
  {
    if (!-[NSMutableArray isEqual:](summarizedEmbeddingResults, "isEqual:"))
      goto LABEL_178;
  }
  audioFusedVideoEmbeddingResults = self->_audioFusedVideoEmbeddingResults;
  if ((unint64_t)audioFusedVideoEmbeddingResults | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](audioFusedVideoEmbeddingResults, "isEqual:"))
      goto LABEL_178;
  }
  imageEmbeddingResults = self->_imageEmbeddingResults;
  if ((unint64_t)imageEmbeddingResults | *((_QWORD *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](imageEmbeddingResults, "isEqual:"))
      goto LABEL_178;
  }
  imageCaptionResults = self->_imageCaptionResults;
  if ((unint64_t)imageCaptionResults | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](imageCaptionResults, "isEqual:"))
      goto LABEL_178;
  }
  videoCaptionResults = self->_videoCaptionResults;
  if ((unint64_t)videoCaptionResults | *((_QWORD *)v4 + 83))
  {
    if (!-[NSMutableArray isEqual:](videoCaptionResults, "isEqual:"))
      goto LABEL_178;
  }
  videoCaptionPreferenceResults = self->_videoCaptionPreferenceResults;
  if ((unint64_t)videoCaptionPreferenceResults | *((_QWORD *)v4 + 82))
  {
    if (!-[NSMutableArray isEqual:](videoCaptionPreferenceResults, "isEqual:"))
      goto LABEL_178;
  }
  videoSegmentCaptionResults = self->_videoSegmentCaptionResults;
  if ((unint64_t)videoSegmentCaptionResults | *((_QWORD *)v4 + 85))
    v83 = -[NSMutableArray isEqual:](videoSegmentCaptionResults, "isEqual:");
  else
    v83 = 1;
LABEL_179:

  return v83;
}

- (unint64_t)hash
{
  double date;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  double quality;
  double v10;
  long double v11;
  double v12;
  double assetModificationDate;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSUInteger v95;
  NSUInteger v96;
  unint64_t v97;
  NSUInteger v98;
  unint64_t v99;
  unint64_t v100;
  unsigned int flags;
  unsigned int types;
  unsigned int version;

  version = self->_version;
  types = self->_types;
  flags = self->_flags;
  date = self->_date;
  v4 = -date;
  if (date >= 0.0)
    v4 = self->_date;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  v100 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    quality = self->_quality;
    v10 = -quality;
    if (quality >= 0.0)
      v10 = self->_quality;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v99 = v8;
  v98 = -[NSString hash](self->_assetIdentifier, "hash");
  assetModificationDate = self->_assetModificationDate;
  v14 = -assetModificationDate;
  if (assetModificationDate >= 0.0)
    v14 = self->_assetModificationDate;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  v97 = v17;
  v96 = -[NSString hash](self->_assetMasterFingerprint, "hash");
  v95 = -[NSString hash](self->_assetAdjustedFingerprint, "hash");
  v94 = -[NSMutableArray hash](self->_imageBlurResults, "hash");
  v93 = -[NSMutableArray hash](self->_imageCompositionResults, "hash");
  v92 = -[NSMutableArray hash](self->_imageFaceResults, "hash");
  v91 = -[NSMutableArray hash](self->_imageFeatureResults, "hash");
  v90 = -[NSMutableArray hash](self->_imageJunkResults, "hash");
  v89 = -[NSMutableArray hash](self->_imageSaliencyResults, "hash");
  v88 = -[NSMutableArray hash](self->_imageShotTypeResults, "hash");
  v87 = -[NSMutableArray hash](self->_livePhotoRecommendationResults, "hash");
  v86 = -[NSMutableArray hash](self->_livePhotoSharpnessResults, "hash");
  v85 = -[NSMutableArray hash](self->_movieActivityLevelResults, "hash");
  v84 = -[NSMutableArray hash](self->_movieCameraMotionResults, "hash");
  v83 = -[NSMutableArray hash](self->_movieClassificationResults, "hash");
  v82 = -[NSMutableArray hash](self->_movieFaceResults, "hash");
  v81 = -[NSMutableArray hash](self->_movieFaceprintResults, "hash");
  v80 = -[NSMutableArray hash](self->_movieFeatureResults, "hash");
  v79 = -[NSMutableArray hash](self->_movieFineSubjectMotionResults, "hash");
  v78 = -[NSMutableArray hash](self->_movieInterestingnessResults, "hash");
  v77 = -[NSMutableArray hash](self->_movieMovingObjectResults, "hash");
  v76 = -[NSMutableArray hash](self->_movieMusicResults, "hash");
  v75 = -[NSMutableArray hash](self->_movieObstructionResults, "hash");
  v74 = -[NSMutableArray hash](self->_movieOrientationResults, "hash");
  v73 = -[NSMutableArray hash](self->_moviePreEncodeResults, "hash");
  v72 = -[NSMutableArray hash](self->_movieQualityResults, "hash");
  v71 = -[NSMutableArray hash](self->_movieSaliencyResults, "hash");
  v70 = -[NSMutableArray hash](self->_movieSceneResults, "hash");
  v69 = -[NSMutableArray hash](self->_movieSubjectMotionResults, "hash");
  v68 = -[NSMutableArray hash](self->_movieUtteranceResults, "hash");
  v66 = -[NSMutableArray hash](self->_movieVoiceResults, "hash");
  v64 = -[NSMutableArray hash](self->_imagePetsResults, "hash");
  v62 = -[NSMutableArray hash](self->_movieSummaryResults, "hash");
  v61 = -[NSMutableArray hash](self->_movieHighlightResults, "hash");
  v67 = -[NSMutableArray hash](self->_imageExposureResults, "hash");
  v65 = -[NSMutableArray hash](self->_livePhotoEffectsResults, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v63 = 2654435761u * self->_statsFlags;
  else
    v63 = 0;
  v60 = -[NSMutableArray hash](self->_imagePetsFaceResults, "hash");
  v59 = -[NSMutableArray hash](self->_imageSceneprintResults, "hash");
  v58 = -[NSMutableArray hash](self->_movieSceneprintResults, "hash");
  v57 = -[NSMutableArray hash](self->_imageHumanPoseResults, "hash");
  v56 = -[NSMutableArray hash](self->_movieHumanPoseResults, "hash");
  v55 = -[NSMutableArray hash](self->_movieApplauseResults, "hash");
  v54 = -[NSMutableArray hash](self->_movieBabbleResults, "hash");
  v53 = -[NSMutableArray hash](self->_movieCheeringResults, "hash");
  v18 = -[NSMutableArray hash](self->_movieLaughterResults, "hash");
  v19 = -[NSMutableArray hash](self->_livePhotoKeyFrameResults, "hash");
  v20 = -[NSMutableArray hash](self->_livePhotoKeyFrameStillResults, "hash");
  v21 = -[NSMutableArray hash](self->_movieHumanActionResults, "hash");
  v22 = -[NSMutableArray hash](self->_movieSubtleMotionResults, "hash");
  v23 = -[NSMutableArray hash](self->_movieLoudnessResults, "hash");
  v24 = -[NSMutableArray hash](self->_moviePetsResults, "hash");
  v25 = -[NSMutableArray hash](self->_moviePetsFaceResults, "hash");
  v26 = -[NSMutableArray hash](self->_movieStabilizationResults, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v27 = 2654435761u * self->_typesWide;
  else
    v27 = 0;
  v28 = v68 ^ v66 ^ v64 ^ v62 ^ v61 ^ v67 ^ v65 ^ v63 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ -[NSMutableArray hash](self->_movieHighlightScoreResults, "hash");
  v29 = v28 ^ -[NSMutableArray hash](self->_livePhotoHumanActionClassificationResults, "hash");
  v30 = (2654435761 * types) ^ (2654435761 * version) ^ v99 ^ v98 ^ v97 ^ (2654435761 * flags) ^ v100 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v29 ^ -[NSMutableArray hash](self->_movieAudioQualityResults, "hash");
  v31 = -[NSMutableArray hash](self->_movieSafetyResults, "hash");
  v32 = v31 ^ -[NSMutableArray hash](self->_filesystemMovieClassificationResults, "hash");
  v33 = v32 ^ -[NSMutableArray hash](self->_filesystemMovieHumanActionClassificationResults, "hash");
  v34 = v33 ^ -[NSMutableArray hash](self->_filesystemMovieApplauseResults, "hash");
  v35 = v34 ^ -[NSMutableArray hash](self->_filesystemMovieBabbleResults, "hash");
  v36 = v35 ^ -[NSMutableArray hash](self->_filesystemMovieCheeringResults, "hash");
  v37 = v36 ^ -[NSMutableArray hash](self->_filesystemMovieLaughterResults, "hash");
  v38 = v37 ^ -[NSMutableArray hash](self->_filesystemMovieMusicResults, "hash");
  v39 = v38 ^ -[NSMutableArray hash](self->_filesystemMovieVoiceResults, "hash");
  v40 = v39 ^ -[NSMutableArray hash](self->_animatedStickerResults, "hash");
  v41 = v40 ^ -[NSMutableArray hash](self->_livePhotoSettlingEffectGatingResults, "hash");
  v42 = v41 ^ -[NSString hash](self->_assetCloudIdentifier, "hash");
  v43 = v42 ^ -[NSMutableArray hash](self->_movieTorsoResults, "hash");
  v44 = v43 ^ -[NSMutableArray hash](self->_movieHumanActionClassificationResults, "hash");
  v45 = v44 ^ -[NSMutableArray hash](self->_videoEmbeddingResults, "hash");
  v46 = v45 ^ -[NSMutableArray hash](self->_summarizedEmbeddingResults, "hash");
  v47 = v46 ^ -[NSMutableArray hash](self->_audioFusedVideoEmbeddingResults, "hash");
  v48 = v47 ^ -[NSMutableArray hash](self->_imageEmbeddingResults, "hash");
  v49 = v48 ^ -[NSMutableArray hash](self->_imageCaptionResults, "hash");
  v50 = v49 ^ -[NSMutableArray hash](self->_videoCaptionResults, "hash");
  v51 = v50 ^ -[NSMutableArray hash](self->_videoCaptionPreferenceResults, "hash");
  return v30 ^ v51 ^ -[NSMutableArray hash](self->_videoSegmentCaptionResults, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t mm;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t nn;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i1;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i2;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i3;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i4;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i5;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i6;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i7;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i8;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i9;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i10;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i11;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i12;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t i13;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t i14;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t i15;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t i16;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i17;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i18;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t i19;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t i20;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i21;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t i22;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t i23;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t i24;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t i25;
  id v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t i26;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t i27;
  id v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t i28;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t i29;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t i30;
  id v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t i31;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t i32;
  id v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t i33;
  id v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t i34;
  id v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t i35;
  id v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t i36;
  id v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t i37;
  id v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t i38;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t i39;
  id v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t i40;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t i41;
  id v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t i42;
  id v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t i43;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t i44;
  id v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t i45;
  id v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t i46;
  id v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t i47;
  id v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t i48;
  id v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t i49;
  id v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t i50;
  id v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t i51;
  id v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t i52;
  id v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t i53;
  id v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t i54;
  id v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t i55;
  id v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t i56;
  id v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t i57;
  id v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t i58;
  id v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t i59;
  id v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t i60;
  id v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t i61;
  id v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t i62;
  id v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t i63;
  id v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t i64;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  __int128 v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  _BYTE v672[128];
  _BYTE v673[128];
  _BYTE v674[128];
  _BYTE v675[128];
  _BYTE v676[128];
  _BYTE v677[128];
  _BYTE v678[128];
  _BYTE v679[128];
  _BYTE v680[128];
  _BYTE v681[128];
  _BYTE v682[128];
  _BYTE v683[128];
  _BYTE v684[128];
  _BYTE v685[128];
  _BYTE v686[128];
  _BYTE v687[128];
  _BYTE v688[128];
  _BYTE v689[128];
  _BYTE v690[128];
  _BYTE v691[128];
  _BYTE v692[128];
  _BYTE v693[128];
  _BYTE v694[128];
  _BYTE v695[128];
  _BYTE v696[128];
  _BYTE v697[128];
  _BYTE v698[128];
  _BYTE v699[128];
  _BYTE v700[128];
  _BYTE v701[128];
  _BYTE v702[128];
  _BYTE v703[128];
  _BYTE v704[128];
  _BYTE v705[128];
  _BYTE v706[128];
  _BYTE v707[128];
  _BYTE v708[128];
  _BYTE v709[128];
  _BYTE v710[128];
  _BYTE v711[128];
  _BYTE v712[128];
  _BYTE v713[128];
  _BYTE v714[128];
  _BYTE v715[128];
  _BYTE v716[128];
  _BYTE v717[128];
  _BYTE v718[128];
  _BYTE v719[128];
  _BYTE v720[128];
  _BYTE v721[128];
  _BYTE v722[128];
  _BYTE v723[128];
  _BYTE v724[128];
  _BYTE v725[128];
  _BYTE v726[128];
  _BYTE v727[128];
  _BYTE v728[128];
  _BYTE v729[128];
  _BYTE v730[128];
  _BYTE v731[128];
  _BYTE v732[128];
  _BYTE v733[128];
  _BYTE v734[128];
  _BYTE v735[128];
  _BYTE v736[128];
  _BYTE v737[128];
  _BYTE v738[128];
  _BYTE v739[128];
  _BYTE v740[128];
  _BYTE v741[128];
  _BYTE v742[128];
  _BYTE v743[128];
  _BYTE v744[128];
  _BYTE v745[128];
  uint64_t v746;

  v746 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  self->_version = *((_DWORD *)v4 + 163);
  self->_types = *((_DWORD *)v4 + 162);
  self->_flags = *((_DWORD *)v4 + 40);
  self->_date = *((double *)v4 + 2);
  if ((*((_BYTE *)v4 + 688) & 1) != 0)
  {
    self->_quality = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
    -[VCPProtoAssetAnalysis setAssetIdentifier:](self, "setAssetIdentifier:");
  self->_assetModificationDate = *((double *)v5 + 1);
  if (*((_QWORD *)v5 + 10))
    -[VCPProtoAssetAnalysis setAssetMasterFingerprint:](self, "setAssetMasterFingerprint:");
  if (*((_QWORD *)v5 + 7))
    -[VCPProtoAssetAnalysis setAssetAdjustedFingerprint:](self, "setAssetAdjustedFingerprint:");
  v671 = 0u;
  v670 = 0u;
  v669 = 0u;
  v668 = 0u;
  v6 = *((id *)v5 + 21);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v668, v745, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v669;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v669 != v9)
          objc_enumerationMutation(v6);
        -[VCPProtoAssetAnalysis addImageBlurResults:](self, "addImageBlurResults:", *(_QWORD *)(*((_QWORD *)&v668 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v668, v745, 16);
    }
    while (v8);
  }

  v667 = 0u;
  v666 = 0u;
  v665 = 0u;
  v664 = 0u;
  v11 = *((id *)v5 + 23);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v664, v744, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v665;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v665 != v14)
          objc_enumerationMutation(v11);
        -[VCPProtoAssetAnalysis addImageCompositionResults:](self, "addImageCompositionResults:", *(_QWORD *)(*((_QWORD *)&v664 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v664, v744, 16);
    }
    while (v13);
  }

  v663 = 0u;
  v662 = 0u;
  v661 = 0u;
  v660 = 0u;
  v16 = *((id *)v5 + 26);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v660, v743, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v661;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v661 != v19)
          objc_enumerationMutation(v16);
        -[VCPProtoAssetAnalysis addImageFaceResults:](self, "addImageFaceResults:", *(_QWORD *)(*((_QWORD *)&v660 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v660, v743, 16);
    }
    while (v18);
  }

  v659 = 0u;
  v658 = 0u;
  v657 = 0u;
  v656 = 0u;
  v21 = *((id *)v5 + 27);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v656, v742, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v657;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v657 != v24)
          objc_enumerationMutation(v21);
        -[VCPProtoAssetAnalysis addImageFeatureResults:](self, "addImageFeatureResults:", *(_QWORD *)(*((_QWORD *)&v656 + 1) + 8 * m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v656, v742, 16);
    }
    while (v23);
  }

  v655 = 0u;
  v654 = 0u;
  v653 = 0u;
  v652 = 0u;
  v26 = *((id *)v5 + 29);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v652, v741, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v653;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v653 != v29)
          objc_enumerationMutation(v26);
        -[VCPProtoAssetAnalysis addImageJunkResults:](self, "addImageJunkResults:", *(_QWORD *)(*((_QWORD *)&v652 + 1) + 8 * n));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v652, v741, 16);
    }
    while (v28);
  }

  v651 = 0u;
  v650 = 0u;
  v649 = 0u;
  v648 = 0u;
  v31 = *((id *)v5 + 32);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v648, v740, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v649;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v649 != v34)
          objc_enumerationMutation(v31);
        -[VCPProtoAssetAnalysis addImageSaliencyResults:](self, "addImageSaliencyResults:", *(_QWORD *)(*((_QWORD *)&v648 + 1) + 8 * ii));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v648, v740, 16);
    }
    while (v33);
  }

  v647 = 0u;
  v646 = 0u;
  v645 = 0u;
  v644 = 0u;
  v36 = *((id *)v5 + 34);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v644, v739, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v645;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v645 != v39)
          objc_enumerationMutation(v36);
        -[VCPProtoAssetAnalysis addImageShotTypeResults:](self, "addImageShotTypeResults:", *(_QWORD *)(*((_QWORD *)&v644 + 1) + 8 * jj));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v644, v739, 16);
    }
    while (v38);
  }

  v643 = 0u;
  v642 = 0u;
  v641 = 0u;
  v640 = 0u;
  v41 = *((id *)v5 + 39);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v640, v738, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v641;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v641 != v44)
          objc_enumerationMutation(v41);
        -[VCPProtoAssetAnalysis addLivePhotoRecommendationResults:](self, "addLivePhotoRecommendationResults:", *(_QWORD *)(*((_QWORD *)&v640 + 1) + 8 * kk));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v640, v738, 16);
    }
    while (v43);
  }

  v639 = 0u;
  v638 = 0u;
  v637 = 0u;
  v636 = 0u;
  v46 = *((id *)v5 + 41);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v636, v737, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v637;
    do
    {
      for (mm = 0; mm != v48; ++mm)
      {
        if (*(_QWORD *)v637 != v49)
          objc_enumerationMutation(v46);
        -[VCPProtoAssetAnalysis addLivePhotoSharpnessResults:](self, "addLivePhotoSharpnessResults:", *(_QWORD *)(*((_QWORD *)&v636 + 1) + 8 * mm));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v636, v737, 16);
    }
    while (v48);
  }

  v635 = 0u;
  v634 = 0u;
  v633 = 0u;
  v632 = 0u;
  v51 = *((id *)v5 + 42);
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v632, v736, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v633;
    do
    {
      for (nn = 0; nn != v53; ++nn)
      {
        if (*(_QWORD *)v633 != v54)
          objc_enumerationMutation(v51);
        -[VCPProtoAssetAnalysis addMovieActivityLevelResults:](self, "addMovieActivityLevelResults:", *(_QWORD *)(*((_QWORD *)&v632 + 1) + 8 * nn));
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v632, v736, 16);
    }
    while (v53);
  }

  v631 = 0u;
  v630 = 0u;
  v629 = 0u;
  v628 = 0u;
  v56 = *((id *)v5 + 46);
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v628, v735, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v629;
    do
    {
      for (i1 = 0; i1 != v58; ++i1)
      {
        if (*(_QWORD *)v629 != v59)
          objc_enumerationMutation(v56);
        -[VCPProtoAssetAnalysis addMovieCameraMotionResults:](self, "addMovieCameraMotionResults:", *(_QWORD *)(*((_QWORD *)&v628 + 1) + 8 * i1));
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v628, v735, 16);
    }
    while (v58);
  }

  v627 = 0u;
  v626 = 0u;
  v625 = 0u;
  v624 = 0u;
  v61 = *((id *)v5 + 48);
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v624, v734, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v625;
    do
    {
      for (i2 = 0; i2 != v63; ++i2)
      {
        if (*(_QWORD *)v625 != v64)
          objc_enumerationMutation(v61);
        -[VCPProtoAssetAnalysis addMovieClassificationResults:](self, "addMovieClassificationResults:", *(_QWORD *)(*((_QWORD *)&v624 + 1) + 8 * i2));
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v624, v734, 16);
    }
    while (v63);
  }

  v623 = 0u;
  v622 = 0u;
  v621 = 0u;
  v620 = 0u;
  v66 = *((id *)v5 + 49);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v620, v733, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v621;
    do
    {
      for (i3 = 0; i3 != v68; ++i3)
      {
        if (*(_QWORD *)v621 != v69)
          objc_enumerationMutation(v66);
        -[VCPProtoAssetAnalysis addMovieFaceResults:](self, "addMovieFaceResults:", *(_QWORD *)(*((_QWORD *)&v620 + 1) + 8 * i3));
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v620, v733, 16);
    }
    while (v68);
  }

  v619 = 0u;
  v618 = 0u;
  v617 = 0u;
  v616 = 0u;
  v71 = *((id *)v5 + 50);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v616, v732, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v617;
    do
    {
      for (i4 = 0; i4 != v73; ++i4)
      {
        if (*(_QWORD *)v617 != v74)
          objc_enumerationMutation(v71);
        -[VCPProtoAssetAnalysis addMovieFaceprintResults:](self, "addMovieFaceprintResults:", *(_QWORD *)(*((_QWORD *)&v616 + 1) + 8 * i4));
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v616, v732, 16);
    }
    while (v73);
  }

  v615 = 0u;
  v614 = 0u;
  v613 = 0u;
  v612 = 0u;
  v76 = *((id *)v5 + 51);
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v612, v731, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v613;
    do
    {
      for (i5 = 0; i5 != v78; ++i5)
      {
        if (*(_QWORD *)v613 != v79)
          objc_enumerationMutation(v76);
        -[VCPProtoAssetAnalysis addMovieFeatureResults:](self, "addMovieFeatureResults:", *(_QWORD *)(*((_QWORD *)&v612 + 1) + 8 * i5));
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v612, v731, 16);
    }
    while (v78);
  }

  v611 = 0u;
  v610 = 0u;
  v609 = 0u;
  v608 = 0u;
  v81 = *((id *)v5 + 52);
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v608, v730, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v609;
    do
    {
      for (i6 = 0; i6 != v83; ++i6)
      {
        if (*(_QWORD *)v609 != v84)
          objc_enumerationMutation(v81);
        -[VCPProtoAssetAnalysis addMovieFineSubjectMotionResults:](self, "addMovieFineSubjectMotionResults:", *(_QWORD *)(*((_QWORD *)&v608 + 1) + 8 * i6));
      }
      v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v608, v730, 16);
    }
    while (v83);
  }

  v607 = 0u;
  v606 = 0u;
  v605 = 0u;
  v604 = 0u;
  v86 = *((id *)v5 + 58);
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v604, v729, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v605;
    do
    {
      for (i7 = 0; i7 != v88; ++i7)
      {
        if (*(_QWORD *)v605 != v89)
          objc_enumerationMutation(v86);
        -[VCPProtoAssetAnalysis addMovieInterestingnessResults:](self, "addMovieInterestingnessResults:", *(_QWORD *)(*((_QWORD *)&v604 + 1) + 8 * i7));
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v604, v729, 16);
    }
    while (v88);
  }

  v603 = 0u;
  v602 = 0u;
  v601 = 0u;
  v600 = 0u;
  v91 = *((id *)v5 + 61);
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v600, v728, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v601;
    do
    {
      for (i8 = 0; i8 != v93; ++i8)
      {
        if (*(_QWORD *)v601 != v94)
          objc_enumerationMutation(v91);
        -[VCPProtoAssetAnalysis addMovieMovingObjectResults:](self, "addMovieMovingObjectResults:", *(_QWORD *)(*((_QWORD *)&v600 + 1) + 8 * i8));
      }
      v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v600, v728, 16);
    }
    while (v93);
  }

  v599 = 0u;
  v598 = 0u;
  v597 = 0u;
  v596 = 0u;
  v96 = *((id *)v5 + 62);
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v596, v727, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v597;
    do
    {
      for (i9 = 0; i9 != v98; ++i9)
      {
        if (*(_QWORD *)v597 != v99)
          objc_enumerationMutation(v96);
        -[VCPProtoAssetAnalysis addMovieMusicResults:](self, "addMovieMusicResults:", *(_QWORD *)(*((_QWORD *)&v596 + 1) + 8 * i9));
      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v596, v727, 16);
    }
    while (v98);
  }

  v595 = 0u;
  v594 = 0u;
  v593 = 0u;
  v592 = 0u;
  v101 = *((id *)v5 + 63);
  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v592, v726, 16);
  if (v102)
  {
    v103 = v102;
    v104 = *(_QWORD *)v593;
    do
    {
      for (i10 = 0; i10 != v103; ++i10)
      {
        if (*(_QWORD *)v593 != v104)
          objc_enumerationMutation(v101);
        -[VCPProtoAssetAnalysis addMovieObstructionResults:](self, "addMovieObstructionResults:", *(_QWORD *)(*((_QWORD *)&v592 + 1) + 8 * i10));
      }
      v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v592, v726, 16);
    }
    while (v103);
  }

  v591 = 0u;
  v590 = 0u;
  v589 = 0u;
  v588 = 0u;
  v106 = *((id *)v5 + 64);
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v588, v725, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v589;
    do
    {
      for (i11 = 0; i11 != v108; ++i11)
      {
        if (*(_QWORD *)v589 != v109)
          objc_enumerationMutation(v106);
        -[VCPProtoAssetAnalysis addMovieOrientationResults:](self, "addMovieOrientationResults:", *(_QWORD *)(*((_QWORD *)&v588 + 1) + 8 * i11));
      }
      v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v588, v725, 16);
    }
    while (v108);
  }

  v587 = 0u;
  v586 = 0u;
  v585 = 0u;
  v584 = 0u;
  v111 = *((id *)v5 + 67);
  v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v584, v724, 16);
  if (v112)
  {
    v113 = v112;
    v114 = *(_QWORD *)v585;
    do
    {
      for (i12 = 0; i12 != v113; ++i12)
      {
        if (*(_QWORD *)v585 != v114)
          objc_enumerationMutation(v111);
        -[VCPProtoAssetAnalysis addMoviePreEncodeResults:](self, "addMoviePreEncodeResults:", *(_QWORD *)(*((_QWORD *)&v584 + 1) + 8 * i12));
      }
      v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v584, v724, 16);
    }
    while (v113);
  }

  v583 = 0u;
  v582 = 0u;
  v581 = 0u;
  v580 = 0u;
  v116 = *((id *)v5 + 68);
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v580, v723, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v581;
    do
    {
      for (i13 = 0; i13 != v118; ++i13)
      {
        if (*(_QWORD *)v581 != v119)
          objc_enumerationMutation(v116);
        -[VCPProtoAssetAnalysis addMovieQualityResults:](self, "addMovieQualityResults:", *(_QWORD *)(*((_QWORD *)&v580 + 1) + 8 * i13));
      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v580, v723, 16);
    }
    while (v118);
  }

  v579 = 0u;
  v578 = 0u;
  v577 = 0u;
  v576 = 0u;
  v121 = *((id *)v5 + 70);
  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v576, v722, 16);
  if (v122)
  {
    v123 = v122;
    v124 = *(_QWORD *)v577;
    do
    {
      for (i14 = 0; i14 != v123; ++i14)
      {
        if (*(_QWORD *)v577 != v124)
          objc_enumerationMutation(v121);
        -[VCPProtoAssetAnalysis addMovieSaliencyResults:](self, "addMovieSaliencyResults:", *(_QWORD *)(*((_QWORD *)&v576 + 1) + 8 * i14));
      }
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v576, v722, 16);
    }
    while (v123);
  }

  v575 = 0u;
  v574 = 0u;
  v573 = 0u;
  v572 = 0u;
  v126 = *((id *)v5 + 71);
  v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v572, v721, 16);
  if (v127)
  {
    v128 = v127;
    v129 = *(_QWORD *)v573;
    do
    {
      for (i15 = 0; i15 != v128; ++i15)
      {
        if (*(_QWORD *)v573 != v129)
          objc_enumerationMutation(v126);
        -[VCPProtoAssetAnalysis addMovieSceneResults:](self, "addMovieSceneResults:", *(_QWORD *)(*((_QWORD *)&v572 + 1) + 8 * i15));
      }
      v128 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v572, v721, 16);
    }
    while (v128);
  }

  v571 = 0u;
  v570 = 0u;
  v569 = 0u;
  v568 = 0u;
  v131 = *((id *)v5 + 74);
  v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v568, v720, 16);
  if (v132)
  {
    v133 = v132;
    v134 = *(_QWORD *)v569;
    do
    {
      for (i16 = 0; i16 != v133; ++i16)
      {
        if (*(_QWORD *)v569 != v134)
          objc_enumerationMutation(v131);
        -[VCPProtoAssetAnalysis addMovieSubjectMotionResults:](self, "addMovieSubjectMotionResults:", *(_QWORD *)(*((_QWORD *)&v568 + 1) + 8 * i16));
      }
      v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v568, v720, 16);
    }
    while (v133);
  }

  v567 = 0u;
  v566 = 0u;
  v565 = 0u;
  v564 = 0u;
  v136 = *((id *)v5 + 78);
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v564, v719, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v565;
    do
    {
      for (i17 = 0; i17 != v138; ++i17)
      {
        if (*(_QWORD *)v565 != v139)
          objc_enumerationMutation(v136);
        -[VCPProtoAssetAnalysis addMovieUtteranceResults:](self, "addMovieUtteranceResults:", *(_QWORD *)(*((_QWORD *)&v564 + 1) + 8 * i17));
      }
      v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v564, v719, 16);
    }
    while (v138);
  }

  v563 = 0u;
  v562 = 0u;
  v561 = 0u;
  v560 = 0u;
  v141 = *((id *)v5 + 79);
  v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v560, v718, 16);
  if (v142)
  {
    v143 = v142;
    v144 = *(_QWORD *)v561;
    do
    {
      for (i18 = 0; i18 != v143; ++i18)
      {
        if (*(_QWORD *)v561 != v144)
          objc_enumerationMutation(v141);
        -[VCPProtoAssetAnalysis addMovieVoiceResults:](self, "addMovieVoiceResults:", *(_QWORD *)(*((_QWORD *)&v560 + 1) + 8 * i18));
      }
      v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v560, v718, 16);
    }
    while (v143);
  }

  v559 = 0u;
  v558 = 0u;
  v557 = 0u;
  v556 = 0u;
  v146 = *((id *)v5 + 31);
  v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v556, v717, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v557;
    do
    {
      for (i19 = 0; i19 != v148; ++i19)
      {
        if (*(_QWORD *)v557 != v149)
          objc_enumerationMutation(v146);
        -[VCPProtoAssetAnalysis addImagePetsResults:](self, "addImagePetsResults:", *(_QWORD *)(*((_QWORD *)&v556 + 1) + 8 * i19));
      }
      v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v556, v717, 16);
    }
    while (v148);
  }

  v555 = 0u;
  v554 = 0u;
  v553 = 0u;
  v552 = 0u;
  v151 = *((id *)v5 + 76);
  v152 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v552, v716, 16);
  if (v152)
  {
    v153 = v152;
    v154 = *(_QWORD *)v553;
    do
    {
      for (i20 = 0; i20 != v153; ++i20)
      {
        if (*(_QWORD *)v553 != v154)
          objc_enumerationMutation(v151);
        -[VCPProtoAssetAnalysis addMovieSummaryResults:](self, "addMovieSummaryResults:", *(_QWORD *)(*((_QWORD *)&v552 + 1) + 8 * i20));
      }
      v153 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v552, v716, 16);
    }
    while (v153);
  }

  v551 = 0u;
  v550 = 0u;
  v549 = 0u;
  v548 = 0u;
  v156 = *((id *)v5 + 53);
  v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v548, v715, 16);
  if (v157)
  {
    v158 = v157;
    v159 = *(_QWORD *)v549;
    do
    {
      for (i21 = 0; i21 != v158; ++i21)
      {
        if (*(_QWORD *)v549 != v159)
          objc_enumerationMutation(v156);
        -[VCPProtoAssetAnalysis addMovieHighlightResults:](self, "addMovieHighlightResults:", *(_QWORD *)(*((_QWORD *)&v548 + 1) + 8 * i21));
      }
      v158 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v548, v715, 16);
    }
    while (v158);
  }

  v547 = 0u;
  v546 = 0u;
  v545 = 0u;
  v544 = 0u;
  v161 = *((id *)v5 + 25);
  v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v544, v714, 16);
  if (v162)
  {
    v163 = v162;
    v164 = *(_QWORD *)v545;
    do
    {
      for (i22 = 0; i22 != v163; ++i22)
      {
        if (*(_QWORD *)v545 != v164)
          objc_enumerationMutation(v161);
        -[VCPProtoAssetAnalysis addImageExposureResults:](self, "addImageExposureResults:", *(_QWORD *)(*((_QWORD *)&v544 + 1) + 8 * i22));
      }
      v163 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v544, v714, 16);
    }
    while (v163);
  }

  v543 = 0u;
  v542 = 0u;
  v541 = 0u;
  v540 = 0u;
  v166 = *((id *)v5 + 35);
  v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v540, v713, 16);
  if (v167)
  {
    v168 = v167;
    v169 = *(_QWORD *)v541;
    do
    {
      for (i23 = 0; i23 != v168; ++i23)
      {
        if (*(_QWORD *)v541 != v169)
          objc_enumerationMutation(v166);
        -[VCPProtoAssetAnalysis addLivePhotoEffectsResults:](self, "addLivePhotoEffectsResults:", *(_QWORD *)(*((_QWORD *)&v540 + 1) + 8 * i23));
      }
      v168 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v540, v713, 16);
    }
    while (v168);
  }

  if ((*((_BYTE *)v5 + 688) & 2) != 0)
  {
    self->_statsFlags = *((_QWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  v539 = 0u;
  v538 = 0u;
  v537 = 0u;
  v536 = 0u;
  v171 = *((id *)v5 + 30);
  v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v536, v712, 16);
  if (v172)
  {
    v173 = v172;
    v174 = *(_QWORD *)v537;
    do
    {
      for (i24 = 0; i24 != v173; ++i24)
      {
        if (*(_QWORD *)v537 != v174)
          objc_enumerationMutation(v171);
        -[VCPProtoAssetAnalysis addImagePetsFaceResults:](self, "addImagePetsFaceResults:", *(_QWORD *)(*((_QWORD *)&v536 + 1) + 8 * i24));
      }
      v173 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v536, v712, 16);
    }
    while (v173);
  }

  v535 = 0u;
  v534 = 0u;
  v533 = 0u;
  v532 = 0u;
  v176 = *((id *)v5 + 33);
  v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v532, v711, 16);
  if (v177)
  {
    v178 = v177;
    v179 = *(_QWORD *)v533;
    do
    {
      for (i25 = 0; i25 != v178; ++i25)
      {
        if (*(_QWORD *)v533 != v179)
          objc_enumerationMutation(v176);
        -[VCPProtoAssetAnalysis addImageSceneprintResults:](self, "addImageSceneprintResults:", *(_QWORD *)(*((_QWORD *)&v532 + 1) + 8 * i25));
      }
      v178 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v532, v711, 16);
    }
    while (v178);
  }

  v531 = 0u;
  v530 = 0u;
  v529 = 0u;
  v528 = 0u;
  v181 = *((id *)v5 + 72);
  v182 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v528, v710, 16);
  if (v182)
  {
    v183 = v182;
    v184 = *(_QWORD *)v529;
    do
    {
      for (i26 = 0; i26 != v183; ++i26)
      {
        if (*(_QWORD *)v529 != v184)
          objc_enumerationMutation(v181);
        -[VCPProtoAssetAnalysis addMovieSceneprintResults:](self, "addMovieSceneprintResults:", *(_QWORD *)(*((_QWORD *)&v528 + 1) + 8 * i26));
      }
      v183 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v528, v710, 16);
    }
    while (v183);
  }

  v527 = 0u;
  v526 = 0u;
  v525 = 0u;
  v524 = 0u;
  v186 = *((id *)v5 + 28);
  v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v524, v709, 16);
  if (v187)
  {
    v188 = v187;
    v189 = *(_QWORD *)v525;
    do
    {
      for (i27 = 0; i27 != v188; ++i27)
      {
        if (*(_QWORD *)v525 != v189)
          objc_enumerationMutation(v186);
        -[VCPProtoAssetAnalysis addImageHumanPoseResults:](self, "addImageHumanPoseResults:", *(_QWORD *)(*((_QWORD *)&v524 + 1) + 8 * i27));
      }
      v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v524, v709, 16);
    }
    while (v188);
  }

  v523 = 0u;
  v522 = 0u;
  v521 = 0u;
  v520 = 0u;
  v191 = *((id *)v5 + 57);
  v192 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v520, v708, 16);
  if (v192)
  {
    v193 = v192;
    v194 = *(_QWORD *)v521;
    do
    {
      for (i28 = 0; i28 != v193; ++i28)
      {
        if (*(_QWORD *)v521 != v194)
          objc_enumerationMutation(v191);
        -[VCPProtoAssetAnalysis addMovieHumanPoseResults:](self, "addMovieHumanPoseResults:", *(_QWORD *)(*((_QWORD *)&v520 + 1) + 8 * i28));
      }
      v193 = objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v520, v708, 16);
    }
    while (v193);
  }

  v519 = 0u;
  v518 = 0u;
  v517 = 0u;
  v516 = 0u;
  v196 = *((id *)v5 + 43);
  v197 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v516, v707, 16);
  if (v197)
  {
    v198 = v197;
    v199 = *(_QWORD *)v517;
    do
    {
      for (i29 = 0; i29 != v198; ++i29)
      {
        if (*(_QWORD *)v517 != v199)
          objc_enumerationMutation(v196);
        -[VCPProtoAssetAnalysis addMovieApplauseResults:](self, "addMovieApplauseResults:", *(_QWORD *)(*((_QWORD *)&v516 + 1) + 8 * i29));
      }
      v198 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v516, v707, 16);
    }
    while (v198);
  }

  v515 = 0u;
  v514 = 0u;
  v513 = 0u;
  v512 = 0u;
  v201 = *((id *)v5 + 45);
  v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v512, v706, 16);
  if (v202)
  {
    v203 = v202;
    v204 = *(_QWORD *)v513;
    do
    {
      for (i30 = 0; i30 != v203; ++i30)
      {
        if (*(_QWORD *)v513 != v204)
          objc_enumerationMutation(v201);
        -[VCPProtoAssetAnalysis addMovieBabbleResults:](self, "addMovieBabbleResults:", *(_QWORD *)(*((_QWORD *)&v512 + 1) + 8 * i30));
      }
      v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v512, v706, 16);
    }
    while (v203);
  }

  v511 = 0u;
  v510 = 0u;
  v509 = 0u;
  v508 = 0u;
  v206 = *((id *)v5 + 47);
  v207 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v508, v705, 16);
  if (v207)
  {
    v208 = v207;
    v209 = *(_QWORD *)v509;
    do
    {
      for (i31 = 0; i31 != v208; ++i31)
      {
        if (*(_QWORD *)v509 != v209)
          objc_enumerationMutation(v206);
        -[VCPProtoAssetAnalysis addMovieCheeringResults:](self, "addMovieCheeringResults:", *(_QWORD *)(*((_QWORD *)&v508 + 1) + 8 * i31));
      }
      v208 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v508, v705, 16);
    }
    while (v208);
  }

  v507 = 0u;
  v506 = 0u;
  v505 = 0u;
  v504 = 0u;
  v211 = *((id *)v5 + 59);
  v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v504, v704, 16);
  if (v212)
  {
    v213 = v212;
    v214 = *(_QWORD *)v505;
    do
    {
      for (i32 = 0; i32 != v213; ++i32)
      {
        if (*(_QWORD *)v505 != v214)
          objc_enumerationMutation(v211);
        -[VCPProtoAssetAnalysis addMovieLaughterResults:](self, "addMovieLaughterResults:", *(_QWORD *)(*((_QWORD *)&v504 + 1) + 8 * i32));
      }
      v213 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v504, v704, 16);
    }
    while (v213);
  }

  v503 = 0u;
  v502 = 0u;
  v501 = 0u;
  v500 = 0u;
  v216 = *((id *)v5 + 37);
  v217 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v500, v703, 16);
  if (v217)
  {
    v218 = v217;
    v219 = *(_QWORD *)v501;
    do
    {
      for (i33 = 0; i33 != v218; ++i33)
      {
        if (*(_QWORD *)v501 != v219)
          objc_enumerationMutation(v216);
        -[VCPProtoAssetAnalysis addLivePhotoKeyFrameResults:](self, "addLivePhotoKeyFrameResults:", *(_QWORD *)(*((_QWORD *)&v500 + 1) + 8 * i33));
      }
      v218 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v500, v703, 16);
    }
    while (v218);
  }

  v499 = 0u;
  v498 = 0u;
  v497 = 0u;
  v496 = 0u;
  v221 = *((id *)v5 + 38);
  v222 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v496, v702, 16);
  if (v222)
  {
    v223 = v222;
    v224 = *(_QWORD *)v497;
    do
    {
      for (i34 = 0; i34 != v223; ++i34)
      {
        if (*(_QWORD *)v497 != v224)
          objc_enumerationMutation(v221);
        -[VCPProtoAssetAnalysis addLivePhotoKeyFrameStillResults:](self, "addLivePhotoKeyFrameStillResults:", *(_QWORD *)(*((_QWORD *)&v496 + 1) + 8 * i34));
      }
      v223 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v496, v702, 16);
    }
    while (v223);
  }

  v495 = 0u;
  v494 = 0u;
  v493 = 0u;
  v492 = 0u;
  v226 = *((id *)v5 + 56);
  v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v492, v701, 16);
  if (v227)
  {
    v228 = v227;
    v229 = *(_QWORD *)v493;
    do
    {
      for (i35 = 0; i35 != v228; ++i35)
      {
        if (*(_QWORD *)v493 != v229)
          objc_enumerationMutation(v226);
        -[VCPProtoAssetAnalysis addMovieHumanActionResults:](self, "addMovieHumanActionResults:", *(_QWORD *)(*((_QWORD *)&v492 + 1) + 8 * i35));
      }
      v228 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v492, v701, 16);
    }
    while (v228);
  }

  v491 = 0u;
  v490 = 0u;
  v489 = 0u;
  v488 = 0u;
  v231 = *((id *)v5 + 75);
  v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v488, v700, 16);
  if (v232)
  {
    v233 = v232;
    v234 = *(_QWORD *)v489;
    do
    {
      for (i36 = 0; i36 != v233; ++i36)
      {
        if (*(_QWORD *)v489 != v234)
          objc_enumerationMutation(v231);
        -[VCPProtoAssetAnalysis addMovieSubtleMotionResults:](self, "addMovieSubtleMotionResults:", *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * i36));
      }
      v233 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v488, v700, 16);
    }
    while (v233);
  }

  v487 = 0u;
  v486 = 0u;
  v485 = 0u;
  v484 = 0u;
  v236 = *((id *)v5 + 60);
  v237 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v484, v699, 16);
  if (v237)
  {
    v238 = v237;
    v239 = *(_QWORD *)v485;
    do
    {
      for (i37 = 0; i37 != v238; ++i37)
      {
        if (*(_QWORD *)v485 != v239)
          objc_enumerationMutation(v236);
        -[VCPProtoAssetAnalysis addMovieLoudnessResults:](self, "addMovieLoudnessResults:", *(_QWORD *)(*((_QWORD *)&v484 + 1) + 8 * i37));
      }
      v238 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v484, v699, 16);
    }
    while (v238);
  }

  v483 = 0u;
  v482 = 0u;
  v481 = 0u;
  v480 = 0u;
  v241 = *((id *)v5 + 66);
  v242 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v480, v698, 16);
  if (v242)
  {
    v243 = v242;
    v244 = *(_QWORD *)v481;
    do
    {
      for (i38 = 0; i38 != v243; ++i38)
      {
        if (*(_QWORD *)v481 != v244)
          objc_enumerationMutation(v241);
        -[VCPProtoAssetAnalysis addMoviePetsResults:](self, "addMoviePetsResults:", *(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i38));
      }
      v243 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v480, v698, 16);
    }
    while (v243);
  }

  v479 = 0u;
  v478 = 0u;
  v477 = 0u;
  v476 = 0u;
  v246 = *((id *)v5 + 65);
  v247 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v476, v697, 16);
  if (v247)
  {
    v248 = v247;
    v249 = *(_QWORD *)v477;
    do
    {
      for (i39 = 0; i39 != v248; ++i39)
      {
        if (*(_QWORD *)v477 != v249)
          objc_enumerationMutation(v246);
        -[VCPProtoAssetAnalysis addMoviePetsFaceResults:](self, "addMoviePetsFaceResults:", *(_QWORD *)(*((_QWORD *)&v476 + 1) + 8 * i39));
      }
      v248 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v476, v697, 16);
    }
    while (v248);
  }

  v475 = 0u;
  v474 = 0u;
  v473 = 0u;
  v472 = 0u;
  v251 = *((id *)v5 + 73);
  v252 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v472, v696, 16);
  if (v252)
  {
    v253 = v252;
    v254 = *(_QWORD *)v473;
    do
    {
      for (i40 = 0; i40 != v253; ++i40)
      {
        if (*(_QWORD *)v473 != v254)
          objc_enumerationMutation(v251);
        -[VCPProtoAssetAnalysis addMovieStabilizationResults:](self, "addMovieStabilizationResults:", *(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * i40));
      }
      v253 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v472, v696, 16);
    }
    while (v253);
  }

  if ((*((_BYTE *)v5 + 688) & 4) != 0)
  {
    self->_typesWide = *((_QWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
  v471 = 0u;
  v470 = 0u;
  v469 = 0u;
  v468 = 0u;
  v256 = *((id *)v5 + 54);
  v257 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v468, v695, 16);
  if (v257)
  {
    v258 = v257;
    v259 = *(_QWORD *)v469;
    do
    {
      for (i41 = 0; i41 != v258; ++i41)
      {
        if (*(_QWORD *)v469 != v259)
          objc_enumerationMutation(v256);
        -[VCPProtoAssetAnalysis addMovieHighlightScoreResults:](self, "addMovieHighlightScoreResults:", *(_QWORD *)(*((_QWORD *)&v468 + 1) + 8 * i41));
      }
      v258 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v468, v695, 16);
    }
    while (v258);
  }

  v467 = 0u;
  v466 = 0u;
  v465 = 0u;
  v464 = 0u;
  v261 = *((id *)v5 + 36);
  v262 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v464, v694, 16);
  if (v262)
  {
    v263 = v262;
    v264 = *(_QWORD *)v465;
    do
    {
      for (i42 = 0; i42 != v263; ++i42)
      {
        if (*(_QWORD *)v465 != v264)
          objc_enumerationMutation(v261);
        -[VCPProtoAssetAnalysis addLivePhotoHumanActionClassificationResults:](self, "addLivePhotoHumanActionClassificationResults:", *(_QWORD *)(*((_QWORD *)&v464 + 1) + 8 * i42));
      }
      v263 = objc_msgSend(v261, "countByEnumeratingWithState:objects:count:", &v464, v694, 16);
    }
    while (v263);
  }

  v463 = 0u;
  v462 = 0u;
  v461 = 0u;
  v460 = 0u;
  v266 = *((id *)v5 + 44);
  v267 = objc_msgSend(v266, "countByEnumeratingWithState:objects:count:", &v460, v693, 16);
  if (v267)
  {
    v268 = v267;
    v269 = *(_QWORD *)v461;
    do
    {
      for (i43 = 0; i43 != v268; ++i43)
      {
        if (*(_QWORD *)v461 != v269)
          objc_enumerationMutation(v266);
        -[VCPProtoAssetAnalysis addMovieAudioQualityResults:](self, "addMovieAudioQualityResults:", *(_QWORD *)(*((_QWORD *)&v460 + 1) + 8 * i43));
      }
      v268 = objc_msgSend(v266, "countByEnumeratingWithState:objects:count:", &v460, v693, 16);
    }
    while (v268);
  }

  v459 = 0u;
  v458 = 0u;
  v457 = 0u;
  v456 = 0u;
  v271 = *((id *)v5 + 69);
  v272 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v456, v692, 16);
  if (v272)
  {
    v273 = v272;
    v274 = *(_QWORD *)v457;
    do
    {
      for (i44 = 0; i44 != v273; ++i44)
      {
        if (*(_QWORD *)v457 != v274)
          objc_enumerationMutation(v271);
        -[VCPProtoAssetAnalysis addMovieSafetyResults:](self, "addMovieSafetyResults:", *(_QWORD *)(*((_QWORD *)&v456 + 1) + 8 * i44));
      }
      v273 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v456, v692, 16);
    }
    while (v273);
  }

  v455 = 0u;
  v454 = 0u;
  v453 = 0u;
  v452 = 0u;
  v276 = *((id *)v5 + 15);
  v277 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v452, v691, 16);
  if (v277)
  {
    v278 = v277;
    v279 = *(_QWORD *)v453;
    do
    {
      for (i45 = 0; i45 != v278; ++i45)
      {
        if (*(_QWORD *)v453 != v279)
          objc_enumerationMutation(v276);
        -[VCPProtoAssetAnalysis addFilesystemMovieClassificationResults:](self, "addFilesystemMovieClassificationResults:", *(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * i45));
      }
      v278 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v452, v691, 16);
    }
    while (v278);
  }

  v451 = 0u;
  v450 = 0u;
  v449 = 0u;
  v448 = 0u;
  v281 = *((id *)v5 + 16);
  v282 = objc_msgSend(v281, "countByEnumeratingWithState:objects:count:", &v448, v690, 16);
  if (v282)
  {
    v283 = v282;
    v284 = *(_QWORD *)v449;
    do
    {
      for (i46 = 0; i46 != v283; ++i46)
      {
        if (*(_QWORD *)v449 != v284)
          objc_enumerationMutation(v281);
        -[VCPProtoAssetAnalysis addFilesystemMovieHumanActionClassificationResults:](self, "addFilesystemMovieHumanActionClassificationResults:", *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * i46));
      }
      v283 = objc_msgSend(v281, "countByEnumeratingWithState:objects:count:", &v448, v690, 16);
    }
    while (v283);
  }

  v447 = 0u;
  v446 = 0u;
  v445 = 0u;
  v444 = 0u;
  v286 = *((id *)v5 + 12);
  v287 = objc_msgSend(v286, "countByEnumeratingWithState:objects:count:", &v444, v689, 16);
  if (v287)
  {
    v288 = v287;
    v289 = *(_QWORD *)v445;
    do
    {
      for (i47 = 0; i47 != v288; ++i47)
      {
        if (*(_QWORD *)v445 != v289)
          objc_enumerationMutation(v286);
        -[VCPProtoAssetAnalysis addFilesystemMovieApplauseResults:](self, "addFilesystemMovieApplauseResults:", *(_QWORD *)(*((_QWORD *)&v444 + 1) + 8 * i47));
      }
      v288 = objc_msgSend(v286, "countByEnumeratingWithState:objects:count:", &v444, v689, 16);
    }
    while (v288);
  }

  v443 = 0u;
  v442 = 0u;
  v441 = 0u;
  v440 = 0u;
  v291 = *((id *)v5 + 13);
  v292 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v440, v688, 16);
  if (v292)
  {
    v293 = v292;
    v294 = *(_QWORD *)v441;
    do
    {
      for (i48 = 0; i48 != v293; ++i48)
      {
        if (*(_QWORD *)v441 != v294)
          objc_enumerationMutation(v291);
        -[VCPProtoAssetAnalysis addFilesystemMovieBabbleResults:](self, "addFilesystemMovieBabbleResults:", *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * i48));
      }
      v293 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v440, v688, 16);
    }
    while (v293);
  }

  v438 = 0u;
  v439 = 0u;
  v436 = 0u;
  v437 = 0u;
  v296 = *((id *)v5 + 14);
  v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v436, v687, 16);
  if (v297)
  {
    v298 = v297;
    v299 = *(_QWORD *)v437;
    do
    {
      for (i49 = 0; i49 != v298; ++i49)
      {
        if (*(_QWORD *)v437 != v299)
          objc_enumerationMutation(v296);
        -[VCPProtoAssetAnalysis addFilesystemMovieCheeringResults:](self, "addFilesystemMovieCheeringResults:", *(_QWORD *)(*((_QWORD *)&v436 + 1) + 8 * i49));
      }
      v298 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v436, v687, 16);
    }
    while (v298);
  }

  v434 = 0u;
  v435 = 0u;
  v432 = 0u;
  v433 = 0u;
  v301 = *((id *)v5 + 17);
  v302 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v432, v686, 16);
  if (v302)
  {
    v303 = v302;
    v304 = *(_QWORD *)v433;
    do
    {
      for (i50 = 0; i50 != v303; ++i50)
      {
        if (*(_QWORD *)v433 != v304)
          objc_enumerationMutation(v301);
        -[VCPProtoAssetAnalysis addFilesystemMovieLaughterResults:](self, "addFilesystemMovieLaughterResults:", *(_QWORD *)(*((_QWORD *)&v432 + 1) + 8 * i50));
      }
      v303 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v432, v686, 16);
    }
    while (v303);
  }

  v430 = 0u;
  v431 = 0u;
  v428 = 0u;
  v429 = 0u;
  v306 = *((id *)v5 + 18);
  v307 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v428, v685, 16);
  if (v307)
  {
    v308 = v307;
    v309 = *(_QWORD *)v429;
    do
    {
      for (i51 = 0; i51 != v308; ++i51)
      {
        if (*(_QWORD *)v429 != v309)
          objc_enumerationMutation(v306);
        -[VCPProtoAssetAnalysis addFilesystemMovieMusicResults:](self, "addFilesystemMovieMusicResults:", *(_QWORD *)(*((_QWORD *)&v428 + 1) + 8 * i51));
      }
      v308 = objc_msgSend(v306, "countByEnumeratingWithState:objects:count:", &v428, v685, 16);
    }
    while (v308);
  }

  v426 = 0u;
  v427 = 0u;
  v424 = 0u;
  v425 = 0u;
  v311 = *((id *)v5 + 19);
  v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v424, v684, 16);
  if (v312)
  {
    v313 = v312;
    v314 = *(_QWORD *)v425;
    do
    {
      for (i52 = 0; i52 != v313; ++i52)
      {
        if (*(_QWORD *)v425 != v314)
          objc_enumerationMutation(v311);
        -[VCPProtoAssetAnalysis addFilesystemMovieVoiceResults:](self, "addFilesystemMovieVoiceResults:", *(_QWORD *)(*((_QWORD *)&v424 + 1) + 8 * i52));
      }
      v313 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v424, v684, 16);
    }
    while (v313);
  }

  v422 = 0u;
  v423 = 0u;
  v420 = 0u;
  v421 = 0u;
  v316 = *((id *)v5 + 6);
  v317 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v420, v683, 16);
  if (v317)
  {
    v318 = v317;
    v319 = *(_QWORD *)v421;
    do
    {
      for (i53 = 0; i53 != v318; ++i53)
      {
        if (*(_QWORD *)v421 != v319)
          objc_enumerationMutation(v316);
        -[VCPProtoAssetAnalysis addAnimatedStickerResults:](self, "addAnimatedStickerResults:", *(_QWORD *)(*((_QWORD *)&v420 + 1) + 8 * i53));
      }
      v318 = objc_msgSend(v316, "countByEnumeratingWithState:objects:count:", &v420, v683, 16);
    }
    while (v318);
  }

  v418 = 0u;
  v419 = 0u;
  v416 = 0u;
  v417 = 0u;
  v321 = *((id *)v5 + 40);
  v322 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v416, v682, 16);
  if (v322)
  {
    v323 = v322;
    v324 = *(_QWORD *)v417;
    do
    {
      for (i54 = 0; i54 != v323; ++i54)
      {
        if (*(_QWORD *)v417 != v324)
          objc_enumerationMutation(v321);
        -[VCPProtoAssetAnalysis addLivePhotoSettlingEffectGatingResults:](self, "addLivePhotoSettlingEffectGatingResults:", *(_QWORD *)(*((_QWORD *)&v416 + 1) + 8 * i54));
      }
      v323 = objc_msgSend(v321, "countByEnumeratingWithState:objects:count:", &v416, v682, 16);
    }
    while (v323);
  }

  if (*((_QWORD *)v5 + 8))
    -[VCPProtoAssetAnalysis setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  v414 = 0u;
  v415 = 0u;
  v412 = 0u;
  v413 = 0u;
  v326 = *((id *)v5 + 77);
  v327 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v412, v681, 16);
  if (v327)
  {
    v328 = v327;
    v329 = *(_QWORD *)v413;
    do
    {
      for (i55 = 0; i55 != v328; ++i55)
      {
        if (*(_QWORD *)v413 != v329)
          objc_enumerationMutation(v326);
        -[VCPProtoAssetAnalysis addMovieTorsoResults:](self, "addMovieTorsoResults:", *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * i55));
      }
      v328 = objc_msgSend(v326, "countByEnumeratingWithState:objects:count:", &v412, v681, 16);
    }
    while (v328);
  }

  v410 = 0u;
  v411 = 0u;
  v408 = 0u;
  v409 = 0u;
  v331 = *((id *)v5 + 55);
  v332 = objc_msgSend(v331, "countByEnumeratingWithState:objects:count:", &v408, v680, 16);
  if (v332)
  {
    v333 = v332;
    v334 = *(_QWORD *)v409;
    do
    {
      for (i56 = 0; i56 != v333; ++i56)
      {
        if (*(_QWORD *)v409 != v334)
          objc_enumerationMutation(v331);
        -[VCPProtoAssetAnalysis addMovieHumanActionClassificationResults:](self, "addMovieHumanActionClassificationResults:", *(_QWORD *)(*((_QWORD *)&v408 + 1) + 8 * i56));
      }
      v333 = objc_msgSend(v331, "countByEnumeratingWithState:objects:count:", &v408, v680, 16);
    }
    while (v333);
  }

  v406 = 0u;
  v407 = 0u;
  v404 = 0u;
  v405 = 0u;
  v336 = *((id *)v5 + 84);
  v337 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v404, v679, 16);
  if (v337)
  {
    v338 = v337;
    v339 = *(_QWORD *)v405;
    do
    {
      for (i57 = 0; i57 != v338; ++i57)
      {
        if (*(_QWORD *)v405 != v339)
          objc_enumerationMutation(v336);
        -[VCPProtoAssetAnalysis addVideoEmbeddingResults:](self, "addVideoEmbeddingResults:", *(_QWORD *)(*((_QWORD *)&v404 + 1) + 8 * i57));
      }
      v338 = objc_msgSend(v336, "countByEnumeratingWithState:objects:count:", &v404, v679, 16);
    }
    while (v338);
  }

  v402 = 0u;
  v403 = 0u;
  v400 = 0u;
  v401 = 0u;
  v341 = *((id *)v5 + 80);
  v342 = objc_msgSend(v341, "countByEnumeratingWithState:objects:count:", &v400, v678, 16);
  if (v342)
  {
    v343 = v342;
    v344 = *(_QWORD *)v401;
    do
    {
      for (i58 = 0; i58 != v343; ++i58)
      {
        if (*(_QWORD *)v401 != v344)
          objc_enumerationMutation(v341);
        -[VCPProtoAssetAnalysis addSummarizedEmbeddingResults:](self, "addSummarizedEmbeddingResults:", *(_QWORD *)(*((_QWORD *)&v400 + 1) + 8 * i58));
      }
      v343 = objc_msgSend(v341, "countByEnumeratingWithState:objects:count:", &v400, v678, 16);
    }
    while (v343);
  }

  v398 = 0u;
  v399 = 0u;
  v396 = 0u;
  v397 = 0u;
  v346 = *((id *)v5 + 11);
  v347 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v396, v677, 16);
  if (v347)
  {
    v348 = v347;
    v349 = *(_QWORD *)v397;
    do
    {
      for (i59 = 0; i59 != v348; ++i59)
      {
        if (*(_QWORD *)v397 != v349)
          objc_enumerationMutation(v346);
        -[VCPProtoAssetAnalysis addAudioFusedVideoEmbeddingResults:](self, "addAudioFusedVideoEmbeddingResults:", *(_QWORD *)(*((_QWORD *)&v396 + 1) + 8 * i59));
      }
      v348 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v396, v677, 16);
    }
    while (v348);
  }

  v394 = 0u;
  v395 = 0u;
  v392 = 0u;
  v393 = 0u;
  v351 = *((id *)v5 + 24);
  v352 = objc_msgSend(v351, "countByEnumeratingWithState:objects:count:", &v392, v676, 16);
  if (v352)
  {
    v353 = v352;
    v354 = *(_QWORD *)v393;
    do
    {
      for (i60 = 0; i60 != v353; ++i60)
      {
        if (*(_QWORD *)v393 != v354)
          objc_enumerationMutation(v351);
        -[VCPProtoAssetAnalysis addImageEmbeddingResults:](self, "addImageEmbeddingResults:", *(_QWORD *)(*((_QWORD *)&v392 + 1) + 8 * i60));
      }
      v353 = objc_msgSend(v351, "countByEnumeratingWithState:objects:count:", &v392, v676, 16);
    }
    while (v353);
  }

  v390 = 0u;
  v391 = 0u;
  v388 = 0u;
  v389 = 0u;
  v356 = *((id *)v5 + 22);
  v357 = objc_msgSend(v356, "countByEnumeratingWithState:objects:count:", &v388, v675, 16);
  if (v357)
  {
    v358 = v357;
    v359 = *(_QWORD *)v389;
    do
    {
      for (i61 = 0; i61 != v358; ++i61)
      {
        if (*(_QWORD *)v389 != v359)
          objc_enumerationMutation(v356);
        -[VCPProtoAssetAnalysis addImageCaptionResults:](self, "addImageCaptionResults:", *(_QWORD *)(*((_QWORD *)&v388 + 1) + 8 * i61));
      }
      v358 = objc_msgSend(v356, "countByEnumeratingWithState:objects:count:", &v388, v675, 16);
    }
    while (v358);
  }

  v386 = 0u;
  v387 = 0u;
  v384 = 0u;
  v385 = 0u;
  v361 = *((id *)v5 + 83);
  v362 = objc_msgSend(v361, "countByEnumeratingWithState:objects:count:", &v384, v674, 16);
  if (v362)
  {
    v363 = v362;
    v364 = *(_QWORD *)v385;
    do
    {
      for (i62 = 0; i62 != v363; ++i62)
      {
        if (*(_QWORD *)v385 != v364)
          objc_enumerationMutation(v361);
        -[VCPProtoAssetAnalysis addVideoCaptionResults:](self, "addVideoCaptionResults:", *(_QWORD *)(*((_QWORD *)&v384 + 1) + 8 * i62));
      }
      v363 = objc_msgSend(v361, "countByEnumeratingWithState:objects:count:", &v384, v674, 16);
    }
    while (v363);
  }

  v382 = 0u;
  v383 = 0u;
  v380 = 0u;
  v381 = 0u;
  v366 = *((id *)v5 + 82);
  v367 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v380, v673, 16);
  if (v367)
  {
    v368 = v367;
    v369 = *(_QWORD *)v381;
    do
    {
      for (i63 = 0; i63 != v368; ++i63)
      {
        if (*(_QWORD *)v381 != v369)
          objc_enumerationMutation(v366);
        -[VCPProtoAssetAnalysis addVideoCaptionPreferenceResults:](self, "addVideoCaptionPreferenceResults:", *(_QWORD *)(*((_QWORD *)&v380 + 1) + 8 * i63));
      }
      v368 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v380, v673, 16);
    }
    while (v368);
  }

  v378 = 0u;
  v379 = 0u;
  v376 = 0u;
  v377 = 0u;
  v371 = *((id *)v5 + 85);
  v372 = objc_msgSend(v371, "countByEnumeratingWithState:objects:count:", &v376, v672, 16);
  if (v372)
  {
    v373 = v372;
    v374 = *(_QWORD *)v377;
    do
    {
      for (i64 = 0; i64 != v373; ++i64)
      {
        if (*(_QWORD *)v377 != v374)
          objc_enumerationMutation(v371);
        -[VCPProtoAssetAnalysis addVideoSegmentCaptionResults:](self, "addVideoSegmentCaptionResults:", *(_QWORD *)(*((_QWORD *)&v376 + 1) + 8 * i64), (_QWORD)v376);
      }
      v373 = objc_msgSend(v371, "countByEnumeratingWithState:objects:count:", &v376, v672, 16);
    }
    while (v373);
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)types
{
  return self->_types;
}

- (void)setTypes:(unsigned int)a3
{
  self->_types = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (double)date
{
  return self->_date;
}

- (void)setDate:(double)a3
{
  self->_date = a3;
}

- (double)quality
{
  return self->_quality;
}

- (unint64_t)statsFlags
{
  return self->_statsFlags;
}

- (unint64_t)typesWide
{
  return self->_typesWide;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifier, a3);
}

- (double)assetModificationDate
{
  return self->_assetModificationDate;
}

- (void)setAssetModificationDate:(double)a3
{
  self->_assetModificationDate = a3;
}

- (NSString)assetMasterFingerprint
{
  return self->_assetMasterFingerprint;
}

- (void)setAssetMasterFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_assetMasterFingerprint, a3);
}

- (NSString)assetAdjustedFingerprint
{
  return self->_assetAdjustedFingerprint;
}

- (void)setAssetAdjustedFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_assetAdjustedFingerprint, a3);
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetCloudIdentifier, a3);
}

- (NSMutableArray)imageBlurResults
{
  return self->_imageBlurResults;
}

- (void)setImageBlurResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageBlurResults, a3);
}

- (NSMutableArray)imageCompositionResults
{
  return self->_imageCompositionResults;
}

- (void)setImageCompositionResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageCompositionResults, a3);
}

- (NSMutableArray)imageFaceResults
{
  return self->_imageFaceResults;
}

- (void)setImageFaceResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageFaceResults, a3);
}

- (NSMutableArray)imageFeatureResults
{
  return self->_imageFeatureResults;
}

- (void)setImageFeatureResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageFeatureResults, a3);
}

- (NSMutableArray)imageJunkResults
{
  return self->_imageJunkResults;
}

- (void)setImageJunkResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageJunkResults, a3);
}

- (NSMutableArray)imageSaliencyResults
{
  return self->_imageSaliencyResults;
}

- (void)setImageSaliencyResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageSaliencyResults, a3);
}

- (NSMutableArray)imageShotTypeResults
{
  return self->_imageShotTypeResults;
}

- (void)setImageShotTypeResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageShotTypeResults, a3);
}

- (NSMutableArray)imagePetsResults
{
  return self->_imagePetsResults;
}

- (void)setImagePetsResults:(id)a3
{
  objc_storeStrong((id *)&self->_imagePetsResults, a3);
}

- (NSMutableArray)imagePetsFaceResults
{
  return self->_imagePetsFaceResults;
}

- (void)setImagePetsFaceResults:(id)a3
{
  objc_storeStrong((id *)&self->_imagePetsFaceResults, a3);
}

- (NSMutableArray)imageSceneprintResults
{
  return self->_imageSceneprintResults;
}

- (void)setImageSceneprintResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageSceneprintResults, a3);
}

- (NSMutableArray)livePhotoEffectsResults
{
  return self->_livePhotoEffectsResults;
}

- (void)setLivePhotoEffectsResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoEffectsResults, a3);
}

- (NSMutableArray)livePhotoRecommendationResults
{
  return self->_livePhotoRecommendationResults;
}

- (void)setLivePhotoRecommendationResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoRecommendationResults, a3);
}

- (NSMutableArray)livePhotoSharpnessResults
{
  return self->_livePhotoSharpnessResults;
}

- (void)setLivePhotoSharpnessResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoSharpnessResults, a3);
}

- (NSMutableArray)livePhotoKeyFrameResults
{
  return self->_livePhotoKeyFrameResults;
}

- (void)setLivePhotoKeyFrameResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoKeyFrameResults, a3);
}

- (NSMutableArray)livePhotoKeyFrameStillResults
{
  return self->_livePhotoKeyFrameStillResults;
}

- (void)setLivePhotoKeyFrameStillResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoKeyFrameStillResults, a3);
}

- (NSMutableArray)livePhotoSettlingEffectGatingResults
{
  return self->_livePhotoSettlingEffectGatingResults;
}

- (void)setLivePhotoSettlingEffectGatingResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoSettlingEffectGatingResults, a3);
}

- (NSMutableArray)movieActivityLevelResults
{
  return self->_movieActivityLevelResults;
}

- (void)setMovieActivityLevelResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieActivityLevelResults, a3);
}

- (NSMutableArray)movieCameraMotionResults
{
  return self->_movieCameraMotionResults;
}

- (void)setMovieCameraMotionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieCameraMotionResults, a3);
}

- (NSMutableArray)movieClassificationResults
{
  return self->_movieClassificationResults;
}

- (void)setMovieClassificationResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieClassificationResults, a3);
}

- (NSMutableArray)movieFaceResults
{
  return self->_movieFaceResults;
}

- (void)setMovieFaceResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieFaceResults, a3);
}

- (NSMutableArray)movieFaceprintResults
{
  return self->_movieFaceprintResults;
}

- (void)setMovieFaceprintResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieFaceprintResults, a3);
}

- (NSMutableArray)movieFeatureResults
{
  return self->_movieFeatureResults;
}

- (void)setMovieFeatureResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieFeatureResults, a3);
}

- (NSMutableArray)movieFineSubjectMotionResults
{
  return self->_movieFineSubjectMotionResults;
}

- (void)setMovieFineSubjectMotionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieFineSubjectMotionResults, a3);
}

- (NSMutableArray)movieInterestingnessResults
{
  return self->_movieInterestingnessResults;
}

- (void)setMovieInterestingnessResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieInterestingnessResults, a3);
}

- (NSMutableArray)movieMovingObjectResults
{
  return self->_movieMovingObjectResults;
}

- (void)setMovieMovingObjectResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieMovingObjectResults, a3);
}

- (NSMutableArray)movieMusicResults
{
  return self->_movieMusicResults;
}

- (void)setMovieMusicResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieMusicResults, a3);
}

- (NSMutableArray)movieObstructionResults
{
  return self->_movieObstructionResults;
}

- (void)setMovieObstructionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieObstructionResults, a3);
}

- (NSMutableArray)movieOrientationResults
{
  return self->_movieOrientationResults;
}

- (void)setMovieOrientationResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieOrientationResults, a3);
}

- (NSMutableArray)moviePreEncodeResults
{
  return self->_moviePreEncodeResults;
}

- (void)setMoviePreEncodeResults:(id)a3
{
  objc_storeStrong((id *)&self->_moviePreEncodeResults, a3);
}

- (NSMutableArray)movieQualityResults
{
  return self->_movieQualityResults;
}

- (void)setMovieQualityResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieQualityResults, a3);
}

- (NSMutableArray)movieSaliencyResults
{
  return self->_movieSaliencyResults;
}

- (void)setMovieSaliencyResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSaliencyResults, a3);
}

- (NSMutableArray)movieSceneResults
{
  return self->_movieSceneResults;
}

- (void)setMovieSceneResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSceneResults, a3);
}

- (NSMutableArray)movieSceneprintResults
{
  return self->_movieSceneprintResults;
}

- (void)setMovieSceneprintResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSceneprintResults, a3);
}

- (NSMutableArray)movieSubjectMotionResults
{
  return self->_movieSubjectMotionResults;
}

- (void)setMovieSubjectMotionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSubjectMotionResults, a3);
}

- (NSMutableArray)movieSubtleMotionResults
{
  return self->_movieSubtleMotionResults;
}

- (void)setMovieSubtleMotionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSubtleMotionResults, a3);
}

- (NSMutableArray)movieUtteranceResults
{
  return self->_movieUtteranceResults;
}

- (void)setMovieUtteranceResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieUtteranceResults, a3);
}

- (NSMutableArray)movieVoiceResults
{
  return self->_movieVoiceResults;
}

- (void)setMovieVoiceResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieVoiceResults, a3);
}

- (NSMutableArray)movieSummaryResults
{
  return self->_movieSummaryResults;
}

- (void)setMovieSummaryResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSummaryResults, a3);
}

- (NSMutableArray)movieHighlightResults
{
  return self->_movieHighlightResults;
}

- (void)setMovieHighlightResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieHighlightResults, a3);
}

- (NSMutableArray)imageExposureResults
{
  return self->_imageExposureResults;
}

- (void)setImageExposureResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageExposureResults, a3);
}

- (NSMutableArray)imageHumanPoseResults
{
  return self->_imageHumanPoseResults;
}

- (void)setImageHumanPoseResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageHumanPoseResults, a3);
}

- (NSMutableArray)movieHumanPoseResults
{
  return self->_movieHumanPoseResults;
}

- (void)setMovieHumanPoseResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieHumanPoseResults, a3);
}

- (NSMutableArray)movieApplauseResults
{
  return self->_movieApplauseResults;
}

- (void)setMovieApplauseResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieApplauseResults, a3);
}

- (NSMutableArray)movieBabbleResults
{
  return self->_movieBabbleResults;
}

- (void)setMovieBabbleResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieBabbleResults, a3);
}

- (NSMutableArray)movieCheeringResults
{
  return self->_movieCheeringResults;
}

- (void)setMovieCheeringResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieCheeringResults, a3);
}

- (NSMutableArray)movieLaughterResults
{
  return self->_movieLaughterResults;
}

- (void)setMovieLaughterResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieLaughterResults, a3);
}

- (NSMutableArray)movieHumanActionResults
{
  return self->_movieHumanActionResults;
}

- (void)setMovieHumanActionResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieHumanActionResults, a3);
}

- (NSMutableArray)movieLoudnessResults
{
  return self->_movieLoudnessResults;
}

- (void)setMovieLoudnessResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieLoudnessResults, a3);
}

- (NSMutableArray)moviePetsResults
{
  return self->_moviePetsResults;
}

- (void)setMoviePetsResults:(id)a3
{
  objc_storeStrong((id *)&self->_moviePetsResults, a3);
}

- (NSMutableArray)moviePetsFaceResults
{
  return self->_moviePetsFaceResults;
}

- (void)setMoviePetsFaceResults:(id)a3
{
  objc_storeStrong((id *)&self->_moviePetsFaceResults, a3);
}

- (NSMutableArray)movieStabilizationResults
{
  return self->_movieStabilizationResults;
}

- (void)setMovieStabilizationResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieStabilizationResults, a3);
}

- (NSMutableArray)movieHighlightScoreResults
{
  return self->_movieHighlightScoreResults;
}

- (void)setMovieHighlightScoreResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieHighlightScoreResults, a3);
}

- (NSMutableArray)livePhotoHumanActionClassificationResults
{
  return self->_livePhotoHumanActionClassificationResults;
}

- (void)setLivePhotoHumanActionClassificationResults:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoHumanActionClassificationResults, a3);
}

- (NSMutableArray)movieAudioQualityResults
{
  return self->_movieAudioQualityResults;
}

- (void)setMovieAudioQualityResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieAudioQualityResults, a3);
}

- (NSMutableArray)movieSafetyResults
{
  return self->_movieSafetyResults;
}

- (void)setMovieSafetyResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieSafetyResults, a3);
}

- (NSMutableArray)filesystemMovieClassificationResults
{
  return self->_filesystemMovieClassificationResults;
}

- (void)setFilesystemMovieClassificationResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieClassificationResults, a3);
}

- (NSMutableArray)filesystemMovieHumanActionClassificationResults
{
  return self->_filesystemMovieHumanActionClassificationResults;
}

- (void)setFilesystemMovieHumanActionClassificationResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieHumanActionClassificationResults, a3);
}

- (NSMutableArray)filesystemMovieApplauseResults
{
  return self->_filesystemMovieApplauseResults;
}

- (void)setFilesystemMovieApplauseResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieApplauseResults, a3);
}

- (NSMutableArray)filesystemMovieBabbleResults
{
  return self->_filesystemMovieBabbleResults;
}

- (void)setFilesystemMovieBabbleResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieBabbleResults, a3);
}

- (NSMutableArray)filesystemMovieCheeringResults
{
  return self->_filesystemMovieCheeringResults;
}

- (void)setFilesystemMovieCheeringResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieCheeringResults, a3);
}

- (NSMutableArray)filesystemMovieLaughterResults
{
  return self->_filesystemMovieLaughterResults;
}

- (void)setFilesystemMovieLaughterResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieLaughterResults, a3);
}

- (NSMutableArray)filesystemMovieMusicResults
{
  return self->_filesystemMovieMusicResults;
}

- (void)setFilesystemMovieMusicResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieMusicResults, a3);
}

- (NSMutableArray)filesystemMovieVoiceResults
{
  return self->_filesystemMovieVoiceResults;
}

- (void)setFilesystemMovieVoiceResults:(id)a3
{
  objc_storeStrong((id *)&self->_filesystemMovieVoiceResults, a3);
}

- (NSMutableArray)animatedStickerResults
{
  return self->_animatedStickerResults;
}

- (void)setAnimatedStickerResults:(id)a3
{
  objc_storeStrong((id *)&self->_animatedStickerResults, a3);
}

- (NSMutableArray)movieTorsoResults
{
  return self->_movieTorsoResults;
}

- (void)setMovieTorsoResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieTorsoResults, a3);
}

- (NSMutableArray)movieHumanActionClassificationResults
{
  return self->_movieHumanActionClassificationResults;
}

- (void)setMovieHumanActionClassificationResults:(id)a3
{
  objc_storeStrong((id *)&self->_movieHumanActionClassificationResults, a3);
}

- (NSMutableArray)videoEmbeddingResults
{
  return self->_videoEmbeddingResults;
}

- (void)setVideoEmbeddingResults:(id)a3
{
  objc_storeStrong((id *)&self->_videoEmbeddingResults, a3);
}

- (NSMutableArray)summarizedEmbeddingResults
{
  return self->_summarizedEmbeddingResults;
}

- (void)setSummarizedEmbeddingResults:(id)a3
{
  objc_storeStrong((id *)&self->_summarizedEmbeddingResults, a3);
}

- (NSMutableArray)audioFusedVideoEmbeddingResults
{
  return self->_audioFusedVideoEmbeddingResults;
}

- (void)setAudioFusedVideoEmbeddingResults:(id)a3
{
  objc_storeStrong((id *)&self->_audioFusedVideoEmbeddingResults, a3);
}

- (NSMutableArray)imageEmbeddingResults
{
  return self->_imageEmbeddingResults;
}

- (void)setImageEmbeddingResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageEmbeddingResults, a3);
}

- (NSMutableArray)imageCaptionResults
{
  return self->_imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
  objc_storeStrong((id *)&self->_imageCaptionResults, a3);
}

- (NSMutableArray)videoCaptionResults
{
  return self->_videoCaptionResults;
}

- (void)setVideoCaptionResults:(id)a3
{
  objc_storeStrong((id *)&self->_videoCaptionResults, a3);
}

- (NSMutableArray)videoCaptionPreferenceResults
{
  return self->_videoCaptionPreferenceResults;
}

- (void)setVideoCaptionPreferenceResults:(id)a3
{
  objc_storeStrong((id *)&self->_videoCaptionPreferenceResults, a3);
}

- (NSMutableArray)videoSegmentCaptionResults
{
  return self->_videoSegmentCaptionResults;
}

- (void)setVideoSegmentCaptionResults:(id)a3
{
  objc_storeStrong((id *)&self->_videoSegmentCaptionResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegmentCaptionResults, 0);
  objc_storeStrong((id *)&self->_videoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_videoCaptionResults, 0);
  objc_storeStrong((id *)&self->_videoCaptionPreferenceResults, 0);
  objc_storeStrong((id *)&self->_summarizedEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_movieVoiceResults, 0);
  objc_storeStrong((id *)&self->_movieUtteranceResults, 0);
  objc_storeStrong((id *)&self->_movieTorsoResults, 0);
  objc_storeStrong((id *)&self->_movieSummaryResults, 0);
  objc_storeStrong((id *)&self->_movieSubtleMotionResults, 0);
  objc_storeStrong((id *)&self->_movieSubjectMotionResults, 0);
  objc_storeStrong((id *)&self->_movieStabilizationResults, 0);
  objc_storeStrong((id *)&self->_movieSceneprintResults, 0);
  objc_storeStrong((id *)&self->_movieSceneResults, 0);
  objc_storeStrong((id *)&self->_movieSaliencyResults, 0);
  objc_storeStrong((id *)&self->_movieSafetyResults, 0);
  objc_storeStrong((id *)&self->_movieQualityResults, 0);
  objc_storeStrong((id *)&self->_moviePreEncodeResults, 0);
  objc_storeStrong((id *)&self->_moviePetsResults, 0);
  objc_storeStrong((id *)&self->_moviePetsFaceResults, 0);
  objc_storeStrong((id *)&self->_movieOrientationResults, 0);
  objc_storeStrong((id *)&self->_movieObstructionResults, 0);
  objc_storeStrong((id *)&self->_movieMusicResults, 0);
  objc_storeStrong((id *)&self->_movieMovingObjectResults, 0);
  objc_storeStrong((id *)&self->_movieLoudnessResults, 0);
  objc_storeStrong((id *)&self->_movieLaughterResults, 0);
  objc_storeStrong((id *)&self->_movieInterestingnessResults, 0);
  objc_storeStrong((id *)&self->_movieHumanPoseResults, 0);
  objc_storeStrong((id *)&self->_movieHumanActionResults, 0);
  objc_storeStrong((id *)&self->_movieHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_movieHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_movieHighlightResults, 0);
  objc_storeStrong((id *)&self->_movieFineSubjectMotionResults, 0);
  objc_storeStrong((id *)&self->_movieFeatureResults, 0);
  objc_storeStrong((id *)&self->_movieFaceprintResults, 0);
  objc_storeStrong((id *)&self->_movieFaceResults, 0);
  objc_storeStrong((id *)&self->_movieClassificationResults, 0);
  objc_storeStrong((id *)&self->_movieCheeringResults, 0);
  objc_storeStrong((id *)&self->_movieCameraMotionResults, 0);
  objc_storeStrong((id *)&self->_movieBabbleResults, 0);
  objc_storeStrong((id *)&self->_movieAudioQualityResults, 0);
  objc_storeStrong((id *)&self->_movieApplauseResults, 0);
  objc_storeStrong((id *)&self->_movieActivityLevelResults, 0);
  objc_storeStrong((id *)&self->_livePhotoSharpnessResults, 0);
  objc_storeStrong((id *)&self->_livePhotoSettlingEffectGatingResults, 0);
  objc_storeStrong((id *)&self->_livePhotoRecommendationResults, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFrameStillResults, 0);
  objc_storeStrong((id *)&self->_livePhotoKeyFrameResults, 0);
  objc_storeStrong((id *)&self->_livePhotoHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_livePhotoEffectsResults, 0);
  objc_storeStrong((id *)&self->_imageShotTypeResults, 0);
  objc_storeStrong((id *)&self->_imageSceneprintResults, 0);
  objc_storeStrong((id *)&self->_imageSaliencyResults, 0);
  objc_storeStrong((id *)&self->_imagePetsResults, 0);
  objc_storeStrong((id *)&self->_imagePetsFaceResults, 0);
  objc_storeStrong((id *)&self->_imageJunkResults, 0);
  objc_storeStrong((id *)&self->_imageHumanPoseResults, 0);
  objc_storeStrong((id *)&self->_imageFeatureResults, 0);
  objc_storeStrong((id *)&self->_imageFaceResults, 0);
  objc_storeStrong((id *)&self->_imageExposureResults, 0);
  objc_storeStrong((id *)&self->_imageEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_imageCompositionResults, 0);
  objc_storeStrong((id *)&self->_imageCaptionResults, 0);
  objc_storeStrong((id *)&self->_imageBlurResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieVoiceResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieMusicResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieLaughterResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieHumanActionClassificationResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieClassificationResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieCheeringResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieBabbleResults, 0);
  objc_storeStrong((id *)&self->_filesystemMovieApplauseResults, 0);
  objc_storeStrong((id *)&self->_audioFusedVideoEmbeddingResults, 0);
  objc_storeStrong((id *)&self->_assetMasterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_assetAdjustedFingerprint, 0);
  objc_storeStrong((id *)&self->_animatedStickerResults, 0);
}

- (BOOL)setAttributesFromLegacyDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performedAnalysisTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statsFlags"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateAnalyzed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quality"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateModified"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("masterFingerprint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adjustedFingerprint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v11 = v7 == 0;
  else
    v11 = 1;
  v14 = v11 || v5 == 0 || v6 == 0 || v8 == 0;
  v15 = !v14;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Invalid attribute: no version/date/types/flags/modificationDate", buf, 2u);
    }
  }
  else
  {
    v16 = objc_msgSend(v5, "unsignedIntegerValue");
    if (_os_feature_enabled_impl())
      v16 &= 0xFFFFFFFFBFBFFFF3;
    -[VCPProtoAssetAnalysis setVersion:](self, "setVersion:", objc_msgSend(v20, "unsignedIntValue"));
    -[VCPProtoAssetAnalysis setTypesWide:](self, "setTypesWide:", v16);
    -[VCPProtoAssetAnalysis setFlags:](self, "setFlags:", objc_msgSend(v6, "unsignedIntValue"));
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    -[VCPProtoAssetAnalysis setDate:](self, "setDate:");
    objc_msgSend(v18, "doubleValue");
    -[VCPProtoAssetAnalysis setQuality:](self, "setQuality:");
    -[VCPProtoAssetAnalysis setStatsFlags:](self, "setStatsFlags:", objc_msgSend(v19, "unsignedLongValue"));
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[VCPProtoAssetAnalysis setAssetModificationDate:](self, "setAssetModificationDate:");
    -[VCPProtoAssetAnalysis setAssetMasterFingerprint:](self, "setAssetMasterFingerprint:", v9);
    -[VCPProtoAssetAnalysis setAssetAdjustedFingerprint:](self, "setAssetAdjustedFingerprint:", v10);
  }

  return v15;
}

+ (id)faceResultKeys
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("imageFaceResults");
  v3[1] = CFSTR("movieFaceResults");
  v3[2] = CFSTR("movieFaceprintResults");
  v3[3] = CFSTR("imageHumanPoseResults");
  v3[4] = CFSTR("movieHumanPoseResults");
  v3[5] = CFSTR("movieHumanActionResults");
  v3[6] = CFSTR("livePhotoHumanActionClassificationResults");
  v3[7] = CFSTR("movieTorsoResults");
  v3[8] = CFSTR("movieHumanActionResults");
  v3[9] = CFSTR("movieHumanActionClassificationResults");
  v3[10] = CFSTR("filesystemMovieHumanActionClassificationResults");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setResults:(id)a3 withClass:(Class)a4 forPropertyKey:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = a5;
  if (_os_feature_enabled_impl())
  {
    +[VCPProtoAssetAnalysis faceResultKeys](VCPProtoAssetAnalysis, "faceResultKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v25);

    if ((v10 & 1) != 0)
      goto LABEL_16;
  }
  if (v8 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to invalid type for results (should be NSArray, is %@)", buf, 0x16u);

    }
    v18 = 0;
    goto LABEL_29;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_16:
    v18 = 1;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v12);
      v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
      if ((objc_opt_respondsToSelector() & 1) == 0)
        break;
      -[objc_class resultFromLegacyDictionary:](a4, "resultFromLegacyDictionary:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(a4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v25;
          v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to nil %@", buf, 0x16u);

        }
LABEL_27:

        v18 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v11, "addObject:", v17);

      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          goto LABEL_8;
        goto LABEL_15;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v25;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->Proto] Failed to set property %@ due to invalid type for result entry (should be NSDictionary, is %@)", buf, 0x16u);

    }
    goto LABEL_27;
  }
LABEL_15:

  -[VCPProtoAssetAnalysis setValue:forKey:](self, "setValue:forKey:", v11, v25);
  v18 = 1;
LABEL_28:

LABEL_29:
  return v18;
}

- (BOOL)setImageAnalysisFromLegacyDictionary:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  void *v31;
  BOOL v32;
  void *v33;
  BOOL v34;
  void *v35;
  BOOL v36;
  void *v37;
  BOOL v38;
  void *v39;
  BOOL v40;
  void *v41;
  BOOL v42;
  void *v43;
  BOOL v44;
  void *v45;
  BOOL v46;
  void *v47;
  BOOL v48;
  void *v49;
  BOOL v50;
  void *v51;
  BOOL v52;
  void *v53;
  BOOL v54;
  void *v55;
  BOOL v56;
  void *v57;
  BOOL v58;
  void *v59;
  BOOL v60;
  void *v61;
  BOOL v62;
  void *v63;
  BOOL v64;
  void *v65;
  BOOL v66;
  void *v67;
  BOOL v68;
  void *v69;
  BOOL v70;
  void *v71;
  BOOL v72;
  void *v73;
  BOOL v74;
  void *v75;
  BOOL v76;
  void *v77;
  BOOL v78;
  void *v79;
  BOOL v80;
  void *v81;
  BOOL v82;
  void *v83;
  BOOL v84;
  void *v85;
  BOOL v86;
  void *v87;
  BOOL v88;
  void *v89;
  BOOL v90;
  void *v91;
  BOOL v92;
  void *v93;
  BOOL v94;
  void *v95;
  BOOL v96;
  void *v97;
  BOOL v98;
  void *v99;
  BOOL v100;
  void *v101;
  BOOL v102;
  void *v103;
  BOOL v104;
  void *v105;
  BOOL v106;
  void *v107;
  BOOL v108;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BlurResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v5, objc_opt_class(), CFSTR("imageBlurResults"));

  if (!v6)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CompositionResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v7, objc_opt_class(), CFSTR("imageCompositionResults"));

  if (!v8)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExposureResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v9, objc_opt_class(), CFSTR("imageExposureResults"));

  if (!v10)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v11, objc_opt_class(), CFSTR("imageFaceResults"));

  if (!v12)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FeatureVectorResults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v13, objc_opt_class(), CFSTR("imageFeatureResults"));

  if (!v14)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("JunkResults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v15, objc_opt_class(), CFSTR("imageJunkResults"));

  if (!v16)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsResults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v17, objc_opt_class(), CFSTR("imagePetsResults"));

  if (!v18)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v19, objc_opt_class(), CFSTR("imagePetsFaceResults"));

  if (!v20)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v21, objc_opt_class(), CFSTR("imageSaliencyResults"));

  if (!v22)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SceneprintResults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v23, objc_opt_class(), CFSTR("imageSceneprintResults"));

  if (!v24)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShotTypeResults"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v25, objc_opt_class(), CFSTR("imageShotTypeResults"));

  if (!v26)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v27, objc_opt_class(), CFSTR("imageHumanPoseResults"));

  if (!v28)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v29, objc_opt_class(), CFSTR("imageEmbeddingResults"));

  if (!v30)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MiCaImageCaptionResults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v31, objc_opt_class(), CFSTR("imageCaptionResults"));

  if (!v32)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IrisRecommendResults"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v33, objc_opt_class(), CFSTR("livePhotoRecommendationResults"));

  if (!v34)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IrisSharpnessResults"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v35, objc_opt_class(), CFSTR("livePhotoSharpnessResults"));

  if (!v36)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v37, objc_opt_class(), CFSTR("livePhotoHumanActionClassificationResults"));

  if (!v38)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LivePhotoEffectsResults"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v39, objc_opt_class(), CFSTR("livePhotoEffectsResults"));

  if (!v40)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v41, objc_opt_class(), CFSTR("livePhotoKeyFrameResults"));

  if (!v42)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KeyFrameStillResults"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v43, objc_opt_class(), CFSTR("livePhotoKeyFrameStillResults"));

  if (!v44)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SettlingEffectsGatingResults"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v45, objc_opt_class(), CFSTR("livePhotoSettlingEffectGatingResults"));

  if (!v46)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v47, objc_opt_class(), CFSTR("movieCameraMotionResults"));

  if (!v48)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FineSubjectMotionResults"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v49, objc_opt_class(), CFSTR("movieFineSubjectMotionResults"));

  if (!v50)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v51, objc_opt_class(), CFSTR("movieInterestingnessResults"));

  if (!v52)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovingObjectsResults"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v53, objc_opt_class(), CFSTR("movieMovingObjectResults"));

  if (!v54)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MusicResults"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v55, objc_opt_class(), CFSTR("movieMusicResults"));

  if (!v56)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ObstructionResults"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v57, objc_opt_class(), CFSTR("movieObstructionResults"));

  if (!v58)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OrientationResults"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v59, objc_opt_class(), CFSTR("movieOrientationResults"));

  if (!v60)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QualityResults"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v61, objc_opt_class(), CFSTR("movieQualityResults"));

  if (!v62)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SceneResults"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v63, objc_opt_class(), CFSTR("movieSceneResults"));

  if (!v64)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SubjectMotionResults"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v65, objc_opt_class(), CFSTR("movieSubjectMotionResults"));

  if (!v66)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SubtleMotionResults"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v67, objc_opt_class(), CFSTR("movieSubtleMotionResults"));

  if (!v68)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UtteranceResults"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v69, objc_opt_class(), CFSTR("movieUtteranceResults"));

  if (!v70)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceResults"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v71, objc_opt_class(), CFSTR("movieVoiceResults"));

  if (!v72)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v73, objc_opt_class(), CFSTR("movieSummaryResults"));

  if (!v74)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnimatedStickerResults"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v75, objc_opt_class(), CFSTR("animatedStickerResults"));

  if (!v76)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieHighlightScoreResults"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v77, objc_opt_class(), CFSTR("movieHighlightScoreResults"));

  if (!v78)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v79, objc_opt_class(), CFSTR("movieHighlightResults"));

  if (!v80)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplauseResults"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v81, objc_opt_class(), CFSTR("movieApplauseResults"));

  if (!v82)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AudioQualityResults"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v83, objc_opt_class(), CFSTR("movieAudioQualityResults"));

  if (!v84)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BabbleResults"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v85, objc_opt_class(), CFSTR("movieBabbleResults"));

  if (!v86)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CheeringResults"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v87, objc_opt_class(), CFSTR("movieCheeringResults"));

  if (!v88)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LaughterResults"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v89, objc_opt_class(), CFSTR("movieLaughterResults"));

  if (!v90)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionResults"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v91, objc_opt_class(), CFSTR("movieHumanActionResults"));

  if (!v92)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LoudnessResults"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v93, objc_opt_class(), CFSTR("movieLoudnessResults"));

  if (!v94)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoStabilizationResults"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v95, objc_opt_class(), CFSTR("movieStabilizationResults"));

  if (!v96)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SafetyResults"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v97, objc_opt_class(), CFSTR("movieSafetyResults"));

  if (!v98)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SummarizedEmbeddingResults"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v99, objc_opt_class(), CFSTR("summarizedEmbeddingResults"));

  if (!v100)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AudioFusedVideoEmbeddingResults"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v101, objc_opt_class(), CFSTR("audioFusedVideoEmbeddingResults"));

  if (!v102)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v103, objc_opt_class(), CFSTR("videoEmbeddingResults"));

  if (!v104)
    goto LABEL_53;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MiCaVideoCaptionResults"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v105, objc_opt_class(), CFSTR("videoCaptionResults"));

  if (v106)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoCaptionPreferenceResults"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v107, objc_opt_class(), CFSTR("videoCaptionPreferenceResults"));

  }
  else
  {
LABEL_53:
    v108 = 0;
  }

  return v108;
}

- (BOOL)setMovieAnalysisFromLegacyDictionary:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  void *v31;
  BOOL v32;
  void *v33;
  BOOL v34;
  void *v35;
  BOOL v36;
  void *v37;
  BOOL v38;
  void *v39;
  BOOL v40;
  void *v41;
  BOOL v42;
  void *v43;
  BOOL v44;
  void *v45;
  BOOL v46;
  void *v47;
  BOOL v48;
  void *v49;
  BOOL v50;
  void *v51;
  BOOL v52;
  void *v53;
  BOOL v54;
  void *v55;
  BOOL v56;
  void *v57;
  BOOL v58;
  void *v59;
  BOOL v60;
  void *v61;
  BOOL v62;
  void *v63;
  BOOL v64;
  void *v65;
  BOOL v66;
  void *v67;
  BOOL v68;
  void *v69;
  BOOL v70;
  void *v71;
  BOOL v72;
  void *v73;
  BOOL v74;
  void *v75;
  BOOL v76;
  void *v77;
  BOOL v78;
  void *v79;
  BOOL v80;
  void *v81;
  BOOL v82;
  void *v83;
  BOOL v84;
  void *v85;
  BOOL v86;
  void *v87;
  BOOL v88;
  void *v89;
  BOOL v90;
  void *v91;
  BOOL v92;
  void *v93;
  BOOL v94;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ActivityLevelResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v5, objc_opt_class(), CFSTR("movieActivityLevelResults"));

  if (!v6)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AudioQualityResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v7, objc_opt_class(), CFSTR("movieAudioQualityResults"));

  if (!v8)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v9, objc_opt_class(), CFSTR("movieCameraMotionResults"));

  if (!v10)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClassificationResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v11, objc_opt_class(), CFSTR("movieClassificationResults"));

  if (!v12)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v13, objc_opt_class(), CFSTR("movieFaceResults"));

  if (!v14)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FacePrintResults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v15, objc_opt_class(), CFSTR("movieFaceprintResults"));

  if (!v16)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FeatureVectorResults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v17, objc_opt_class(), CFSTR("movieFeatureResults"));

  if (!v18)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FineSubjectMotionResults"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v19, objc_opt_class(), CFSTR("movieFineSubjectMotionResults"));

  if (!v20)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v21, objc_opt_class(), CFSTR("movieInterestingnessResults"));

  if (!v22)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovingObjectsResults"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v23, objc_opt_class(), CFSTR("movieMovingObjectResults"));

  if (!v24)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MusicResults"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v25, objc_opt_class(), CFSTR("movieMusicResults"));

  if (!v26)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ObstructionResults"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v27, objc_opt_class(), CFSTR("movieObstructionResults"));

  if (!v28)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OrientationResults"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v29, objc_opt_class(), CFSTR("movieOrientationResults"));

  if (!v30)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreEncodeResults"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v31, objc_opt_class(), CFSTR("moviePreEncodeResults"));

  if (!v32)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QualityResults"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v33, objc_opt_class(), CFSTR("movieQualityResults"));

  if (!v34)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v35, objc_opt_class(), CFSTR("movieSaliencyResults"));

  if (!v36)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SceneResults"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v37, objc_opt_class(), CFSTR("movieSceneResults"));

  if (!v38)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SceneprintResults"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v39, objc_opt_class(), CFSTR("movieSceneprintResults"));

  if (!v40)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SubjectMotionResults"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v41, objc_opt_class(), CFSTR("movieSubjectMotionResults"));

  if (!v42)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SubtleMotionResults"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v43, objc_opt_class(), CFSTR("movieSubtleMotionResults"));

  if (!v44)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UtteranceResults"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v45, objc_opt_class(), CFSTR("movieUtteranceResults"));

  if (!v46)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceResults"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v47, objc_opt_class(), CFSTR("movieVoiceResults"));

  if (!v48)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieSummaryResults"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v49, objc_opt_class(), CFSTR("movieSummaryResults"));

  if (!v50)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnimatedStickerResults"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v51, objc_opt_class(), CFSTR("animatedStickerResults"));

  if (!v52)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieHighlightScoreResults"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v53, objc_opt_class(), CFSTR("movieHighlightScoreResults"));

  if (!v54)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MovieHighlightResults"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v55, objc_opt_class(), CFSTR("movieHighlightResults"));

  if (!v56)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v57, objc_opt_class(), CFSTR("movieHumanPoseResults"));

  if (!v58)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplauseResults"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v59, objc_opt_class(), CFSTR("movieApplauseResults"));

  if (!v60)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BabbleResults"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v61, objc_opt_class(), CFSTR("movieBabbleResults"));

  if (!v62)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CheeringResults"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v63, objc_opt_class(), CFSTR("movieCheeringResults"));

  if (!v64)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LaughterResults"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v65, objc_opt_class(), CFSTR("movieLaughterResults"));

  if (!v66)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionResults"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v67, objc_opt_class(), CFSTR("movieHumanActionResults"));

  if (!v68)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LoudnessResults"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v69, objc_opt_class(), CFSTR("movieLoudnessResults"));

  if (!v70)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsFaceResults"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v71, objc_opt_class(), CFSTR("moviePetsFaceResults"));

  if (!v72)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PetsResults"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v73, objc_opt_class(), CFSTR("moviePetsResults"));

  if (!v74)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SafetyResults"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v75, objc_opt_class(), CFSTR("movieSafetyResults"));

  if (!v76)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TorsoResults"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v77, objc_opt_class(), CFSTR("movieTorsoResults"));

  if (!v78)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v79, objc_opt_class(), CFSTR("movieHumanActionClassificationResults"));

  if (!v80)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v81, objc_opt_class(), CFSTR("imageEmbeddingResults"));

  if (!v82)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoEmbeddingResults"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v83, objc_opt_class(), CFSTR("videoEmbeddingResults"));

  if (!v84)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SummarizedEmbeddingResults"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v85, objc_opt_class(), CFSTR("summarizedEmbeddingResults"));

  if (!v86)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AudioFusedVideoEmbeddingResults"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v87, objc_opt_class(), CFSTR("audioFusedVideoEmbeddingResults"));

  if (!v88)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MiCaImageCaptionResults"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v89, objc_opt_class(), CFSTR("imageCaptionResults"));

  if (!v90)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MiCaVideoCaptionResults"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v91, objc_opt_class(), CFSTR("videoCaptionResults"));

  if (v92)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoSegmentCaptionResults"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](self, "setResults:withClass:forPropertyKey:", v93, objc_opt_class(), CFSTR("videoSegmentCaptionResults"));

  }
  else
  {
LABEL_46:
    v94 = 0;
  }

  return v94;
}

+ (id)imageAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4
{
  id v5;
  id v6;
  VCPProtoAssetAnalysis *v7;
  VCPProtoAssetAnalysis *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(VCPProtoAssetAnalysis);
    -[VCPProtoAssetAnalysis setAssetCloudIdentifier:](v7, "setAssetCloudIdentifier:", v6);
    if (-[VCPProtoAssetAnalysis setAttributesFromLegacyDictionary:](v7, "setAttributesFromLegacyDictionary:", v5))
    {
      if (-[VCPProtoAssetAnalysis setImageAnalysisFromLegacyDictionary:](v7, "setImageAnalysisFromLegacyDictionary:", v5))
      {
        v8 = v7;
LABEL_17:

        goto LABEL_18;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        v8 = 0;
        goto LABEL_17;
      }
      v13 = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "[LegacyDict->ImageProto] Invalid analysis; skipping";
      v11 = (uint8_t *)&v13;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v14 = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "[LegacyDict->ImageProto] Invalid attribute; skipping";
      v11 = (uint8_t *)&v14;
    }
    _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->ImageProto] No cloud identifier; skipping",
      buf,
      2u);
  }
  v8 = 0;
LABEL_18:

  return v8;
}

+ (id)movieAnalysisFromLegacyDictionary:(id)a3 assetCloudIdentifier:(id)a4
{
  id v5;
  id v6;
  VCPProtoAssetAnalysis *v7;
  VCPProtoAssetAnalysis *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v13;
  __int16 v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(VCPProtoAssetAnalysis);
    -[VCPProtoAssetAnalysis setAssetCloudIdentifier:](v7, "setAssetCloudIdentifier:", v6);
    if (-[VCPProtoAssetAnalysis setAttributesFromLegacyDictionary:](v7, "setAttributesFromLegacyDictionary:", v5))
    {
      if (-[VCPProtoAssetAnalysis setMovieAnalysisFromLegacyDictionary:](v7, "setMovieAnalysisFromLegacyDictionary:", v5))
      {
        v8 = v7;
LABEL_17:

        goto LABEL_18;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_16:
        v8 = 0;
        goto LABEL_17;
      }
      v13 = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "[LegacyDict->MovieProto] Invalid analysis; skipping";
      v11 = (uint8_t *)&v13;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v14 = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "[LegacyDict->MovieProto] Invalid attribute; skipping";
      v11 = (uint8_t *)&v14;
    }
    _os_log_impl(&dword_1B6C4A000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[LegacyDict->MovieProto] No cloud identifier; skipping",
      buf,
      2u);
  }
  v8 = 0;
LABEL_18:

  return v8;
}

+ (id)imageAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3
{
  id v3;
  VCPProtoAssetAnalysis *v4;
  VCPProtoAssetAnalysis *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  __int16 v11;

  v3 = a3;
  v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  if (!-[VCPProtoAssetAnalysis setAttributesFromLegacyDictionary:](v4, "setAttributesFromLegacyDictionary:", v3))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[LegacyDict->ImageProto] Invalid attribute; skipping";
    v8 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  if (!-[VCPProtoAssetAnalysis setImageAnalysisFromLegacyDictionary:](v4, "setImageAnalysisFromLegacyDictionary:", v3))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v10 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[LegacyDict->ImageProto] Invalid analysis; skipping";
    v8 = (uint8_t *)&v10;
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = v4;
LABEL_12:

  return v5;
}

+ (id)movieAnalysisComputeSyncPayloadFromLegacyDictionary:(id)a3
{
  id v3;
  VCPProtoAssetAnalysis *v4;
  VCPProtoAssetAnalysis *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  __int16 v11;

  v3 = a3;
  v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  if (!-[VCPProtoAssetAnalysis setAttributesFromLegacyDictionary:](v4, "setAttributesFromLegacyDictionary:", v3))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[LegacyDict->MovieProto] Invalid attribute; skipping";
    v8 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  if (!-[VCPProtoAssetAnalysis setMovieAnalysisFromLegacyDictionary:](v4, "setMovieAnalysisFromLegacyDictionary:", v3))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v10 = 0;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[LegacyDict->MovieProto] Invalid analysis; skipping";
    v8 = (uint8_t *)&v10;
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = v4;
LABEL_12:

  return v5;
}

+ (id)filesystemMovieAnalysisFromLegacyDictionary:(id)a3
{
  id v3;
  VCPProtoAssetAnalysis *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  VCPProtoAssetAnalysis *v22;

  v3 = a3;
  v4 = objc_alloc_init(VCPProtoAssetAnalysis);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("metadataRanges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassificationResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v6, objc_opt_class(), CFSTR("filesystemMovieClassificationResults"));

  if (!v7)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HumanActionClassificationResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v8, objc_opt_class(), CFSTR("filesystemMovieHumanActionClassificationResults"));

  if (!v9)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ApplauseResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v10, objc_opt_class(), CFSTR("filesystemMovieApplauseResults"));

  if (!v11)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BabbleResults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v12, objc_opt_class(), CFSTR("filesystemMovieBabbleResults"));

  if (!v13)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CheeringResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v14, objc_opt_class(), CFSTR("filesystemMovieCheeringResults"));

  if (!v15)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LaughterResults"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v16, objc_opt_class(), CFSTR("filesystemMovieLaughterResults"));

  if (!v17)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MusicResults"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v18, objc_opt_class(), CFSTR("filesystemMovieMusicResults"));

  if (!v19)
    goto LABEL_10;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VoiceResults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[VCPProtoAssetAnalysis setResults:withClass:forPropertyKey:](v4, "setResults:withClass:forPropertyKey:", v20, objc_opt_class(), CFSTR("filesystemMovieVoiceResults"));

  if (v21)
    v22 = v4;
  else
LABEL_10:
    v22 = 0;

  return v22;
}

- (BOOL)exportResultsWithPropertyKey:(id)a3 toLegacyDictionary:(id)a4 withKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_os_feature_enabled_impl()
    && (+[VCPProtoAssetAnalysis faceResultKeys](VCPProtoAssetAnalysis, "faceResultKeys"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v8),
        v11,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    -[VCPProtoAssetAnalysis valueForKey:](self, "valueForKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "exportToLegacyDictionary", (_QWORD)v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v27 = v8;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Proto->LegacyDict] Failed to export entry from property %@", buf, 0xCu);
              }

              v13 = 0;
              goto LABEL_18;
            }
            objc_msgSend(v15, "addObject:", v20);

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v10);
      v13 = 1;
LABEL_18:

    }
    else
    {
      v13 = 1;
    }

  }
  return v13;
}

- (id)exportFilesystemAnalysisToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieClassificationResults"), v3, CFSTR("ClassificationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieHumanActionClassificationResults"), v3, CFSTR("HumanActionClassificationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieApplauseResults"), v3, CFSTR("ApplauseResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("filesystemMovieBabbleResults"),
         v3,
         CFSTR("BabbleResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieCheeringResults"), v3, CFSTR("CheeringResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieLaughterResults"), v3, CFSTR("LaughterResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("filesystemMovieMusicResults"), v3, CFSTR("MusicResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("filesystemMovieVoiceResults"),
         v3,
         CFSTR("VoiceResults")))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis version](self, "version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("version"));

    if (-[VCPProtoAssetAnalysis hasTypesWide](self, "hasTypesWide"))
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis typesWide](self, "typesWide"));
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis types](self, "types"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("performedAnalysisTypes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis flags](self, "flags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("flags"));

    v9 = (void *)MEMORY[0x1E0C99D68];
    -[VCPProtoAssetAnalysis date](self, "date");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dateAnalyzed"));

    v11 = (void *)MEMORY[0x1E0C99D68];
    -[VCPProtoAssetAnalysis assetModificationDate](self, "assetModificationDate");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("dateModified"));

    if (-[VCPProtoAssetAnalysis hasQuality](self, "hasQuality"))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[VCPProtoAssetAnalysis quality](self, "quality");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("quality"));

    }
    if (-[VCPProtoAssetAnalysis hasStatsFlags](self, "hasStatsFlags"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis statsFlags](self, "statsFlags"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("statsFlags"));

    }
    if (-[VCPProtoAssetAnalysis hasAssetMasterFingerprint](self, "hasAssetMasterFingerprint"))
    {
      -[VCPProtoAssetAnalysis assetMasterFingerprint](self, "assetMasterFingerprint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("masterFingerprint"));

    }
    if (-[VCPProtoAssetAnalysis hasAssetAdjustedFingerprint](self, "hasAssetAdjustedFingerprint"))
    {
      -[VCPProtoAssetAnalysis assetAdjustedFingerprint](self, "assetAdjustedFingerprint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("adjustedFingerprint"));

    }
    if (objc_msgSend(v3, "count"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("metadataRanges"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageBlurResults"), v3, CFSTR("BlurResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageCompositionResults"), v3, CFSTR("CompositionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageExposureResults"), v3, CFSTR("ExposureResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("imageFaceResults"),
         v3,
         CFSTR("FaceResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageFeatureResults"), v3, CFSTR("FeatureVectorResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageJunkResults"), v3, CFSTR("JunkResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imagePetsResults"), v3, CFSTR("PetsResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("imagePetsFaceResults"),
         v3,
         CFSTR("PetsFaceResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageSaliencyResults"), v3, CFSTR("SaliencyResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageSceneprintResults"), v3, CFSTR("SceneprintResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageShotTypeResults"), v3, CFSTR("ShotTypeResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("imageHumanPoseResults"),
         v3,
         CFSTR("HumanPoseResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoRecommendationResults"), v3, CFSTR("IrisRecommendResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoSharpnessResults"), v3, CFSTR("IrisSharpnessResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoHumanActionClassificationResults"), v3)&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("livePhotoEffectsResults"),
         v3,
         CFSTR("LivePhotoEffectsResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoKeyFrameResults"), v3, CFSTR("KeyFrameResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoKeyFrameStillResults"), v3, CFSTR("KeyFrameStillResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("livePhotoSettlingEffectGatingResults"), v3, CFSTR("SettlingEffectsGatingResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieActivityLevelResults"),
         v3,
         CFSTR("ActivityLevelResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieCameraMotionResults"), v3, CFSTR("CameraMotionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieClassificationResults"), v3, CFSTR("ClassificationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieFaceResults"), v3, CFSTR("FaceResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieFaceprintResults"),
         v3,
         CFSTR("FacePrintResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieFeatureResults"), v3, CFSTR("FeatureVectorResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieFineSubjectMotionResults"), v3, CFSTR("FineSubjectMotionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieInterestingnessResults"), v3, CFSTR("InterestingnessResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieMovingObjectResults"),
         v3,
         CFSTR("MovingObjectsResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieMusicResults"), v3, CFSTR("MusicResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieObstructionResults"), v3, CFSTR("ObstructionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieOrientationResults"), v3, CFSTR("OrientationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("moviePreEncodeResults"),
         v3,
         CFSTR("PreEncodeResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieQualityResults"), v3, CFSTR("QualityResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieSaliencyResults"), v3, CFSTR("SaliencyResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieSceneResults"), v3, CFSTR("SceneResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieSceneprintResults"),
         v3,
         CFSTR("SceneprintResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieSubjectMotionResults"), v3, CFSTR("SubjectMotionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieSubtleMotionResults"), v3, CFSTR("SubtleMotionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieUtteranceResults"), v3, CFSTR("UtteranceResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieVoiceResults"),
         v3,
         CFSTR("VoiceResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("animatedStickerResults"), v3, CFSTR("AnimatedStickerResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieSummaryResults"), v3, CFSTR("MovieSummaryResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieHighlightScoreResults"), v3, CFSTR("MovieHighlightScoreResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieHighlightResults"),
         v3,
         CFSTR("MovieHighlightResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieHumanPoseResults"), v3, CFSTR("HumanPoseResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieApplauseResults"), v3, CFSTR("ApplauseResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieAudioQualityResults"), v3, CFSTR("AudioQualityResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieBabbleResults"),
         v3,
         CFSTR("BabbleResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieCheeringResults"), v3, CFSTR("CheeringResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieLaughterResults"), v3, CFSTR("LaughterResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieHumanActionResults"), v3, CFSTR("HumanActionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieLoudnessResults"),
         v3,
         CFSTR("LoudnessResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("moviePetsFaceResults"), v3, CFSTR("PetsFaceResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("moviePetsResults"), v3, CFSTR("PetsResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieStabilizationResults"), v3, CFSTR("VideoStabilizationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("movieSafetyResults"),
         v3,
         CFSTR("SafetyResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieTorsoResults"), v3, CFSTR("TorsoResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("movieHumanActionClassificationResults"), v3, CFSTR("HumanActionClassificationResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageEmbeddingResults"), v3, CFSTR("ImageEmbeddingResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("videoEmbeddingResults"),
         v3,
         CFSTR("VideoEmbeddingResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("summarizedEmbeddingResults"), v3, CFSTR("SummarizedEmbeddingResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("audioFusedVideoEmbeddingResults"), v3, CFSTR("AudioFusedVideoEmbeddingResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("imageCaptionResults"), v3, CFSTR("MiCaImageCaptionResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self,
         "exportResultsWithPropertyKey:toLegacyDictionary:withKey:",
         CFSTR("videoCaptionResults"),
         v3,
         CFSTR("MiCaVideoCaptionResults"))
    && -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("videoCaptionPreferenceResults"), v3, CFSTR("VideoCaptionPreferenceResults"))&& -[VCPProtoAssetAnalysis exportResultsWithPropertyKey:toLegacyDictionary:withKey:](self, "exportResultsWithPropertyKey:toLegacyDictionary:withKey:", CFSTR("videoSegmentCaptionResults"), v3, CFSTR("VideoSegmentCaptionResults")))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis version](self, "version"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("version"));

    if (-[VCPProtoAssetAnalysis hasTypesWide](self, "hasTypesWide"))
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis typesWide](self, "typesWide"));
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis types](self, "types"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("performedAnalysisTypes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAssetAnalysis flags](self, "flags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("flags"));

    v9 = (void *)MEMORY[0x1E0C99D68];
    -[VCPProtoAssetAnalysis date](self, "date");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dateAnalyzed"));

    v11 = (void *)MEMORY[0x1E0C99D68];
    -[VCPProtoAssetAnalysis assetModificationDate](self, "assetModificationDate");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("dateModified"));

    if (-[VCPProtoAssetAnalysis hasQuality](self, "hasQuality"))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[VCPProtoAssetAnalysis quality](self, "quality");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("quality"));

    }
    if (-[VCPProtoAssetAnalysis hasStatsFlags](self, "hasStatsFlags"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCPProtoAssetAnalysis statsFlags](self, "statsFlags"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("statsFlags"));

    }
    if (-[VCPProtoAssetAnalysis hasAssetMasterFingerprint](self, "hasAssetMasterFingerprint"))
    {
      -[VCPProtoAssetAnalysis assetMasterFingerprint](self, "assetMasterFingerprint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("masterFingerprint"));

    }
    if (-[VCPProtoAssetAnalysis hasAssetAdjustedFingerprint](self, "hasAssetAdjustedFingerprint"))
    {
      -[VCPProtoAssetAnalysis assetAdjustedFingerprint](self, "assetAdjustedFingerprint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("adjustedFingerprint"));

    }
    if (objc_msgSend(v3, "count"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("metadataRanges"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
