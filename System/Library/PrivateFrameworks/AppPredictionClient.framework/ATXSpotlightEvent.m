@implementation ATXSpotlightEvent

- (ATXSpotlightEvent)initWithDate:(id)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11
{
  uint64_t v15;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ATXSpotlightEvent *v25;

  v15 = *(_QWORD *)&a4;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  v25 = -[ATXSpotlightEvent initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v15, v24, v23, v22, v21, v20, v19, v18);

  return v25;
}

- (ATXSpotlightEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11
{
  id v18;
  id v19;
  ATXSpotlightEvent *v20;
  ATXSpotlightEvent *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v18 = a10;
  v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)ATXSpotlightEvent;
  v20 = -[ATXSpotlightEvent init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_absoluteDate = a3;
    v20->_eventType = a4;
    objc_storeStrong((id *)&v20->_appConsumerSubType, a5);
    objc_storeStrong((id *)&v21->_actionConsumerSubType, a6);
    objc_storeStrong((id *)&v21->_appBlendingCacheId, a7);
    objc_storeStrong((id *)&v21->_actionBlendingCacheId, a8);
    objc_storeStrong((id *)&v21->_appSuggestionIds, a9);
    objc_storeStrong((id *)&v21->_actionSuggestionIds, a10);
    objc_storeStrong((id *)&v21->_metadata, a11);
  }

  return v21;
}

- (NSDate)date
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_absoluteDate);
}

- (void)setDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  self->_absoluteDate = v4;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 9;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  int v3;

  if (a3)
    return (id)MEMORY[0x1E0C9AA60];
  v3 = self->_eventType - 1;
  if (v3 > 7)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return (id)qword_1E4D5D3D0[v3];
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  const __CFString *v4;

  v4 = CFSTR("spotlight-action");
  if (a4 != 21)
    v4 = 0;
  if (a4 == 9)
    return CFSTR("spotlight-app");
  else
    return (id)v4;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  NSString **p_appBlendingCacheId;
  void *v4;

  if (a3 != 21)
  {
    if (a3 != 9)
      goto LABEL_4;
    p_appBlendingCacheId = &self->_appBlendingCacheId;
    if (!self->_appBlendingCacheId)
      goto LABEL_4;
LABEL_6:
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *p_appBlendingCacheId);
    return v4;
  }
  p_appBlendingCacheId = &self->_actionBlendingCacheId;
  if (self->_actionBlendingCacheId)
    goto LABEL_6;
