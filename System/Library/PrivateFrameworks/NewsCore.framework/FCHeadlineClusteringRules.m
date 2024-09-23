@implementation FCHeadlineClusteringRules

+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 todayFeedEnabled:(BOOL)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "minClusterSizeIPhone");
    v15 = objc_msgSend(v13, "maxClusterSizeIPhone");
    v16 = objc_msgSend(v13, "minClusterSizeIPad");
    v17 = objc_msgSend(v13, "maxClusterSizeIPad");
  }
  else
  {
    v15 = 30;
    v16 = 3;
    v14 = 3;
    v17 = 30;
  }
  LOBYTE(v20) = a7;
  objc_msgSend(a1, "rulesWithTreatment:configurationSet:deviceIsiPad:limitUnpaidArticles:enforcePublisherCap:minClusterSizeiPhone:maxClusterSizeiPhone:minClusterSizeiPad:maxClusterSizeiPad:todayFeedEnabled:", v13, 0, v10, v9, v8, v14, v15, v16, v17, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)rulesWithTreatment:(id)a3 deviceIsiPad:(BOOL)a4 limitUnpaidArticles:(BOOL)a5 enforcePublisherCap:(BOOL)a6 minClusterSizeiPhone:(int64_t)a7 maxClusterSizeiPhone:(int64_t)a8 minClusterSizeiPad:(int64_t)a9 maxClusterSizeiPad:(int64_t)a10 todayFeedEnabled:(BOOL)a11
{
  uint64_t v12;

  LOBYTE(v12) = a11;
  return (id)objc_msgSend(a1, "rulesWithTreatment:configurationSet:deviceIsiPad:limitUnpaidArticles:enforcePublisherCap:minClusterSizeiPhone:maxClusterSizeiPhone:minClusterSizeiPad:maxClusterSizeiPad:todayFeedEnabled:", a3, 0, a4, a5, a6, a7, a8, a9, a10, v12);
}

