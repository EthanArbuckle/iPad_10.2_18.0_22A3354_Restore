@implementation ATXHomeScreenEvent

- (ATXHomeScreenEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBHomeScreenEvent *v5;
  ATXHomeScreenEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBHomeScreenEvent initWithData:]([ATXPBHomeScreenEvent alloc], "initWithData:", v4);

    self = -[ATXHomeScreenEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXHomeScreenEvent)initWithProto:(id)a3
{
  id v4;
  ATXHomeScreenEvent *v5;
  id v6;
  uint64_t v7;
  NSString *eventTypeString;
  uint64_t v9;
  NSString *reason;
  uint64_t v11;
  NSString *blendingCacheId;
  uint64_t v13;
  NSString *stackId;
  int v15;
  int v16;
  uint64_t v17;
  NSString *widgetBundleId;
  uint64_t v19;
  NSString *widgetKind;
  int v21;
  uint64_t v22;
  NSString *intentDescription;
  uint64_t v24;
  NSString *widgetUniqueId;
  uint64_t v26;
  NSString *appBundleId;
  uint64_t v28;
  NSArray *suggestionIds;
  ATXHomeScreenEventMetadata *v30;
  void *v31;
  uint64_t v32;
  ATXHomeScreenEventMetadata *metadata;
  ATXHomeScreenEvent *v34;
  NSObject *v35;
  objc_super v37;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v34 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenEvent initWithProto:].cold.1((uint64_t)self, v35);

    goto LABEL_9;
  }
  v37.receiver = self;
  v37.super_class = (Class)ATXHomeScreenEvent;
  v5 = -[ATXHomeScreenEvent init](&v37, sel_init);
  if (v5)
  {
    v6 = v4;
    v5->_absoluteDate = -[ATXPBHomeScreenEvent date]((uint64_t)v6);
    -[ATXPBHomeScreenEvent eventTypeString]((uint64_t)v6);
    v7 = objc_claimAutoreleasedReturnValue();
    eventTypeString = v5->_eventTypeString;
    v5->_eventTypeString = (NSString *)v7;

    -[ATXPBHomeScreenEvent reason]((uint64_t)v6);
    v9 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v9;

    -[ATXPBHomeScreenEvent blendingCacheId]((uint64_t)v6);
    v11 = objc_claimAutoreleasedReturnValue();
    blendingCacheId = v5->_blendingCacheId;
    v5->_blendingCacheId = (NSString *)v11;

    -[ATXPBHomeScreenEvent stackId]((uint64_t)v6);
    v13 = objc_claimAutoreleasedReturnValue();
    stackId = v5->_stackId;
    v5->_stackId = (NSString *)v13;

    v15 = -[ATXPBHomeScreenEvent stackKind]((uint64_t)v6);
    v5->_stackKind = ATXStackKindForPBKind(v15);
    v16 = -[ATXPBHomeScreenEvent stackLocation]((uint64_t)v6);
    v5->_stackLocation = ATXStackLocationForPBLocation(v16);
    -[ATXPBHomeScreenEvent widgetBundleId]((uint64_t)v6);
    v17 = objc_claimAutoreleasedReturnValue();
    widgetBundleId = v5->_widgetBundleId;
    v5->_widgetBundleId = (NSString *)v17;

    -[ATXPBHomeScreenEvent widgetKind]((uint64_t)v6);
    v19 = objc_claimAutoreleasedReturnValue();
    widgetKind = v5->_widgetKind;
    v5->_widgetKind = (NSString *)v19;

    v21 = -[ATXPBHomeScreenEvent widgetSize]((uint64_t)v6);
    v5->_widgetSize = ATXStackLayoutSizeForPBLayoutSize(v21);
    -[ATXPBHomeScreenEvent intentDescription]((uint64_t)v6);
    v22 = objc_claimAutoreleasedReturnValue();
    intentDescription = v5->_intentDescription;
    v5->_intentDescription = (NSString *)v22;

    -[ATXPBHomeScreenEvent widgetUniqueId]((uint64_t)v6);
    v24 = objc_claimAutoreleasedReturnValue();
    widgetUniqueId = v5->_widgetUniqueId;
    v5->_widgetUniqueId = (NSString *)v24;

    -[ATXPBHomeScreenEvent appBundleId]((uint64_t)v6);
    v26 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v26;

    -[ATXPBHomeScreenEvent suggestionIds]((uint64_t)v6);
    v28 = objc_claimAutoreleasedReturnValue();
    suggestionIds = v5->_suggestionIds;
    v5->_suggestionIds = (NSArray *)v28;

    v30 = [ATXHomeScreenEventMetadata alloc];
    -[ATXPBHomeScreenEvent metadata]((uint64_t)v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[ATXHomeScreenEventMetadata initWithProto:](v30, "initWithProto:", v31);
    metadata = v5->_metadata;
    v5->_metadata = (ATXHomeScreenEventMetadata *)v32;

  }
  self = v5;
  v34 = self;
LABEL_10:

  return v34;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXHomeScreenEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[ATXPBHomeScreenEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBHomeScreenEvent setEventTypeString:]((uint64_t)v3, self->_eventTypeString);
  -[ATXPBHomeScreenEvent setReason:]((uint64_t)v3, self->_reason);
  -[ATXPBHomeScreenEvent setBlendingCacheId:]((uint64_t)v3, self->_blendingCacheId);
  -[ATXPBHomeScreenEvent setStackId:]((uint64_t)v3, self->_stackId);
  v4 = ATXPBStackKindForKind(self->_stackKind);
  -[ATXPBHomeScreenEvent setStackKind:]((uint64_t)v3, v4);
  v5 = ATXPBStackLocationForLocation(self->_stackLocation);
  -[ATXPBHomeScreenEvent setStackLocation:]((uint64_t)v3, v5);
  -[ATXPBHomeScreenEvent setWidgetBundleId:]((uint64_t)v3, self->_widgetBundleId);
  -[ATXPBHomeScreenEvent setWidgetKind:]((uint64_t)v3, self->_widgetKind);
  v6 = ATXPBStackLayoutSizeForLayoutSize(self->_widgetSize);
  -[ATXPBHomeScreenEvent setWidgetSize:]((uint64_t)v3, v6);
  -[ATXPBHomeScreenEvent setIntentDescription:]((uint64_t)v3, self->_intentDescription);
  -[ATXPBHomeScreenEvent setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBHomeScreenEvent setAppBundleId:]((uint64_t)v3, self->_appBundleId);
  v7 = (void *)-[NSArray copy](self->_suggestionIds, "copy");
  -[ATXPBHomeScreenEvent setSuggestionIds:]((uint64_t)v3, v7);

  -[ATXHomeScreenEventMetadata proto](self->_metadata, "proto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenEvent setMetadata:]((uint64_t)v3, v8);

  return v3;
}

- (void)setDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_absoluteDate = v4;
}