LABEL_4:
  v4 = 0;
  return v4;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  int v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  if (v4 == 21)
  {
    v7 = v6;
    -[ATXSpotlightEvent _updateActionUIFeedbackSession:](self, "_updateActionUIFeedbackSession:", v6);
    goto LABEL_5;
  }
  if (v4 == 9)
  {
    v7 = v6;
    -[ATXSpotlightEvent _updateAppUIFeedbackSession:](self, "_updateAppUIFeedbackSession:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (void)_updateAppUIFeedbackSession:(id)a3
{
  ATXSpotlightSessionMetadata *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  switch(self->_eventType)
  {
    case 1:
      v5 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", self->_appConsumerSubType, 0);
      v4 = -[ATXSpotlightSessionMetadata initWithAppConsumerSubType:actionConsumerSubType:]([ATXSpotlightSessionMetadata alloc], "initWithAppConsumerSubType:actionConsumerSubType:", v5, 21);
      objc_msgSend(v11, "updateConsumerSubTypeIfUnset:", v5);
      objc_msgSend(v11, "updateSessionMetadataIfUnset:", v4);
      goto LABEL_11;
    case 2:
      objc_msgSend(v11, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata didSearchDuringSession](self->_metadata, "didSearchDuringSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightSessionMetadata setDidSearchDuringSession:](v4, "setDidSearchDuringSession:", objc_msgSend(v6, "BOOLValue"));
      goto LABEL_10;
    case 3:
      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_appSuggestionIds);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, 0, v7);

      v4 = (ATXSpotlightSessionMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_appBlendingCacheId);
      objc_msgSend(v11, "updateBlendingUICacheUpdateUUIDIfUnset:", v4);
      goto LABEL_11;
    case 4:
      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_appSuggestionIds);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", v8, 0, 0);

      objc_msgSend(v11, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata engagedAppString](self->_metadata, "engagedAppString");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_appSuggestionIds);
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, v4, 0);
      goto LABEL_11;
    case 8:
      objc_msgSend(v11, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata searchEngagedBundleId](self->_metadata, "searchEngagedBundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_11;
      -[ATXSpotlightEventMetadata searchEngagedBundleId](self->_metadata, "searchEngagedBundleId");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = (void *)v9;
      -[ATXSpotlightSessionMetadata setEngagedAppString:](v4, "setEngagedAppString:", v9);
LABEL_10:

LABEL_11:
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)_updateActionUIFeedbackSession:(id)a3
{
  ATXSpotlightSessionMetadata *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  switch(self->_eventType)
  {
    case 1:
      v5 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", self->_actionConsumerSubType, 0);
      v4 = -[ATXSpotlightSessionMetadata initWithAppConsumerSubType:actionConsumerSubType:]([ATXSpotlightSessionMetadata alloc], "initWithAppConsumerSubType:actionConsumerSubType:", 9, v5);
      objc_msgSend(v10, "updateConsumerSubTypeIfUnset:", v5);
      objc_msgSend(v10, "updateSessionMetadataIfUnset:", v4);
      goto LABEL_10;
    case 2:
      objc_msgSend(v10, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata didSearchDuringSession](self->_metadata, "didSearchDuringSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightSessionMetadata setDidSearchDuringSession:](v4, "setDidSearchDuringSession:", objc_msgSend(v6, "BOOLValue"));
      goto LABEL_9;
    case 3:
      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_actionSuggestionIds);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, 0, v7);

      v4 = (ATXSpotlightSessionMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_actionBlendingCacheId);
      objc_msgSend(v10, "updateBlendingUICacheUpdateUUIDIfUnset:", v4);
      goto LABEL_10;
    case 4:
      objc_msgSend(v10, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata engagedAppString](self->_metadata, "engagedAppString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightSessionMetadata setEngagedAppString:](v4, "setEngagedAppString:", v8);

      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_actionSuggestionIds);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", v6, 0, 0);
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      -[ATXSpotlightEvent _stringArrayToUUIDArray:](self, "_stringArrayToUUIDArray:", self->_actionSuggestionIds);
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, v4, 0);
      goto LABEL_10;
    case 8:
      objc_msgSend(v10, "sessionMetadata");
      v4 = (ATXSpotlightSessionMetadata *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightEventMetadata searchEngagedBundleId](self->_metadata, "searchEngagedBundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_10;
      -[ATXSpotlightEventMetadata searchEngagedBundleId](self->_metadata, "searchEngagedBundleId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSpotlightSessionMetadata setEngagedAppString:](v4, "setEngagedAppString:", v6);
LABEL_9:

LABEL_10:
LABEL_11:

      return;
    default:
      goto LABEL_11;
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
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  const __CFString *appBlendingCacheId;
  NSString *actionBlendingCacheId;
  const __CFString *v10;
  NSArray *appSuggestionIds;
  NSArray *actionSuggestionIds;
  const __CFString *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("date");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXSpotlightEvent date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("eventType");
  v6 = self->_eventType - 1;
  if (v6 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E4D5D410[v6];
  }
  appBlendingCacheId = (const __CFString *)self->_appBlendingCacheId;
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if (!appBlendingCacheId)
    appBlendingCacheId = CFSTR("nil");
  v17[1] = v7;
  v17[2] = appBlendingCacheId;
  v16[2] = CFSTR("appBlendingCacheId");
  v16[3] = CFSTR("actionBlendingCacheId");
  if (actionBlendingCacheId)
    v10 = (const __CFString *)actionBlendingCacheId;
  else
    v10 = CFSTR("nil");
  appSuggestionIds = self->_appSuggestionIds;
  actionSuggestionIds = self->_actionSuggestionIds;
  if (!appSuggestionIds)
    appSuggestionIds = (NSArray *)CFSTR("nil");
  v17[3] = v10;
  v17[4] = appSuggestionIds;
  v16[4] = CFSTR("appSuggestionIds");
  v16[5] = CFSTR("actionSuggestionIds");
  if (actionSuggestionIds)
    v13 = (const __CFString *)actionSuggestionIds;
  else
    v13 = CFSTR("nil");
  v17[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXSpotlightEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
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
  -[ATXSpotlightEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXSpotlightEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXSpotlightEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXSpotlightEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (ATXSpotlightEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBSpotlightEvent *v5;
  ATXSpotlightEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBSpotlightEvent initWithData:]([ATXPBSpotlightEvent alloc], "initWithData:", v4);

    self = -[ATXSpotlightEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXSpotlightEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXSpotlightEventMetadata *v12;
  void *v13;
  ATXSpotlightEventMetadata *v14;
  ATXSpotlightEvent *v15;
  NSObject *v16;
  void *v18;
  unsigned int v19;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXSpotlightEvent initWithProto:].cold.1();

    goto LABEL_7;
  }
  v5 = v4;
  v6 = -[ATXPBSpotlightEvent date]((uint64_t)v5);
  v19 = -[ATXPBSpotlightEvent eventType]((uint64_t)v5);
  -[ATXPBSpotlightEvent appConsumerSubType]((uint64_t)v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent actionConsumerSubType]((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent appBlendingCacheId]((uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent actionBlendingCacheId]((uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent appSuggestionIds]((uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent actionSuggestionIds]((uint64_t)v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [ATXSpotlightEventMetadata alloc];
  -[ATXPBSpotlightEvent metadata]((uint64_t)v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ATXSpotlightEventMetadata initWithProto:](v12, "initWithProto:", v13);
  self = -[ATXSpotlightEvent initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v19, v18, v7, v8, v9, v10, v6, v11, v14);

  v15 = self;
LABEL_8:

  return v15;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[ATXPBSpotlightEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBSpotlightEvent setAppConsumerSubType:]((uint64_t)v3, self->_appConsumerSubType);
  -[ATXPBSpotlightEvent setActionConsumerSubType:]((uint64_t)v3, self->_actionConsumerSubType);
  -[ATXPBSpotlightEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[ATXPBSpotlightEvent setAppBlendingCacheId:]((uint64_t)v3, self->_appBlendingCacheId);
  -[ATXPBSpotlightEvent setActionBlendingCacheId:]((uint64_t)v3, self->_actionBlendingCacheId);
  v4 = (void *)-[NSArray copy](self->_appSuggestionIds, "copy");
  -[ATXPBSpotlightEvent setAppSuggestionIds:]((uint64_t)v3, v4);

  v5 = (void *)-[NSArray copy](self->_actionSuggestionIds, "copy");
  -[ATXPBSpotlightEvent setActionSuggestionIds:]((uint64_t)v3, v5);

  -[ATXSpotlightEventMetadata proto](self->_metadata, "proto");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent setMetadata:]((uint64_t)v3, v6);

  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXSpotlightEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightEvent *v4;
  ATXSpotlightEvent *v5;
  BOOL v6;

  v4 = (ATXSpotlightEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSpotlightEvent isEqualToATXSpotlightEvent:](self, "isEqualToATXSpotlightEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXSpotlightEvent:(id)a3
{
  double *v4;
  double *v5;
  double v6;
  int eventType;
  NSString *appBlendingCacheId;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  NSString *actionBlendingCacheId;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSArray *appSuggestionIds;
  NSArray *v19;
  NSArray *v20;
  NSArray *v21;
  char v22;
  NSArray *actionSuggestionIds;
  NSArray *v24;
  NSArray *v25;
  NSArray *v26;
  char v27;
  char v28;
  ATXSpotlightEventMetadata *v30;
  ATXSpotlightEventMetadata *v31;

  v4 = (double *)a3;
  v5 = v4;
  v6 = self->_absoluteDate - v4[1];
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16)
    goto LABEL_19;
  eventType = self->_eventType;
  if (eventType != objc_msgSend(v4, "eventType"))
    goto LABEL_19;
  appBlendingCacheId = self->_appBlendingCacheId;
  v9 = (NSString *)*((id *)v5 + 5);
  if (appBlendingCacheId == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = appBlendingCacheId;
    v12 = -[NSString isEqual:](v11, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_19;
  }
  actionBlendingCacheId = self->_actionBlendingCacheId;
  v14 = (NSString *)*((id *)v5 + 6);
  if (actionBlendingCacheId == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = actionBlendingCacheId;
    v17 = -[NSString isEqual:](v16, "isEqual:", v15);

    if ((v17 & 1) == 0)
      goto LABEL_19;
  }
  appSuggestionIds = self->_appSuggestionIds;
  v19 = (NSArray *)*((id *)v5 + 7);
  if (appSuggestionIds == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = appSuggestionIds;
    v22 = -[NSArray isEqual:](v21, "isEqual:", v20);

    if ((v22 & 1) == 0)
      goto LABEL_19;
  }
  actionSuggestionIds = self->_actionSuggestionIds;
  v24 = (NSArray *)*((id *)v5 + 8);
  if (actionSuggestionIds == v24)
  {

  }
  else
  {
    v25 = v24;
    v26 = actionSuggestionIds;
    v27 = -[NSArray isEqual:](v26, "isEqual:", v25);

    if ((v27 & 1) == 0)
    {
LABEL_19:
      v28 = 0;
      goto LABEL_20;
    }
  }
  v30 = self->_metadata;
  v31 = v30;
  if (v30 == *((ATXSpotlightEventMetadata **)v5 + 9))
    v28 = 1;
  else
    v28 = -[ATXSpotlightEventMetadata isEqual:](v30, "isEqual:");

LABEL_20:
  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  v4 = -[NSString hash](self->_appBlendingCacheId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_actionBlendingCacheId, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_appSuggestionIds, "hash") - v5 + 32 * v5;
  v7 = -[NSArray hash](self->_actionSuggestionIds, "hash") - v6 + 32 * v6;
  return -[ATXSpotlightEventMetadata hash](self->_metadata, "hash") - v7 + 32 * v7;
}

- (id)_stringArrayToUUIDArray:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_95);
}

id __45__ATXSpotlightEvent__stringArrayToUUIDArray___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (NSString)appConsumerSubType
{
  return self->_appConsumerSubType;
}

- (void)setAppConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_appConsumerSubType, a3);
}

- (NSString)actionConsumerSubType
{
  return self->_actionConsumerSubType;
}

- (void)setActionConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_actionConsumerSubType, a3);
}

- (NSString)appBlendingCacheId
{
  return self->_appBlendingCacheId;
}

- (void)setAppBlendingCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_appBlendingCacheId, a3);
}

- (NSString)actionBlendingCacheId
{
  return self->_actionBlendingCacheId;
}

- (void)setActionBlendingCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_actionBlendingCacheId, a3);
}

