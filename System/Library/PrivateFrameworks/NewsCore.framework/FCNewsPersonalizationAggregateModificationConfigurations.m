@implementation FCNewsPersonalizationAggregateModificationConfigurations

- (FCNewsPersonalizationAggregateModificationConfigurations)initWithDictionary:(id)a3
{
  id v4;
  FCNewsPersonalizationAggregateModificationConfigurations *v5;
  FCNewsPersonalizationAggregateModificationConfiguration *v6;
  FCNewsPersonalizationAggregateModificationConfiguration *articleSeenAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v8;
  FCNewsPersonalizationAggregateModificationConfiguration *articleVisitedAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v10;
  FCNewsPersonalizationAggregateModificationConfiguration *articleReadAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v12;
  FCNewsPersonalizationAggregateModificationConfiguration *dislikeAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v14;
  FCNewsPersonalizationAggregateModificationConfiguration *undislikeAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v16;
  FCNewsPersonalizationAggregateModificationConfiguration *likeAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v18;
  FCNewsPersonalizationAggregateModificationConfiguration *unlikeAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v20;
  FCNewsPersonalizationAggregateModificationConfiguration *shareAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v22;
  FCNewsPersonalizationAggregateModificationConfiguration *muteAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v24;
  FCNewsPersonalizationAggregateModificationConfiguration *savedAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v26;
  FCNewsPersonalizationAggregateModificationConfiguration *unsavedAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v28;
  FCNewsPersonalizationAggregateModificationConfiguration *unmuteAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v30;
  FCNewsPersonalizationAggregateModificationConfiguration *followAggregateModificationConfiguration;
  FCNewsPersonalizationAggregateModificationConfiguration *v32;
  FCNewsPersonalizationAggregateModificationConfiguration *unfollowAggregateModificationConfiguration;
  void *v34;
  FCNewsPersonalizationAggregateModificationConfiguration *v35;
  FCNewsPersonalizationAggregateModificationConfiguration *deprecatedFeedViewAggregateModificationConfiguration;
  void *v37;
  FCNewsPersonalizationAggregateModificationConfiguration *v38;
  FCNewsPersonalizationAggregateModificationConfiguration *feedViewAggregateModificationConfiguration;
  void *v40;
  FCNewsPersonalizationAggregateModificationConfiguration *v41;
  FCNewsPersonalizationAggregateModificationConfiguration *tagIgnoreAggregateModificationConfiguration;
  void *v43;
  FCNewsPersonalizationAggregateModificationConfiguration *v44;
  FCNewsPersonalizationAggregateModificationConfiguration *trackVisitedAggregateModificationConfiguration;
  void *v46;
  FCNewsPersonalizationAggregateModificationConfiguration *v47;
  FCNewsPersonalizationAggregateModificationConfiguration *trackListenedAggregateModificationConfiguration;
  void *v49;
  FCNewsPersonalizationAggregateModificationConfiguration *v50;
  FCNewsPersonalizationAggregateModificationConfiguration *trackFinishedAggregateModificationConfiguration;
  void *v52;
  FCNewsPersonalizationAggregateModificationConfiguration *v53;
  FCNewsPersonalizationAggregateModificationConfiguration *sportsTagSeenAggregateModificationConfiguration;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)FCNewsPersonalizationAggregateModificationConfigurations;
  v5 = -[FCNewsPersonalizationAggregateModificationConfigurations init](&v70, sel_init);
  if (v5)
  {
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleSeen"), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v69);
    articleSeenAggregateModificationConfiguration = v5->_articleSeenAggregateModificationConfiguration;
    v5->_articleSeenAggregateModificationConfiguration = v6;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleVisited"), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v68);
    articleVisitedAggregateModificationConfiguration = v5->_articleVisitedAggregateModificationConfiguration;
    v5->_articleVisitedAggregateModificationConfiguration = v8;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("articleRead"), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v67);
    articleReadAggregateModificationConfiguration = v5->_articleReadAggregateModificationConfiguration;
    v5->_articleReadAggregateModificationConfiguration = v10;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("dislike"), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v66);
    dislikeAggregateModificationConfiguration = v5->_dislikeAggregateModificationConfiguration;
    v5->_dislikeAggregateModificationConfiguration = v12;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("undislike"), 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v65);
    undislikeAggregateModificationConfiguration = v5->_undislikeAggregateModificationConfiguration;
    v5->_undislikeAggregateModificationConfiguration = v14;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("like"), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v64);
    likeAggregateModificationConfiguration = v5->_likeAggregateModificationConfiguration;
    v5->_likeAggregateModificationConfiguration = v16;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("unlike"), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v63);
    unlikeAggregateModificationConfiguration = v5->_unlikeAggregateModificationConfiguration;
    v5->_unlikeAggregateModificationConfiguration = v18;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("share"), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v62);
    shareAggregateModificationConfiguration = v5->_shareAggregateModificationConfiguration;
    v5->_shareAggregateModificationConfiguration = v20;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("mute"), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v61);
    muteAggregateModificationConfiguration = v5->_muteAggregateModificationConfiguration;
    v5->_muteAggregateModificationConfiguration = v22;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("saved"), 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v60);
    savedAggregateModificationConfiguration = v5->_savedAggregateModificationConfiguration;
    v5->_savedAggregateModificationConfiguration = v24;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("unsaved"), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v59);
    unsavedAggregateModificationConfiguration = v5->_unsavedAggregateModificationConfiguration;
    v5->_unsavedAggregateModificationConfiguration = v26;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("unmute"), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v58);
    unmuteAggregateModificationConfiguration = v5->_unmuteAggregateModificationConfiguration;
    v5->_unmuteAggregateModificationConfiguration = v28;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("follow"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v57);
    followAggregateModificationConfiguration = v5->_followAggregateModificationConfiguration;
    v5->_followAggregateModificationConfiguration = v30;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("unfollow"), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v56);
    unfollowAggregateModificationConfiguration = v5->_unfollowAggregateModificationConfiguration;
    v5->_unfollowAggregateModificationConfiguration = v32;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("feedView"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v34);
    deprecatedFeedViewAggregateModificationConfiguration = v5->_deprecatedFeedViewAggregateModificationConfiguration;
    v5->_deprecatedFeedViewAggregateModificationConfiguration = v35;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("feedView2"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v37);
    feedViewAggregateModificationConfiguration = v5->_feedViewAggregateModificationConfiguration;
    v5->_feedViewAggregateModificationConfiguration = v38;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("tagIgnore"), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v40);
    tagIgnoreAggregateModificationConfiguration = v5->_tagIgnoreAggregateModificationConfiguration;
    v5->_tagIgnoreAggregateModificationConfiguration = v41;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackVisited"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v43);
    trackVisitedAggregateModificationConfiguration = v5->_trackVisitedAggregateModificationConfiguration;
    v5->_trackVisitedAggregateModificationConfiguration = v44;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackListened"), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v46);
    trackListenedAggregateModificationConfiguration = v5->_trackListenedAggregateModificationConfiguration;
    v5->_trackListenedAggregateModificationConfiguration = v47;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("trackFinished"), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v49);
    trackFinishedAggregateModificationConfiguration = v5->_trackFinishedAggregateModificationConfiguration;
    v5->_trackFinishedAggregateModificationConfiguration = v50;

    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("sportsTagSeen"), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[FCNewsPersonalizationAggregateModificationConfiguration initWithDictionary:]([FCNewsPersonalizationAggregateModificationConfiguration alloc], "initWithDictionary:", v52);
    sportsTagSeenAggregateModificationConfiguration = v5->_sportsTagSeenAggregateModificationConfiguration;
    v5->_sportsTagSeenAggregateModificationConfiguration = v53;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsTagSeenAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_trackFinishedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_trackListenedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_trackVisitedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_tagIgnoreAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_feedViewAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_deprecatedFeedViewAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_unfollowAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_followAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_unmuteAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_unsavedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_savedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_muteAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_shareAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_unlikeAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_likeAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_undislikeAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_dislikeAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_articleReadAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_articleVisitedAggregateModificationConfiguration, 0);
  objc_storeStrong((id *)&self->_articleSeenAggregateModificationConfiguration, 0);
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNewsPersonalizationAggregateModificationConfigurations articleSeenAggregateModificationConfiguration](self, "articleSeenAggregateModificationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleSeenAggregateModificationConfiguration: %@"), v4);

  -[FCNewsPersonalizationAggregateModificationConfigurations articleVisitedAggregateModificationConfiguration](self, "articleVisitedAggregateModificationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleVisitedAggregateModificationConfiguration: %@"), v5);

  -[FCNewsPersonalizationAggregateModificationConfigurations articleReadAggregateModificationConfiguration](self, "articleReadAggregateModificationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; articleReadAggregateModificationConfiguration: %@"), v6);

  -[FCNewsPersonalizationAggregateModificationConfigurations dislikeAggregateModificationConfiguration](self, "dislikeAggregateModificationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; dislikeAggregateModificationConfiguration: %@"), v7);

  -[FCNewsPersonalizationAggregateModificationConfigurations undislikeAggregateModificationConfiguration](self, "undislikeAggregateModificationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; undislikeAggregateModificationConfiguration: %@"), v8);

  -[FCNewsPersonalizationAggregateModificationConfigurations likeAggregateModificationConfiguration](self, "likeAggregateModificationConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; likeAggregateModificationConfiguration: %@"), v9);

  -[FCNewsPersonalizationAggregateModificationConfigurations unlikeAggregateModificationConfiguration](self, "unlikeAggregateModificationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; unlikeAggregateModificationConfiguration: %@"), v10);

  -[FCNewsPersonalizationAggregateModificationConfigurations shareAggregateModificationConfiguration](self, "shareAggregateModificationConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; shareAggregateModificationConfiguration: %@"), v11);

  -[FCNewsPersonalizationAggregateModificationConfigurations muteAggregateModificationConfiguration](self, "muteAggregateModificationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; muteAggregateModificationConfiguration: %@"), v12);

  -[FCNewsPersonalizationAggregateModificationConfigurations savedAggregateModificationConfiguration](self, "savedAggregateModificationConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; savedAggregateModificationConfiguration: %@"), v13);

  -[FCNewsPersonalizationAggregateModificationConfigurations unsavedAggregateModificationConfiguration](self, "unsavedAggregateModificationConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; unsavedAggregateModificationConfiguration: %@"), v14);

  -[FCNewsPersonalizationAggregateModificationConfigurations unmuteAggregateModificationConfiguration](self, "unmuteAggregateModificationConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; unmuteAggregateModificationConfiguration: %@"), v15);

  -[FCNewsPersonalizationAggregateModificationConfigurations followAggregateModificationConfiguration](self, "followAggregateModificationConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; followAggregateModificationConfiguration: %@"), v16);

  -[FCNewsPersonalizationAggregateModificationConfigurations unfollowAggregateModificationConfiguration](self, "unfollowAggregateModificationConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; unfollowAggregateModificationConfiguration: %@"), v17);

  -[FCNewsPersonalizationAggregateModificationConfigurations deprecatedFeedViewAggregateModificationConfiguration](self, "deprecatedFeedViewAggregateModificationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; deprecatedFeedViewAggregateModificationConfiguration: %@"), v18);

  -[FCNewsPersonalizationAggregateModificationConfigurations feedViewAggregateModificationConfiguration](self, "feedViewAggregateModificationConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; feedViewAggregateModificationConfiguration: %@"), v19);

  -[FCNewsPersonalizationAggregateModificationConfigurations tagIgnoreAggregateModificationConfiguration](self, "tagIgnoreAggregateModificationConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; tagIgnoreAggregateModificationConfiguration: %@"), v20);

  -[FCNewsPersonalizationAggregateModificationConfigurations trackVisitedAggregateModificationConfiguration](self, "trackVisitedAggregateModificationConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trackVisitedAggregateModificationConfiguration: %@"), v21);

  -[FCNewsPersonalizationAggregateModificationConfigurations trackListenedAggregateModificationConfiguration](self, "trackListenedAggregateModificationConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trackListenedAggregateModificationConfiguration: %@"), v22);

  -[FCNewsPersonalizationAggregateModificationConfigurations trackFinishedAggregateModificationConfiguration](self, "trackFinishedAggregateModificationConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; trackFinishedAggregateModificationConfiguration: %@"), v23);

  -[FCNewsPersonalizationAggregateModificationConfigurations sportsTagSeenAggregateModificationConfiguration](self, "sportsTagSeenAggregateModificationConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; sportsTagSeenAggregateModificationConfiguration: %@"), v24);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (FCNewsPersonalizationAggregateModificationConfiguration)articleSeenAggregateModificationConfiguration
{
  return self->_articleSeenAggregateModificationConfiguration;
}

