@implementation GEOPlaceQuestionnaire

- (GEOPlaceQuestionnaire)initWithGEOPDPlaceQuestionnaire:(id)a3
{
  id *v4;
  void *v5;
  GEOPlaceQuestionnaire *v6;
  uint64_t v7;
  GEOPDScorecardLayout *scorecardLayout;
  BOOL v9;
  unsigned int *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  float *v16;
  float v17;
  GEOPlaceQuestionnaire *v18;
  objc_super v20;

  v4 = (id *)a3;
  -[GEOPDPlaceQuestionnaireResult scorecardLayout](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (!-[GEOPDPlaceQuestionnaireResult collectPhotos]((_BOOL8)v4))
  {
    v18 = 0;
    goto LABEL_17;
  }
  v20.receiver = self;
  v20.super_class = (Class)GEOPlaceQuestionnaire;
  v6 = -[GEOPlaceQuestionnaire init](&v20, sel_init);
  if (v6)
  {
    -[GEOPDPlaceQuestionnaireResult scorecardLayout](v4);
    v7 = objc_claimAutoreleasedReturnValue();
    scorecardLayout = v6->_scorecardLayout;
    v6->_scorecardLayout = (GEOPDScorecardLayout *)v7;

    if (v4)
      v9 = *((_BYTE *)v4 + 64) != 0;
    else
      v9 = 0;
    v6->_alwaysPositionInitialRatingCtaTowardsTop = v9;
    v6->_canCollectPhotos = -[GEOPDPlaceQuestionnaireResult collectPhotos]((_BOOL8)v4);
    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v10 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v10[9];
    else
      v11 = 0;
    v6->_maximumNumberOfPhotos = v11;

    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v12[1];
    else
      v13 = 0;
    v6->_maxPixels = v13;

    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = v14[3];
    else
      v15 = 0;
    v6->_minPixels = v15;

    -[GEOPDPlaceQuestionnaireResult photoConstraints](v4);
    v16 = (float *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v16[8];
    else
      v17 = 0.0;
    v6->_maxAspectRatio = v17;

  }
  self = v6;
  v18 = self;
LABEL_17:

  return v18;
}

- (BOOL)canCollectRatings
{
  return self->_scorecardLayout != 0;
}

- (BOOL)canShowCallToAction
{
  return -[GEOPlaceQuestionnaire canCollectPhotos](self, "canCollectPhotos")
      || -[GEOPlaceQuestionnaire canCollectRatings](self, "canCollectRatings");
}

- (NSString)version
{
  return -[GEOPDScorecardLayout version]((id *)&self->_scorecardLayout->super.super.isa);
}

- (NSArray)ratingCategories
{
  NSArray *ratingCategories;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOAppleRatingCategory *v11;
  GEOAppleRatingCategory *v12;
  NSArray *v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ratingCategories = self->_ratingCategories;
  if (!ratingCategories)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOPDScorecardLayout ratingCategorys]((id *)&self->_scorecardLayout->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = [GEOAppleRatingCategory alloc];
          v12 = -[GEOAppleRatingCategory initWithRatingCategory:](v11, "initWithRatingCategory:", v10, (_QWORD)v16);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = (NSArray *)objc_msgSend(v4, "copy");
    v14 = self->_ratingCategories;
    self->_ratingCategories = v13;

    ratingCategories = self->_ratingCategories;
  }
  return ratingCategories;
}

- (BOOL)alwaysPositionInitialRatingCtaTowardsTop
{
  return self->_alwaysPositionInitialRatingCtaTowardsTop;
}

- (BOOL)canCollectPhotos
{
  return self->_canCollectPhotos;
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (unint64_t)maxPixels
{
  return self->_maxPixels;
}

- (unint64_t)minPixels
{
  return self->_minPixels;
}

- (float)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingCategories, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_scorecardLayout, 0);
}

@end