+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 todayFeedEnabled:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "minClusterSizeIPhone");
    v17 = objc_msgSend(v15, "maxClusterSizeIPhone");
    v18 = objc_msgSend(v15, "minClusterSizeIPad");
    v19 = objc_msgSend(v15, "maxClusterSizeIPad");
  }
  else
  {
    v17 = 30;
    v18 = 3;
    v16 = 3;
    v19 = 30;
  }
  LOBYTE(v22) = a8;
  objc_msgSend(a1, "rulesWithTreatment:configurationSet:deviceIsiPad:limitUnpaidArticles:enforcePublisherCap:minClusterSizeiPhone:maxClusterSizeiPhone:minClusterSizeiPad:maxClusterSizeiPad:todayFeedEnabled:", v15, a4, v11, v10, v9, v16, v17, v18, v19, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)rulesWithTreatment:(id)a3 configurationSet:(int64_t)a4 deviceIsiPad:(BOOL)a5 limitUnpaidArticles:(BOOL)a6 enforcePublisherCap:(BOOL)a7 minClusterSizeiPhone:(int64_t)a8 maxClusterSizeiPhone:(int64_t)a9 minClusterSizeiPad:(int64_t)a10 maxClusterSizeiPad:(int64_t)a11 todayFeedEnabled:(BOOL)a12
{
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v17;
  int64_t v18;
  id v19;
  void *v20;
  int64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  FCHeadlineClusteringRules *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
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
  void *v42;
  uint64_t v44;
  FCHeadlineClusteringRules *v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;

  v14 = a6;
  v15 = a5;
  v17 = a12;
  v18 = a10;
  v19 = a3;
  v20 = v19;
  v21 = &a9;
  if (v15)
    v21 = &a11;
  v22 = *v21;
  if (!v15)
    v18 = a8;
  if (!v19)
  {
    v25 = [FCHeadlineClusteringRules alloc];
    if (v15)
      v26 = 5;
    else
      v26 = 3;
    LOBYTE(v44) = a7;
    v27 = -[FCHeadlineClusteringRules initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:](v25, "initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:", v18, v22, 3, 9, 3, 1.0, 3, v26, 2, v44, 1, 0, 0, 0);
    goto LABEL_45;
  }
  if (v15)
  {
    v23 = objc_msgSend(v19, "maxUnpaidArticlesIPad");
    v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPad");
    v24 = objc_msgSend(v20, "maxNativeAdCountIPad");
  }
  else
  {
    v23 = objc_msgSend(v19, "maxUnpaidArticlesIPhone");
    v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPhone");
    v24 = objc_msgSend(v20, "maxNativeAdCountIPhone");
  }
  v28 = v24;
  objc_msgSend(v20, "topicDiversityThreshold");
  v30 = v29;
  v47 = v18;
  switch(a4)
  {
    case 10:
      if (v15)
      {
        v31 = objc_msgSend(v20, "maxUnpaidArticlesIPadBestOfBundle");
        v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPadBestOfBundle");
        v32 = objc_msgSend(v20, "maxNativeAdCountIPadBestOfBundle");
        goto LABEL_28;
      }
      v31 = objc_msgSend(v20, "maxUnpaidArticlesIPhoneBestOfBundle");
      v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPhoneBestOfBundle");
      v40 = objc_msgSend(v20, "maxNativeAdCountIPhoneBestOfBundle");
      goto LABEL_37;
    case 11:
      if (v15)
      {
        v31 = objc_msgSend(v20, "maxUnpaidArticlesIPadForYouGroup");
        v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPadForYouGroup");
        v32 = objc_msgSend(v20, "maxNativeAdCountIPadForYouGroup");
        goto LABEL_28;
      }
      v31 = objc_msgSend(v20, "maxUnpaidArticlesIPhoneForYouGroup");
      v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPhoneForYouGroup");
      v40 = objc_msgSend(v20, "maxNativeAdCountIPhoneForYouGroup");
      goto LABEL_37;
    case 12:
      if (v15)
      {
        v31 = objc_msgSend(v20, "maxUnpaidArticlesIPadGreatStoriesYouMissed");
        v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPadGreatStoriesYouMissed");
        v32 = objc_msgSend(v20, "maxNativeAdCountIPadGreatStoriesYouMissed");
        goto LABEL_28;
      }
      v31 = objc_msgSend(v20, "maxUnpaidArticlesIPhoneGreatStoriesYouMissed");
      v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPhoneGreatStoriesYouMissed");
      v40 = objc_msgSend(v20, "maxNativeAdCountIPhoneGreatStoriesYouMissed");
      goto LABEL_37;
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
      goto LABEL_22;
    case 19:
    case 21:
      goto LABEL_17;
    default:
      if ((unint64_t)(a4 - 27) < 2)
      {
LABEL_17:
        if (v17)
          v33 = v28;
        else
          v33 = 0;
        v46 = v33;
        v45 = [FCHeadlineClusteringRules alloc];
        v30 = 1.0;
        v31 = v23;
        if (!v15)
          goto LABEL_41;
LABEL_32:
        v35 = objc_msgSend(v20, "minIdealClusterSizeIPad");
        v36 = objc_msgSend(v20, "maxIdealClusterSizeIPad");
        v37 = objc_msgSend(v20, "minClusterSizeIPadAutoFavorite");
        objc_msgSend(v20, "maxClusterSizeIPadAutoFavorite");
        v38 = objc_msgSend(v20, "minIdealClusterSizeIPadAutoFavorite");
        v39 = objc_msgSend(v20, "maxIdealClusterSizeIPadAutoFavorite");
        goto LABEL_42;
      }
LABEL_22:
      if (v15)
      {
        v31 = objc_msgSend(v20, "maxUnpaidArticlesIPad");
        v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPad");
        v32 = objc_msgSend(v20, "maxNativeAdCountIPad");
LABEL_28:
        if (v17)
          v34 = v32;
        else
          v34 = 0;
        v46 = v34;
        v45 = [FCHeadlineClusteringRules alloc];
        goto LABEL_32;
      }
      v31 = objc_msgSend(v20, "maxUnpaidArticlesIPhone");
      v48 = objc_msgSend(v20, "maxPublisherOccurrencesIPhone");
      v40 = objc_msgSend(v20, "maxNativeAdCountIPhone");
LABEL_37:
      if (v17)
        v41 = v40;
      else
        v41 = 0;
      v46 = v41;
      v45 = [FCHeadlineClusteringRules alloc];
LABEL_41:
      v35 = objc_msgSend(v20, "minIdealClusterSizeIPhone");
      v36 = objc_msgSend(v20, "maxIdealClusterSizeIPhone");
      v37 = objc_msgSend(v20, "minClusterSizeIPhoneAutoFavorite");
      objc_msgSend(v20, "maxClusterSizeIPhoneAutoFavorite");
      v38 = objc_msgSend(v20, "minIdealClusterSizeIPhoneAutoFavorite");
      v39 = objc_msgSend(v20, "maxIdealClusterSizeIPhoneAutoFavorite");
LABEL_42:
      if (!v14)
        v31 = v22;
      LOBYTE(v44) = a7;
      v27 = -[FCHeadlineClusteringRules initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:](v45, "initWithMinClusterSize:maxClusterSize:minIdealClusterSize:maxIdealClusterSize:minClusterSizeAutoFavorite:maxClusterSizeAutoFavorite:minIdealClusterSizeAutoFavorite:maxIdealClusterSizeAutoFavorite:maxPublisherOccurrences:enforcePublisherCap:maxUnpaidArticles:maxEvergreenArticles:topicDiversityThreshold:maxNativeAdCount:thumbnailMinHammingDistance:", v47, v22, v35, v36, v37, v30, v38, v39, v48, v44, v31, objc_msgSend(v20, "maxEvergreenArticlesPerGroup"), v46, objc_msgSend(v20, "thumbnailMinHammingDistance"));
LABEL_45:
      v42 = (void *)v27;

      return v42;
  }
}

