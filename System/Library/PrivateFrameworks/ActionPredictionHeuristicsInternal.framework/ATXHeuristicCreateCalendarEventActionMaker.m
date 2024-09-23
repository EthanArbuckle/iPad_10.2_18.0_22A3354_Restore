@implementation ATXHeuristicCreateCalendarEventActionMaker

- (ATXHeuristicCreateCalendarEventActionMaker)initWithTitle:(id)a3 subtitle:(id)a4 event:(id)a5 suggestionsInfoUniqueKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXHeuristicCreateCalendarEventActionMaker *v15;
  ATXHeuristicCreateCalendarEventActionMaker *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  v15 = -[ATXHeuristicCreateCalendarEventActionMaker init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._title, a3);
    objc_storeStrong((id *)&v16->super._subtitle, a4);
    objc_storeStrong((id *)&v16->_event, a5);
    objc_storeStrong((id *)&v16->_suggestionsInfoUniqueKey, a6);
  }

  return v16;
}

- (id)_makeAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  -[ATXHeuristicObjectHandle obj](self->_event, "obj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      pthread_mutex_lock(&_makeAction_actionHandlerLock);
      objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createEventIntentForEvent:withSuggestionsInfoUniqueKey:", v3, self->_suggestionsInfoUniqueKey);
      v5 = objc_claimAutoreleasedReturnValue();

      pthread_mutex_unlock(&_makeAction_actionHandlerLock);
      INIntentWithTypedIntent();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = objc_alloc(MEMORY[0x1E0CF8C20]);
          v8 = (void *)objc_opt_new();
          LOBYTE(v27) = 0;
          v9 = (void *)objc_msgSend(v7, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v6, v8, CFSTR("com.apple.mobilecal"), 0, 0, 0, v27, self->super._title, self->super._subtitle);

LABEL_18:
          goto LABEL_19;
        }
        __atxlog_handle_heuristic();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Generic intent created from EKUICreateEventIntent is not an INIntent object."));
      }
      else
      {
        __atxlog_handle_heuristic();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

      }
      v9 = 0;
      goto LABEL_18;
    }
    __atxlog_handle_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.4();
  }
  else
  {
    __atxlog_handle_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicCreateCalendarEventActionMaker _makeAction].cold.1(self);
  }
  v9 = 0;
LABEL_19:

  return v9;
}

- (id)actionTypeName
{
  return CFSTR("EKUICreateEventIntent");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHeuristicCreateCalendarEventActionMaker)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicCreateCalendarEventActionMaker *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  ATXHeuristicObjectHandle *event;
  uint64_t v12;
  NSString *suggestionsInfoUniqueKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  v5 = -[ATXHeuristicActionMaker initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->super._title;
    v5->super._title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->super._subtitle;
    v5->super._subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v10 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (ATXHeuristicObjectHandle *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionsInfoUniqueKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    suggestionsInfoUniqueKey = v5->_suggestionsInfoUniqueKey;
    v5->_suggestionsInfoUniqueKey = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicCreateCalendarEventActionMaker;
  v4 = a3;
  -[ATXHeuristicActionMaker encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_event, CFSTR("event"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionsInfoUniqueKey, CFSTR("suggestionsInfoUniqueKey"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInfoUniqueKey, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)_makeAction
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0_1(&dword_1C99DF000, v2, v3, "Wrong type: expected EKEvent, got %s", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
