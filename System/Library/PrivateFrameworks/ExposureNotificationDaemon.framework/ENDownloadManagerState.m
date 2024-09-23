@implementation ENDownloadManagerState

- (ENDownloadManagerState)init
{
  ENDownloadManagerState *v2;
  NSDictionary *v3;
  NSDictionary *statesByURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENDownloadManagerState;
  v2 = -[ENDownloadManagerState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D88]);
    statesByURL = v2->_statesByURL;
    v2->_statesByURL = v3;

  }
  return v2;
}

- (void)setEndpoints:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  ENDownloadEndpointState *v13;
  ENDownloadEndpointState *v14;
  NSDictionary *v15;
  NSDictionary *statesByURL;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "serverBaseURL", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_statesByURL, "objectForKeyedSubscript:", v12);
        v13 = (ENDownloadEndpointState *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          -[ENDownloadEndpointState setEndpoint:](v13, "setEndpoint:", v11);
        }
        else
        {
          v14 = -[ENDownloadEndpointState initWithEndpoint:]([ENDownloadEndpointState alloc], "initWithEndpoint:", v11);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D88]), "initWithDictionary:", v5);
  statesByURL = self->_statesByURL;
  self->_statesByURL = v15;

}

- (NSArray)endpoints
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ENDownloadManagerState endpointStates](self, "endpointStates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "endpoint");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)endpointStates
{
  return -[NSDictionary allValues](self->_statesByURL, "allValues");
}

- (id)stateForServerBaseURL:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_statesByURL, "objectForKeyedSubscript:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENDownloadManagerState endpointStates](self, "endpointStates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("vers"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("endpoints"));

}

- (ENDownloadManagerState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ENDownloadManagerState *v9;
  ENDownloadManagerState *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *statesByURL;
  ENDownloadManagerState *v22;
  ENDownloadManagerState *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vers")) == 1)
  {
    v5 = (void *)MEMORY[0x1E0C99E68];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("endpoints"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[ENDownloadManagerState init](self, "init");
      v10 = v9;
      if (v9)
      {
        v24 = v9;
        v25 = v7;
        v11 = objc_alloc_init(MEMORY[0x1E0C99E00]);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v12 = v8;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v27 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v17, "endpoint");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "serverBaseURL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v19);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v14);
        }

        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D88]), "initWithDictionary:", v11);
        v10 = v24;
        statesByURL = v24->_statesByURL;
        v24->_statesByURL = (NSDictionary *)v20;

        v7 = v25;
      }
      self = v10;
      v22 = self;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statesByURL, 0);
}

@end
