@implementation ATXSpotlightAction

- (ATXSpotlightAction)initWithTopic:(id)a3 criteria:(id)a4 actionDescription:(id)a5 actionIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXSpotlightAction *v15;
  ATXSpotlightAction *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXSpotlightAction;
  v15 = -[ATXSpotlightAction init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topic, a3);
    objc_storeStrong((id *)&v16->_criteria, a4);
    objc_storeStrong((id *)&v16->_actionDescription, a5);
    objc_storeStrong((id *)&v16->_actionIdentifier, a6);
  }

  return v16;
}

- (ATXActionCriteria)criteria
{
  ATXActionCriteria *criteria;

  criteria = self->_criteria;
  if (criteria)
    return criteria;
  else
    return (ATXActionCriteria *)(id)objc_opt_new();
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
  SFTopic *topic;
  id v5;

  topic = self->_topic;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topic, CFSTR("KEY_TOPIC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionDescription, CFSTR("KEY_ACTION_DESCRIPTION"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionIdentifier, CFSTR("KEY_ACTION_IDENTIFIER"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteria, CFSTR("KEY_ACTION_CRITERIA"));

}

- (ATXSpotlightAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXSpotlightAction *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("KEY_TOPIC"), v4, 1, CFSTR("com.apple.duetexpertd.ATXSpotlightAction"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (!v9 && v8)
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_default();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("KEY_ACTION_DESCRIPTION"), v4, 1, CFSTR("com.apple.duetexpertd.ATXSpotlightAction"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!v15 && v14)
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_default();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("KEY_ACTION_IDENTIFIER"), v4, 1, CFSTR("com.apple.duetexpertd.ATXSpotlightAction"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      if (!v20 && v19)
      {
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_default();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("KEY_ACTION_CRITERIA"), v4, 0, CFSTR("com.apple.duetexpertd.ATXSpotlightAction"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          self = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v8, v24, v14, v19);
          v10 = self;
        }

      }
    }

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[SFTopic identifier](self->_topic, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[NSString hash](self->_actionIdentifier, "hash") - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXSpotlightAction *v4;
  ATXSpotlightAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  NSString *v11;
  NSString *v12;

  v4 = (ATXSpotlightAction *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (-[ATXSpotlightAction isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFTopic identifier](self->_topic, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTopic identifier](v5->_topic, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
        {
          v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v11 = self->_actionIdentifier;
      v12 = v11;
      if (v11 == v5->_actionIdentifier)
        v10 = 1;
      else
        v10 = -[NSString isEqual:](v11, "isEqual:");

      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (ATXSpotlightAction)initWithSearchString:(id)a3
{
  void *v4;
  ATXSpotlightAction *v5;

  objc_msgSend(MEMORY[0x1E0DA9B98], "localTopicWithTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v4, 0, CFSTR("Search-String"), CFSTR("SP-Search-String"));

  return v5;
}

- (ATXSpotlightAction)initWithContactName:(id)a3 contactIdentifier:(id)a4 subtitle:(id)a5 criteria:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  ATXSpotlightAction *v16;

  v10 = a3;
  v11 = (void *)MEMORY[0x1E0DA9B98];
  v12 = a6;
  objc_msgSend(v11, "localTopicWithContactName:contactIdentifier:detailText:", v10, a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v13, v12, v14, v15);

  return v16;
}

- (ATXSpotlightAction)initWithContactName:(id)a3 contactEmail:(id)a4 subtitle:(id)a5 criteria:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ATXSpotlightAction *v19;
  ATXSpotlightAction *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0DA9B98];
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localTopicWithContactName:emails:phones:detailText:", v10, v15, 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v10;
    objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v16, v13, v17, v18);

    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ATXSpotlightAction)initWithFlightCode:(id)a3 date:(id)a4 criteria:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  ATXSpotlightAction *v18;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D8C3C8];
  v11 = a5;
  v12 = [v10 alloc];
  v13 = v12;
  if (v9)
  {
    v14 = (void *)objc_msgSend(v12, "initWithQuery:date:", v8, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "initWithQuery:date:", v8, v15);

  }
  v16 = v8;
  objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v14, v11, v16, v17);

  return v18;
}

- (ATXSpotlightAction)initWithWeatherLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 criteria:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  ATXSpotlightAction *v16;
  ATXSpotlightAction *v17;
  NSObject *v18;

  v10 = a3;
  v11 = a6;
  if (a4 == 0.0 || a5 == 0.0)
  {
    __atxlog_handle_default();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXSpotlightAction initWithWeatherLocation:latitude:longitude:criteria:].cold.1(v18, a4, a5);

    v17 = 0;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D8C478]);
    objc_msgSend(v12, "setLat:", a4);
    objc_msgSend(v12, "setLng:", a5);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C860]), "initWithQuery:location:", v10, v12);
    v14 = v10;
    objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v13, v11, v14, v15);

    self = v16;
    v17 = self;
  }

  return v17;
}

