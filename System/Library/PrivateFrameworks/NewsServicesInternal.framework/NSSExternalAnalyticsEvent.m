@implementation NSSExternalAnalyticsEvent

- (NSSExternalAnalyticsEvent)init
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
    v8 = "-[NSSExternalAnalyticsEvent init]";
    v9 = 2080;
    v10 = "NSSExternalAnalyticsEvent.m";
    v11 = 1024;
    v12 = 46;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSExternalAnalyticsEvent init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSExternalAnalyticsEvent)initWithSession:(id)a3 requestQueryParameters:(id)a4
{
  id v6;
  id v7;
  NSSExternalAnalyticsEvent *v8;
  uint64_t v9;
  NTPBSession *session;
  uint64_t v11;
  NSDictionary *requestQueryParameters;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSExternalAnalyticsEvent initWithSession:requestQueryParameters:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSExternalAnalyticsEvent initWithSession:requestQueryParameters:].cold.1();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NSSExternalAnalyticsEvent;
  v8 = -[NSSExternalAnalyticsEvent init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    session = v8->_session;
    v8->_session = (NTPBSession *)v9;

    v11 = objc_msgSend(v7, "copy");
    requestQueryParameters = v8->_requestQueryParameters;
    v8->_requestQueryParameters = (NSDictionary *)v11;

  }
  return v8;
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSExternalAnalyticsEvent;
  return -[NSSExternalAnalyticsEvent copy](&v3, sel_copy);
}

- (id)requestMetadataWithExternalAnalyticsIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSExternalAnalyticsRequestMetadata *v11;
  void *v12;
  NSSExternalAnalyticsRequestMetadata *v13;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSSExternalAnalyticsEvent requestMetadataWithExternalAnalyticsIdentifier:].cold.1();
  -[NSSExternalAnalyticsEvent requestQueryParameters](self, "requestQueryParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("udid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("articleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("pub"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = NTPBExternalAnalyticsEventTypeFromExternalEventURLQueryParameter(v9);

  v11 = [NSSExternalAnalyticsRequestMetadata alloc];
  -[NSSExternalAnalyticsEvent session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSSExternalAnalyticsRequestMetadata initWithSession:eventIdentifier:externalAnalyticsIdentifier:contentViewedIdentifier:publisherIdentifier:eventType:](v11, "initWithSession:eventIdentifier:externalAnalyticsIdentifier:contentViewedIdentifier:publisherIdentifier:eventType:", v12, v6, v4, v7, v8, v10);

  return v13;
}

- (NSDictionary)requestQueryParameters
{
  return self->_requestQueryParameters;
}

- (NTPBSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_requestQueryParameters, 0);
}

- (void)initWithSession:requestQueryParameters:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestQueryParameters", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSession:requestQueryParameters:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"session", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)requestMetadataWithExternalAnalyticsIdentifier:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"externalAnalyticsIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
