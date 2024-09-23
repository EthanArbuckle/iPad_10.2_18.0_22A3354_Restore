@implementation FCNewsTabiConfiguration

- (NSArray)packageAssetIDs
{
  NSArray *packageAssetIDs;
  _QWORD v4[5];

  packageAssetIDs = self->_packageAssetIDs;
  if (packageAssetIDs)
    return packageAssetIDs;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke;
  v4[3] = &unk_1E4643BA0;
  v4[4] = self;
  __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke((uint64_t)v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)version
{
  return self->_version;
}

- (FCNewsTabiConfiguration)initWithDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  FCNewsTabiConfiguration *v8;
  FCNewsTabiConfiguration *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *version;
  uint64_t v15;
  NSArray *packageAssetIDs;
  FCNewsTabiAdSegmentsEndpoint *v17;
  FCNewsTabiAdSegmentsEndpoint *adSegmentsEndpoint;
  FCNewsTabiChannelPickerSuggestionsEndpoint *v19;
  FCNewsTabiChannelPickerSuggestionsEndpoint *channelPickerSuggestionsEndpoint;
  FCNewsTabiChannelPickerSuggestionsConfiguration *v21;
  FCNewsTabiChannelPickerSuggestionsConfiguration *channelPickerSuggestionsConfiguration;
  FCNewsTabiFeedPersonalizationEndpoint *v23;
  FCNewsTabiFeedPersonalizationEndpoint *feedPersonalizationEndpoint;
  FCNewsTabiFeedPersonalizationConfiguration *v25;
  FCNewsTabiFeedPersonalizationConfiguration *feedPersonalizationConfiguration;
  FCNewsTabiPersonalizedPaywallsEndpoint *v27;
  FCNewsTabiPersonalizedPaywallsEndpoint *personalizedPaywallsEndpoint;
  FCNewsTabiPersonalizedPaywallsConfiguration *v29;
  FCNewsTabiPersonalizedPaywallsConfiguration *personalizedPaywallsConfiguration;
  FCNewsTabiRecommendedIssuesEndpoint *v31;
  FCNewsTabiRecommendedIssuesEndpoint *recommendedIssuesEndpoint;
  FCNewsTabiRecommendedIssuesConfiguration *v33;
  FCNewsTabiRecommendedIssuesConfiguration *recommendedIssuesConfiguration;
  FCNewsTabiRecommendedTagsEndpoint *v35;
  FCNewsTabiRecommendedTagsEndpoint *recommendedTagsEndpoint;
  FCNewsTabiTagCohortMembershipEndpoint *v37;
  FCNewsTabiTagCohortMembershipEndpoint *tagCohortMembershipEndpoint;
  FCNewsTabiTagScoringEndpoint *v39;
  FCNewsTabiTagScoringEndpoint *tagScoringEndpoint;
  FCNewsTabiTagSuggestionsEndpoint *v41;
  FCNewsTabiTagSuggestionsEndpoint *tagSuggestionsEndpoint;
  void *v43;
  FCNewsTabiMyMagazinesEndpoint *v44;
  FCNewsTabiMyMagazinesEndpoint *myMagazinesEndpoint;
  void *v46;
  FCNewsTabiUnloadGraphOnBackgroundConfiguration *v47;
  FCNewsTabiUnloadGraphOnBackgroundConfiguration *unloadGraphOnBackgroundConfiguration;
  void *v49;
  FCNewsTabiEventAggregationConfiguration *v50;
  void *v51;
  FCNewsTabiConfiguration *v52;
  void *v53;
  uint64_t v54;
  FCNewsTabiEventAggregationConfiguration *eventAggregationConfiguration;
  FCNewsTabiConfiguration *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  FCNewsTabiConfiguration *v68;
  objc_super v69;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v69.receiver = self;
    v69.super_class = (Class)FCNewsTabiConfiguration;
    v8 = -[FCNewsTabiConfiguration init](&v69, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_dictionary, a3);
      v10 = v7;
      v11 = FCAppConfigurationIntegerValue(v10, (uint64_t)CFSTR("mlComputeUnits"), 0);
      if ((unint64_t)(v11 - 1) >= 3)
        v12 = 0;
      else
        v12 = v11;
      v9->_mlComputeUnits = v12;
      FCAppConfigurationStringValue(v10, (uint64_t)CFSTR("version"), CFSTR("UNSPECIFIED"));
      v13 = objc_claimAutoreleasedReturnValue();
      version = v9->_version;
      v9->_version = (NSString *)v13;

      FCAppConfigurationArrayValueWithDefaultValue(v10, (uint64_t)CFSTR("packageAssetIDs"), 0);
      v15 = objc_claimAutoreleasedReturnValue();
      packageAssetIDs = v9->_packageAssetIDs;
      v9->_packageAssetIDs = (NSArray *)v15;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("adSegmentsConfiguration"), 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[FCNewsTabiAdSegmentsEndpoint initWithDictionary:]([FCNewsTabiAdSegmentsEndpoint alloc], "initWithDictionary:", v66);
      adSegmentsEndpoint = v9->_adSegmentsEndpoint;
      v9->_adSegmentsEndpoint = v17;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("channelPickerSuggestionsConfiguration"), 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FCNewsTabiChannelPickerSuggestionsEndpoint initWithDictionary:]([FCNewsTabiChannelPickerSuggestionsEndpoint alloc], "initWithDictionary:", v65);
      channelPickerSuggestionsEndpoint = v9->_channelPickerSuggestionsEndpoint;
      v9->_channelPickerSuggestionsEndpoint = v19;

      v21 = -[FCNewsTabiChannelPickerSuggestionsConfiguration initWithDictionary:]([FCNewsTabiChannelPickerSuggestionsConfiguration alloc], "initWithDictionary:", v65);
      channelPickerSuggestionsConfiguration = v9->_channelPickerSuggestionsConfiguration;
      v9->_channelPickerSuggestionsConfiguration = v21;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("feedPersonalizationConfiguration"), 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[FCNewsTabiFeedPersonalizationEndpoint initWithDictionary:]([FCNewsTabiFeedPersonalizationEndpoint alloc], "initWithDictionary:", v64);
      feedPersonalizationEndpoint = v9->_feedPersonalizationEndpoint;
      v9->_feedPersonalizationEndpoint = v23;

      v25 = -[FCNewsTabiFeedPersonalizationConfiguration initWithDictionary:]([FCNewsTabiFeedPersonalizationConfiguration alloc], "initWithDictionary:", v64);
      feedPersonalizationConfiguration = v9->_feedPersonalizationConfiguration;
      v9->_feedPersonalizationConfiguration = v25;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("personalizedPaywallsConfiguration"), 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[FCNewsTabiPersonalizedPaywallsEndpoint initWithDictionary:]([FCNewsTabiPersonalizedPaywallsEndpoint alloc], "initWithDictionary:", v63);
      personalizedPaywallsEndpoint = v9->_personalizedPaywallsEndpoint;
      v9->_personalizedPaywallsEndpoint = v27;

      v29 = -[FCNewsTabiPersonalizedPaywallsConfiguration initWithDictionary:]([FCNewsTabiPersonalizedPaywallsConfiguration alloc], "initWithDictionary:", v63);
      personalizedPaywallsConfiguration = v9->_personalizedPaywallsConfiguration;
      v9->_personalizedPaywallsConfiguration = v29;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("recommendedIssuesConfiguration"), 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[FCNewsTabiRecommendedIssuesEndpoint initWithDictionary:]([FCNewsTabiRecommendedIssuesEndpoint alloc], "initWithDictionary:", v62);
      recommendedIssuesEndpoint = v9->_recommendedIssuesEndpoint;
      v9->_recommendedIssuesEndpoint = v31;

      v33 = -[FCNewsTabiRecommendedIssuesConfiguration initWithDictionary:]([FCNewsTabiRecommendedIssuesConfiguration alloc], "initWithDictionary:", v62);
      recommendedIssuesConfiguration = v9->_recommendedIssuesConfiguration;
      v9->_recommendedIssuesConfiguration = v33;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("recommendedTagsConfiguration"), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[FCNewsTabiRecommendedTagsEndpoint initWithDictionary:]([FCNewsTabiRecommendedTagsEndpoint alloc], "initWithDictionary:", v61);
      recommendedTagsEndpoint = v9->_recommendedTagsEndpoint;
      v9->_recommendedTagsEndpoint = v35;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("tagCohortMembershipConfiguration"), 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[FCNewsTabiTagCohortMembershipEndpoint initWithDictionary:]([FCNewsTabiTagCohortMembershipEndpoint alloc], "initWithDictionary:", v60);
      tagCohortMembershipEndpoint = v9->_tagCohortMembershipEndpoint;
      v9->_tagCohortMembershipEndpoint = v37;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("tagScoringConfiguration"), 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[FCNewsTabiTagScoringEndpoint initWithDictionary:]([FCNewsTabiTagScoringEndpoint alloc], "initWithDictionary:", v59);
      tagScoringEndpoint = v9->_tagScoringEndpoint;
      v9->_tagScoringEndpoint = v39;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("tagSuggestionsConfiguration"), 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[FCNewsTabiTagSuggestionsEndpoint initWithDictionary:]([FCNewsTabiTagSuggestionsEndpoint alloc], "initWithDictionary:", v58);
      tagSuggestionsEndpoint = v9->_tagSuggestionsEndpoint;
      v9->_tagSuggestionsEndpoint = v41;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("myMagazinesConfiguration"), 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[FCNewsTabiMyMagazinesEndpoint initWithDictionary:]([FCNewsTabiMyMagazinesEndpoint alloc], "initWithDictionary:", v43);
      myMagazinesEndpoint = v9->_myMagazinesEndpoint;
      v9->_myMagazinesEndpoint = v44;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("unloadGraphOnBackgroundConfiguration"), 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[FCNewsTabiUnloadGraphOnBackgroundConfiguration initWithDictionary:]([FCNewsTabiUnloadGraphOnBackgroundConfiguration alloc], "initWithDictionary:", v46);
      unloadGraphOnBackgroundConfiguration = v9->_unloadGraphOnBackgroundConfiguration;
      v9->_unloadGraphOnBackgroundConfiguration = v47;

      FCAppConfigurationDictionaryValueWithDefaultValue(v10, (uint64_t)CFSTR("eventAggregationConfiguration"), 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = [FCNewsTabiEventAggregationConfiguration alloc];
      v51 = (void *)MEMORY[0x1E0C99D20];
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_3;
      v67[3] = &unk_1E463AA30;
      v52 = v9;
      v68 = v52;
      objc_msgSend(v51, "fc_array:", v67);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[FCNewsTabiEventAggregationConfiguration initWithDictionary:outputs:](v50, "initWithDictionary:outputs:", v49, v53);
      eventAggregationConfiguration = v52->_eventAggregationConfiguration;
      v52->_eventAggregationConfiguration = (FCNewsTabiEventAggregationConfiguration *)v54;

    }
    self = v9;

    v56 = self;
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagSuggestionsEndpoint, 0);
  objc_storeStrong((id *)&self->_tagScoringEndpoint, 0);
  objc_storeStrong((id *)&self->_myMagazinesEndpoint, 0);
  objc_storeStrong((id *)&self->_tagCohortMembershipEndpoint, 0);
  objc_storeStrong((id *)&self->_recommendedTagsEndpoint, 0);
  objc_storeStrong((id *)&self->_recommendedIssuesEndpoint, 0);
  objc_storeStrong((id *)&self->_personalizedPaywallsEndpoint, 0);
  objc_storeStrong((id *)&self->_feedPersonalizationEndpoint, 0);
  objc_storeStrong((id *)&self->_channelPickerSuggestionsEndpoint, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_unloadGraphOnBackgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_myMagazinesConfiguration, 0);
  objc_storeStrong((id *)&self->_tagSuggestionsConfiguration, 0);
  objc_storeStrong((id *)&self->_tagScoringConfiguration, 0);
  objc_storeStrong((id *)&self->_recommendedTagsConfiguration, 0);
  objc_storeStrong((id *)&self->_recommendedIssuesConfiguration, 0);
  objc_storeStrong((id *)&self->_personalizedPaywallsConfiguration, 0);
  objc_storeStrong((id *)&self->_packageAssetIDs, 0);
  objc_storeStrong((id *)&self->_feedPersonalizationConfiguration, 0);
  objc_storeStrong((id *)&self->_eventAggregationConfiguration, 0);
  objc_storeStrong((id *)&self->_tagCohortMembershipConfiguration, 0);
  objc_storeStrong((id *)&self->_channelPickerSuggestionsConfiguration, 0);
  objc_storeStrong((id *)&self->_adSegmentsEndpoint, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (FCNewsTabiConfiguration)init
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
    v8 = "-[FCNewsTabiConfiguration init]";
    v9 = 2080;
    v10 = "FCNewsTabiConfiguration.m";
    v11 = 1024;
    v12 = 76;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNewsTabiConfiguration init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void __46__FCNewsTabiConfiguration_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = a2;
  objc_msgSend(v3, "eventAggregationOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "eventAggregationOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "eventAggregationOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "eventAggregationOutputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "eventAggregationOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "eventAggregationOutputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "eventAggregationOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "eventAggregationOutputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "eventAggregationOutputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "eventAggregationOutputs");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v14);

}

id __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke_2;
  v4[3] = &unk_1E463AE18;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "fc_set:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __42__FCNewsTabiConfiguration_packageAssetIDs__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
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
  id v22;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "channelPickerSuggestionsEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "packageAssetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "feedPersonalizationEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "packageAssetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "personalizedPaywallsEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "packageAssetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "recommendedIssuesEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "packageAssetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "recommendedTagsEndpoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "packageAssetID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v14);

  objc_msgSend(*(id *)(a1 + 32), "tagCohortMembershipEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "packageAssetID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v16);

  objc_msgSend(*(id *)(a1 + 32), "tagScoringEndpoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "packageAssetID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v18);

  objc_msgSend(*(id *)(a1 + 32), "tagSuggestionsEndpoint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "packageAssetID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v20);

  objc_msgSend(*(id *)(a1 + 32), "myMagazinesEndpoint");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "packageAssetID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v21);

}

