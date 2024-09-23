@implementation ATXUIEvent

- (unsigned)dataVersion
{
  return 2;
}

- (unsigned)consumerSubTypeForUIStream
{
  return self->_consumerSubType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 2)
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

- (ATXUIEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBUIEvent *v5;
  ATXUIEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBUIEvent initWithData:]([ATXPBUIEvent alloc], "initWithData:", v4);

    self = -[ATXUIEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXUIEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  ATXUIEvent *v8;
  uint64_t v9;
  __objc2_class *v10;
  id v11;
  void *v12;
  NSObject *v13;
  char v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXUIEvent initWithProto:].cold.2();
      v8 = 0;
      goto LABEL_24;
    }
    v5 = v4;
    -[ATXPBUIEvent consumerSubType]((uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v7 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v6, &v15);
    v8 = 0;
    if (!v15 || (v9 = v7, !(_DWORD)v7) || (_DWORD)v7 == 48)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    if ((int)v7 <= 33)
    {
      if ((_DWORD)v7 == 9)
      {
        v10 = ATXSpotlightEvent;
        goto LABEL_21;
      }
      if ((_DWORD)v7 == 22)
      {
        v10 = ATXLockscreenEvent;
        goto LABEL_21;
      }
    }
    else
    {
      switch((_DWORD)v7)
      {
        case '"':
          v10 = ATXHomeScreenEvent;
          goto LABEL_21;
        case '#':
          v10 = ATXAppDirectoryEvent;
          goto LABEL_21;
        case '+':
          v10 = (__objc2_class *)MEMORY[0x1E0D811E8];
LABEL_21:
          v11 = [v10 alloc];
          -[ATXPBUIEvent event]((uint64_t)v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "initWithProtoData:", v12);

          self = -[ATXUIEvent initWithConsumerSubType:event:](self, "initWithConsumerSubType:event:", v9, v13);
          v8 = self;
LABEL_22:

          goto LABEL_23;
      }
    }
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[ATXUIEvent initWithProto:].cold.1((uint64_t)self, v9, v13);
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
LABEL_25:

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXUIEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUIEvent setConsumerSubType:]((uint64_t)v3, v4);

  -[ATXProactiveSuggestionUIInteractionProtocol encodeAsProto](self->_event, "encodeAsProto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUIEvent setEvent:]((uint64_t)v3, v5);

  return v3;
}

+ (id)uiEventWithHomeScreenEvent:(id)a3
{
  id v3;
  ATXUIEvent *v4;

  v3 = a3;
  v4 = -[ATXUIEvent initWithConsumerSubType:event:]([ATXUIEvent alloc], "initWithConsumerSubType:event:", 34, v3);

  return v4;
}

- (ATXUIEvent)initWithConsumerSubType:(unsigned __int8)a3 event:(id)a4
{
  unsigned int v5;
  id v7;
  ATXUIEvent *v8;
  ATXUIEvent *v9;
  NSObject *v11;
  objc_super v12;

  v5 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXUIEvent;
  v8 = -[ATXUIEvent init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_consumerSubType = v5;
    objc_storeStrong((id *)&v8->_event, a4);
  }
  if (v5 > 0x2B || ((1 << v5) & 0x80C00600200) == 0)
  {
    __atxlog_handle_feedback();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXUIEvent initWithConsumerSubType:event:].cold.1(v5);

  }
  return v9;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  return (id)-[ATXProactiveSuggestionUIInteractionProtocol sessionProcessingOptionsForSessionType:](self->_event, "sessionProcessingOptionsForSessionType:", a3);
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return (id)-[ATXProactiveSuggestionUIInteractionProtocol sessionIdentifierForSessionType:uiCacheConsumerSubType:](self->_event, "sessionIdentifierForSessionType:uiCacheConsumerSubType:", a3, a4);
}

+ (id)uiEventWithSpotlightEvent:(id)a3
{
  id v3;
  ATXUIEvent *v4;

  v3 = a3;
  v4 = -[ATXUIEvent initWithConsumerSubType:event:]([ATXUIEvent alloc], "initWithConsumerSubType:event:", 9, v3);

  return v4;
}

+ (id)uiEventWithAppDirectoryEvent:(id)a3
{
  id v3;
  ATXUIEvent *v4;

  v3 = a3;
  v4 = -[ATXUIEvent initWithConsumerSubType:event:]([ATXUIEvent alloc], "initWithConsumerSubType:event:", 35, v3);

  return v4;
}

