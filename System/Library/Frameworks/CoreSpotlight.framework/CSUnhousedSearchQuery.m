@implementation CSUnhousedSearchQuery

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 attributers:(id)a5
{
  return -[CSUnhousedSearchQuery initWithPath:queryString:context:attributes:](self, "initWithPath:queryString:context:attributes:", a3, a4, 0, a5);
}

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5
{
  return -[CSUnhousedSearchQuery initWithPath:queryString:context:attributes:](self, "initWithPath:queryString:context:attributes:", a3, a4, a5, 0);
}

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5 attributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CSUnhousedSearchQuery *v14;
  CSUnhousedSearchQuery *v15;
  objc_super v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
    v14 = -[CSSearchQuery initWithQueryString:context:](&v18, sel_initWithQueryString_context_, v11, v12, v17.receiver, v17.super_class, self, CSUnhousedSearchQuery);
  else
    v14 = -[CSSearchQuery initWithQueryString:attributes:](&v17, sel_initWithQueryString_attributes_, v11, v13, self, CSUnhousedSearchQuery, v18.receiver, v18.super_class);
  v15 = v14;
  if (v14)
    -[CSUnhousedSearchQuery setIndexPath:](v14, "setIndexPath:", v10);

  return v15;
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
    -[CSUnhousedSearchQuery initialConnection](self, "initialConnection");
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
  CSUnhousedSearchQuery *v4;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  _BYTE v15[24];
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
      -[CSUnhousedSearchQuery indexPath](v4, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CSResolveUnhousedIndexPath(v6, (int *)&v14);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_resolvedIndexPath;
      self->_resolvedIndexPath = v7;

      -[CSUnhousedSearchQuery indexPath](v4, "indexPath");
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
            -[CSUnhousedSearchQuery indexPath](v4, "indexPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CSUnhousedSearchQuery resolvedIndexPath].cold.1(v13, (uint64_t)v15, v12, v11);
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
  -[CSUnhousedSearchQuery indexPath](self, "indexPath");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CSUnhousedSearchQuery resolvedIndexPath](self, "resolvedIndexPath");
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
        -[CSUnhousedSearchQuery indexPath](self, "indexPath");
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
        -[CSSearchQuery handleCompletion:](self, "handleCompletion:", v12);

        return;
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CSUnhousedSearchQuery;
  -[CSSearchQuery start](&v13, sel_start);
}

- (id)debugDescriptionWithQueryString:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSUnhousedSearchQuery;
  -[CSSearchQuery debugDescriptionWithQueryString:](&v10, sel_debugDescriptionWithQueryString_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CSUnhousedSearchQuery indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR(" indexPath=%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertString:atIndex:", v8, objc_msgSend(v5, "length") - 1);

  return v5;
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
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_6_1(&dword_18C42F000, a4, a3, "CSUnhousedUserQuery couldn't resolve index path. error:%d path:%@", (uint8_t *)a2);

}

@end