- (void)setStackLocation:(unint64_t)a3
{
  self->_stackLocation = a3;
}

- (void)setStackKind:(unint64_t)a3
{
  self->_stackKind = a3;
}

- (void)setStackId:(id)a3
{
  objc_storeStrong((id *)&self->_stackId, a3);
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setEventTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_eventTypeString, a3);
}

- (void)setBlendingCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_eventTypeString, 0);
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return self->_widgetUniqueId;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  NSString *v3;
  void *v4;

  v3 = self->_eventTypeString;
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Unknown")))
  {
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Tapped"))
      || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("ContextMenuDismissOnce"))
      || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("ContextMenuNeverShowAgain")))
    {
      goto LABEL_6;
    }
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("WidgetAppeared")))
    {
      v4 = &unk_1E4DC2960;
      goto LABEL_7;
    }
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("WidgetDisappeared")))
    {
      v4 = &unk_1E4DC2978;
      goto LABEL_7;
    }
    if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("SuggestionsAppeared"))
      || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("SuggestionsDisappeared")))
    {
LABEL_6:
      v4 = &unk_1E4DC2990;
      goto LABEL_7;
    }
    if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("WidgetOccluded")))
      -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("WidgetUnoccluded"));
  }
  v4 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:

  return v4;
}

- (void)setWidgetUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUniqueId, a3);
}

- (void)setWidgetSize:(unint64_t)a3
{
  self->_widgetSize = a3;
}

- (void)setWidgetKind:(id)a3
{
  objc_storeStrong((id *)&self->_widgetKind, a3);
}

- (void)setWidgetBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBundleId, a3);
}

- (void)setIsSuggestedWidget:(BOOL)a3
{
  self->_isSuggestedWidget = a3;
}

- (void)setIntentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_intentDescription, a3);
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