- (NSArray)appSuggestionIds
{
  return self->_appSuggestionIds;
}

- (void)setAppSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_appSuggestionIds, a3);
}

- (NSArray)actionSuggestionIds
{
  return self->_actionSuggestionIds;
}

- (void)setActionSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_actionSuggestionIds, a3);
}

- (ATXSpotlightEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_actionSuggestionIds, 0);
  objc_storeStrong((id *)&self->_appSuggestionIds, 0);
  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_actionConsumerSubType, 0);
  objc_storeStrong((id *)&self->_appConsumerSubType, 0);
}

+ (id)viewAppearedEventWithSFFeedback:(id)a3 date:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  ATXSpotlightEvent *v19;
  NSObject *v21;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CF9508];
  v7 = v5;
  v8 = a4;
  v9 = objc_msgSend(v7, "viewAppearEvent");
  v10 = 4;
  if (v9 > 21)
  {
    if (v9 == 22)
      goto LABEL_15;
    if (v9 == 23 || v9 == 29)
    {
      v10 = 7;
      goto LABEL_15;
    }
  }
  else
  {
    if ((unint64_t)(v9 - 4) < 2 || v9 == 0)
      goto LABEL_15;
    if (v9 == 2)
    {
      v10 = 8;
      goto LABEL_15;
    }
  }
  __atxlog_handle_feedback();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    +[ATXSpotlightEvent(Initializers) viewAppearedEventWithSFFeedback:date:].cold.2(v7);

  v10 = 4;