- (FCHeadlineClusteringRules)initWithMinClusterSize:(unint64_t)a3 maxClusterSize:(unint64_t)a4 minIdealClusterSize:(unint64_t)a5 maxIdealClusterSize:(unint64_t)a6 minClusterSizeAutoFavorite:(unint64_t)a7 maxClusterSizeAutoFavorite:(unint64_t)a8 minIdealClusterSizeAutoFavorite:(unint64_t)a9 maxIdealClusterSizeAutoFavorite:(unint64_t)a10 maxPublisherOccurrences:(unint64_t)a11 enforcePublisherCap:(BOOL)a12 maxUnpaidArticles:(unint64_t)a13 maxEvergreenArticles:(unint64_t)a14 topicDiversityThreshold:(double)a15 maxNativeAdCount:(unint64_t)a16 thumbnailMinHammingDistance:(unint64_t)a17
{
  FCHeadlineClusteringRules *result;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)FCHeadlineClusteringRules;
  result = -[FCHeadlineClusteringRules init](&v30, sel_init);
  if (result)
  {
    result->_minClusterSize = a3;
    result->_maxClusterSize = a4;
    result->_minIdealClusterSize = a5;
    result->_maxIdealClusterSize = a6;
    result->_minClusterSizeAutoFavorite = a7;
    result->_maxClusterSizeAutoFavorite = a8;
    result->_minIdealClusterSizeAutoFavorite = a9;
    result->_maxIdealClusterSizeAutoFavorite = a10;
    result->_enforcePublisherCap = a12;
    result->_maxUnpaidArticles = a13;
    result->_maxEvergreenArticles = a14;
    result->_topicDiversityThreshold = a15;
    result->_maxPublisherOccurrences = a11;
    result->_maxNativeAdCount = a16;
    result->_thumbnailMinHammingDistance = a17;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_autoFavoriteClusterMinSizeMultiplier = _Q0;
  }
  return result;
}