+ (id)eventForPageShownWithIndex:(unint64_t)a3 widgetsByStack:(id)a4 blendingCacheIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v10);

  objc_msgSend(v9, "setEventTypeString:", CFSTR("HomeScreenPageShown"));
  objc_msgSend(v9, "setBlendingCacheId:", v7);

  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPageIndex:", v12);

  objc_msgSend(v11, "setStacks:", v8);
  objc_msgSend(v9, "setMetadata:", v11);

  return v9;
}

- (NSDate)date
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteDate);
}

- (unsigned)consumerSubTypeForUIStream
{
  return 34;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_blendingCacheId);
}

- (unsigned)feedbackConsumerSubType
{
  NSString **p_widgetBundleId;
  BOOL v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  NSObject *v8;

  p_widgetBundleId = &self->_widgetBundleId;
  if (-[NSString isEqualToString:](self->_widgetBundleId, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel")))
  {
    v4 = !ATXStackLocationIsTodayPage(self->_stackLocation);
    v5 = 37;
    v6 = 40;
    goto LABEL_5;
  }
  if (-[NSString isEqualToString:](*p_widgetBundleId, "isEqualToString:", *MEMORY[0x1E0CF9480]))
  {
    v4 = !ATXStackLocationIsTodayPage(self->_stackLocation);
    v5 = 36;
    v6 = 39;
LABEL_5:
    if (v4)
      return v5;
    else
      return v6;
  }
  __atxlog_handle_feedback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ATXHomeScreenEvent feedbackConsumerSubType].cold.1((uint64_t *)p_widgetBundleId, v8);

  return 36;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  ATXHomeScreenSessionMetadata *v12;
  id v13;

  v13 = a3;
  v5 = self->_eventTypeString;
  if (!-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("Unknown")))
  {
    if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("Tapped")))
    {

      -[ATXHomeScreenEvent _uuidArrayFromStringArray:](self, "_uuidArrayFromStringArray:", self->_suggestionIds);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = v13;
      v7 = v5;
      v8 = 0;
LABEL_7:
      v9 = 0;
LABEL_8:
      objc_msgSend(v6, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", v7, v8, v9);
      goto LABEL_9;
    }
    if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("ContextMenuDismissOnce"))
      || -[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("ContextMenuNeverShowAgain")))
    {

      -[ATXHomeScreenEvent _uuidArrayFromStringArray:](self, "_uuidArrayFromStringArray:", self->_suggestionIds);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = v13;
      v7 = 0;
      v8 = v5;
      goto LABEL_7;
    }
    if (!-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("WidgetAppeared"))
      && !-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("WidgetDisappeared")))
    {
      if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("SuggestionsAppeared")))
      {

        -[ATXHomeScreenEvent _uuidArrayFromStringArray:](self, "_uuidArrayFromStringArray:", self->_suggestionIds);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        v6 = v13;
        v7 = 0;
        v8 = 0;
        v9 = v5;
        goto LABEL_8;
      }
      if (!-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("SuggestionsDisappeared"))
        && !-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("WidgetOccluded")))
      {
        -[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("WidgetUnoccluded"));
      }
    }
  }