LABEL_15:

  objc_msgSend(v6, "stringForConsumerSubtype:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CF9508];
  v15 = v7;
  v16 = objc_msgSend(v15, "viewAppearEvent");
  if (v16 > 0x1E)
  {
LABEL_23:
    __atxlog_handle_feedback();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      +[ATXSpotlightEvent(Initializers) viewAppearedEventWithSFFeedback:date:].cold.1(v15);

    goto LABEL_17;
  }
  if (((1 << v16) & 0x40400031) == 0)
  {
    if (v16 == 2)
    {
      v17 = 20;
      goto LABEL_18;
    }
    if (v16 == 23)
    {
      v17 = 19;
      goto LABEL_18;
    }
    goto LABEL_23;
  }
LABEL_17:
  v17 = 18;
LABEL_18:

  objc_msgSend(v14, "stringForConsumerSubtype:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:]([ATXSpotlightEvent alloc], "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v8, 1, v13, v18, 0, 0, 0, 0, 0);

  return v19;
}

+ (id)viewDisappearedEventWithDidSearch:(BOOL)a3 date:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  ATXSpotlightEvent *v8;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDidSearchDuringSession:", v7);

  v8 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:]([ATXSpotlightEvent alloc], "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v5, 2, 0, 0, 0, 0, 0, 0, v6);
  return v8;
}