- (FCNewsTabiChannelPickerSuggestionsConfiguration)channelPickerSuggestionsConfiguration
{
  void *v3;
  void *channelPickerSuggestionsConfiguration;
  void *v5;
  FCNewsTabiChannelPickerSuggestionsConfiguration *v6;

  -[FCNewsTabiConfiguration channelPickerSuggestionsEndpoint](self, "channelPickerSuggestionsEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  channelPickerSuggestionsConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  v5 = channelPickerSuggestionsConfiguration;
  if (!channelPickerSuggestionsConfiguration)
    channelPickerSuggestionsConfiguration = self->_channelPickerSuggestionsConfiguration;
  v6 = channelPickerSuggestionsConfiguration;

  return v6;
}

- (FCNewsTabiEventAggregationConfiguration)eventAggregationConfiguration
{
  return self->_eventAggregationConfiguration;
}

- (FCNewsTabiFeedPersonalizationConfiguration)feedPersonalizationConfiguration
{
  void *v3;
  void *feedPersonalizationConfiguration;
  void *v5;
  FCNewsTabiFeedPersonalizationConfiguration *v6;

  -[FCNewsTabiConfiguration feedPersonalizationEndpoint](self, "feedPersonalizationEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  feedPersonalizationConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  v5 = feedPersonalizationConfiguration;
  if (!feedPersonalizationConfiguration)
    feedPersonalizationConfiguration = self->_feedPersonalizationConfiguration;
  v6 = feedPersonalizationConfiguration;

  return v6;
}

- (FCNewsTabiPersonalizedPaywallsConfiguration)personalizedPaywallsConfiguration
{
  void *v3;
  void *personalizedPaywallsConfiguration;
  void *v5;
  FCNewsTabiPersonalizedPaywallsConfiguration *v6;

  -[FCNewsTabiConfiguration personalizedPaywallsEndpoint](self, "personalizedPaywallsEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  personalizedPaywallsConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  v5 = personalizedPaywallsConfiguration;
  if (!personalizedPaywallsConfiguration)
    personalizedPaywallsConfiguration = self->_personalizedPaywallsConfiguration;
  v6 = personalizedPaywallsConfiguration;

  return v6;
}

- (FCNewsTabiRecommendedIssuesConfiguration)recommendedIssuesConfiguration
{
  void *v3;
  void *recommendedIssuesConfiguration;
  void *v5;
  FCNewsTabiRecommendedIssuesConfiguration *v6;

  -[FCNewsTabiConfiguration recommendedIssuesEndpoint](self, "recommendedIssuesEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  recommendedIssuesConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  v5 = recommendedIssuesConfiguration;
  if (!recommendedIssuesConfiguration)
    recommendedIssuesConfiguration = self->_recommendedIssuesConfiguration;
  v6 = recommendedIssuesConfiguration;

  return v6;
}

- (FCNewsTabiRecommendedTagsConfiguration)recommendedTagsConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsTabiConfiguration recommendedTagsEndpoint](self, "recommendedTagsEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsTabiRecommendedTagsConfiguration *)v3;
}

- (FCNewsTabiTagCohortMembershipConfiguration)tagCohortMembershipConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsTabiConfiguration tagCohortMembershipEndpoint](self, "tagCohortMembershipEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsTabiTagCohortMembershipConfiguration *)v3;
}

- (FCNewsTabiTagScoringConfiguration)tagScoringConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsTabiConfiguration tagScoringEndpoint](self, "tagScoringEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsTabiTagScoringConfiguration *)v3;
}

- (FCNewsTabiTagSuggestionsConfiguration)tagSuggestionsConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsTabiConfiguration tagSuggestionsEndpoint](self, "tagSuggestionsEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsTabiTagSuggestionsConfiguration *)v3;
}

