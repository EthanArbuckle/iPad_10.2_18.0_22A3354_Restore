@implementation FCNewsTabiEventAggregationConditions

- (FCNewsTabiEventAggregationConditions)initWithDictionary:(id)a3
{
  id v4;
  FCNewsTabiEventAggregationConditions *v5;
  FCNewsTabiEventAggregationArticleSeenConditions *v6;
  void *v7;
  uint64_t v8;
  FCNewsTabiEventAggregationArticleSeenConditions *articleSeenConditions;
  FCNewsTabiEventAggregationArticleReadConditions *v10;
  void *v11;
  uint64_t v12;
  FCNewsTabiEventAggregationArticleReadConditions *articleReadConditions;
  FCNewsTabiEventAggregationTrackListenedConditions *v14;
  void *v15;
  uint64_t v16;
  FCNewsTabiEventAggregationTrackListenedConditions *trackListenedConditions;
  FCNewsTabiEventAggregationArticleVisitedConditions *v18;
  void *v19;
  uint64_t v20;
  FCNewsTabiEventAggregationArticleVisitedConditions *articleVisitedConditions;
  FCNewsTabiEventAggregationArticleSharedConditions *v22;
  void *v23;
  uint64_t v24;
  FCNewsTabiEventAggregationArticleSharedConditions *articleSharedConditions;
  FCNewsTabiEventAggregationArticleLikedConditions *v26;
  void *v27;
  uint64_t v28;
  FCNewsTabiEventAggregationArticleLikedConditions *articleLikedConditions;
  FCNewsTabiEventAggregationArticleDislikedConditions *v30;
  void *v31;
  uint64_t v32;
  FCNewsTabiEventAggregationArticleDislikedConditions *articleDislikedConditions;
  FCNewsTabiEventAggregationArticleSavedConditions *v34;
  void *v35;
  uint64_t v36;
  FCNewsTabiEventAggregationArticleSavedConditions *articleSavedConditions;
  FCNewsTabiEventAggregationTrackVisitedConditions *v38;
  void *v39;
  uint64_t v40;
  FCNewsTabiEventAggregationTrackVisitedConditions *trackVisitedConditions;
  FCNewsTabiEventAggregationTrackFinishedConditions *v42;
  void *v43;
  uint64_t v44;
  FCNewsTabiEventAggregationTrackFinishedConditions *trackFinishedConditions;
  FCNewsTabiEventAggregationArticleUnlikedConditions *v46;
  void *v47;
  uint64_t v48;
  FCNewsTabiEventAggregationArticleUnlikedConditions *articleUnlikedConditions;
  FCNewsTabiEventAggregationArticleUndislikedConditions *v50;
  void *v51;
  uint64_t v52;
  FCNewsTabiEventAggregationArticleUndislikedConditions *articleUndislikedConditions;
  FCNewsTabiEventAggregationArticleUnsavedConditions *v54;
  void *v55;
  uint64_t v56;
  FCNewsTabiEventAggregationArticleUnsavedConditions *articleUnsavedConditions;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)FCNewsTabiEventAggregationConditions;
  v5 = -[FCNewsTabiEventAggregationConditions init](&v59, sel_init);
  if (v5)
  {
    v6 = [FCNewsTabiEventAggregationArticleSeenConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleSeenConditions"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCNewsTabiEventAggregationDurationEventConditions initWithDictionary:](v6, "initWithDictionary:", v7);
    articleSeenConditions = v5->_articleSeenConditions;
    v5->_articleSeenConditions = (FCNewsTabiEventAggregationArticleSeenConditions *)v8;

    v10 = [FCNewsTabiEventAggregationArticleReadConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleReadConditions"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCNewsTabiEventAggregationDurationEventConditions initWithDictionary:](v10, "initWithDictionary:", v11);
    articleReadConditions = v5->_articleReadConditions;
    v5->_articleReadConditions = (FCNewsTabiEventAggregationArticleReadConditions *)v12;

    v14 = [FCNewsTabiEventAggregationTrackListenedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackListenedConditions"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v14, "initWithDictionary:", v15);
    trackListenedConditions = v5->_trackListenedConditions;
    v5->_trackListenedConditions = (FCNewsTabiEventAggregationTrackListenedConditions *)v16;

    v18 = [FCNewsTabiEventAggregationArticleVisitedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleVisitedConditions"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v18, "initWithDictionary:", v19);
    articleVisitedConditions = v5->_articleVisitedConditions;
    v5->_articleVisitedConditions = (FCNewsTabiEventAggregationArticleVisitedConditions *)v20;

    v22 = [FCNewsTabiEventAggregationArticleSharedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleSharedConditions"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v22, "initWithDictionary:", v23);
    articleSharedConditions = v5->_articleSharedConditions;
    v5->_articleSharedConditions = (FCNewsTabiEventAggregationArticleSharedConditions *)v24;

    v26 = [FCNewsTabiEventAggregationArticleLikedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleLikedConditions"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v26, "initWithDictionary:", v27);
    articleLikedConditions = v5->_articleLikedConditions;
    v5->_articleLikedConditions = (FCNewsTabiEventAggregationArticleLikedConditions *)v28;

    v30 = [FCNewsTabiEventAggregationArticleDislikedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleDislikedConditions"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v30, "initWithDictionary:", v31);
    articleDislikedConditions = v5->_articleDislikedConditions;
    v5->_articleDislikedConditions = (FCNewsTabiEventAggregationArticleDislikedConditions *)v32;

    v34 = [FCNewsTabiEventAggregationArticleSavedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleSavedConditions"), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v34, "initWithDictionary:", v35);
    articleSavedConditions = v5->_articleSavedConditions;
    v5->_articleSavedConditions = (FCNewsTabiEventAggregationArticleSavedConditions *)v36;

    v38 = [FCNewsTabiEventAggregationTrackVisitedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackVisitedConditions"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v38, "initWithDictionary:", v39);
    trackVisitedConditions = v5->_trackVisitedConditions;
    v5->_trackVisitedConditions = (FCNewsTabiEventAggregationTrackVisitedConditions *)v40;

    v42 = [FCNewsTabiEventAggregationTrackFinishedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackFinishedConditions"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v42, "initWithDictionary:", v43);
    trackFinishedConditions = v5->_trackFinishedConditions;
    v5->_trackFinishedConditions = (FCNewsTabiEventAggregationTrackFinishedConditions *)v44;

    v46 = [FCNewsTabiEventAggregationArticleUnlikedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleUnlikedConditions"), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v46, "initWithDictionary:", v47);
    articleUnlikedConditions = v5->_articleUnlikedConditions;
    v5->_articleUnlikedConditions = (FCNewsTabiEventAggregationArticleUnlikedConditions *)v48;

    v50 = [FCNewsTabiEventAggregationArticleUndislikedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleUndislikedConditions"), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v50, "initWithDictionary:", v51);
    articleUndislikedConditions = v5->_articleUndislikedConditions;
    v5->_articleUndislikedConditions = (FCNewsTabiEventAggregationArticleUndislikedConditions *)v52;

    v54 = [FCNewsTabiEventAggregationArticleUnsavedConditions alloc];
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleUnsavedConditions"), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[FCNewsTabiEventAggregationBaseEventConditions initWithDictionary:](v54, "initWithDictionary:", v55);
    articleUnsavedConditions = v5->_articleUnsavedConditions;
    v5->_articleUnsavedConditions = (FCNewsTabiEventAggregationArticleUnsavedConditions *)v56;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleUnsavedConditions, 0);
  objc_storeStrong((id *)&self->_articleUndislikedConditions, 0);
  objc_storeStrong((id *)&self->_articleUnlikedConditions, 0);
  objc_storeStrong((id *)&self->_trackFinishedConditions, 0);
  objc_storeStrong((id *)&self->_trackListenedConditions, 0);
  objc_storeStrong((id *)&self->_trackVisitedConditions, 0);
  objc_storeStrong((id *)&self->_articleSavedConditions, 0);
  objc_storeStrong((id *)&self->_articleDislikedConditions, 0);
  objc_storeStrong((id *)&self->_articleLikedConditions, 0);
  objc_storeStrong((id *)&self->_articleSharedConditions, 0);
  objc_storeStrong((id *)&self->_articleVisitedConditions, 0);
  objc_storeStrong((id *)&self->_articleReadConditions, 0);
  objc_storeStrong((id *)&self->_articleSeenConditions, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsTabiEventAggregationConditions articleSeenConditions](self, "articleSeenConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indentedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleSeenConditions: %@"), v5);

  -[FCNewsTabiEventAggregationConditions articleReadConditions](self, "articleReadConditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleReadConditions: %@"), v7);

  -[FCNewsTabiEventAggregationConditions trackListenedConditions](self, "trackListenedConditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indentedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttrackListenedConditions: %@"), v9);

  -[FCNewsTabiEventAggregationConditions articleVisitedConditions](self, "articleVisitedConditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indentedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleVisitedConditions: %@"), v11);

  -[FCNewsTabiEventAggregationConditions articleSharedConditions](self, "articleSharedConditions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indentedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleSharedConditions: %@"), v13);

  -[FCNewsTabiEventAggregationConditions articleLikedConditions](self, "articleLikedConditions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indentedDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleLikedConditions: %@"), v15);

  -[FCNewsTabiEventAggregationConditions articleDislikedConditions](self, "articleDislikedConditions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indentedDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleDislikedConditions: %@"), v17);

  -[FCNewsTabiEventAggregationConditions articleSavedConditions](self, "articleSavedConditions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "indentedDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleSavedConditions: %@"), v19);

  -[FCNewsTabiEventAggregationConditions trackVisitedConditions](self, "trackVisitedConditions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indentedDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttrackVisitedConditions: %@"), v21);

  -[FCNewsTabiEventAggregationConditions trackFinishedConditions](self, "trackFinishedConditions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "indentedDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttrackFinishedConditions: %@"), v23);

  -[FCNewsTabiEventAggregationConditions articleUnlikedConditions](self, "articleUnlikedConditions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "indentedDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleUnlikedConditions: %@"), v25);

  -[FCNewsTabiEventAggregationConditions articleUndislikedConditions](self, "articleUndislikedConditions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "indentedDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleUndislikedConditions: %@"), v27);

  -[FCNewsTabiEventAggregationConditions articleUnsavedConditions](self, "articleUnsavedConditions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "indentedDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tarticleUnsavedConditions: %@"), v29);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (FCNewsTabiEventAggregationArticleSeenConditions)articleSeenConditions
{
  return self->_articleSeenConditions;
}

- (FCNewsTabiEventAggregationArticleReadConditions)articleReadConditions
{
  return self->_articleReadConditions;
}

- (FCNewsTabiEventAggregationArticleVisitedConditions)articleVisitedConditions
{
  return self->_articleVisitedConditions;
}

- (FCNewsTabiEventAggregationArticleSharedConditions)articleSharedConditions
{
  return self->_articleSharedConditions;
}

- (FCNewsTabiEventAggregationArticleLikedConditions)articleLikedConditions
{
  return self->_articleLikedConditions;
}

- (FCNewsTabiEventAggregationArticleDislikedConditions)articleDislikedConditions
{
  return self->_articleDislikedConditions;
}

- (FCNewsTabiEventAggregationArticleSavedConditions)articleSavedConditions
{
  return self->_articleSavedConditions;
}

- (FCNewsTabiEventAggregationTrackVisitedConditions)trackVisitedConditions
{
  return self->_trackVisitedConditions;
}

- (FCNewsTabiEventAggregationTrackListenedConditions)trackListenedConditions
{
  return self->_trackListenedConditions;
}

- (FCNewsTabiEventAggregationTrackFinishedConditions)trackFinishedConditions
{
  return self->_trackFinishedConditions;
}

- (FCNewsTabiEventAggregationArticleUnlikedConditions)articleUnlikedConditions
{
  return self->_articleUnlikedConditions;
}

- (FCNewsTabiEventAggregationArticleUndislikedConditions)articleUndislikedConditions
{
  return self->_articleUndislikedConditions;
}

- (FCNewsTabiEventAggregationArticleUnsavedConditions)articleUnsavedConditions
{
  return self->_articleUnsavedConditions;
}

@end
