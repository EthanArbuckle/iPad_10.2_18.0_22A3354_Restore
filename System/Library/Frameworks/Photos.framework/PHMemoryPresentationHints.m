@implementation PHMemoryPresentationHints

- (PHMemoryPresentationHints)initWithMemory:(id)a3
{
  id v4;
  PHMemoryPresentationHints *v5;
  uint64_t v6;
  NSDictionary *musicGenreDistribution;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHMemoryPresentationHints;
  v5 = -[PHMemoryPresentationHints init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "musicGenreDistribution");
    v6 = objc_claimAutoreleasedReturnValue();
    musicGenreDistribution = v5->_musicGenreDistribution;
    v5->_musicGenreDistribution = (NSDictionary *)v6;

    v5->_tripType = objc_msgSend((id)objc_opt_class(), "tripTypeFromMemory:", v4);
    v5->_socialRelationships = objc_msgSend((id)objc_opt_class(), "socialRelationshipsFromMemory:", v4);
    objc_msgSend(v4, "photosGraphProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recommendedMoods = 0;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recommendedMoods"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v5->_recommendedMoods = PHMemoryMoodForString(v9);
    v5->_forbiddenMoods = 0;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("forbiddenMoods"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v5->_forbiddenMoods = PHMemoryMoodForString(v11);
    v5->_qualityCategory = 0;
    if ((objc_msgSend(v4, "isMustSee") & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v4, "isStellar") & 1) != 0)
    {
      v13 = 2;
    }
    else
    {
      if (!objc_msgSend(v4, "isGreat"))
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = 1;
    }
    v5->_qualityCategory = v13;
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  PHCollectionPresentationHintsStringsFromSocialRelationships(-[PHMemoryPresentationHints socialRelationships](self, "socialRelationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)PHMemoryPresentationHints;
  -[PHMemoryPresentationHints description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PHCollectionPresentationHintsStringFromTripType(-[PHMemoryPresentationHints tripType](self, "tripType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PHCollectionPresentationHintsStringFromQualityCategory(-[PHMemoryPresentationHints qualityCategory](self, "qualityCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryPresentationHints musicGenreDistribution](self, "musicGenreDistribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@|%@|%@|%@"), v6, v7, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)recommendedMoods
{
  return self->_recommendedMoods;
}

- (unint64_t)forbiddenMoods
{
  return self->_forbiddenMoods;
}

- (unint64_t)socialRelationships
{
  return self->_socialRelationships;
}

- (int64_t)tripType
{
  return self->_tripType;
}

- (NSDictionary)musicGenreDistribution
{
  return self->_musicGenreDistribution;
}

- (int64_t)qualityCategory
{
  return self->_qualityCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicGenreDistribution, 0);
}

+ (unint64_t)socialRelationshipsFromMemory:(id)a3
{
  return 0;
}

+ (int64_t)tripTypeFromMemory:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "category") == 301)
  {
    v4 = objc_msgSend(v3, "subcategory");
    if (v4 == 215)
      v5 = 2;
    else
      v5 = v4 == 205;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
