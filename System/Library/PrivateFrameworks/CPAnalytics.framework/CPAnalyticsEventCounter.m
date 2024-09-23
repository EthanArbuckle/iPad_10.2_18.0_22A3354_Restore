@implementation CPAnalyticsEventCounter

- (CPAnalyticsEventCounter)initWithConfig:(id)a3
{
  id v4;
  CPAnalyticsEventCounter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CPAnalyticsEventCounter *countKey;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPAnalyticsEventCounter;
  v5 = -[CPAnalyticsEventCounter init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("matchCriteria"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:](CPAnalyticsEventMatcher, "eventMatcherWithConfiguration:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPAnalyticsEventCounter _validateAndParseEventName:](CPAnalyticsEventCounter, "_validateAndParseEventName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v9, "length") && v7)
    {
      objc_storeStrong((id *)&v5->_matcher, v7);
      objc_storeStrong((id *)&v5->_name, v9);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countKey"));
      v10 = objc_claimAutoreleasedReturnValue();
      countKey = (CPAnalyticsEventCounter *)v5->_countKey;
      v5->_countKey = (NSString *)v10;
    }
    else
    {
      CPAnalyticsLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v4;
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v7;
        _os_log_error_impl(&dword_20AB22000, v12, OS_LOG_TYPE_ERROR, "Error creating event counter from config: %@, name: %@, matcher: %@", buf, 0x20u);
      }

      countKey = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (CPAnalyticsEventCounter)initWithEventName:(id)a3
{
  id v5;
  CPAnalyticsEventCounter *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[CPAnalyticsEventCounter init](self, "init");
  if (v6)
  {
    +[CPAnalyticsEventMatcher eventMatcherWithEventName:](CPAnalyticsEventMatcher, "eventMatcherWithEventName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && v7)
    {
      objc_storeStrong((id *)&v6->_matcher, v7);
      objc_storeStrong((id *)&v6->_name, a3);
    }
    else
    {
      CPAnalyticsLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412546;
        v11 = v5;
        v12 = 2112;
        v13 = v7;
        _os_log_error_impl(&dword_20AB22000, v8, OS_LOG_TYPE_ERROR, "Error creating event counter, eventName: %@, matcher: %@", (uint8_t *)&v10, 0x16u);
      }

      v6 = 0;
    }

  }
  return v6;
}

- (CPAnalyticsEventCounter)initWithName:(id)a3 matcher:(id)a4
{
  id v7;
  id v8;
  CPAnalyticsEventCounter *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = -[CPAnalyticsEventCounter init](self, "init");
  if (v9)
  {
    v10 = objc_msgSend(v7, "length");
    if (v8 && v10)
    {
      objc_storeStrong((id *)&v9->_matcher, a4);
      objc_storeStrong((id *)&v9->_name, a3);
    }
    else
    {
      CPAnalyticsLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_error_impl(&dword_20AB22000, v11, OS_LOG_TYPE_ERROR, "Error creating event counter, name: %@, matcher: %@", (uint8_t *)&v13, 0x16u);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void)countEvent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[CPAnalyticsEventCounter matcher](self, "matcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "doesMatch:", v10);

  if (v5)
  {
    -[CPAnalyticsEventCounter countKey](self, "countKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v9 = 1;
LABEL_11:
      -[CPAnalyticsEventCounter setCount:](self, "setCount:", -[CPAnalyticsEventCounter count](self, "count") + v9);

      goto LABEL_12;
    }
    objc_msgSend(v10, "propertyForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "integerValue");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 1;
        goto LABEL_10;
      }
      v8 = objc_msgSend(v7, "count");
    }
    v9 = v8;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

}

- (void)resetCount
{
  -[CPAnalyticsEventCounter setCount:](self, "setCount:", 0);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[CPAnalyticsEventCounter name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Name: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (CPAnalyticsEventMatcher)matcher
{
  return self->_matcher;
}

- (NSString)countKey
{
  return self->_countKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countKey, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)_validateAndParseEventName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
