@implementation ATXWidgetModeEntityModelWeights

- (ATXWidgetModeEntityModelWeights)init
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
  v13.super_class = (Class)ATXWidgetModeEntityModelWeights;
  v2 = -[ATXWidgetModeEntityModelWeights init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    objc_msgSend(*((id *)v2 + 2), "widgetModeEntityModelWeights");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ATXWidgetModeEntityModelWeights init].cold.2(v7);

      objc_msgSend(*((id *)v2 + 2), "widgetModeEntityModelWeights");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v8;

      __atxlog_handle_modes();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ATXWidgetModeEntityModelWeights init].cold.1((uint64_t *)v2 + 1, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXWidgetModeEntityModelWeights"), CFSTR("plist"), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = *((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v11;
    }

  }
  return (ATXWidgetModeEntityModelWeights *)v2;
}

- (double)classConditionalProbability
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("classConditionalProbability"));
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

- (double)posteriorProbability
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("posteriorProbability"));
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

- (double)globalPopularity
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("globalPopularity"));
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

- (double)modePopularity
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("modePopularity"));
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

- (double)weightForWidgetProbability
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("weightForWidgetProbability"));
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

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("numOfDays"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (id)abGroup
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_widgetModeEntityModelWeights, "objectForKeyedSubscript:", CFSTR("abGroup"));
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
  objc_storeStrong((id *)&self->_widgetModeEntityModelWeights, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXWidgetModeEntityModelWeights: Trial factors loaded", v1, 2u);
}

@end
