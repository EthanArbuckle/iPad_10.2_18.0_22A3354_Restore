@implementation ATXAppDirectoryEvent

+ (id)appDirectoryEventWithEventType:(unint64_t)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXAppDirectoryEvent *v14;

  v6 = a4;
  objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingDate"), objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingCategoryID"), objc_opt_class(), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingCategoryIndex"), objc_opt_class(), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingBundleID"), objc_opt_class(), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingBundleIndex"), objc_opt_class(), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingSearchQueryLength"), objc_opt_class(), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_objectForKey:classType:fromMetadata:", CFSTR("kATXAppDirectoryLoggingSearchTab"), objc_opt_class(), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ATXAppDirectoryEvent initWithDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:]([ATXAppDirectoryEvent alloc], "initWithDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:", v7, a3, v8, v9, v10, v11, v12, v13, 0, 0, 0, 0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ATXAppDirectoryEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  ATXAppDirectoryEvent *v32;

  v18 = a14;
  v19 = a13;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a9;
  v24 = a8;
  v25 = a7;
  v26 = a6;
  v27 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  v32 = -[ATXAppDirectoryEvent initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:", a4, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return v32;
}

- (ATXAppDirectoryEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  ATXAppDirectoryEvent *v24;
  ATXAppDirectoryEvent *v25;
  id obj;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a5;
  obj = a6;
  v35 = a6;
  v29 = a7;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v37.receiver = self;
  v37.super_class = (Class)ATXAppDirectoryEvent;
  v24 = -[ATXAppDirectoryEvent init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_absoluteDate = a3;
    v24->_eventType = a4;
    objc_storeStrong((id *)&v24->_categoryID, a5);
    objc_storeStrong((id *)&v25->_categoryIndex, obj);
    objc_storeStrong((id *)&v25->_bundleId, v29);
    objc_storeStrong((id *)&v25->_bundleIndex, a8);
    objc_storeStrong((id *)&v25->_searchQueryLength, a9);
    objc_storeStrong((id *)&v25->_searchTab, a10);
    objc_storeStrong((id *)&v25->_blendingCacheUUID, a11);
    objc_storeStrong((id *)&v25->_shownSuggestionIds, a12);
    objc_storeStrong((id *)&v25->_engagedSuggestionIds, a13);
    objc_storeStrong((id *)&v25->_metadata, a14);
  }

  return v25;
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

+ (id)_objectForKey:(id)a3 classType:(Class)a4 fromMetadata:(id)a5
{
  void *v5;
  id v6;

  objc_msgSend(a5, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 35;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  unint64_t v3;

  v3 = self->_eventType - 1;
  if (v3 > 8)
    return &unk_1E4DC29F0;
  else
    return (id)qword_1E4D5A4C0[v3];
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return CFSTR("app-directory");
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheUUID;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;
  ATXAppDirectoryEventMetadata *metadata;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "sessionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "sessionMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v11, "updateSessionMetadataIfUnset:", v6);
  }
  switch(self->_eventType)
  {
    case 3uLL:
    case 4uLL:
    case 6uLL:
      objc_msgSend(v11, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", self->_engagedSuggestionIds, 0, self->_shownSuggestionIds);
      objc_msgSend(v6, "setEngagedBundleId:", self->_bundleId);
      -[ATXAppDirectoryEventMetadata bundleIdInTopAppsVisible](self->_metadata, "bundleIdInTopAppsVisible");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEngagedBundleIdInTopAppsVisible:", v7);

      goto LABEL_6;
    case 7uLL:
      objc_msgSend(v6, "setDidSearchDuringSession:", 1);
      break;
    case 8uLL:
      metadata = self->_metadata;
      if (metadata)
      {
        -[ATXAppDirectoryEventMetadata userLaunchedAppBeforeLeaving](metadata, "userLaunchedAppBeforeLeaving");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v11, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", 0, 0, self->_shownSuggestionIds);
LABEL_6:
          objc_msgSend(v11, "updateConsumerSubTypeIfUnset:", 35);
          objc_msgSend(v11, "updateBlendingUICacheUpdateUUIDIfUnset:", self->_blendingCacheUUID);
        }
      }
      break;
    default:
      break;
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
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSNumber *categoryID;
  NSNumber *categoryIndex;
  const __CFString *v12;
  const __CFString *bundleId;
  NSNumber *bundleIndex;
  const __CFString *v15;
  NSNumber *searchQueryLength;
  NSNumber *searchTab;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  _QWORD v29[12];
  _QWORD v30[13];

  v30[12] = *MEMORY[0x1E0C80C00];
  -[NSArray _pas_mappedArrayWithTransform:](self->_shownSuggestionIds, "_pas_mappedArrayWithTransform:", &__block_literal_global_52);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NSArray _pas_mappedArrayWithTransform:](self->_engagedSuggestionIds, "_pas_mappedArrayWithTransform:", &__block_literal_global_19_0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("date");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXAppDirectoryEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  v29[1] = CFSTR("eventType");
  NSStringForATXAppDirectoryInteractionEvent(self->_eventType);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  categoryID = self->_categoryID;
  categoryIndex = self->_categoryIndex;
  if (!categoryID)
    categoryID = (NSNumber *)CFSTR("nil");
  v30[1] = v8;
  v30[2] = categoryID;
  v29[2] = CFSTR("categoryID");
  v29[3] = CFSTR("categoryIndex");
  if (categoryIndex)
    v12 = (const __CFString *)categoryIndex;
  else
    v12 = CFSTR("nil");
  bundleId = (const __CFString *)self->_bundleId;
  bundleIndex = self->_bundleIndex;
  if (!bundleId)
    bundleId = CFSTR("nil");
  v30[3] = v12;
  v30[4] = bundleId;
  v29[4] = CFSTR("bundleId");
  v29[5] = CFSTR("bundleIndex");
  if (bundleIndex)
    v15 = (const __CFString *)bundleIndex;
  else
    v15 = CFSTR("nil");
  searchQueryLength = self->_searchQueryLength;
  searchTab = self->_searchTab;
  if (!searchQueryLength)
    searchQueryLength = (NSNumber *)CFSTR("nil");
  v30[5] = v15;
  v30[6] = searchQueryLength;
  v29[6] = CFSTR("searchQueryLength");
  v29[7] = CFSTR("searchTab");
  if (searchTab)
    v18 = (const __CFString *)searchTab;
  else
    v18 = CFSTR("nil");
  v30[7] = v18;
  v29[8] = CFSTR("blendingCacheUUID");
  -[NSUUID UUIDString](self->_blendingCacheUUID, "UUIDString");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("nil");
  if (v3)
    v22 = v3;
  else
    v22 = CFSTR("nil");
  v30[8] = v21;
  v30[9] = v22;
  v29[9] = CFSTR("shownSuggestionIds");
  v29[10] = CFSTR("engagedSuggestionIds");
  if (v4)
    v23 = v4;
  else
    v23 = CFSTR("nil");
  v30[10] = v23;
  v29[11] = CFSTR("metadata");
  -[ATXAppDirectoryEventMetadata jsonDict](self->_metadata, "jsonDict");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("nil");
  v30[11] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

uint64_t __32__ATXAppDirectoryEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __32__ATXAppDirectoryEvent_jsonDict__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXAppDirectoryEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXAppDirectoryEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBAppDirectoryEvent *v5;
  ATXAppDirectoryEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBAppDirectoryEvent initWithData:]([ATXPBAppDirectoryEvent alloc], "initWithData:", v4);

    self = -[ATXAppDirectoryEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXAppDirectoryEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  NSObject *v7;
  ATXAppDirectoryEvent *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ATXAppDirectoryEventMetadata *v16;
  void *v17;
  ATXAppDirectoryEventMetadata *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXAppDirectoryEvent initWithProto:].cold.1((uint64_t)self, v7);

    goto LABEL_10;
  }
  v5 = v4;
  if (-[ATXPBAppDirectoryEvent hasDate]((uint64_t)v5)
    && (v6 = -[ATXPBAppDirectoryEvent date]((uint64_t)v5),
        -[ATXPBAppDirectoryEvent hasEventType]((uint64_t)v5)))
  {
    v25 = -[ATXPBAppDirectoryEvent eventType]((uint64_t)v5);
    if (-[ATXPBAppDirectoryEvent hasCategoryID]((uint64_t)v5))
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[ATXPBAppDirectoryEvent categoryID]((uint64_t)v5));
    else
      v26 = 0;
    if (-[ATXPBAppDirectoryEvent hasCategoryIndex]((uint64_t)v5))
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[ATXPBAppDirectoryEvent categoryIndex]((uint64_t)v5));
    else
      v24 = 0;
    if (-[ATXPBAppDirectoryEvent hasBundleId]((_BOOL8)v5))
    {
      -[ATXPBAppDirectoryEvent bundleId]((uint64_t)v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasBundleIndex]((uint64_t)v5))
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[ATXPBAppDirectoryEvent bundleIndex]((uint64_t)v5));
    else
      v22 = 0;
    if (-[ATXPBAppDirectoryEvent hasSearchQueryLength]((uint64_t)v5))
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[ATXPBAppDirectoryEvent searchQueryLength]((uint64_t)v5));
    else
      v21 = 0;
    if (-[ATXPBAppDirectoryEvent hasSearchTab]((uint64_t)v5))
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[ATXPBAppDirectoryEvent searchTab]((uint64_t)v5));
    else
      v9 = 0;
    if (-[ATXPBAppDirectoryEvent hasBlendingCacheId]((_BOOL8)v5))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[ATXPBAppDirectoryEvent blendingCacheId]((uint64_t)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

    }
    else
    {
      v12 = 0;
    }
    -[ATXPBAppDirectoryEvent shownSuggestionIds]((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_51_0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXPBAppDirectoryEvent engagedSuggestionIds]((uint64_t)v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = [ATXAppDirectoryEventMetadata alloc];
    -[ATXPBAppDirectoryEvent metadata]((uint64_t)v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ATXAppDirectoryEventMetadata initWithProto:](v16, "initWithProto:", v17);

    self = -[ATXAppDirectoryEvent initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:", v25, v26, v24, v23, v22, v21, v6, v9, v12, v20, v15, v18);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

LABEL_33:
  return v8;
}

id __38__ATXAppDirectoryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

id __38__ATXAppDirectoryEvent_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (id)proto
{
  void *v3;
  NSNumber *categoryID;
  NSNumber *categoryIndex;
  NSString *bundleId;
  NSNumber *bundleIndex;
  NSNumber *searchQueryLength;
  NSNumber *searchTab;
  NSUUID *blendingCacheUUID;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXPBAppDirectoryEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBAppDirectoryEvent setEventType:]((uint64_t)v3, self->_eventType);
  categoryID = self->_categoryID;
  if (categoryID)
    -[ATXPBAppDirectoryEvent setCategoryID:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](categoryID, "unsignedIntegerValue"));
  categoryIndex = self->_categoryIndex;
  if (categoryIndex)
    -[ATXPBAppDirectoryEvent setCategoryIndex:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](categoryIndex, "unsignedIntegerValue"));
  bundleId = self->_bundleId;
  if (bundleId)
    -[ATXPBAppDirectoryEvent setBundleId:]((uint64_t)v3, bundleId);
  bundleIndex = self->_bundleIndex;
  if (bundleIndex)
    -[ATXPBAppDirectoryEvent setBundleIndex:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](bundleIndex, "unsignedIntegerValue"));
  searchQueryLength = self->_searchQueryLength;
  if (searchQueryLength)
    -[ATXPBAppDirectoryEvent setSearchQueryLength:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](searchQueryLength, "unsignedIntegerValue"));
  searchTab = self->_searchTab;
  if (searchTab)
    -[ATXPBAppDirectoryEvent setSearchTab:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](searchTab, "unsignedIntegerValue"));
  blendingCacheUUID = self->_blendingCacheUUID;
  if (blendingCacheUUID)
  {
    -[NSUUID UUIDString](blendingCacheUUID, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBAppDirectoryEvent setBlendingCacheId:]((uint64_t)v3, v11);

  }
  if (self->_shownSuggestionIds)
  {
    v12 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = self->_shownSuggestionIds;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v17), "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }

    -[ATXPBAppDirectoryEvent setShownSuggestionIds:]((uint64_t)v3, v12);
  }
  if (self->_engagedSuggestionIds)
  {
    v19 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = self->_engagedSuggestionIds;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24), "UUIDString", (_QWORD)v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v22);
    }

    -[ATXPBAppDirectoryEvent setEngagedSuggestionIds:]((uint64_t)v3, v19);
  }
  -[ATXAppDirectoryEventMetadata proto](self->_metadata, "proto", (_QWORD)v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBAppDirectoryEvent setMetadata:]((uint64_t)v3, v26);

  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXAppDirectoryEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXAppDirectoryEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXAppDirectoryEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXAppDirectoryEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXAppDirectoryEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  v4 = -[NSNumber hash](self->_categoryID, "hash") - v3 + 32 * v3;
  v5 = -[NSNumber hash](self->_categoryIndex, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_bundleId, "hash") - v5 + 32 * v5;
  v7 = -[NSNumber hash](self->_bundleIndex, "hash") - v6 + 32 * v6;
  v8 = -[NSNumber hash](self->_searchQueryLength, "hash") - v7 + 32 * v7;
  v9 = -[NSNumber hash](self->_searchTab, "hash") - v8 + 32 * v8;
  v10 = -[NSUUID hash](self->_blendingCacheUUID, "hash") - v9 + 32 * v9;
  v11 = -[NSArray hash](self->_shownSuggestionIds, "hash") - v10 + 32 * v10;
  v12 = -[NSArray hash](self->_engagedSuggestionIds, "hash") - v11 + 32 * v11;
  return -[ATXAppDirectoryEventMetadata hash](self->_metadata, "hash") - v12 + 32 * v12;
}

