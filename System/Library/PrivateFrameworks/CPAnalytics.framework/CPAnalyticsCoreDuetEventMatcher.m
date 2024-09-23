@implementation CPAnalyticsCoreDuetEventMatcher

- (CPAnalyticsCoreDuetEventMatcher)init
{
  abort();
}

- (CPAnalyticsCoreDuetEventMatcher)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  CPAnalyticsCoreDuetEventMatcher *v10;
  CPAnalyticsCoreDuetEventMatcher *v11;
  uint64_t v12;
  NSObject *subsetPropertyValue;
  void *v14;
  CPAnalyticsCoreDuetEventMatcher *v15;
  objc_super v17;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceEventMatchCriteria"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifierPropertyName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subsetPropertyName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("datasetName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CPAnalyticsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20AB22000, v9, OS_LOG_TYPE_ERROR, "Error parsing KnowledgeStore event", buf, 2u);
    }
    goto LABEL_12;
  }
  +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:](CPAnalyticsEventMatcher, "eventMatcherWithConfiguration:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v17.receiver = self;
  v17.super_class = (Class)CPAnalyticsCoreDuetEventMatcher;
  v10 = -[CPAnalyticsCoreDuetEventMatcher init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_eventMatcher, v9);
    objc_storeStrong((id *)&v11->_identifierPropertyName, v6);
    objc_storeStrong((id *)&v11->_subsetPropertyName, v7);
    objc_storeStrong((id *)&v11->_datasetName, v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subsetPropertyValue"));
    v12 = objc_claimAutoreleasedReturnValue();
    subsetPropertyValue = v11->_subsetPropertyValue;
    v11->_subsetPropertyValue = v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchNextEvent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_matchNextEvent = objc_msgSend(v14, "BOOLValue");

  }
  self = v11;
  v15 = self;
LABEL_13:

  return v15;
}

- (BOOL)doesMatch:(id)a3
{
  return -[CPAnalyticsEventMatcher doesMatch:](self->_eventMatcher, "doesMatch:", a3);
}

- (NSString)datasetName
{
  return self->_datasetName;
}

- (NSString)identifierPropertyName
{
  return self->_identifierPropertyName;
}

- (NSString)subsetPropertyName
{
  return self->_subsetPropertyName;
}

- (NSObject)subsetPropertyValue
{
  return self->_subsetPropertyValue;
}

- (BOOL)matchNextEvent
{
  return self->_matchNextEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsetPropertyValue, 0);
  objc_storeStrong((id *)&self->_subsetPropertyName, 0);
  objc_storeStrong((id *)&self->_identifierPropertyName, 0);
  objc_storeStrong((id *)&self->_datasetName, 0);
  objc_storeStrong((id *)&self->_eventMatcher, 0);
}

@end
