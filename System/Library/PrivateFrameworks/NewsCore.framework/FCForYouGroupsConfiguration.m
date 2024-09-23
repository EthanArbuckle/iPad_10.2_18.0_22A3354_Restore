@implementation FCForYouGroupsConfiguration

void __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_groupIdentifiersByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke_2;
  v6[3] = &unk_1E4648828;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

+ (id)_groupIdentifiersByType
{
  if (qword_1ED0F86D0 != -1)
    dispatch_once(&qword_1ED0F86D0, &__block_literal_global_347);
  return (id)qword_1ED0F86C8;
}

void __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  FCForYouGroupConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "integerValue");

  v9 = objc_alloc_init(FCForYouGroupConfiguration);
  -[FCForYouGroupConfiguration setIdentifier:](v9, "setIdentifier:", v18);
  -[FCForYouGroupConfiguration setGroupType:](v9, "setGroupType:", v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("position"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("position"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouGroupConfiguration setGroupPosition:](v9, "setGroupPosition:", objc_msgSend(v11, "integerValue"));

  }
  else
  {
    -[FCForYouGroupConfiguration setGroupPosition:](v9, "setGroupPosition:", objc_msgSend(*(id *)(a1 + 40), "_defaultGroupPositionValueForGroupType:", v8));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("precedingGroupsCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("precedingGroupsCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouGroupConfiguration setPrecedingGroupsCount:](v9, "setPrecedingGroupsCount:", objc_msgSend(v13, "integerValue"));

  }
  else
  {
    -[FCForYouGroupConfiguration setPrecedingGroupsCount:](v9, "setPrecedingGroupsCount:", objc_msgSend(*(id *)(a1 + 40), "_defaultPrecedingGroupsCount:", v8));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("precedingGroupsCountForFirstGroup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("precedingGroupsCountForFirstGroup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouGroupConfiguration setPrecedingGroupsCountForFirstGroup:](v9, "setPrecedingGroupsCountForFirstGroup:", objc_msgSend(v15, "integerValue"));

  }
  else
  {
    -[FCForYouGroupConfiguration setPrecedingGroupsCountForFirstGroup:](v9, "setPrecedingGroupsCountForFirstGroup:", -[FCForYouGroupConfiguration precedingGroupsCount](v9, "precedingGroupsCount"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowsNativeAds"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowsNativeAds"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCForYouGroupConfiguration setAllowsNativeAds:](v9, "setAllowsNativeAds:", objc_msgSend(v17, "BOOLValue"));

  }
  else
  {
    -[FCForYouGroupConfiguration setAllowsNativeAds:](v9, "setAllowsNativeAds:", objc_msgSend(*(id *)(a1 + 40), "_defaultAllowsNativeAdsValueForGroupType:", v8));
  }

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v18);
}

- (BOOL)_defaultAllowsNativeAdsValueForGroupType:(int64_t)a3
{
  return ((unint64_t)a3 > 0x26) | (0x2120uLL >> a3) & 1;
}

- (unint64_t)_defaultPrecedingGroupsCount:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = 2;
  v4 = 2;
  if (a3 != 23)
    v4 = 0;
  if (a3 != 15)
    v3 = v4;
  v5 = 2;
  v6 = 2;
  if (a3 != 12)
    v6 = 0;
  if (a3 != 6)
    v5 = v6;
  if (a3 <= 14)
    return v5;
  else
    return v3;
}

- (unint64_t)_defaultGroupPositionValueForGroupType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x26)
    return 1;
  else
    return qword_1A1E833B0[a3];
}