- (void)setArticleSeenAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_articleSeenAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)articleVisitedAggregateModificationConfiguration
{
  return self->_articleVisitedAggregateModificationConfiguration;
}

- (void)setArticleVisitedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_articleVisitedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)articleReadAggregateModificationConfiguration
{
  return self->_articleReadAggregateModificationConfiguration;
}

- (void)setArticleReadAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_articleReadAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)dislikeAggregateModificationConfiguration
{
  return self->_dislikeAggregateModificationConfiguration;
}

- (void)setDislikeAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_dislikeAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)undislikeAggregateModificationConfiguration
{
  return self->_undislikeAggregateModificationConfiguration;
}

- (void)setUndislikeAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_undislikeAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)likeAggregateModificationConfiguration
{
  return self->_likeAggregateModificationConfiguration;
}

- (void)setLikeAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_likeAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)unlikeAggregateModificationConfiguration
{
  return self->_unlikeAggregateModificationConfiguration;
}

- (void)setUnlikeAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_unlikeAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)shareAggregateModificationConfiguration
{
  return self->_shareAggregateModificationConfiguration;
}

- (void)setShareAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_shareAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)muteAggregateModificationConfiguration
{
  return self->_muteAggregateModificationConfiguration;
}

- (void)setMuteAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_muteAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)savedAggregateModificationConfiguration
{
  return self->_savedAggregateModificationConfiguration;
}

