@implementation ATXERMEvent

- (ATXERMEvent)initWithEventDate:(id)a3 eventType:(unint64_t)a4 recordEntry:(id)a5 clientModelIds:(id)a6
{
  id v11;
  id v12;
  id v13;
  ATXERMEvent *v14;
  ATXERMEvent *v15;
  uint64_t v16;
  NSArray *clientModelIds;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXERMEvent;
  v14 = -[ATXERMEvent init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventDate, a3);
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_entry, a5);
    v16 = objc_msgSend(v13, "copy");
    clientModelIds = v15->_clientModelIds;
    v15->_clientModelIds = (NSArray *)v16;

  }
  return v15;
}

- (ATXERMEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBERMEvent *v5;
  ATXERMEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBERMEvent initWithData:]([ATXPBERMEvent alloc], "initWithData:", v4);

    self = -[ATXERMEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXERMEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ATXAction *v10;
  ATXExecutableIdentifier *v11;
  ATXERMEvent *v12;
  NSObject *p_super;
  ATXEngagementRecordEntry *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXERMEvent initWithProto:].cold.6((uint64_t)self, v5);
      v12 = 0;
      goto LABEL_23;
    }
    v5 = v4;
    if ((-[ATXPBERMEvent hasEventDate]((uint64_t)v5) & 1) != 0)
    {
      if (-[ATXPBERMEvent eventType]((uint64_t)v5))
      {
        if ((-[ATXPBERMEvent hasDateEngaged]((uint64_t)v5) & 1) != 0)
        {
          if (-[ATXPBERMEvent hasExecutable]((_BOOL8)v5))
          {
            v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", -[ATXPBERMEvent eventDate]((uint64_t)v5));
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", -[ATXPBERMEvent dateEngaged]((uint64_t)v5));
            v8 = -[ATXPBERMEvent engagementType]((uint64_t)v5);
            -[ATXPBERMEvent executable]((uint64_t)v5);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            switch(-[ATXPBERMEvent executableType]((uint64_t)v5))
            {
              case 1u:
                v10 = (ATXAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
                v11 = -[ATXExecutableIdentifier initWithString:]([ATXExecutableIdentifier alloc], "initWithString:", v10);
                goto LABEL_31;
              case 2u:
                v10 = -[ATXAction initWithProtoData:]([ATXAction alloc], "initWithProtoData:", v9);
                v11 = -[ATXExecutableIdentifier initWithAction:]([ATXExecutableIdentifier alloc], "initWithAction:", v10);
                goto LABEL_31;
              case 3u:
                v10 = (ATXAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FC70]), "initWithProtoData:", v9);
                v11 = -[ATXExecutableIdentifier initWithHeroAppPrediction:]([ATXExecutableIdentifier alloc], "initWithHeroAppPrediction:", v10);
                goto LABEL_31;
              case 4u:
                v10 = (ATXAction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81150]), "initWithProtoData:", v9);
                v11 = -[ATXExecutableIdentifier initWithInfoSuggestion:]([ATXExecutableIdentifier alloc], "initWithInfoSuggestion:", v10);
LABEL_31:
                p_super = &v11->super;

                v15 = -[ATXEngagementRecordEntry initWithExecutable:dateEngaged:engagementRecordType:]([ATXEngagementRecordEntry alloc], "initWithExecutable:dateEngaged:engagementRecordType:", p_super, v7, v8);
                v16 = (int)-[ATXPBERMEvent eventType]((uint64_t)v5);
                -[ATXPBERMEvent clientModelIds]((uint64_t)v5);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                self = -[ATXERMEvent initWithEventDate:eventType:recordEntry:clientModelIds:](self, "initWithEventDate:eventType:recordEntry:clientModelIds:", v6, v16, v15, v17);

                v12 = self;
                break;
              default:
                __atxlog_handle_default();
                p_super = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
                  -[ATXERMEvent initWithProto:].cold.2((uint64_t)v5, p_super);
                v12 = 0;
                break;
            }

            goto LABEL_22;
          }
          __atxlog_handle_default();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            -[ATXERMEvent initWithProto:].cold.3();
        }
        else
        {
          __atxlog_handle_default();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            -[ATXERMEvent initWithProto:].cold.4();
        }
      }
      else
      {
        __atxlog_handle_default();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[ATXERMEvent initWithProto:].cold.1();
      }
    }
    else
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[ATXERMEvent initWithProto:].cold.5();
    }
    v12 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  v4 = (void *)-[NSArray mutableCopy](self->_clientModelIds, "mutableCopy");
  -[ATXPBERMEvent setClientModelIds:]((uint64_t)v3, v4);

  -[ATXEngagementRecordEntry dateEngaged](self->_entry, "dateEngaged");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[ATXPBERMEvent setDateEngaged:]((uint64_t)v3, v6);

  -[ATXPBERMEvent setEngagementType:]((uint64_t)v3, -[ATXEngagementRecordEntry engagementRecordType](self->_entry, "engagementRecordType"));
  -[NSDate timeIntervalSinceReferenceDate](self->_eventDate, "timeIntervalSinceReferenceDate");
  -[ATXPBERMEvent setEventDate:]((uint64_t)v3, v7);
  -[ATXPBERMEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[ATXEngagementRecordEntry executable](self->_entry, "executable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  switch(v9)
  {
    case 0:
      -[ATXPBERMEvent setExecutableType:]((uint64_t)v3, 1);
      -[ATXEngagementRecordEntry executable](self->_entry, "executable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      v13 = (uint64_t)v3;
      v14 = 2;
      goto LABEL_7;
    case 2:
      v13 = (uint64_t)v3;
      v14 = 3;
      goto LABEL_7;
    case 3:
      v13 = (uint64_t)v3;
      v14 = 4;
      goto LABEL_7;
    case 4:
      v13 = (uint64_t)v3;
      v14 = 5;
LABEL_7:
      -[ATXPBERMEvent setExecutableType:](v13, v14);
      -[ATXEngagementRecordEntry executable](self->_entry, "executable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "encodeAsProto");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = v12;
      -[ATXPBERMEvent setExecutable:]((uint64_t)v3, v12);

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXERMEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  const __CFString *v6;

  -[ATXEngagementRecordEntry jsonDict](self->_entry, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSDate description](self->_eventDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("eventDate"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_clientModelIds, CFSTR("clientModelIds"));
  if (self->_eventType == 1)
    v6 = CFSTR("AddedEntry");
  else
    v6 = CFSTR("Unknown");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("eventType"));
  return v4;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXERMEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXERMEvent *v4;
  ATXERMEvent *v5;
  BOOL v6;

  v4 = (ATXERMEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXERMEvent isEqualToATXERMEvent:](self, "isEqualToATXERMEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXERMEvent:(id)a3
{
  id v4;
  unint64_t eventType;
  ATXEngagementRecordEntry *entry;
  void *v7;
  NSArray *clientModelIds;
  void *v9;
  BOOL v10;

  v4 = a3;
  eventType = self->_eventType;
  if (eventType == objc_msgSend(v4, "eventType"))
  {
    entry = self->_entry;
    objc_msgSend(v4, "entry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXEngagementRecordEntry isEqual:](entry, "isEqual:", v7))
    {
      clientModelIds = self->_clientModelIds;
      objc_msgSend(v4, "clientModelIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSArray isEqualToArray:](clientModelIds, "isEqualToArray:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (ATXEngagementRecordEntry)entry
{
  return self->_entry;
}

- (NSArray)clientModelIds
{
  return self->_clientModelIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelIds, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "The ERM event had an unknown event type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = (int)-[ATXPBERMEvent executableType](a1);
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "The ERM event did not have a valid executable type: %ld", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "The ERM event did not have an executable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithProto:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "The ERM event did not have an engaged date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithProto:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "The ERM event did not have an event date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithProto:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
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
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBERMEvent proto", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

@end
