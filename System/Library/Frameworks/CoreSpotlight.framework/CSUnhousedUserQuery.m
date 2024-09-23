@implementation CSUnhousedUserQuery

+ (void)prepareWithPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB2AE0];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "prepareProtectionClasses:path:", v6, v5, v7, v8);

}

+ (void)preheat:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_18C42F000, v7, OS_LOG_TYPE_ERROR, "Shouldn't call preheat on CSUnhousedUserQuery: %@", (uint8_t *)&v8, 0xCu);
  }

  __assert_rtn("+[CSUnhousedUserQuery preheat:path:]", "CSUserQuery.m", 2706, "0");
}

+ (void)prepareProtectionClasses:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_18C42F000, v7, OS_LOG_TYPE_ERROR, "Shouldn't call prepareProtectionClasses on CSUnhousedUserQuery: %@", (uint8_t *)&v8, 0xCu);
  }

  __assert_rtn("+[CSUnhousedUserQuery prepareProtectionClasses:path:]", "CSUserQuery.m", 2712, "0");
}

- (CSUnhousedUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5
{
  id v8;
  CSUnhousedUserQuery *v9;
  CSUnhousedUserQuery *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedUserQuery;
  v9 = -[CSUserQuery initWithUserAttributedQueryString:userQueryContext:](&v12, sel_initWithUserAttributedQueryString_userQueryContext_, a3, a4);
  v10 = v9;
  if (v9)
    -[CSUnhousedUserQuery setIndexPath:](v9, "setIndexPath:", v8);

  return v10;
}

- (CSUnhousedUserQuery)initWithUserQueryString:(id)a3 userQueryContext:(id)a4 path:(id)a5
{
  id v8;
  CSUnhousedUserQuery *v9;
  CSUnhousedUserQuery *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CSUnhousedUserQuery;
  v9 = -[CSUserQuery initWithUserQueryString:userQueryContext:](&v12, sel_initWithUserQueryString_userQueryContext_, a3, a4);
  v10 = v9;
  if (v9)
    -[CSUnhousedUserQuery setIndexPath:](v9, "setIndexPath:", v8);

  return v10;
}

- (id)initialConnection
{
  return 0;
}

- (id)connection
{
  CSSearchConnection *savedConnection;
  CSSearchConnection *v4;
  CSSearchConnection *v5;

  savedConnection = self->_savedConnection;
  if (!savedConnection)
  {
    -[CSUnhousedUserQuery initialConnection](self, "initialConnection");
    v4 = (CSSearchConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_savedConnection;
    self->_savedConnection = v4;

    savedConnection = self->_savedConnection;
  }
  return savedConnection;
}

- (NSString)resolvedIndexPath
{
  NSString *resolvedIndexPath;
  CSUnhousedUserQuery *v4;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  resolvedIndexPath = self->_resolvedIndexPath;
  if (!resolvedIndexPath)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_resolvedIndexPath)
    {
      v14 = 0;
      -[CSUnhousedUserQuery indexPath](v4, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CSResolveUnhousedIndexPath(v6, &v14);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_resolvedIndexPath;
      self->_resolvedIndexPath = v7;

      -[CSUnhousedUserQuery indexPath](v4, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = self->_resolvedIndexPath == 0;

        if (v10)
        {
          logForCSLogCategoryDefault();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v12 = v14;
            -[CSUnhousedUserQuery indexPath](v4, "indexPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSUnhousedUserQuery resolvedIndexPath].cold.1(v13, buf, v12, v11);
          }

        }
      }
    }
    objc_sync_exit(v4);

    resolvedIndexPath = self->_resolvedIndexPath;
  }
  return resolvedIndexPath;
}

- (void)start
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[CSUnhousedUserQuery indexPath](self, "indexPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CSUnhousedUserQuery resolvedIndexPath](self, "resolvedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[CSSearchQuery completionHandler](self, "completionHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        -[CSUnhousedUserQuery indexPath](self, "indexPath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("Couldn't resolve index path: \"%@\"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB2D50];
        v15[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CSSearchQueryErrorDomain"), -2001, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSUserQuery handleCompletion:](self, "handleCompletion:", v12);

        return;
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CSUnhousedUserQuery;
  -[CSUserQuery start](&v13, sel_start);
}

- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 userQueryContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CSUnhousedUserQuery *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CSUnhousedUserQuery initWithPath:userQueryString:userQueryContext:].cold.1();

  v12 = -[CSUnhousedUserQuery initWithUserQueryString:userQueryContext:path:](self, "initWithUserQueryString:userQueryContext:path:", v9, v8, v10);
  return v12;
}

- (CSUnhousedUserQuery)initWithPath:(id)a3 userQueryString:(id)a4 queryContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  CSUnhousedUserQuery *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CSUnhousedUserQuery initWithPath:userQueryString:queryContext:].cold.1();

  v14.receiver = self;
  v14.super_class = (Class)CSUnhousedUserQuery;
  v12 = -[CSUserQuery initWithUserQueryString:queryContext:](&v14, sel_initWithUserQueryString_queryContext_, v10, v9);

  if (v12)
    -[CSUnhousedUserQuery setIndexPath:](v12, "setIndexPath:", v8);

  return v12;
}

- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5 path:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;

  v6 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CSUnhousedUserQuery userEngagedWithResult:visibleResults:interactionType:path:].cold.1();

  -[CSUserQuery userEngagedWithResult:visibleResults:interactionType:](self, "userEngagedWithResult:visibleResults:interactionType:", v10, v9, v6);
}

- (void)userEngagedWithSuggestion:(id)a3 visibleSuggestions:(id)a4 interactionType:(int)a5 path:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  NSObject *v11;

  v6 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CSUnhousedUserQuery userEngagedWithSuggestion:visibleSuggestions:interactionType:path:].cold.1();

  -[CSUserQuery userEngagedWithSuggestion:visibleSuggestions:interactionType:](self, "userEngagedWithSuggestion:visibleSuggestions:interactionType:", v10, v9, v6);
}

- (void)updateRecentSuggestions:(id)a3 path:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a3;
  logForCSLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CSUnhousedUserQuery updateRecentSuggestions:path:].cold.1();

  -[CSUserQuery updateRecentSuggestions:](self, "updateRecentSuggestions:", v5);
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (CSSearchConnection)savedConnection
{
  return self->_savedConnection;
}

- (void)setSavedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_savedConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedConnection, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_resolvedIndexPath, 0);
}

- (void)resolvedIndexPath
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a1;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "CSUnhousedUserQuery couldn't resolve index path. error:%d path:%@", buf, 0x12u);

}

- (void)initWithPath:userQueryString:userQueryContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "-[CSUnhousedUserQuery initWithPath:userQueryString:userQueryContext:] is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initWithPath:userQueryString:queryContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "-[CSUnhousedUserQuery initWithPath:userQueryString:queryContext:] is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)userEngagedWithResult:visibleResults:interactionType:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "-[CSUnhousedUserQuery userEngagedWithResult:visibleResults:interactionType:path:] is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)userEngagedWithSuggestion:visibleSuggestions:interactionType:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "-[CSUnhousedUserQuery userEngagedWithSuggestion:visibleSuggestions:interactionType:path:] is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)updateRecentSuggestions:path:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "-[CSUnhousedUserQuery updateRecentSuggestions:path:] is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
