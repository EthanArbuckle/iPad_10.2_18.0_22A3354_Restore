@implementation _ANEAnalyticsProcedure

- (_ANEAnalyticsProcedure)initWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ANEAnalyticsProcedure *v12;
  _ANEAnalyticsProcedure *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ANEAnalyticsProcedure;
  v12 = -[_ANEAnalyticsProcedure init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupInfo, a3);
    objc_storeStrong((id *)&v13->_procedureMetrics, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v24 = CFSTR("procedure_analytics");
  -[_ANEAnalyticsProcedure procedureMetrics](self, "procedureMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  v22 = CFSTR("identifier");
  -[_ANEAnalyticsProcedure identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("group"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_ANEAnalyticsProcedure groupInfo](self, "groupInfo", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("group"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "serialize");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEntriesFromDictionary:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v3;
}

- (NSArray)groupInfo
{
  return self->_groupInfo;
}

- (NSDictionary)procedureMetrics
{
  return self->_procedureMetrics;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_procedureMetrics, 0);
  objc_storeStrong((id *)&self->_groupInfo, 0);
}

+ (id)objectWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGroups:procedureMetrics:indentifier:", v8, v9, v10);

  return v11;
}

@end