- (void)setSavedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_savedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)unsavedAggregateModificationConfiguration
{
  return self->_unsavedAggregateModificationConfiguration;
}

- (void)setUnsavedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)unmuteAggregateModificationConfiguration
{
  return self->_unmuteAggregateModificationConfiguration;
}

- (void)setUnmuteAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_unmuteAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)followAggregateModificationConfiguration
{
  return self->_followAggregateModificationConfiguration;
}

- (void)setFollowAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_followAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)unfollowAggregateModificationConfiguration
{
  return self->_unfollowAggregateModificationConfiguration;
}

- (void)setUnfollowAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_unfollowAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)deprecatedFeedViewAggregateModificationConfiguration
{
  return self->_deprecatedFeedViewAggregateModificationConfiguration;
}

- (void)setDeprecatedFeedViewAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_deprecatedFeedViewAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)feedViewAggregateModificationConfiguration
{
  return self->_feedViewAggregateModificationConfiguration;
}

- (void)setFeedViewAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)tagIgnoreAggregateModificationConfiguration
{
  return self->_tagIgnoreAggregateModificationConfiguration;
}

- (void)setTagIgnoreAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_tagIgnoreAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)trackVisitedAggregateModificationConfiguration
{
  return self->_trackVisitedAggregateModificationConfiguration;
}

- (void)setTrackVisitedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_trackVisitedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)trackListenedAggregateModificationConfiguration
{
  return self->_trackListenedAggregateModificationConfiguration;
}

- (void)setTrackListenedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_trackListenedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)trackFinishedAggregateModificationConfiguration
{
  return self->_trackFinishedAggregateModificationConfiguration;
}

- (void)setTrackFinishedAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_trackFinishedAggregateModificationConfiguration, a3);
}

- (FCNewsPersonalizationAggregateModificationConfiguration)sportsTagSeenAggregateModificationConfiguration
{
  return self->_sportsTagSeenAggregateModificationConfiguration;
}

- (void)setSportsTagSeenAggregateModificationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sportsTagSeenAggregateModificationConfiguration, a3);
}

@end
