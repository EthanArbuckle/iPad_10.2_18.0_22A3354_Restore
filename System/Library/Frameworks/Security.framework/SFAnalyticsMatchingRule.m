@implementation SFAnalyticsMatchingRule

- (SFAnalyticsMatchingRule)initWithSFARule:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  SFAnalyticsMatchingRule *v8;
  void *v9;
  void *v10;
  void *v11;
  SFAnalyticsMatchingRule *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAnalyticsMatchingRule;
  v8 = -[SFAnalyticsMatchingRule init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "eventType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule setEventName:](v8, "setEventName:", v9);

    -[SFAnalyticsMatchingRule setRule:](v8, "setRule:", v6);
    -[SFAnalyticsMatchingRule lastMatchTimeKey](v8, "lastMatchTimeKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "datePropertyForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule setLastMatch:](v8, "setLastMatch:", v11);

    v12 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SFAnalyticsMatchingRule eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsMatchingRule lastMatch](self, "lastMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SFAnalyticsMatchingRule: %@ match: %@ %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)valueMatch:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  char v8;
  BOOL v9;
  id v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t j;
  id obj;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_msgSend(v6, "isEqual:", v7);
LABEL_4:
    v9 = v8;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[SFAnalyticsMatchingRule isSubsetMatch:target:](self, "isSubsetMatch:target:", v6, v7);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    v23 = v7;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v11;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = v23;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (!v15)
          {

LABEL_28:
            v9 = 0;
            goto LABEL_29;
          }
          v16 = v15;
          v17 = 0;
          v18 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v14);
              v17 |= -[SFAnalyticsMatchingRule valueMatch:target:](self, "valueMatch:target:", v13, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v16);

          if ((v17 & 1) == 0)
            goto LABEL_28;
        }
        v9 = 1;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v9 = 1;
    }
LABEL_29:

  }
  else
  {
    v9 = 0;
  }
LABEL_5:

  return v9;
}

