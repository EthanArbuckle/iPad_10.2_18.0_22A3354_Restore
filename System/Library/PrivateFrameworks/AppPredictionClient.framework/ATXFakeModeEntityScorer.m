@implementation ATXFakeModeEntityScorer

- (ATXFakeModeEntityScorer)init
{
  ATXFakeModeEntityScorer *v2;
  uint64_t v3;
  NSMutableDictionary *entityToScoreMapping;
  uint64_t v5;
  NSMutableDictionary *entityToScoreMappingForDenyList;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXFakeModeEntityScorer;
  v2 = -[ATXFakeModeEntityScorer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entityToScoreMapping = v2->_entityToScoreMapping;
    v2->_entityToScoreMapping = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    entityToScoreMappingForDenyList = v2->_entityToScoreMappingForDenyList;
    v2->_entityToScoreMappingForDenyList = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (unint64_t)atxModeFromString:(id)a3
{
  return ATXStringToMode(a3);
}

- (void)setDefaultScoreForAllApps:(double)a3
{
  self->_defaultAppScore = a3;
}

- (void)setDefaultScoreForAllContacts:(double)a3
{
  self->_defaultContactScore = a3;
}

- (void)setScoreForEntity:(id)a3 score:(double)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entityToScoreMapping, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setScoreForBundleId:(id)a3 score:(double)a4
{
  id v6;
  void *v7;
  ATXAppModeEntity *v8;

  v6 = a3;
  v8 = -[ATXAppModeEntity initWithBundleId:]([ATXAppModeEntity alloc], "initWithBundleId:", v6);

  -[ATXAppModeEntity identifier](v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFakeModeEntityScorer setScoreForEntity:score:](self, "setScoreForEntity:score:", v7, a4);

}

- (void)setScoreForContactId:(id)a3 score:(double)a4
{
  id v6;
  void *v7;
  ATXContactModeEntity *v8;

  v6 = a3;
  v8 = -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:]([ATXContactModeEntity alloc], "initWithDisplayName:rawIdentifier:cnContactId:", 0, 0, v6);

  -[ATXContactModeEntity cnContactId](v8, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFakeModeEntityScorer setScoreForEntity:score:](self, "setScoreForEntity:score:", v7, a4);

}

- (id)rankedAppsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedAppsForNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedContactsForNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedNotificationsForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedAppsForDenyListForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *entityToScoreMapping;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  ATXModeEntityScore *v16;
  double v17;
  double v18;
  void *v19;
  ATXModeEntityScore *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        entityToScoreMapping = self->_entityToScoreMapping;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](entityToScoreMapping, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultAppScore);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        v16 = [ATXModeEntityScore alloc];
        objc_msgSend(v15, "doubleValue");
        v18 = v17;
        v19 = (void *)objc_opt_new();
        v20 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v16, "initWithScore:featureVector:uuid:", 0, v19, v18);

        objc_msgSend(v9, "setScoreMetadata:", v20);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFakeModeEntityScorer scoreApps:mode:](self, "scoreApps:mode:", v7, a4);
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_10_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFakeModeEntityScorer scoreContacts:mode:reply:](self, "scoreContacts:mode:reply:", v8, a4, &__block_literal_global_12_0);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "appEntity", (_QWORD)v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scoreMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "contactEntity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scoreMetadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          v19 = v18 == 0;
        else
          v19 = 1;
        if (v19)
        {
          if (v16)
            v20 = v16;
          else
            v20 = v18;
        }
        else
        {
          objc_msgSend(v16, "score");
          v22 = v21;
          objc_msgSend(v18, "score");
          if (v22 <= v23)
            v20 = v18;
          else
            v20 = v16;
        }
        objc_msgSend(v14, "setScoreMetadata:", v20);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

}

uint64_t __51__ATXFakeModeEntityScorer_scoreNotifications_mode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appEntity");
}

uint64_t __51__ATXFakeModeEntityScorer_scoreNotifications_mode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactEntity");
}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  ATXUserNotificationModelScore *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "_pas_mappedArrayWithTransform:", &__block_literal_global_14_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFakeModeEntityScorer scoreNotifications:mode:](self, "scoreNotifications:mode:", v6, a4);
  if (objc_msgSend(v19, "count"))
  {
    v7 = 0;
    do
    {
      v8 = [ATXUserNotificationModelScore alloc];
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scoreMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "score");
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v13;
      v15 = (void *)objc_opt_new();
      v16 = -[ATXUserNotificationModelScore initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:](v8, "initFromModelScoreData:modelVersion:score:scoreTimestamp:scoreUUID:scoreInfo:", CFSTR("ATXModeEntityScorer"), 0, v15, 0, v12, v14);

      objc_msgSend(v19, "objectAtIndexedSubscript:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "derivedData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addScore:", v16);

      ++v7;
    }
    while (v7 < objc_msgSend(v19, "count"));
  }

}