+ (id)uiEventWithLockscreenEvent:(id)a3
{
  id v3;
  ATXUIEvent *v4;

  v3 = a3;
  v4 = -[ATXUIEvent initWithConsumerSubType:event:]([ATXUIEvent alloc], "initWithConsumerSubType:event:", 22, v3);

  return v4;
}

+ (id)uiEventWithShortcutsEditorEvent:(id)a3
{
  id v3;
  ATXUIEvent *v4;

  v3 = a3;
  v4 = -[ATXUIEvent initWithConsumerSubType:event:]([ATXUIEvent alloc], "initWithConsumerSubType:event:", 43, v3);

  return v4;
}

- (id)homeScreenEvent
{
  ATXProactiveSuggestionUIInteractionProtocol *v3;

  if (self->_consumerSubType == 34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_event;
  else
    v3 = 0;
  return v3;
}

- (id)spotlightEvent
{
  ATXProactiveSuggestionUIInteractionProtocol *v3;

  if (self->_consumerSubType == 9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_event;
  else
    v3 = 0;
  return v3;
}

- (id)appDirectoryEvent
{
  ATXProactiveSuggestionUIInteractionProtocol *v3;

  if (self->_consumerSubType == 35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_event;
  else
    v3 = 0;
  return v3;
}

- (id)lockscreenEvent
{
  ATXProactiveSuggestionUIInteractionProtocol *v3;

  if (self->_consumerSubType == 22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_event;
  else
    v3 = 0;
  return v3;
}

- (id)shortcutsEditorEvent
{
  ATXProactiveSuggestionUIInteractionProtocol *v3;

  if (self->_consumerSubType == 43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_event;
  else
    v3 = 0;
  return v3;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return (id)-[ATXProactiveSuggestionUIInteractionProtocol blendingUICacheUpdateUUIDForUICacheConsumerSubType:](self->_event, "blendingUICacheUpdateUUIDForUICacheConsumerSubType:", a3);
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  -[ATXProactiveSuggestionUIInteractionProtocol updateUIFeedbackSession:uiCacheConsumerSubType:](self->_event, "updateUIFeedbackSession:uiCacheConsumerSubType:", a3, a4);
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

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXUIEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXUIEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXUIEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXUIEvent initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonDict
{
  char isKindOfClass;
  ATXProactiveSuggestionUIInteractionProtocol *event;
  char v5;
  char v6;
  char v7;
  ATXProactiveSuggestionUIInteractionProtocol *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  event = self->_event;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_5;
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();
  event = self->_event;
  if ((v5 & 1) != 0
    || (objc_opt_class(), v6 = objc_opt_isKindOfClass(), event = self->_event, (v6 & 1) != 0)
    || (objc_opt_class(), v7 = objc_opt_isKindOfClass(), event = self->_event, (v7 & 1) != 0))
  {
LABEL_5:
    v8 = event;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = objc_opt_new();
      goto LABEL_7;
    }
    v8 = self->_event;
  }
  -[ATXProactiveSuggestionUIInteractionProtocol jsonDict](v8, "jsonDict");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;
  v14[0] = CFSTR("consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("event");
  v15[0] = v11;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXUIEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXUIEvent *v4;
  ATXUIEvent *v5;
  BOOL v6;

  v4 = (ATXUIEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXUIEvent isEqualToATXUIEvent:](self, "isEqualToATXUIEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXUIEvent:(id)a3
{
  _QWORD *v4;
  int consumerSubType;
  ATXProactiveSuggestionUIInteractionProtocol *v6;
  ATXProactiveSuggestionUIInteractionProtocol *v7;
  char v8;

  v4 = a3;
  consumerSubType = self->_consumerSubType;
  if (consumerSubType == objc_msgSend(v4, "consumerSubType"))
  {
    v6 = self->_event;
    v7 = v6;
    if (v6 == (ATXProactiveSuggestionUIInteractionProtocol *)v4[2])
      v8 = 1;
    else
      v8 = -[ATXProactiveSuggestionUIInteractionProtocol isEqual:](v6, "isEqual:");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (ATXProactiveSuggestionUIInteractionProtocol)event
{
  return self->_event;
}

- (void)initWithConsumerSubType:(unsigned __int8)a1 event:.cold.1(unsigned __int8 a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "initializing ATXUIEvent with invalid consumerSubType: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:(NSObject *)a3 .cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_FAULT, "%@: in initWithProto, unhandled consumerSubType of: %@", (uint8_t *)&v8, 0x16u);

}

- (void)initWithProto:.cold.2()
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
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: tried to initialize with a non-ATXPBUIEvent proto", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