- (ATXSpotlightAction)initWithWeatherLatitude:(double)a3 longitude:(double)a4 criteria:(id)a5
{
  return -[ATXSpotlightAction initWithWeatherLocation:latitude:longitude:criteria:](self, "initWithWeatherLocation:latitude:longitude:criteria:", CFSTR("lat_long"), a5, a3, a4);
}

- (ATXSpotlightAction)initWithMediaName:(id)a3 identifier:(id)a4 criteria:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  ATXSpotlightAction *v15;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0D8C5E8];
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithType:query:identifier:", 1, v8, v11);

  v13 = v8;
  objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v12, v10, v13, v14);

  return v15;
}

- (ATXSpotlightAction)initWithPOIName:(id)a3 muid:(id)a4 criteria:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  ATXSpotlightAction *v17;

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0D8C5E8];
  v10 = a5;
  v11 = a4;
  v12 = [v9 alloc];
  objc_msgSend(v11, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v12, "initWithType:query:identifier:", 6, v8, v13);
  v15 = v8;
  objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v14, v10, v15, v16);

  return v17;
}

- (ATXSpotlightAction)initWithSportsTeamName:(id)a3 qid:(id)a4 criteria:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  ATXSpotlightAction *v16;

  v8 = (objc_class *)MEMORY[0x1E0D8C730];
  v9 = a5;
  v10 = a4;
  v11 = (__CFString *)a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithQuery:requestedEntityType:identifier:", CFSTR("team-qid"), CFSTR("Team"), v10);

  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("team-qid");
  v14 = v13;
  objc_msgSend((id)objc_opt_class(), "actionIdentifierFromTopic:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v12, v9, v14, v15);

  return v16;
}

- (ATXSpotlightAction)initWithEntityName:(id)a3 qid:(id)a4 criteria:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  ATXSpotlightAction *v14;

  v8 = (objc_class *)MEMORY[0x1E0D8C5E8];
  v9 = a5;
  v10 = a4;
  v11 = (__CFString *)a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithType:query:identifier:", 2, CFSTR("entity-qid"), v10);

  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("entity-qid");
  v14 = -[ATXSpotlightAction initWithTopic:criteria:actionDescription:actionIdentifier:](self, "initWithTopic:criteria:actionDescription:actionIdentifier:", v12, v9, v13, CFSTR("SP-Entity-QID"));

  return v14;
}

+ (id)actionIdentifierFromTopic:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "spotlightActionTypeFromTopic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "instanceIdentifierFromTopic:", v4);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%lu"), v5, v6);
  return v7;
}

+ (unint64_t)instanceIdentifierFromTopic:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

