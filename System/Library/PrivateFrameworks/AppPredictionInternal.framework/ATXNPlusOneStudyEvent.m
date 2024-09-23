@implementation ATXNPlusOneStudyEvent

- (id)coreAnalyticsEvent
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
  _QWORD v34[18];
  _QWORD v35[20];

  v35[18] = *MEMORY[0x1E0C80C00];
  v34[0] = CFSTR("extensionBundleId");
  -[ATXNPlusOneStudyEvent extensionBundleId](self, "extensionBundleId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  v34[1] = CFSTR("widgetKind");
  -[ATXNPlusOneStudyEvent widgetKind](self, "widgetKind");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v32;
  v34[2] = CFSTR("widgetExistsOnScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXNPlusOneStudyEvent widgetExistsOnScreen](self, "widgetExistsOnScreen"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v31;
  v34[3] = CFSTR("appPushNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXNPlusOneStudyEvent appPushNotificationEnabled](self, "appPushNotificationEnabled"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v30;
  v34[4] = CFSTR("appLaunchPopularity");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchPopularity](self, "appLaunchPopularity");
  objc_msgSend(v3, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v29;
  v34[5] = CFSTR("appScreenTimeCategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXNPlusOneStudyEvent appScreenTimeCategory](self, "appScreenTimeCategory"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v28;
  v34[6] = CFSTR("numAppLaunchPastDay");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchCounts](self, "appLaunchCounts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v27, "numAppLaunchPastDay"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v26;
  v34[7] = CFSTR("numAppLaunchPast3Day");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchCounts](self, "appLaunchCounts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v25, "numAppLaunchPast3Day"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v24;
  v34[8] = CFSTR("numAppLaunchPast7Day");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchCounts](self, "appLaunchCounts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v23, "numAppLaunchPast7Day"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v22;
  v34[9] = CFSTR("numAppLaunchPast14Day");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchCounts](self, "appLaunchCounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v21, "numAppLaunchPast14Day"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v20;
  v34[10] = CFSTR("numAppLaunchPast28Day");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXNPlusOneStudyEvent appLaunchCounts](self, "appLaunchCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "numAppLaunchPast28Day"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v10;
  v34[11] = CFSTR("suggestionCountInfoHeuristic");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicHigh](self, "suggestionCountInfoHeuristicHigh"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v11;
  v34[12] = CFSTR("suggestionCountInfoHeuristicMED");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicMed](self, "suggestionCountInfoHeuristicMed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v12;
  v34[13] = CFSTR("suggestionCountInfoHeuristicLOW");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountInfoHeuristicLow](self, "suggestionCountInfoHeuristicLow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v13;
  v34[14] = CFSTR("suggestionCountRelevantShortcut");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountRelevantShortcut](self, "suggestionCountRelevantShortcut"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[14] = v14;
  v34[15] = CFSTR("suggestionCountShortcutConversion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionHigh](self, "suggestionCountShortcutConversionHigh"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[15] = v15;
  v34[16] = CFSTR("suggestionCountShortcutConversionMED");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionMed](self, "suggestionCountShortcutConversionMed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[16] = v16;
  v34[17] = CFSTR("suggestionCountShortcutConversionLOW");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXNPlusOneStudyEvent suggestionCountShortcutConversionLow](self, "suggestionCountShortcutConversionLow"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[17] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 18);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleId, a3);
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
  objc_storeStrong((id *)&self->_widgetKind, a3);
}

- (BOOL)widgetExistsOnScreen
{
  return self->_widgetExistsOnScreen;
}

- (void)setWidgetExistsOnScreen:(BOOL)a3
{
  self->_widgetExistsOnScreen = a3;
}

- (BOOL)appPushNotificationEnabled
{
  return self->_appPushNotificationEnabled;
}

- (void)setAppPushNotificationEnabled:(BOOL)a3
{
  self->_appPushNotificationEnabled = a3;
}

- (double)appLaunchPopularity
{
  return self->_appLaunchPopularity;
}

- (void)setAppLaunchPopularity:(double)a3
{
  self->_appLaunchPopularity = a3;
}

- (unint64_t)appScreenTimeCategory
{
  return self->_appScreenTimeCategory;
}

- (void)setAppScreenTimeCategory:(unint64_t)a3
{
  self->_appScreenTimeCategory = a3;
}

- (ATXNPlusOneStudyAppLaunchCounts)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (void)setAppLaunchCounts:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchCounts, a3);
}

- (int64_t)suggestionCountInfoHeuristicHigh
{
  return self->_suggestionCountInfoHeuristicHigh;
}

- (void)setSuggestionCountInfoHeuristicHigh:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicHigh = a3;
}

- (int64_t)suggestionCountInfoHeuristicMed
{
  return self->_suggestionCountInfoHeuristicMed;
}

- (void)setSuggestionCountInfoHeuristicMed:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicMed = a3;
}

- (int64_t)suggestionCountInfoHeuristicLow
{
  return self->_suggestionCountInfoHeuristicLow;
}

- (void)setSuggestionCountInfoHeuristicLow:(int64_t)a3
{
  self->_suggestionCountInfoHeuristicLow = a3;
}

- (int64_t)suggestionCountRelevantShortcut
{
  return self->_suggestionCountRelevantShortcut;
}

- (void)setSuggestionCountRelevantShortcut:(int64_t)a3
{
  self->_suggestionCountRelevantShortcut = a3;
}

- (int64_t)suggestionCountShortcutConversionHigh
{
  return self->_suggestionCountShortcutConversionHigh;
}

- (void)setSuggestionCountShortcutConversionHigh:(int64_t)a3
{
  self->_suggestionCountShortcutConversionHigh = a3;
}

- (int64_t)suggestionCountShortcutConversionMed
{
  return self->_suggestionCountShortcutConversionMed;
}

- (void)setSuggestionCountShortcutConversionMed:(int64_t)a3
{
  self->_suggestionCountShortcutConversionMed = a3;
}

- (int64_t)suggestionCountShortcutConversionLow
{
  return self->_suggestionCountShortcutConversionLow;
}

- (void)setSuggestionCountShortcutConversionLow:(int64_t)a3
{
  self->_suggestionCountShortcutConversionLow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
