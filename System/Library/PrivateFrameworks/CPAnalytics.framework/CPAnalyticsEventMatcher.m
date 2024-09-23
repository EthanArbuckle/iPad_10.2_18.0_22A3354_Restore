@implementation CPAnalyticsEventMatcher

+ (id)eventMatcherWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CPAnalyticsCompoundEventMatcher *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count") != 1)
    goto LABEL_28;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("and"), "isEqual:", v6) & 1) != 0 || (objc_msgSend(CFSTR("all"), "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
    v8 = 1;
  }
  else if ((objc_msgSend(CFSTR("or"), "isEqual:", v6) & 1) != 0
         || (objc_msgSend(CFSTR("any"), "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
    v8 = 2;
  }
  else
  {
    if ((objc_msgSend(CFSTR("not"), "isEqual:", v6) & 1) == 0)
      goto LABEL_27;
    v7 = 1;
    v8 = 3;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7)
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v11;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_27:
LABEL_28:
    v20 = (CPAnalyticsCompoundEventMatcher *)objc_msgSend(objc_alloc((Class)a1), "initWithConfig:", v4);
    goto LABEL_29;
  }
  v22 = v8;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "eventMatcherWithConfiguration:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v12, "addObject:", v19);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v20 = -[CPAnalyticsCompoundEventMatcher initWithType:subEventMatchers:]([CPAnalyticsCompoundEventMatcher alloc], "initWithType:subEventMatchers:", v22, v12);
  if (!v20)
    goto LABEL_28;
LABEL_29:

  return v20;
}

+ (id)eventMatcherWithEventName:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc((Class)a1);
    v9 = CFSTR("key");
    v10 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithConfig:", v6);
  }
  else
  {
    CPAnalyticsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_20AB22000, v6, OS_LOG_TYPE_ERROR, "Invalid event name for event matcher: %@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)eventMatcherWithEventName:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_alloc((Class)a1);
    v12[0] = CFSTR("key");
    v12[1] = CFSTR("properties");
    v13[0] = v6;
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithConfig:", v9);
  }
  else
  {
    CPAnalyticsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_20AB22000, v9, OS_LOG_TYPE_ERROR, "Invalid event name for event matcher: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (CPAnalyticsEventMatcher)initWithConfig:(id)a3
{
  id v4;
  CPAnalyticsEventMatcher *v5;
  void *v6;
  uint64_t v7;
  NSString *eventKeyToMatch;
  void *v9;
  uint64_t v10;
  NSDictionary *eventPropertiesToMatch;
  void *v12;
  uint64_t v13;
  NSArray *conditionalChecks;
  CPAnalyticsEventMatcher *v15;

  v4 = a3;
  v5 = -[CPAnalyticsEventMatcher init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsEventMatcher _validateAndParseEventKey:](v5, "_validateAndParseEventKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    eventKeyToMatch = v5->_eventKeyToMatch;
    v5->_eventKeyToMatch = (NSString *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("properties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsEventMatcher _validateAndParseEventProperties:](v5, "_validateAndParseEventProperties:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    eventPropertiesToMatch = v5->_eventPropertiesToMatch;
    v5->_eventPropertiesToMatch = (NSDictionary *)v10;

    if (!v5->_eventKeyToMatch && !-[NSDictionary count](v5->_eventPropertiesToMatch, "count"))
    {

      v15 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conditionalChecks"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsEventMatcher _validateAndParseConditionalChecks:](v5, "_validateAndParseConditionalChecks:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    conditionalChecks = v5->_conditionalChecks;
    v5->_conditionalChecks = (NSArray *)v13;

  }
  v15 = v5;
LABEL_6:

  return v15;
}

- (BOOL)doesMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPAnalyticsEventMatcher eventKeyToMatch](self, "eventKeyToMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "name"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", v5),
        v6,
        !v7))
  {
    v26 = 0;
  }
  else
  {
    -[CPAnalyticsEventMatcher eventPropertiesToMatch](self, "eventPropertiesToMatch");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v4, "propertyForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14
            || (-[CPAnalyticsEventMatcher eventPropertiesToMatch](self, "eventPropertiesToMatch"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v15, "valueForKey:", v13),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v15,
                LODWORD(v15) = objc_msgSend(v16, "isEqual:", v14),
                v16,
                !(_DWORD)v15))
          {

            v26 = 0;
            v17 = v28;
            goto LABEL_27;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v10)
          continue;
        break;
      }
    }

    v17 = v28;
    if (v5 || objc_msgSend(v28, "count"))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[CPAnalyticsEventMatcher conditionalChecks](self, "conditionalChecks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v8);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_msgSend(v22, "property");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "propertyForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "predicate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v23) = objc_msgSend(v25, "evaluateWithObject:", v24);

            if (!(_DWORD)v23)
            {
              v26 = 0;
              goto LABEL_27;
            }
          }
          v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          v26 = 1;
          if (v19)
            continue;
          break;
        }
      }
      else
      {
        v26 = 1;
      }
LABEL_27:

    }
    else
    {
      v26 = 0;
    }

  }
  return v26;
}

- (id)_validateAndParseEventKey:(id)a3
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

- (id)_validateAndParseEventProperties:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "setObject:forKey:", v11, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_validateAndParseConditionalChecks:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CPAnalyticsConditional *v11;
  CPAnalyticsConditional *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          v11 = [CPAnalyticsConditional alloc];
          v12 = -[CPAnalyticsConditional initWithConfig:](v11, "initWithConfig:", v10, (_QWORD)v15);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v13 = (void *)objc_msgSend(v4, "copy");
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)eventKeyToMatch
{
  return self->_eventKeyToMatch;
}

- (NSDictionary)eventPropertiesToMatch
{
  return self->_eventPropertiesToMatch;
}

- (NSArray)conditionalChecks
{
  return self->_conditionalChecks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalChecks, 0);
  objc_storeStrong((id *)&self->_eventPropertiesToMatch, 0);
  objc_storeStrong((id *)&self->_eventKeyToMatch, 0);
}

@end