ATXNotificationModeEntity *__55__ATXFakeModeEntityScorer_scoreUserNotifications_mode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXNotificationModeEntity *v3;

  v2 = a2;
  v3 = -[ATXNotificationModeEntity initWithUserNotification:]([ATXNotificationModeEntity alloc], "initWithUserNotification:", v2);

  return v3;
}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *entityToScoreMappingForDenyList;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  ATXModeEntityScore *v16;
  double v17;
  double v18;
  void *v19;
  ATXModeEntityScore *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        entityToScoreMappingForDenyList = self->_entityToScoreMappingForDenyList;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](entityToScoreMappingForDenyList, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultAppScore);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        v16 = [ATXModeEntityScore alloc];
        objc_msgSend(v15, "doubleValue");
        v18 = v17;
        v19 = (void *)objc_opt_new();
        v20 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v16, "initWithScore:featureVector:uuid:", 0, v19, v18);

        objc_msgSend(v9, "setScoreMetadata:", v20);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *entityToScoreMappingForDenyList;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  ATXModeEntityScore *v16;
  double v17;
  double v18;
  void *v19;
  ATXModeEntityScore *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        entityToScoreMappingForDenyList = self->_entityToScoreMappingForDenyList;
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](entityToScoreMappingForDenyList, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultContactScore);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        v16 = [ATXModeEntityScore alloc];
        objc_msgSend(v15, "doubleValue");
        v18 = v17;
        v19 = (void *)objc_opt_new();
        v20 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v16, "initWithScore:featureVector:uuid:", 0, v19, v18);

        objc_msgSend(v9, "setScoreMetadata:", v20);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

}

- (void)rankedAppsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedAppsForMode:](self, "rankedAppsForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedAppsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedAppsForNotificationsForMode:](self, "rankedAppsForNotificationsForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedContactsForMode:(unint64_t)a3 reply:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, MEMORY[0x1E0C9AA60], 0);
}

- (void)rankedContactsForNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedContactsForNotificationsForMode:](self, "rankedContactsForNotificationsForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedNotificationsForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedNotificationsForMode:](self, "rankedNotificationsForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedAppsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedAppsForDenyListForMode:](self, "rankedAppsForDenyListForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 reply:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ATXFakeModeEntityScorer rankedContactsForDenyListForMode:](self, "rankedContactsForDenyListForMode:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (void)rankedContactsForDenyListForMode:(unint64_t)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v9;
  id v10;

  v9 = a5;
  -[ATXFakeModeEntityScorer rankedContactsForDenyListForMode:options:](self, "rankedContactsForDenyListForMode:options:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v9, v10, 0);

}

- (void)scoreApps:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[ATXFakeModeEntityScorer scoreApps:mode:](self, "scoreApps:mode:", a3, a4);
  v8[2](v8, 0);

}

- (void)scoreContacts:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableDictionary *entityToScoreMapping;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ATXModeEntityScore *v19;
  double v20;
  double v21;
  void *v22;
  ATXModeEntityScore *v23;
  void (**v24)(id, _QWORD);
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = (void (**)(id, _QWORD))a5;
  obj = v7;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        entityToScoreMapping = self->_entityToScoreMapping;
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](entityToScoreMapping, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultContactScore);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        v19 = [ATXModeEntityScore alloc];
        objc_msgSend(v18, "doubleValue");
        v21 = v20;
        v22 = (void *)objc_opt_new();
        v23 = -[ATXModeEntityScore initWithScore:featureVector:uuid:](v19, "initWithScore:featureVector:uuid:", 0, v22, v21);

        objc_msgSend(v12, "setScoreMetadata:", v23);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  v24[2](v24, 0);

}

- (void)scoreNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[ATXFakeModeEntityScorer scoreNotifications:mode:](self, "scoreNotifications:mode:", a3, a4);
  v8[2](v8, 0);

}

- (void)scoreUserNotifications:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[ATXFakeModeEntityScorer scoreUserNotifications:mode:](self, "scoreUserNotifications:mode:", a3, a4);
  v8[2](v8, 0);

}

- (void)scoreAppsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[ATXFakeModeEntityScorer scoreAppsForDenyList:mode:](self, "scoreAppsForDenyList:mode:", a3, a4);
  v8[2](v8, 0);

}

- (void)scoreContactsForDenyList:(id)a3 mode:(unint64_t)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a5;
  -[ATXFakeModeEntityScorer scoreContactsForDenyList:mode:](self, "scoreContactsForDenyList:mode:", a3, a4);
  v8[2](v8, 0);

}

- (void)rankedWidgetsForMode:(unint64_t)a3 reply:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityToScoreMappingForDenyList, 0);
  objc_storeStrong((id *)&self->_entityToScoreMapping, 0);
}

@end