+ (id)spotlightActionTypeFromTopic:(id)a3
{
  id v3;
  const __CFString *v4;
  NSObject *v5;
  NSObject *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("SP-Contact");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      v4 = CFSTR("SP-Media-AdamId");
      switch(-[NSObject queryType](v5, "queryType"))
      {
        case 0u:
        case 2u:
        case 7u:
        case 8u:
          __atxlog_handle_default();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            +[ATXSpotlightAction spotlightActionTypeFromTopic:].cold.2(v5);
          goto LABEL_11;
        case 1u:
          goto LABEL_13;
        case 3u:
          v4 = CFSTR("SP-Sports-Team-QID");
          goto LABEL_13;
        case 4u:
          v4 = CFSTR("SP-Weather");
          goto LABEL_13;
        case 5u:
          v4 = CFSTR("SP-Flight");
          goto LABEL_13;
        case 6u:
          v4 = CFSTR("SP-POI-Muid");
          goto LABEL_13;
        default:
          __atxlog_handle_default();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            +[ATXSpotlightAction spotlightActionTypeFromTopic:].cold.1(v5);
LABEL_11:

          goto LABEL_12;
      }
    }
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ATXSpotlightAction spotlightActionTypeFromTopic:].cold.3((uint64_t)v3, v5);
LABEL_12:
    v4 = 0;
LABEL_13:

  }
  return (id)v4;
}

+ (id)_searchSuggestionResultWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
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
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D8C6A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setText:", v4);
  objc_msgSend(v5, "setTitle:", v6);
  objc_msgSend(v5, "setCompletion:", v4);
  objc_msgSend(v5, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
  objc_msgSend(v5, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
  objc_msgSend(v5, "setIdentifier:", v4);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSymbolName:", CFSTR("magnifyingglass.circle.fill"));
  objc_msgSend(v7, "setIsTemplate:", 1);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "resultBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBundleIdentifier:", v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSuggestionText:", v11);

  objc_msgSend(v10, "suggestionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaxLines:", 1);

  objc_msgSend(v10, "setSuggestionType:", 0);
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPunchoutOptions:", v13);

  objc_msgSend(v10, "setThumbnail:", v7);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setSearchString:", v4);

  objc_msgSend(v14, "setQuerySource:", 1);
  objc_msgSend(v10, "setCommand:", v14);
  v15 = (void *)objc_opt_new();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCardSections:", v16);

  objc_msgSend(v5, "setInlineCard:", v15);
  return v5;
}

+ (id)_contactSuggestionResultWithId:(id)a3 title:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D8C6A8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setText:", v6);
  objc_msgSend(v8, "setTitle:", v9);
  objc_msgSend(v8, "setCompletion:", v6);
  objc_msgSend(v8, "setResultBundleId:", CFSTR("com.apple.searchd.suggestion"));
  objc_msgSend(v8, "setSectionBundleIdentifier:", CFSTR("com.apple.searchd.recent.suggestions"));
  objc_msgSend(v8, "setIdentifier:", v7);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "resultBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBundleIdentifier:", v11);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setSymbolName:", CFSTR("person.crop.circle"));
  objc_msgSend(v12, "setIsTemplate:", 1);
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setEntityType:", 2);
  objc_msgSend(v13, "setEntityIdentifier:", v7);

  objc_msgSend(v13, "setTokenString:", v6);
  objc_msgSend(v13, "setSymbolImage:", v12);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setCommand:", v13);
  v15 = (void *)objc_opt_new();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCardSections:", v16);

  objc_msgSend(v8, "setInlineCard:", v15);
  return v8;
}

- (SFTopic)topic
{
  return self->_topic;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
}

- (void)initWithWeatherLocation:(double)a3 latitude:longitude:criteria:.cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXSpotlightAction Weather: received 0 lat or long. %f, %f", (uint8_t *)&v3, 0x16u);
}

+ (void)spotlightActionTypeFromTopic:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "queryType");
  OUTLINED_FUNCTION_0_14(&dword_1A49EF000, v1, v2, "spotlightActionTypeFromTopic: new type %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_6();
}

+ (void)spotlightActionTypeFromTopic:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "queryType");
  OUTLINED_FUNCTION_0_14(&dword_1A49EF000, v1, v2, "spotlightActionTypeFromTopic: unsupported type %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_6();
}

+ (void)spotlightActionTypeFromTopic:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
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
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "spotlightActionTypeFromTopic: not a local topic or query topic: %@", (uint8_t *)&v5, 0xCu);

}

@end