- (FCForYouGroupsConfiguration)initWithJSONConfiguration:(id)a3
{
  id v5;
  FCForYouGroupsConfiguration *v6;
  FCForYouGroupsConfiguration *v7;
  void *v8;
  void *v9;
  FCForYouGroupsConfiguration *v10;
  id v11;
  uint64_t v12;
  NSDictionary *groupConfigurationsByIdentifier;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  FCForYouGroupsConfiguration *v23;
  id v24;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCForYouGroupsConfiguration;
  v6 = -[FCForYouGroupsConfiguration init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99D80];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __57__FCForYouGroupsConfiguration_initWithJSONConfiguration___block_invoke;
    v22 = &unk_1E463B8D0;
    v10 = v7;
    v23 = v10;
    v11 = v8;
    v24 = v11;
    objc_msgSend(v9, "fc_dictionary:", &v19);
    v12 = objc_claimAutoreleasedReturnValue();
    groupConfigurationsByIdentifier = v10->_groupConfigurationsByIdentifier;
    v10->_groupConfigurationsByIdentifier = (NSDictionary *)v12;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WeekendGreatStoriesYouMissed"), v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timeRange"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "doubleValue");
    else
      v17 = 0x411A5E0000000000;
    *(_QWORD *)&v10->_weekendGreatStoriesYouMissedTimeRange = v17;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupConfigurationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __54__FCForYouGroupsConfiguration__groupIdentifiersByType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[20];
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E470AF40;
  v2[1] = &unk_1E470AF58;
  v3[0] = CFSTR("TopStories");
  v3[1] = CFSTR("TrendingStories");
  v2[2] = &unk_1E470AF70;
  v2[3] = &unk_1E470AF88;
  v3[2] = CFSTR("DailyBriefings");
  v3[3] = CFSTR("SavedStories");
  v2[4] = &unk_1E470AFA0;
  v2[5] = &unk_1E470AFB8;
  v3[4] = CFSTR("GreatStoriesYouMissed");
  v3[5] = CFSTR("Editorial");
  v2[6] = &unk_1E470AFD0;
  v2[7] = &unk_1E470AFE8;
  v3[6] = CFSTR("Latest");
  v3[7] = CFSTR("Topic");
  v2[8] = &unk_1E470B000;
  v2[9] = &unk_1E470B018;
  v3[8] = CFSTR("MoreFromYou");
  v3[9] = CFSTR("NewFavorite");
  v2[10] = &unk_1E470B030;
  v2[11] = &unk_1E470B048;
  v3[10] = CFSTR("PaidSubscription");
  v3[11] = CFSTR("BestOfEdition");
  v2[12] = &unk_1E470B060;
  v2[13] = &unk_1E470B078;
  v3[12] = CFSTR("AutoFavorite");
  v3[13] = CFSTR("Magazines");
  v2[14] = &unk_1E470B090;
  v2[15] = &unk_1E470B0A8;
  v3[14] = CFSTR("Spotlight");
  v3[15] = CFSTR("Curated");
  v2[16] = &unk_1E470B0C0;
  v2[17] = &unk_1E470B0D8;
  v3[16] = CFSTR("LocalNews");
  v3[17] = CFSTR("AudioDailyBriefing");
  v2[18] = &unk_1E470B0F0;
  v2[19] = &unk_1E470B108;
  v3[18] = CFSTR("MagazineTrending");
  v3[19] = CFSTR("MySports");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F86C8;
  qword_1ED0F86C8 = v0;

}

- (id)configurationForGroupType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[FCForYouGroupsConfiguration _identifierForGroupType:](self, "_identifierForGroupType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FCForYouGroupsConfiguration groupConfigurationsByIdentifier](self, "groupConfigurationsByIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_identifierForGroupType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "_groupIdentifiersByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = -[NSString isEqualToString:](self->_configuration, "isEqualToString:", v6[1]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_configuration, "hash");
}

- (double)weekendGreatStoriesYouMissedTimeRange
{
  return self->_weekendGreatStoriesYouMissedTimeRange;
}

- (NSDictionary)groupConfigurationsByIdentifier
{
  return self->_groupConfigurationsByIdentifier;
}

- (void)setGroupConfigurationsByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