- (FCNewsTabiMyMagazinesConfiguration)myMagazinesConfiguration
{
  void *v2;
  void *v3;

  -[FCNewsTabiConfiguration myMagazinesEndpoint](self, "myMagazinesEndpoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCNewsTabiMyMagazinesConfiguration *)v3;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_packageAssetIDs)
  {
    -[FCNewsTabiConfiguration channelPickerSuggestionsConfiguration](self, "channelPickerSuggestionsConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indentedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tchannelPickerSuggestionsConfiguration: %@;"), v5);

    -[FCNewsTabiConfiguration eventAggregationConfiguration](self, "eventAggregationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indentedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\teventAggregationConfiguration: %@;"), v7);

    -[FCNewsTabiConfiguration feedPersonalizationConfiguration](self, "feedPersonalizationConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indentedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfeedPersonalizationConfiguration: %@;"), v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCNewsTabiConfiguration mlComputeUnits](self, "mlComputeUnits"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmlComputeUnits: %@;"), v10);

    -[FCNewsTabiConfiguration packageAssetIDs](self, "packageAssetIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indentedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpackageAssetIDs: %@;"), v12);

    -[FCNewsTabiConfiguration personalizedPaywallsConfiguration](self, "personalizedPaywallsConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indentedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpersonalizedPaywallsConfiguration: %@;"), v14);

    -[FCNewsTabiConfiguration recommendedTagsConfiguration](self, "recommendedTagsConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indentedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedTagsConfiguration: %@;"), v16);

    -[FCNewsTabiConfiguration recommendedIssuesConfiguration](self, "recommendedIssuesConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "indentedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedIssuesConfiguration: %@;"), v18);

    -[FCNewsTabiConfiguration tagCohortMembershipConfiguration](self, "tagCohortMembershipConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "indentedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagCohortMembershipConfiguration: %@;"), v20);

    -[FCNewsTabiConfiguration tagScoringConfiguration](self, "tagScoringConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indentedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagScoringConfiguration: %@;"), v22);

    -[FCNewsTabiConfiguration tagSuggestionsConfiguration](self, "tagSuggestionsConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "indentedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagSuggestionsConfiguration: %@;"), v24);

    -[FCNewsTabiConfiguration myMagazinesConfiguration](self, "myMagazinesConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "indentedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmyMagazinesConfiguration: %@;"), v26);
  }
  else
  {
    -[FCNewsTabiConfiguration adSegmentsEndpoint](self, "adSegmentsEndpoint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indentedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tadSegmentsEndpoint: %@;"), v28);

    -[FCNewsTabiConfiguration channelPickerSuggestionsEndpoint](self, "channelPickerSuggestionsEndpoint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "indentedDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tchannelPickerSuggestionsEndpoint: %@;"), v30);

    -[FCNewsTabiConfiguration eventAggregationConfiguration](self, "eventAggregationConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "indentedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\teventAggregationConfiguration: %@;"), v32);

    -[FCNewsTabiConfiguration feedPersonalizationEndpoint](self, "feedPersonalizationEndpoint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "indentedDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tfeedPersonalizationEndpoint: %@;"), v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FCNewsTabiConfiguration mlComputeUnits](self, "mlComputeUnits"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmlComputeUnits: %@;"), v35);

    -[FCNewsTabiConfiguration packageAssetIDs](self, "packageAssetIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "indentedDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpackageAssetIDs: %@;"), v37);

    -[FCNewsTabiConfiguration personalizedPaywallsEndpoint](self, "personalizedPaywallsEndpoint");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "indentedDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tpersonalizedPaywallsEndpoint: %@;"), v39);

    -[FCNewsTabiConfiguration recommendedIssuesEndpoint](self, "recommendedIssuesEndpoint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "indentedDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedIssuesEndpoint: %@;"), v41);

    -[FCNewsTabiConfiguration recommendedTagsEndpoint](self, "recommendedTagsEndpoint");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "indentedDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\trecommendedTagsEndpoint: %@;"), v43);

    -[FCNewsTabiConfiguration tagCohortMembershipEndpoint](self, "tagCohortMembershipEndpoint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "indentedDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagCohortMembershipEndpoint: %@;"), v45);

    -[FCNewsTabiConfiguration tagScoringEndpoint](self, "tagScoringEndpoint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "indentedDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagScoringEndpoint: %@;"), v47);

    -[FCNewsTabiConfiguration tagSuggestionsEndpoint](self, "tagSuggestionsEndpoint");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "indentedDescription");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\ttagSuggestionsEndpoint: %@;"), v49);

    -[FCNewsTabiConfiguration myMagazinesEndpoint](self, "myMagazinesEndpoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "indentedDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tmyMagazinesEndpoint: %@;"), v26);
  }

  -[FCNewsTabiConfiguration unloadGraphOnBackgroundConfiguration](self, "unloadGraphOnBackgroundConfiguration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "indentedDescription");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tunloadGraphOnBackgroundConfiguration: %@;"), v51);

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  return v3;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (FCNewsTabiAdSegmentsEndpoint)adSegmentsEndpoint
{
  return self->_adSegmentsEndpoint;
}

- (void)setAdSegmentsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_adSegmentsEndpoint, a3);
}

- (void)setChannelPickerSuggestionsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_channelPickerSuggestionsConfiguration, a3);
}

- (void)setTagCohortMembershipConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_tagCohortMembershipConfiguration, a3);
}

- (void)setEventAggregationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_eventAggregationConfiguration, a3);
}

- (void)setFeedPersonalizationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizationConfiguration, a3);
}

- (int64_t)mlComputeUnits
{
  return self->_mlComputeUnits;
}

- (void)setMlComputeUnits:(int64_t)a3
{
  self->_mlComputeUnits = a3;
}

- (void)setPackageAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_packageAssetIDs, a3);
}

- (void)setPersonalizedPaywallsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedPaywallsConfiguration, a3);
}

- (void)setRecommendedIssuesConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedIssuesConfiguration, a3);
}

- (void)setRecommendedTagsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedTagsConfiguration, a3);
}

- (void)setTagScoringConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_tagScoringConfiguration, a3);
}

- (void)setTagSuggestionsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_tagSuggestionsConfiguration, a3);
}

- (void)setMyMagazinesConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_myMagazinesConfiguration, a3);
}

- (FCNewsTabiUnloadGraphOnBackgroundConfiguration)unloadGraphOnBackgroundConfiguration
{
  return self->_unloadGraphOnBackgroundConfiguration;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (FCNewsTabiChannelPickerSuggestionsEndpoint)channelPickerSuggestionsEndpoint
{
  return self->_channelPickerSuggestionsEndpoint;
}

- (void)setChannelPickerSuggestionsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_channelPickerSuggestionsEndpoint, a3);
}

