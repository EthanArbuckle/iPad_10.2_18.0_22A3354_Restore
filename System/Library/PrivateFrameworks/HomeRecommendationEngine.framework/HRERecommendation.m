@implementation HRERecommendation

- (HRERecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  id v7;
  id v8;
  HRERecommendation *v9;
  HRERecommendation *v10;
  uint64_t v11;
  NSMutableDictionary *defaultAnalyticsData;
  uint64_t v13;
  NSMutableDictionary *userInfo;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HRERecommendation;
  v9 = -[HRERecommendation init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_uniqueIdentifier, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    defaultAnalyticsData = v10->_defaultAnalyticsData;
    v10->_defaultAnalyticsData = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    userInfo = v10->_userInfo;
    v10->_userInfo = (NSMutableDictionary *)v13;

    v10->_rankModifier = 0.0;
    -[HRERecommendation setRankingConfidenceScore:rankVersion:](v10, "setRankingConfidenceScore:rankVersion:", -1, 0.0);
  }

  return v10;
}

- (HRERecommendation)initWithHome:(id)a3
{
  return -[HRERecommendation initWithHome:uniqueIdentifier:](self, "initWithHome:uniqueIdentifier:", a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HRERecommendation home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v4, "initWithHome:uniqueIdentifier:", v5, self->_uniqueIdentifier);

  -[HRERecommendation rankingConfidenceScore](self, "rankingConfidenceScore");
  v6[4] = v7;
  -[HRERecommendation userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = (void *)v6[6];
  v6[6] = v9;

  -[HRERecommendation identifierBuilder](self, "identifierBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v6, "setIdentifierBuilder:", v12);

  -[HRERecommendation rankModifier](self, "rankModifier");
  objc_msgSend(v6, "setRankModifier:");
  -[HRERecommendation sortingPriority](self, "sortingPriority");
  objc_msgSend(v6, "setSortingPriority:");
  -[HRERecommendation defaultAnalyticsData](self, "defaultAnalyticsData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v6, "setDefaultAnalyticsData:", v14);

  return v6;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;
  NSString *v3;
  void *v4;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v3 = uniqueIdentifier;
  }
  else
  {
    -[HRERecommendation identifierBuilder](self, "identifierBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composedString");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)containsMeaningfulChanges
{
  return 0;
}

- (BOOL)containsRecommendableContent
{
  return 0;
}

- (BOOL)includesObjects:(id)a3
{
  return 1;
}

- (id)involvedObjects
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (NADescriptionBuilder)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6B600], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERecommendation uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("uniqueIdentifier"));

  -[HRERecommendation rankingConfidenceScore](self, "rankingConfidenceScore");
  v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("rankingConfidenceScore"), 2);
  return (NADescriptionBuilder *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[HRERecommendation descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRankingConfidenceScore:(double)a3 rankVersion:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  self->_rankingConfidenceScore = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERecommendation defaultAnalyticsData](self, "defaultAnalyticsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE4CDC0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERecommendation defaultAnalyticsData](self, "defaultAnalyticsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE4CDB8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HRERecommendation defaultAnalyticsData](self, "defaultAnalyticsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE4CDC8]);

}

- (void)setSortingPriority:(double)a3
{
  self->_sortingPriority = a3;
}

- (NSDictionary)analyticsData
{
  void *v2;
  void *v3;

  -[HRERecommendation defaultAnalyticsData](self, "defaultAnalyticsData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

+ (id)highestRankInRecommendations:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -5.0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "rankingConfidenceScore");
        if (v10 > v4)
        {
          objc_msgSend(v9, "rankingConfidenceScore");
          v4 = v11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__HRERecommendation_highestRankInRecommendations___block_invoke;
  v14[3] = &__block_descriptor_40_e27_B16__0__HRERecommendation_8l;
  *(double *)&v14[4] = v4;
  objc_msgSend(v3, "na_filter:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __50__HRERecommendation_highestRankInRecommendations___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "rankingConfidenceScore");
  return v3 == *(double *)(a1 + 32);
}

- (HREIdentifierBuilder)identifierBuilder
{
  return self->identifierBuilder;
}

- (void)setIdentifierBuilder:(id)a3
{
  objc_storeStrong((id *)&self->identifierBuilder, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (double)rankingConfidenceScore
{
  return self->_rankingConfidenceScore;
}

- (double)sortingPriority
{
  return self->_sortingPriority;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSMutableDictionary)defaultAnalyticsData
{
  return self->_defaultAnalyticsData;
}

- (void)setDefaultAnalyticsData:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAnalyticsData, a3);
}

- (double)rankModifier
{
  return self->_rankModifier;
}

- (void)setRankModifier:(double)a3
{
  self->_rankModifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAnalyticsData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->identifierBuilder, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMRoom)room
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HRERecommendation userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("room"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HMRoom *)v6;
}

- (void)setRoom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRERecommendation userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("room"));

}

- (HMZone)zone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HRERecommendation userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HMZone *)v6;
}

- (void)setZone:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRERecommendation userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("zone"));

}

- (NSArray)roomsToFilterHomeObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[HRERecommendation room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HRERecommendation room](self, "room");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HRERecommendation zone](self, "zone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rooms");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return (NSArray *)v6;
}

- (HMCharacteristic)splitCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HRERecommendation userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("splitCharacteristic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HMCharacteristic *)v6;
}

- (void)setSplitCharacteristic:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRERecommendation userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("splitCharacteristic"));

}

- (HRETemplate)sourceTemplate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HRERecommendation userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("template"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HRETemplate *)v6;
}

- (void)setSourceTemplate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HRERecommendation userInfo](self, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("template"));

}

- (unint64_t)numberOfEnabledRecommendationsForTemplate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  objc_opt_class();
  -[HRERecommendation userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("numberOfEnabledRecommendationsForTemplate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (void)setNumberOfEnabledRecommendationsForTemplate:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HRERecommendation userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfEnabledRecommendationsForTemplate"));

}

- (id)splitUsingSplitStrategy:(unint64_t)a3 inHome:(id)a4
{
  void *v4;
  id v7;
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
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (a3)
  {
    if (a3 == 2)
    {
      v16 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v7, "zones");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke_2;
      v20[3] = &unk_24F218A60;
      v20[4] = self;
      objc_msgSend(v17, "na_map:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (a3 == 1)
    {
      v9 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v7, "rooms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "roomForEntireHome");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v8, "roomForEntireHome");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v13);

      }
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke;
      v21[3] = &unk_24F218A38;
      v21[4] = self;
      objc_msgSend(v11, "na_map:", v21);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v4, "setRoom:", v3);
  objc_msgSend(v4, "identifierBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("room"));

  return v4;
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v4, "setZone:", v3);
  objc_msgSend(v4, "identifierBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("zone"));

  return v4;
}

- (id)splitUsingSplitCharacteristics:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitCharacteristics___block_invoke;
  v4[3] = &unk_24F218A88;
  v4[4] = self;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v4, "setSplitCharacteristic:", v3);
  objc_msgSend(v4, "identifierBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("splitCharacteristic"));

  return v4;
}

@end