+ (id)suggestionsAppearedEventWithAppSuggestionIds:(id)a3 actionSuggestionIds:(id)a4 appBlendingCacheId:(id)a5 actionBlendingCacheId:(id)a6 date:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  ATXSpotlightEvent *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:]([ATXSpotlightEvent alloc], "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v11, 3, 0, 0, v13, v12, v15, v14, 0);

  return v16;
}

+ (id)appSuggestionTappedEventWithSuggestion:(id)a3 appBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ATXSpotlightEvent *v15;
  void *v16;
  void *v17;
  void *v18;
  ATXSpotlightEvent *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setQueryAtEngagement:", v10);

  objc_msgSend(v12, "bundleIdExecutableObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEngagedAppString:", v14);
  v15 = [ATXSpotlightEvent alloc];
  objc_msgSend(v12, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](v15, "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v9, 4, 0, 0, v11, 0, v18, 0, v13);

  return v19;
}

+ (id)actionSuggestionTappedEventWithSuggestion:(id)a3 actionBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  ATXSpotlightEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  ATXSpotlightEvent *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setQueryAtEngagement:", v10);

  objc_msgSend(v12, "atxActionExecutableObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEngagedAppString:", v15);

  v16 = [ATXSpotlightEvent alloc];
  objc_msgSend(v12, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](v16, "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v9, 4, 0, 0, 0, v11, 0, v19, v13);

  return v20;
}

+ (id)actionSuggestionContextMenuDismissOnceEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATXSpotlightEvent *v10;
  void *v11;
  ATXSpotlightEvent *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [ATXSpotlightEvent alloc];
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](v10, "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v7, 6, 0, 0, 0, v8, 0, v11, 0);
  return v12;
}

+ (id)actionSuggestionDismissedEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATXSpotlightEvent *v10;
  void *v11;
  ATXSpotlightEvent *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [ATXSpotlightEvent alloc];
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](v10, "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v7, 5, 0, 0, 0, v8, 0, v11, 0);
  return v12;
}

+ (id)searchResultTappedWithEngagedBundleId:(id)a3 searchedActionType:(unint64_t)a4 date:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  ATXSpotlightEvent *v11;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSearchEngagedBundleId:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchEngagedActionType:", v10);

  v11 = -[ATXSpotlightEvent initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:]([ATXSpotlightEvent alloc], "initWithDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v7, 8, 0, 0, 0, 0, 0, 0, v9);
  return v11;
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: tried to initialize with a non-ATXPBSpotlightEvent proto", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