LABEL_9:

  objc_msgSend(v13, "updateConsumerSubTypeIfUnset:", -[ATXHomeScreenEvent feedbackConsumerSubType](self, "feedbackConsumerSubType"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_blendingCacheId);
  objc_msgSend(v13, "updateBlendingUICacheUpdateUUIDIfUnset:", v10);

  objc_msgSend(v13, "sessionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[ATXHomeScreenSessionMetadata initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:]([ATXHomeScreenSessionMetadata alloc], "initWithWidgetUniqueId:widgetBundleId:isWidgetInTodayView:", self->_widgetUniqueId, self->_widgetBundleId, ATXStackLocationIsTodayPage(self->_stackLocation));
    objc_msgSend(v13, "updateSessionMetadataIfUnset:", v12);

  }
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)jsonDict
{
  const __CFString *blendingCacheId;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *stackId;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *widgetUniqueId;
  const __CFString *widgetBundleId;
  const __CFString *widgetKind;
  uint64_t v18;
  void *v19;
  const __CFString *appBundleId;
  const __CFString *intentDescription;
  const __CFString *reason;
  NSString *eventTypeString;
  ATXHomeScreenEventMetadata *metadata;
  NSArray *suggestionIds;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v32[15];
  _QWORD v33[16];

  v33[15] = *MEMORY[0x1E0C80C00];
  blendingCacheId = (const __CFString *)self->_blendingCacheId;
  if (!blendingCacheId)
    blendingCacheId = CFSTR("nil");
  v33[0] = blendingCacheId;
  v32[0] = CFSTR("blendingCacheId");
  v32[1] = CFSTR("date");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXHomeScreenEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  stackId = (const __CFString *)self->_stackId;
  if (!stackId)
    stackId = CFSTR("nil");
  v33[1] = v6;
  v33[2] = stackId;
  v32[2] = CFSTR("stackId");
  v32[3] = CFSTR("stackKind");
  ATXStringForStackKind(self->_stackKind);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("nil");
  v33[3] = v11;
  v32[4] = CFSTR("stackLocation");
  ATXStringForStackLocation(self->_stackLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("nil");
  widgetUniqueId = (const __CFString *)self->_widgetUniqueId;
  if (!widgetUniqueId)
    widgetUniqueId = CFSTR("nil");
  v33[4] = v14;
  v33[5] = widgetUniqueId;
  v32[5] = CFSTR("widgetUniqueId");
  v32[6] = CFSTR("widgetBundleId");
  widgetBundleId = (const __CFString *)self->_widgetBundleId;
  widgetKind = (const __CFString *)self->_widgetKind;
  if (!widgetBundleId)
    widgetBundleId = CFSTR("nil");
  if (!widgetKind)
    widgetKind = CFSTR("nil");
  v33[6] = widgetBundleId;
  v33[7] = widgetKind;
  v32[7] = CFSTR("widgetKind");
  v32[8] = CFSTR("isSuggestedWidget");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSuggestedWidget);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  appBundleId = (const __CFString *)self->_appBundleId;
  if (!appBundleId)
    appBundleId = CFSTR("nil");
  v33[8] = v18;
  v33[9] = appBundleId;
  v32[9] = CFSTR("appBundleId");
  v32[10] = CFSTR("intentDescription");
  intentDescription = (const __CFString *)self->_intentDescription;
  if (!intentDescription)
    intentDescription = CFSTR("nil");
  eventTypeString = self->_eventTypeString;
  reason = (const __CFString *)self->_reason;
  if (!reason)
    reason = CFSTR("nil");
  v33[10] = intentDescription;
  v33[11] = reason;
  v32[11] = CFSTR("reason");
  v32[12] = CFSTR("suggestionIds");
  suggestionIds = self->_suggestionIds;
  metadata = self->_metadata;
  if (!suggestionIds)
    suggestionIds = (NSArray *)CFSTR("nil");
  if (eventTypeString)
    v26 = (const __CFString *)eventTypeString;
  else
    v26 = CFSTR("nil");
  v33[12] = suggestionIds;
  v33[13] = v26;
  v32[13] = CFSTR("eventType");
  v32[14] = CFSTR("metadata");
  -[ATXHomeScreenEventMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = CFSTR("nil");
  v33[14] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXHomeScreenEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenEvent *v4;
  ATXHomeScreenEvent *v5;
  BOOL v6;

  v4 = (ATXHomeScreenEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenEvent isEqualToATXHomeScreenEvent:](self, "isEqualToATXHomeScreenEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenEvent:(id)a3
{
  id *v4;
  id *v5;
  double v6;
  NSString *eventTypeString;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  NSString *reason;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSString *blendingCacheId;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSString *stackId;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  NSString *widgetBundleId;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  char v31;
  NSString *widgetUniqueId;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  NSString *intentDescription;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  NSArray *suggestionIds;
  NSArray *v43;
  NSArray *v44;
  NSArray *v45;
  char v46;
  ATXHomeScreenEventMetadata *metadata;
  ATXHomeScreenEventMetadata *v48;
  ATXHomeScreenEventMetadata *v49;
  ATXHomeScreenEventMetadata *v50;
  BOOL v51;
  NSString *widgetKind;
  NSString *v53;
  NSString *v54;
  NSString *v55;
  char v56;
  NSString *appBundleId;
  NSString *v58;
  NSString *v59;
  NSString *v60;
  char v61;
  BOOL v62;

  v4 = (id *)a3;
  v5 = v4;
  v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16)
    goto LABEL_51;
  eventTypeString = self->_eventTypeString;
  v8 = (NSString *)v4[3];
  if (eventTypeString == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = eventTypeString;
    v11 = -[NSString isEqual:](v10, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_51:
      v62 = 0;
      goto LABEL_52;
    }
  }
  reason = self->_reason;
  v13 = (NSString *)v5[4];
  if (reason == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = reason;
    v16 = -[NSString isEqual:](v15, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_51;
  }
  blendingCacheId = self->_blendingCacheId;
  v18 = (NSString *)v5[5];
  if (blendingCacheId == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = blendingCacheId;
    v21 = -[NSString isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_51;
  }
  stackId = self->_stackId;
  v23 = (NSString *)v5[6];
  if (stackId == v23)
  {

  }
  else
  {
    v24 = v23;
    v25 = stackId;
    v26 = -[NSString isEqual:](v25, "isEqual:", v24);

    if ((v26 & 1) == 0)
      goto LABEL_51;
  }
  widgetBundleId = self->_widgetBundleId;
  v28 = (NSString *)v5[7];
  if (widgetBundleId == v28)
  {

  }
  else
  {
    v29 = v28;
    v30 = widgetBundleId;
    v31 = -[NSString isEqual:](v30, "isEqual:", v29);

    if ((v31 & 1) == 0)
      goto LABEL_51;
  }
  widgetUniqueId = self->_widgetUniqueId;
  v33 = (NSString *)v5[14];
  if (widgetUniqueId == v33)
  {

  }
  else
  {
    v34 = v33;
    v35 = widgetUniqueId;
    v36 = -[NSString isEqual:](v35, "isEqual:", v34);

    if ((v36 & 1) == 0)
      goto LABEL_51;
  }
  intentDescription = self->_intentDescription;
  v38 = (NSString *)v5[13];
  if (intentDescription == v38)
  {

  }
  else
  {
    v39 = v38;
    v40 = intentDescription;
    v41 = -[NSString isEqual:](v40, "isEqual:", v39);

    if ((v41 & 1) == 0)
      goto LABEL_51;
  }
  suggestionIds = self->_suggestionIds;
  v43 = (NSArray *)v5[15];
  if (suggestionIds == v43)
  {

  }
  else
  {
    v44 = v43;
    v45 = suggestionIds;
    v46 = -[NSArray isEqual:](v45, "isEqual:", v44);

    if ((v46 & 1) == 0)
      goto LABEL_51;
  }
  metadata = self->_metadata;
  v48 = (ATXHomeScreenEventMetadata *)v5[16];
  if (metadata == v48)
  {

  }
  else
  {
    v49 = v48;
    v50 = metadata;
    v51 = -[ATXHomeScreenEventMetadata isEqual:](v50, "isEqual:", v49);

    if (!v51)
      goto LABEL_51;
  }
  widgetKind = self->_widgetKind;
  v53 = (NSString *)v5[8];
  if (widgetKind == v53)
  {

  }
  else
  {
    v54 = v53;
    v55 = widgetKind;
    v56 = -[NSString isEqual:](v55, "isEqual:", v54);

    if ((v56 & 1) == 0)
      goto LABEL_51;
  }
  appBundleId = self->_appBundleId;
  v58 = (NSString *)v5[9];
  if (appBundleId == v58)
  {

  }
  else
  {
    v59 = v58;
    v60 = appBundleId;
    v61 = -[NSString isEqual:](v60, "isEqual:", v59);

    if ((v61 & 1) == 0)
      goto LABEL_51;
  }
  if ((id)self->_widgetSize != v5[10] || (id)self->_stackKind != v5[11])
    goto LABEL_51;
  v62 = self->_stackLocation == (_QWORD)v5[12];
LABEL_52:

  return v62;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXHomeScreenEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXHomeScreenEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXHomeScreenEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXHomeScreenEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)_uuidArrayFromStringArray:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_50);
}

id __48__ATXHomeScreenEvent__uuidArrayFromStringArray___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (NSString)eventTypeString
{
  return self->_eventTypeString;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)blendingCacheId
{
  return self->_blendingCacheId;
}

- (NSString)stackId
{
  return self->_stackId;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (BOOL)isSuggestedWidget
{
  return self->_isSuggestedWidget;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (unint64_t)widgetSize
{
  return self->_widgetSize;
}

- (unint64_t)stackKind
{
  return self->_stackKind;
}

- (unint64_t)stackLocation
{
  return self->_stackLocation;
}

- (NSString)intentDescription
{
  return self->_intentDescription;
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIds, a3);
}

- (ATXHomeScreenEventMetadata)metadata
{
  return self->_metadata;
}

- (void)feedbackConsumerSubType
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Could not find consumerSubType for non-proactive widget bundle id: %@", (uint8_t *)&v3, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
