@implementation ATXSuggestedPagesTunableConstants

- (ATXSuggestedPagesTunableConstants)init
{
  ATXSuggestedPagesTunableConstants *v2;
  uint64_t v3;
  NSDictionary *suggestedPagesTunableConstants;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestedPagesTunableConstants;
  v2 = -[ATXSuggestedPagesTunableConstants init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForResource:ofType:specifiedABGroup:", CFSTR("ATXSuggestedPagesTunableConstants"), CFSTR("plist"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (NSDictionary *)v3;

  }
  return v2;
}

- (double)maxRatioOfAppleAppsForFirstPageSorting
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("maxRatioOfAppleAppsForFirstPageSorting"));
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

- (int)numberOfContactsForMediumWidget
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("numberOfContactsForMediumWidget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)numberOfContactsForSmallWidget
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("numberOfContactsForSmallWidget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (double)minScoreForModeAffinityContactsWidgetSuggestions
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("minScoreForModeAffinityContactsWidgetSuggestions"));
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

- (int)maxSuggestedPages
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("maxSuggestedPages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)maxWidgetsInStack
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("maxWidgetsInStack"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (double)suggestedPagesModeAffinityAppDataSourceScoreThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("suggestedPagesModeAffinityAppDataSourceScoreThreshold"));
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

- (int)stackHeuristicsSignificantHomeAccessoryEventCount
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("stackHeuristicsSignificantHomeAccessoryEventCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)faceComplicationsSignificantHomeAccessoryEventCount
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("faceComplicationsSignificantHomeAccessoryEventCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)faceComplicationsSignificantStocksEventCount
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("faceComplicationsSignificantStocksEventCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)faceComplicationsSignificantRemindersEventCount
{
  void *v2;
  void *v3;
  int v4;

  -[NSDictionary objectForKeyedSubscript:](self->_suggestedPagesTunableConstants, "objectForKeyedSubscript:", CFSTR("faceComplicationsSignificantRemindersEventCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
}

@end