- (BOOL)isSubsetMatch:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 <= objc_msgSend(v7, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v15, (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[SFAnalyticsMatchingRule valueMatch:target:](self, "valueMatch:target:", v17, v16);

          if (!v18)
          {
            v9 = 0;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastMatchTimeKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SFAnalyticsMatchingRule rule](self, "rule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SFA-LastMatchRule-%@-"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cachedMatchDictionary
{
  SFAnalyticsMatchingRule *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[SFAnalyticsMatchingRule matchingDictionary](v2, "matchingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  v5 = (void *)MEMORY[0x1E0CB38B0];
  -[SFAnalyticsMatchingRule rule](v2, "rule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "match");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "propertyListWithData:options:format:error:", v7, 0, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (!v8 || v9)
  {
    getOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      objc_sync_exit(v2);
      v4 = 0;
      return v4;
    }
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    v11 = "SFAnalyticsMatchingRule match dictionary wrong: %@";
    v12 = v10;
    v13 = 12;
LABEL_13:
    _os_log_error_impl(&dword_18A900000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v11 = "SFAnalyticsMatchingRule match not dictionary";
    v12 = v10;
    v13 = 2;
    goto LABEL_13;
  }
  -[SFAnalyticsMatchingRule setMatchingDictionary:](v2, "setMatchingDictionary:", v8);

LABEL_2:
  objc_sync_exit(v2);

  -[SFAnalyticsMatchingRule matchingDictionary](v2, "matchingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (BOOL)matchAttributes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;

  v4 = a3;
  -[SFAnalyticsMatchingRule rule](self, "rule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMatch");

  if (!v6)
    goto LABEL_4;
  -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = -[SFAnalyticsMatchingRule isSubsetMatch:target:](self, "isSubsetMatch:target:", v7, v4);

  if (v9)
LABEL_4:
    LOBYTE(v9) = 1;
LABEL_6:

  return v9;
}

- (BOOL)shouldRatelimit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[SFAnalyticsMatchingRule lastMatch](self, "lastMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_5;
  -[SFAnalyticsMatchingRule rule](self, "rule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "repeatAfterSeconds");

  v8 = 86400;
  if (v7)
    v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)-v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsMatchingRule lastMatch](self, "lastMatch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 != 1)
  {
    v15 = 1;
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule setLastMatch:](self, "setLastMatch:", v12);

    -[SFAnalyticsMatchingRule lastMatch](self, "lastMatch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsMatchingRule lastMatchTimeKey](self, "lastMatchTimeKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDateProperty:forKey:", v13, v14);

    v15 = 0;
  }

  return v15;
}

- (unsigned)doAction:(id)a3 attributes:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SFAnalyticsMatchingRule rule](self, "rule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v12, "hasTtr"))
    {
      v13 = -[SFAnalyticsMatchingRule shouldRatelimit:](self, "shouldRatelimit:", v10);
      getOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v13)
      {
        v47 = v10;
        v48 = v9;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[SFAnalyticsMatchingRule rule](self, "rule");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "eventType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v27;
          v51 = 2112;
          v52 = v28;
          _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger ttr: %@: %@", buf, 0x16u);

        }
        objc_msgSend(v12, "ttr");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject alert](v15, "alert");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject description](v15, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "radarnumber");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject componentName](v15, "componentName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject componentVersion](v15, "componentVersion");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject componentID](v15, "componentID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v48;
        objc_msgSend(v8, "tapToRadar:description:radar:componentName:componentVersion:componentID:attributes:", v29, v30, v31, v32, v33, v34, v48);

        v18 = 0;
        v10 = v47;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[SFAnalyticsMatchingRule rule](self, "rule");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "eventType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_INFO, "SFACollection ratelimit ttr: %@", buf, 0xCu);

      }
LABEL_30:
      v18 = 0;
LABEL_31:

      goto LABEL_32;
    }
    if (objc_msgSend(v12, "hasAbc"))
    {
      v19 = -[SFAnalyticsMatchingRule shouldRatelimit:](self, "shouldRatelimit:", v10);
      getOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v15 = v20;
      if (!v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[SFAnalyticsMatchingRule rule](self, "rule");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "eventType");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAnalyticsMatchingRule cachedMatchDictionary](self, "cachedMatchDictionary");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v50 = v41;
          v51 = 2112;
          v52 = v42;
          _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger abc: %@ %@", buf, 0x16u);

        }
        objc_msgSend(v12, "abc");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject domain](v15, "domain");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {

        }
        else
        {
          -[NSObject type](v15, "type");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
            goto LABEL_30;
        }
        -[NSObject type](v15, "type");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject subtype](v15, "subtype");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject domain](v15, "domain");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "autoBugCaptureWithType:subType:domain:", v21, v22, v45);

LABEL_29:
        goto LABEL_30;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_30;
      -[SFAnalyticsMatchingRule rule](self, "rule");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eventType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v22;
      v23 = "SFACollection ratelimit abc: %@";
      v24 = v15;
      v25 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v35 = objc_msgSend(v12, "hasDrop");
      getOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v36)
        {
          -[SFAnalyticsMatchingRule rule](self, "rule");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "eventType");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v50 = v38;
          _os_log_impl(&dword_18A900000, v15, OS_LOG_TYPE_DEFAULT, "SFACollection action trigger drop: %@", buf, 0xCu);

        }
        objc_msgSend(v12, "drop");
        v15 = objc_claimAutoreleasedReturnValue();
        v39 = -[NSObject excludeEvent](v15, "excludeEvent");
        if (-[NSObject excludeCount](v15, "excludeCount"))
          v18 = v39 | 2;
        else
          v18 = v39;
        goto LABEL_31;
      }
      if (!v36)
        goto LABEL_30;
      -[SFAnalyticsMatchingRule rule](self, "rule");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eventType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v22;
      v23 = "SFACollection unknown action: %@";
      v24 = v15;
      v25 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_18A900000, v24, v25, v23, buf, 0xCu);
    goto LABEL_29;
  }
  v18 = 0;
LABEL_32:

  return v18;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SECSFARule)rule
{
  return (SECSFARule *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRule:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)lastMatch
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastMatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)matchingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchingDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDictionary, 0);
  objc_storeStrong((id *)&self->_lastMatch, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
