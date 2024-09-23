@implementation ATXWidgetModeEventProvider

- (ATXWidgetModeEventProvider)initWithInformationStore:(id)a3
{
  id v5;
  ATXWidgetModeEventProvider *v6;
  ATXWidgetModeEventProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetModeEventProvider;
  v6 = -[ATXWidgetModeEventProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_informationStore, a3);

  return v7;
}

- (id)widgetModeEventsBetweenStartDate:(id)a3 endDate:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[ATXInformationStore fetchWidgetTapEngagementsBetweenStartDate:endDate:](self->_informationStore, "fetchWidgetTapEngagementsBetweenStartDate:endDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__ATXWidgetModeEventProvider_widgetModeEventsBetweenStartDate_endDate___block_invoke;
  v9[3] = &unk_1E82E6988;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __71__ATXWidgetModeEventProvider_widgetModeEventsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXModeEvent *v15;
  void *v16;
  void *v17;
  ATXModeEvent *v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "containerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_4;
  objc_msgSend(v19, "widgetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, objc_msgSend(v3, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
LABEL_4:
    v7 = objc_alloc(MEMORY[0x1E0D10148]);
    v8 = objc_alloc(MEMORY[0x1E0D10038]);
    objc_msgSend(v19, "widgetBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v9, v3, 0);
    objc_msgSend(v19, "widgetKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v10, v11, objc_msgSend(v19, "widgetFamily"), 0, 0);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9218]), "initWithWidget:", v12);
    v14 = *(void **)(a1 + 32);
    v15 = [ATXModeEvent alloc];
    objc_msgSend(v19, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ATXModeEvent initWithStartDate:endDate:entity:](v15, "initWithStartDate:endDate:entity:", v16, v17, v13);
    objc_msgSend(v14, "addObject:", v18);

  }
}

- (id)widgetEngagementCountSinceStartDate:(id)a3
{
  return (id)-[ATXInformationStore fetchWidgetTapEngagementCountSinceStartDate:](self->_informationStore, "fetchWidgetTapEngagementCountSinceStartDate:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationStore, 0);
}

@end
