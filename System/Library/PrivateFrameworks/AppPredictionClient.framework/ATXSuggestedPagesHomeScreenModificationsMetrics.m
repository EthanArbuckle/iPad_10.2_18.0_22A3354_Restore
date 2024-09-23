@implementation ATXSuggestedPagesHomeScreenModificationsMetrics

- (id)metricName
{
  return CFSTR("com.apple.ModeConfiguration.SuggestedPagesHomeScreenConfiguration");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  id v25;
  void *v26;
  _QWORD v27[8];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x1E0C80C00];
  v27[0] = CFSTR("suggestedPageType");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics suggestedPageType](self, "suggestedPageType");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = CFSTR("eventType");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics eventType](self, "eventType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = CFSTR("widgetBundleId");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetBundleId](self, "widgetBundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = CFSTR("widgetKind");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetKind](self, "widgetKind");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = CFSTR("appBundleId");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics appBundleId](self, "appBundleId");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v26 = v4;
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = CFSTR("widgetSize");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetSize](self, "widgetSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v14;
  v27[6] = CFSTR("isSuggestedWidget");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXSuggestedPagesHomeScreenModificationsMetrics isSuggestedWidget](self, "isSuggestedWidget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v16;
  v27[7] = CFSTR("source");
  -[ATXSuggestedPagesHomeScreenModificationsMetrics metricsSourceToStringWithSource:](self, "metricsSourceToStringWithSource:", -[ATXSuggestedPagesHomeScreenModificationsMetrics source](self, "source"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v15)
  if (!v13)

  if (!v12)
  if (!v10)

  if (!v8)
  if (!v6)

  if (!v26)
  return v25;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXSuggestedPagesHomeScreenModificationsMetrics suggestedPageType](self, "suggestedPageType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics eventType](self, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetBundleId](self, "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetKind](self, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics appBundleId](self, "appBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics widgetSize](self, "widgetSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATXSuggestedPagesHomeScreenModificationsMetrics\nsuggestedPageType:%@\neventType:%@\nwidgetBundleId%@\nwidgetKind:%@\nappBundleId:%@\nwidgetSize:%@\nisSuggestedWidget:%d"), v4, v5, v6, v7, v8, v9, -[ATXSuggestedPagesHomeScreenModificationsMetrics isSuggestedWidget](self, "isSuggestedWidget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)metricsSourceToStringWithSource:(int)a3
{
  if (a3 == 1)
    return CFSTR("HomeScreen");
  else
    return CFSTR("Setup");
}

- (void)logToCoreAnalytics
{
  void *v3;
  id v4;

  -[ATXSuggestedPagesHomeScreenModificationsMetrics metricName](self, "metricName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestedPagesHomeScreenModificationsMetrics coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (NSString)suggestedPageType
{
  return self->_suggestedPageType;
}

- (void)setSuggestedPageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)widgetSize
{
  return self->_widgetSize;
}

- (void)setWidgetSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSuggestedWidget
{
  return self->_isSuggestedWidget;
}

- (void)setIsSuggestedWidget:(BOOL)a3
{
  self->_isSuggestedWidget = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSize, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_suggestedPageType, 0);
}

@end