- (FCHeadlineClusteringRules)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCHeadlineClusteringRules init]";
    v9 = 2080;
    v10 = "FCHeadlineClusteringRules.m";
    v11 = 1024;
    v12 = 213;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCHeadlineClusteringRules init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)minClusterSizeAutoFavorite
{
  double minClusterSizeAutoFavorite;
  double v3;

  minClusterSizeAutoFavorite = (double)self->_minClusterSizeAutoFavorite;
  -[FCHeadlineClusteringRules autoFavoriteClusterMinSizeMultiplier](self, "autoFavoriteClusterMinSizeMultiplier");
  *(float *)&v3 = v3 * minClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)maxClusterSizeAutoFavorite
{
  double maxClusterSizeAutoFavorite;
  double v3;

  maxClusterSizeAutoFavorite = (double)self->_maxClusterSizeAutoFavorite;
  -[FCHeadlineClusteringRules autoFavoriteClusterMaxSizeMultiplier](self, "autoFavoriteClusterMaxSizeMultiplier");
  *(float *)&v3 = v3 * maxClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)minIdealClusterSizeAutoFavorite
{
  double minIdealClusterSizeAutoFavorite;
  double v3;

  minIdealClusterSizeAutoFavorite = (double)self->_minIdealClusterSizeAutoFavorite;
  -[FCHeadlineClusteringRules autoFavoriteClusterMinSizeMultiplier](self, "autoFavoriteClusterMinSizeMultiplier");
  *(float *)&v3 = v3 * minIdealClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)maxIdealClusterSizeAutoFavorite
{
  double maxIdealClusterSizeAutoFavorite;
  double v3;

  maxIdealClusterSizeAutoFavorite = (double)self->_maxIdealClusterSizeAutoFavorite;
  -[FCHeadlineClusteringRules autoFavoriteClusterMaxSizeMultiplier](self, "autoFavoriteClusterMaxSizeMultiplier");
  *(float *)&v3 = v3 * maxIdealClusterSizeAutoFavorite;
  return vcvtas_u32_f32(*(float *)&v3);
}

- (unint64_t)minClusterSize
{
  return self->_minClusterSize;
}

- (unint64_t)maxClusterSize
{
  return self->_maxClusterSize;
}

- (unint64_t)minIdealClusterSize
{
  return self->_minIdealClusterSize;
}

- (unint64_t)maxIdealClusterSize
{
  return self->_maxIdealClusterSize;
}

- (void)setMinClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_minClusterSizeAutoFavorite = a3;
}

- (void)setMaxClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_maxClusterSizeAutoFavorite = a3;
}

- (void)setMinIdealClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_minIdealClusterSizeAutoFavorite = a3;
}

- (void)setMaxIdealClusterSizeAutoFavorite:(unint64_t)a3
{
  self->_maxIdealClusterSizeAutoFavorite = a3;
}

- (unint64_t)maxPublisherOccurrences
{
  return self->_maxPublisherOccurrences;
}

- (unint64_t)maxNativeAdCount
{
  return self->_maxNativeAdCount;
}

- (BOOL)enforcePublisherCap
{
  return self->_enforcePublisherCap;
}

- (unint64_t)maxUnpaidArticles
{
  return self->_maxUnpaidArticles;
}

- (unint64_t)maxEvergreenArticles
{
  return self->_maxEvergreenArticles;
}

- (double)topicDiversityThreshold
{
  return self->_topicDiversityThreshold;
}

- (unint64_t)thumbnailMinHammingDistance
{
  return self->_thumbnailMinHammingDistance;
}

- (double)autoFavoriteClusterMinSizeMultiplier
{
  return self->_autoFavoriteClusterMinSizeMultiplier;
}

- (void)setAutoFavoriteClusterMinSizeMultiplier:(double)a3
{
  self->_autoFavoriteClusterMinSizeMultiplier = a3;
}

- (double)autoFavoriteClusterMaxSizeMultiplier
{
  return self->_autoFavoriteClusterMaxSizeMultiplier;
}

- (void)setAutoFavoriteClusterMaxSizeMultiplier:(double)a3
{
  self->_autoFavoriteClusterMaxSizeMultiplier = a3;
}

@end