- (BOOL)isEqual:(id)a3
{
  ATXAppDirectoryEvent *v4;
  ATXAppDirectoryEvent *v5;
  BOOL v6;

  v4 = (ATXAppDirectoryEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXAppDirectoryEvent isEqualToATXAppDirectoryEvent:](self, "isEqualToATXAppDirectoryEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXAppDirectoryEvent:(id)a3
{
  id *v4;
  id *v5;
  double v6;
  NSNumber *categoryID;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;
  char v11;
  NSNumber *categoryIndex;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  char v16;
  NSString *bundleId;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSNumber *bundleIndex;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  char v26;
  NSNumber *searchQueryLength;
  NSNumber *v28;
  NSNumber *v29;
  NSNumber *v30;
  char v31;
  NSNumber *searchTab;
  NSNumber *v33;
  NSNumber *v34;
  NSNumber *v35;
  char v36;
  NSUUID *blendingCacheUUID;
  NSUUID *v38;
  NSUUID *v39;
  NSUUID *v40;
  char v41;
  NSArray *shownSuggestionIds;
  NSArray *v43;
  NSArray *v44;
  NSArray *v45;
  char v46;
  NSArray *engagedSuggestionIds;
  NSArray *v48;
  NSArray *v49;
  NSArray *v50;
  char v51;
  char v52;
  ATXAppDirectoryEventMetadata *v54;
  ATXAppDirectoryEventMetadata *v55;

  v4 = (id *)a3;
  v5 = v4;
  v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16 || (id)self->_eventType != v4[2])
    goto LABEL_39;
  categoryID = self->_categoryID;
  v8 = (NSNumber *)v4[3];
  if (categoryID == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = categoryID;
    v11 = -[NSNumber isEqual:](v10, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_39;
  }
  categoryIndex = self->_categoryIndex;
  v13 = (NSNumber *)v5[4];
  if (categoryIndex == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = categoryIndex;
    v16 = -[NSNumber isEqual:](v15, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_39;
  }
  bundleId = self->_bundleId;
  v18 = (NSString *)v5[5];
  if (bundleId == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = bundleId;
    v21 = -[NSString isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_39;
  }
  bundleIndex = self->_bundleIndex;
  v23 = (NSNumber *)v5[6];
  if (bundleIndex == v23)
  {

  }
  else
  {
    v24 = v23;
    v25 = bundleIndex;
    v26 = -[NSNumber isEqual:](v25, "isEqual:", v24);

    if ((v26 & 1) == 0)
      goto LABEL_39;
  }
  searchQueryLength = self->_searchQueryLength;
  v28 = (NSNumber *)v5[7];
  if (searchQueryLength == v28)
  {

  }
  else
  {
    v29 = v28;
    v30 = searchQueryLength;
    v31 = -[NSNumber isEqual:](v30, "isEqual:", v29);

    if ((v31 & 1) == 0)
      goto LABEL_39;
  }
  searchTab = self->_searchTab;
  v33 = (NSNumber *)v5[8];
  if (searchTab == v33)
  {

  }
  else
  {
    v34 = v33;
    v35 = searchTab;
    v36 = -[NSNumber isEqual:](v35, "isEqual:", v34);

    if ((v36 & 1) == 0)
      goto LABEL_39;
  }
  blendingCacheUUID = self->_blendingCacheUUID;
  v38 = (NSUUID *)v5[9];
  if (blendingCacheUUID == v38)
  {

  }
  else
  {
    v39 = v38;
    v40 = blendingCacheUUID;
    v41 = -[NSUUID isEqual:](v40, "isEqual:", v39);

    if ((v41 & 1) == 0)
      goto LABEL_39;
  }
  shownSuggestionIds = self->_shownSuggestionIds;
  v43 = (NSArray *)v5[10];
  if (shownSuggestionIds == v43)
  {

  }
  else
  {
    v44 = v43;
    v45 = shownSuggestionIds;
    v46 = -[NSArray isEqual:](v45, "isEqual:", v44);

    if ((v46 & 1) == 0)
      goto LABEL_39;
  }
  engagedSuggestionIds = self->_engagedSuggestionIds;
  v48 = (NSArray *)v5[11];
  if (engagedSuggestionIds == v48)
  {

  }
  else
  {
    v49 = v48;
    v50 = engagedSuggestionIds;
    v51 = -[NSArray isEqual:](v50, "isEqual:", v49);

    if ((v51 & 1) == 0)
    {
LABEL_39:
      v52 = 0;
      goto LABEL_40;
    }
  }
  v54 = self->_metadata;
  v55 = v54;
  if (v54 == v5[12])
    v52 = 1;
  else
    v52 = -[ATXAppDirectoryEventMetadata isEqual:](v54, "isEqual:");

LABEL_40:
  return v52;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSNumber)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_storeStrong((id *)&self->_categoryID, a3);
}

- (NSNumber)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIndex, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSNumber)bundleIndex
{
  return self->_bundleIndex;
}

- (void)setBundleIndex:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIndex, a3);
}

