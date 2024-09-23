@implementation ATXLockscreenEvent

- (ATXLockscreenEvent)initWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  ATXLockscreenEvent *v12;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  v12 = -[ATXLockscreenEvent initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:](self, "initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:", v7, v11, v10);

  return v12;
}

- (ATXLockscreenEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  id v11;
  id v12;
  ATXLockscreenEvent *v13;
  ATXLockscreenEvent *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ATXLockscreenEvent;
  v13 = -[ATXLockscreenEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_absoluteDate = a3;
    v13->_eventType = a4;
    objc_storeStrong((id *)&v13->_blendingCacheId, a5);
    objc_storeStrong((id *)&v14->_suggestionIds, a6);
  }

  return v14;
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
  return 22;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheId;
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return CFSTR("lockscreen");
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  int v3;

  v3 = self->_eventType - 2;
  if (v3 > 2)
    return &unk_1E4DC2858;
  else
    return (id)qword_1E4D5A378[v3];
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  id v5;
  int eventType;
  NSArray *v7;
  NSArray *v8;
  NSArray *suggestionIds;
  id v10;

  v5 = a3;
  eventType = self->_eventType;
  v10 = v5;
  switch(eventType)
  {
    case 3:
      suggestionIds = self->_suggestionIds;
      v8 = 0;
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    case 2:
      v8 = self->_suggestionIds;
      suggestionIds = 0;
      goto LABEL_7;
    case 1:
      v7 = self->_suggestionIds;
      v8 = 0;
      suggestionIds = 0;
LABEL_8:
      objc_msgSend(v5, "updateEngagedUUIDs:rejectedUUIDs:shownUUIDs:", v8, suggestionIds, v7);
      v5 = v10;
      break;
  }
  objc_msgSend(v5, "updateConsumerSubTypeIfUnset:", 22);
  objc_msgSend(v10, "updateBlendingUICacheUpdateUUIDIfUnset:", self->_blendingCacheId);

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
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[NSArray _pas_mappedArrayWithTransform:](self->_suggestionIds, "_pas_mappedArrayWithTransform:", &__block_literal_global_49);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("date");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXLockscreenEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = CFSTR("eventType");
  v7 = self->_eventType - 1;
  if (v7 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E4D5A390[v7];
  }
  v16[1] = v8;
  v15[2] = CFSTR("blendingCacheId");
  -[NSUUID UUIDString](self->_blendingCacheId, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("nil");
  if (v9)
    v12 = (const __CFString *)v9;
  else
    v12 = CFSTR("nil");
  v15[3] = CFSTR("suggestionIds");
  if (v3)
    v11 = v3;
  v16[2] = v12;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __30__ATXLockscreenEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXLockscreenEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXLockscreenEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ATXLockscreenEvent *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXLockscreenEvent initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_10;
  }
  v5 = v4;
  if (-[ATXPBLockscreenEvent hasDate]((uint64_t)v5)
    && (v6 = -[ATXPBLockscreenEvent date]((uint64_t)v5), -[ATXPBLockscreenEvent hasEventType]((uint64_t)v5)))
  {
    v7 = -[ATXPBLockscreenEvent eventType]((uint64_t)v5);
    if (-[ATXPBLockscreenEvent hasBlendingCacheId]((_BOOL8)v5))
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[ATXPBLockscreenEvent blendingCacheId]((uint64_t)v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    }
    else
    {
      v10 = 0;
    }
    -[ATXPBLockscreenEvent suggestionIds]((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[ATXLockscreenEvent initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:](self, "initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:", v7, v10, v14, v6);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

LABEL_15:
  return v12;
}

id __36__ATXLockscreenEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (ATXLockscreenEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBLockscreenEvent *v5;
  ATXLockscreenEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBLockscreenEvent initWithData:]([ATXPBLockscreenEvent alloc], "initWithData:", v4);

    self = -[ATXLockscreenEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  NSUUID *blendingCacheId;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXPBLockscreenEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBLockscreenEvent setEventType:]((uint64_t)v3, self->_eventType);
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
  {
    -[NSUUID UUIDString](blendingCacheId, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBLockscreenEvent setBlendingCacheId:]((uint64_t)v3, v5);

  }
  if (self->_suggestionIds)
  {
    v6 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_suggestionIds;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "UUIDString", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[ATXPBLockscreenEvent setSuggestionIds:]((uint64_t)v3, v6);
  }
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
  -[ATXLockscreenEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXLockscreenEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXLockscreenEvent *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("protobufData"), v4, 1, CFSTR("com.apple.duetexpertd.ATXLockscreenEvent"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    self = -[ATXLockscreenEvent initWithProtoData:](self, "initWithProtoData:", v8);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ATXLockscreenEvent *v4;
  ATXLockscreenEvent *v5;
  BOOL v6;

  v4 = (ATXLockscreenEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXLockscreenEvent isEqualToATXLockscreenEvent:](self, "isEqualToATXLockscreenEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXLockscreenEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  double v6;
  NSUUID *blendingCacheId;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;
  char v11;
  char v12;
  NSArray *v14;
  NSArray *v15;

  v4 = a3;
  v5 = v4;
  v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0)
    v6 = -v6;
  if (v6 > 2.22044605e-16 || self->_eventType != *((_DWORD *)v4 + 4))
    goto LABEL_7;
  blendingCacheId = self->_blendingCacheId;
  v8 = (NSUUID *)*((id *)v4 + 3);
  if (blendingCacheId == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = blendingCacheId;
    v11 = -[NSUUID isEqual:](v10, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_7:
      v12 = 0;
      goto LABEL_8;
    }
  }
  v14 = self->_suggestionIds;
  v15 = v14;
  if (v14 == (NSArray *)v5[4])
    v12 = 1;
  else
    v12 = -[NSArray isEqual:](v14, "isEqual:");

LABEL_8:
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  v4 = -[NSUUID hash](self->_blendingCacheId, "hash") - v3 + 32 * v3;
  return -[NSArray hash](self->_suggestionIds, "hash") - v4 + 32 * v4;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (NSUUID)blendingCacheId
{
  return self->_blendingCacheId;
}

- (void)setBlendingCacheId:(id)a3
{
  objc_storeStrong((id *)&self->_blendingCacheId, a3);
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
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
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBLockscreenEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
