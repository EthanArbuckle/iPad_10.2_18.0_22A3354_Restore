@implementation ATXNotificationModeEntityModelWeights

- (ATXNotificationModeEntityModelWeights)init
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationModeEntityModelWeights;
  v2 = -[ATXNotificationModeEntityModelWeights init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    objc_msgSend(*((id *)v2 + 2), "notificationModeEntityModelWeights");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ATXNotificationModeEntityModelWeights init].cold.2(v7);

      objc_msgSend(*((id *)v2 + 2), "notificationModeEntityModelWeights");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v8;

      __atxlog_handle_modes();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ATXNotificationModeEntityModelWeights init].cold.1((uint64_t *)v2 + 1, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXNotificationModeEntityModelWeights"), CFSTR("plist"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = *((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v11;
    }

  }
  return (ATXNotificationModeEntityModelWeights *)v2;
}

- (double)appCategoryScoreComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appCategoryScoreComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)appClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)appGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)appModePopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appModePopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)appPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)appGlobalOccurrencesComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("appGlobalOccurrencesComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactGlobalOccurrencesComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactGlobalOccurrencesComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactIsFavoriteComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactIsFavoriteComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)contactIsVIPComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("contactIsVIPComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)engagementGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("engagementGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)engagementModePopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("engagementModePopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)engagementClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("engagementClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)engagementPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("engagementPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)clearGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("clearGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)clearModePopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("clearModePopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)clearClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("clearClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)clearPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("clearPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)hiddenGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("hiddenGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)hiddenModePopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("hiddenModePopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)hiddenClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("hiddenClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)hiddenPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("hiddenPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)dismissGlobalPopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("dismissGlobalPopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)dismissModePopularityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("dismissModePopularityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)dismissClassConditionalProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("dismissClassConditionalProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)dismissPosteriorProbabilityComponent
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("dismissPosteriorProbabilityComponent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (int)numOfDays
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("numOfDays"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (double)bias
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("bias"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (id)abGroup
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_notificationModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("abGroup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("default");
  v5 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_notificationModeEntityModelWeights, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXNotificationModeEntityModelWeights: Trial factors loaded", v1, 2u);
}

@end