- (NSNumber)searchQueryLength
{
  return self->_searchQueryLength;
}

- (void)setSearchQueryLength:(id)a3
{
  objc_storeStrong((id *)&self->_searchQueryLength, a3);
}

- (NSNumber)searchTab
{
  return self->_searchTab;
}

- (void)setSearchTab:(id)a3
{
  objc_storeStrong((id *)&self->_searchTab, a3);
}

- (NSUUID)blendingCacheUUID
{
  return self->_blendingCacheUUID;
}

- (void)setBlendingCacheUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheUUID, a3);
}

- (NSArray)shownSuggestionIds
{
  return self->_shownSuggestionIds;
}

- (void)setShownSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_shownSuggestionIds, a3);
}

- (NSArray)engagedSuggestionIds
{
  return self->_engagedSuggestionIds;
}

- (void)setEngagedSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_engagedSuggestionIds, a3);
}

- (ATXAppDirectoryEventMetadata)metadata
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
  objc_storeStrong((id *)&self->_engagedSuggestionIds, 0);
  objc_storeStrong((id *)&self->_shownSuggestionIds, 0);
  objc_storeStrong((id *)&self->_blendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_searchTab, 0);
  objc_storeStrong((id *)&self->_searchQueryLength, 0);
  objc_storeStrong((id *)&self->_bundleIndex, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_categoryIndex, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
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
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAppDirectoryEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
