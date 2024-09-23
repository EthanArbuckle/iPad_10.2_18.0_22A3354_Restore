@implementation CPAnalyticsLogEventMatcher

- (CPAnalyticsLogEventMatcher)init
{
  abort();
}

- (CPAnalyticsLogEventMatcher)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  CPAnalyticsLogEventMatcher *v18;
  CPAnalyticsLogEventMatcher *v19;
  CPAnalyticsLogEventMatcher *v20;
  uint64_t v21;
  NSString *eventTypeLabel;
  uint64_t v23;
  NSArray *eventPropertiesToLog;
  uint64_t v25;
  NSArray *eventPublicPropertiesToLog;
  NSObject *v27;
  NSObject *v28;
  NSObject *v30;
  NSObject *v31;
  NSObject *obj;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldLogEventName"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      CPAnalyticsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v4;
        _os_log_error_impl(&dword_20AB22000, v7, OS_LOG_TYPE_ERROR, "Malformed shouldLogEventName in log event matcher configuration %@", buf, 0xCu);
      }
      v18 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventPropertiesToLog"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        CPAnalyticsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v4;
          _os_log_error_impl(&dword_20AB22000, v13, OS_LOG_TYPE_ERROR, "Malformed eventPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
        }
        v18 = 0;
      }
      else
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v31 = v7;
        v8 = v7;
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v39 != v11)
                objc_enumerationMutation(v8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                CPAnalyticsLog();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v4;
                  _os_log_error_impl(&dword_20AB22000, v27, OS_LOG_TYPE_ERROR, "Malformed eventPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
                }

                v18 = 0;
                v13 = v8;
                v7 = v31;
                goto LABEL_50;
              }
            }
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
            if (v10)
              continue;
            break;
          }
        }

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventPublicPropertiesToLog"));
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          CPAnalyticsLog();
          obj = objc_claimAutoreleasedReturnValue();
          v7 = v31;
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v4;
            _os_log_error_impl(&dword_20AB22000, obj, OS_LOG_TYPE_ERROR, "Malformed eventPublicPropertiesToLog in log event matcher configuration %@", buf, 0xCu);
          }
          v18 = 0;
        }
        else
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v30 = v13;
          obj = v13;
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v35;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v35 != v16)
                  objc_enumerationMutation(obj);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  CPAnalyticsLog();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v45 = v4;
                    _os_log_error_impl(&dword_20AB22000, v28, OS_LOG_TYPE_ERROR, "Malformed eventPublicPropertyToLog in log event matcher configuration %@", buf, 0xCu);
                  }

                  v18 = 0;
                  goto LABEL_44;
                }
              }
              v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v15)
                continue;
              break;
            }
          }

          +[CPAnalyticsEventMatcher eventMatcherWithConfiguration:](CPAnalyticsEventMatcher, "eventMatcherWithConfiguration:", v4);
          v18 = (CPAnalyticsLogEventMatcher *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v33.receiver = self;
            v33.super_class = (Class)CPAnalyticsLogEventMatcher;
            v19 = -[CPAnalyticsLogEventMatcher init](&v33, sel_init);
            v20 = v19;
            v7 = v31;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_eventMatcher, v18);
              v21 = objc_msgSend(v5, "copy");
              eventTypeLabel = v20->_eventTypeLabel;
              v20->_eventTypeLabel = (NSString *)v21;

              v20->_shouldLogEventName = -[NSObject BOOLValue](v6, "BOOLValue");
              v23 = -[NSObject copy](v8, "copy");
              eventPropertiesToLog = v20->_eventPropertiesToLog;
              v20->_eventPropertiesToLog = (NSArray *)v23;

              v25 = -[NSObject copy](obj, "copy");
              eventPublicPropertiesToLog = v20->_eventPublicPropertiesToLog;
              v20->_eventPublicPropertiesToLog = (NSArray *)v25;

            }
            self = v20;
            obj = &v18->super.super;
            v18 = self;
          }
          else
          {
            obj = 0;
LABEL_44:
            v7 = v31;
          }
          v13 = v30;
        }

      }
LABEL_50:

    }
  }
  else
  {
    CPAnalyticsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v4;
      _os_log_error_impl(&dword_20AB22000, v6, OS_LOG_TYPE_ERROR, "Malformed label in log event matcher configuration %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)doesMatch:(id)a3
{
  return -[CPAnalyticsEventMatcher doesMatch:](self->_eventMatcher, "doesMatch:", a3);
}

- (NSString)eventTypeLabel
{
  return self->_eventTypeLabel;
}

- (BOOL)shouldLogEventName
{
  return self->_shouldLogEventName;
}

- (NSArray)eventPropertiesToLog
{
  return self->_eventPropertiesToLog;
}

- (NSArray)eventPublicPropertiesToLog
{
  return self->_eventPublicPropertiesToLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPublicPropertiesToLog, 0);
  objc_storeStrong((id *)&self->_eventPropertiesToLog, 0);
  objc_storeStrong((id *)&self->_eventTypeLabel, 0);
  objc_storeStrong((id *)&self->_eventMatcher, 0);
}

@end
