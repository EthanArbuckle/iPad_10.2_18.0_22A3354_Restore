@implementation CNAutocompleteQueryCacheMissLogger

- (CNAutocompleteQueryCacheMissLogger)init
{
  _CNAutocompleteQueryCacheMissOSLogging *v3;
  _CNAutocompleteQueryCacheMissAggdLogging *v4;
  void *v5;
  CNAutocompleteQueryCacheMissLogger *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_CNAutocompleteQueryCacheMissOSLogging);
  v4 = objc_alloc_init(_CNAutocompleteQueryCacheMissAggdLogging);
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAutocompleteQueryCacheMissLogger initWithLoggers:](self, "initWithLoggers:", v5);

  return v6;
}

- (CNAutocompleteQueryCacheMissLogger)initWithLoggers:(id)a3
{
  id v4;
  CNAutocompleteQueryCacheMissLogger *v5;
  uint64_t v6;
  NSArray *loggers;
  CNAutocompleteQueryCacheMissLogger *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteQueryCacheMissLogger;
  v5 = -[CNAutocompleteQueryCacheMissLogger init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    loggers = v5->_loggers;
    v5->_loggers = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNAutocompleteQueryCacheMissLogger loggers](self, "loggers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didReturnCacheFalseNegatives:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)didReturnCacheFalsePositives:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNAutocompleteQueryCacheMissLogger loggers](self, "loggers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didReturnCacheFalsePositives:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)loggers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggers, 0);
}

@end