- (FCNewsTabiFeedPersonalizationEndpoint)feedPersonalizationEndpoint
{
  return self->_feedPersonalizationEndpoint;
}

- (void)setFeedPersonalizationEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizationEndpoint, a3);
}

- (FCNewsTabiPersonalizedPaywallsEndpoint)personalizedPaywallsEndpoint
{
  return self->_personalizedPaywallsEndpoint;
}

- (void)setPersonalizedPaywallsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedPaywallsEndpoint, a3);
}

- (FCNewsTabiRecommendedIssuesEndpoint)recommendedIssuesEndpoint
{
  return self->_recommendedIssuesEndpoint;
}

- (void)setRecommendedIssuesEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedIssuesEndpoint, a3);
}

- (FCNewsTabiRecommendedTagsEndpoint)recommendedTagsEndpoint
{
  return self->_recommendedTagsEndpoint;
}

- (void)setRecommendedTagsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedTagsEndpoint, a3);
}

- (FCNewsTabiTagCohortMembershipEndpoint)tagCohortMembershipEndpoint
{
  return self->_tagCohortMembershipEndpoint;
}

- (void)setTagCohortMembershipEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_tagCohortMembershipEndpoint, a3);
}

- (FCNewsTabiMyMagazinesEndpoint)myMagazinesEndpoint
{
  return self->_myMagazinesEndpoint;
}

- (void)setMyMagazinesEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_myMagazinesEndpoint, a3);
}

- (FCNewsTabiTagScoringEndpoint)tagScoringEndpoint
{
  return self->_tagScoringEndpoint;
}

- (void)setTagScoringEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_tagScoringEndpoint, a3);
}

- (FCNewsTabiTagSuggestionsEndpoint)tagSuggestionsEndpoint
{
  return self->_tagSuggestionsEndpoint;
}

- (void)setTagSuggestionsEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_tagSuggestionsEndpoint, a3);
}

@end
