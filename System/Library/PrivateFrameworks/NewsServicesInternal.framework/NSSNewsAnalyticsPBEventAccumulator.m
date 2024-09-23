@implementation NSSNewsAnalyticsPBEventAccumulator

- (NSSNewsAnalyticsPBEventAccumulator)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsAnalyticsPBEventAccumulator init]";
    v9 = 2080;
    v10 = "NSSNewsAnalyticsPBEventAccumulator.m";
    v11 = 1024;
    v12 = 83;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSNewsAnalyticsPBEventAccumulator init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSNewsAnalyticsPBEventAccumulator)initWithEnvelopeDescriptor:(id)a3 sessionManager:(id)a4
{
  id v6;
  id v7;
  NSSNewsAnalyticsPBEventAccumulator *v8;
  uint64_t v9;
  NSSNewsAnalyticsEnvelopeDescriptor *envelopeDescriptor;
  uint64_t v11;
  NSMutableArray *events;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSNewsAnalyticsPBEventAccumulator initWithEnvelopeDescriptor:sessionManager:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSNewsAnalyticsPBEventAccumulator initWithEnvelopeDescriptor:sessionManager:].cold.1();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NSSNewsAnalyticsPBEventAccumulator;
  v8 = -[NSSNewsAnalyticsPBEventAccumulator init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    envelopeDescriptor = v8->_envelopeDescriptor;
    v8->_envelopeDescriptor = (NSSNewsAnalyticsEnvelopeDescriptor *)v9;

    objc_storeWeak((id *)&v8->_sessionManager, v7);
    v11 = objc_opt_new();
    events = v8->_events;
    v8->_events = (NSMutableArray *)v11;

  }
  return v8;
}

- (id)dequeueEventsIntoEnvelope
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[NSSNewsAnalyticsPBEventAccumulator events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[NSSNewsAnalyticsPBEventAccumulator sessionManager](self, "sessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSSNewsAnalyticsPBEventAccumulator events](self, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x1E0D62828], "nss_sessionBatchWithIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSession:", v7);
  objc_msgSend(v10, "setEvents:", v9);
  NSSNewsAnalyticsPBEventAccumulatorLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v26 = objc_msgSend(v12, "contentType");
    v27 = 2112;
    v28 = v7;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1D7116000, v11, OS_LOG_TYPE_DEBUG, "Preparing an envelope of contentType %d with session %@, events %@", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0D626B0], "nss_envelopeWithIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentTypeVersion:", objc_msgSend(v14, "contentTypeVersion"));

  -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentTypeMinorVersion:", objc_msgSend(v15, "contentTypeMinorVersion"));

  -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentTypePatchVersion:", objc_msgSend(v16, "contentTypePatchVersion"));

  -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentType:", objc_msgSend(v17, "contentType"));

  objc_msgSend(v10, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fc_zlibDeflate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContent:", v19);

  v20 = (void *)MEMORY[0x1E0D56B90];
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerEnvelopesAsCreated:", v21);

  -[NSSNewsAnalyticsPBEventAccumulator events](self, "events");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeAllObjects");

  return v13;
}

- (void)observeEvent:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSNewsAnalyticsPBEventAccumulator observeEvent:].cold.1();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSNewsAnalyticsPBEventAccumulator observeEvents:](self, "observeEvents:", v5);

}

- (void)observeEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSNewsAnalyticsPBEventAccumulator observeEvents:].cold.1();
  if (objc_msgSend(v4, "count"))
  {
    -[NSSNewsAnalyticsPBEventAccumulator events](self, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0D56B90];
      -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerEnvelopeCreationAnticipatedForContentType:", objc_msgSend(v8, "contentType"));

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          NSSNewsAnalyticsPBEventAccumulatorLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            -[NSSNewsAnalyticsPBEventAccumulator envelopeDescriptor](self, "envelopeDescriptor");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "contentType");
            *(_DWORD *)buf = 67109378;
            v25 = v17;
            v26 = 2112;
            v27 = v14;
            _os_log_impl(&dword_1D7116000, v15, OS_LOG_TYPE_DEBUG, "For envelope of contentType %d, processing event %@.", buf, 0x12u);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v11);
    }

    -[NSSNewsAnalyticsPBEventAccumulator events](self, "events");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v9);

    v4 = v19;
  }

}

- (NSSNewsAnalyticsEnvelopeDescriptor)envelopeDescriptor
{
  return self->_envelopeDescriptor;
}

- (NSSNewsAnalyticsSessionManager)sessionManager
{
  return (NSSNewsAnalyticsSessionManager *)objc_loadWeakRetained((id *)&self->_sessionManager);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
  objc_storeStrong((id *)&self->_envelopeDescriptor, 0);
}

- (void)initWithEnvelopeDescriptor:sessionManager:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionManager", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithEnvelopeDescriptor:sessionManager:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)observeEvent:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)observeEvents:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"events", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
