@implementation CSHashtagQuery

- (CSHashtagQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CSHashtagQuery *v34;
  uint64_t v35;
  NSMutableSet *hashtags;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[CSHashtagQuery initWithQueryString:context:].cold.1();
  v8 = v7;
  if (!v7)
    -[CSHashtagQuery initWithQueryString:context:].cold.2();
  objc_msgSend(v7, "fetchAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToArray:", &unk_1E242F9E8))
  {
    v10 = objc_msgSend(v8, "attribute");

    if ((v10 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  logForCSLogCategoryQuery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CSHashtagQuery initWithQueryString:context:].cold.5(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v8, "setFetchAttributes:", &unk_1E242FA00);
  objc_msgSend(v8, "setAttribute:", 1);
LABEL_10:
  if (objc_msgSend(v8, "live"))
  {
    logForCSLogCategoryQuery();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CSHashtagQuery initWithQueryString:context:].cold.4(v19, v20, v21, v22, v23, v24, v25, v26);

    objc_msgSend(v8, "setLive:", 0);
  }
  logForCSLogCategoryQuery();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[CSHashtagQuery initWithQueryString:context:].cold.3((uint64_t)v6, v27, v28, v29, v30, v31, v32, v33);

  v38.receiver = self;
  v38.super_class = (Class)CSHashtagQuery;
  v34 = -[CSSearchQuery initWithQueryString:context:](&v38, sel_initWithQueryString_context_, v6, v8);
  if (v34)
  {
    v35 = objc_opt_new();
    hashtags = v34->_hashtags;
    v34->_hashtags = (NSMutableSet *)v35;

  }
  return v34;
}

- (CSHashtagQuery)initWithQueryString:(id)a3 bundleIDs:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CSHashtagQuery *v17;
  uint64_t v18;
  NSMutableSet *hashtags;

  v6 = (__CFString *)a3;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("kMDItemHashtags=*");
  v8 = a4;
  logForCSLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CSHashtagQuery initWithQueryString:bundleIDs:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setBundleIDs:", v8);

  objc_msgSend(v16, "setFetchAttributes:", &unk_1E242FA18);
  objc_msgSend(v16, "setAttribute:", 1);
  objc_msgSend(v16, "setUserQuery:", v7);
  objc_msgSend(v16, "setLowPriority:", 0);
  v17 = -[CSHashtagQuery initWithQueryString:context:](self, "initWithQueryString:context:", v7, v16);
  if (v17)
  {
    v18 = objc_opt_new();
    hashtags = v17->_hashtags;
    v17->_hashtags = (NSMutableSet *)v18;

  }
  return v17;
}

- (void)handleFoundAttributes:(id)a3 values:(id)a4 attributesHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  logForCSLogCategoryQuery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[CSSearchQuery queryString](self, "queryString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v17;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_debug_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEBUG, "Query %@, returned values for attribute %@: %@", buf, 0x20u);

  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kMDItemHashtags")))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          -[NSMutableSet addObject:](self->_hashtags, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
  v18.receiver = self;
  v18.super_class = (Class)CSHashtagQuery;
  -[CSSearchQuery handleFoundAttributes:values:attributesHandler:](&v18, sel_handleFoundAttributes_values_attributesHandler_, v8, v9, v10);

}

- (void)handleCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  objc_super v8;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSHashtagQuery handleCompletion:].cold.1((uint64_t)v4, (uint64_t)self, v5);

  -[CSHashtagQuery hashTagCompletionHandler](self, "hashTagCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CSHashtagQuery hashTagCompletionHandler](self, "hashTagCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSMutableSet *, id))v7)[2](v7, self->_hashtags, v4);

  }
  v8.receiver = self;
  v8.super_class = (Class)CSHashtagQuery;
  -[CSSearchQuery handleCompletion:](&v8, sel_handleCompletion_, v4);

}

- (id)hashTagCompletionHandler
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setHashTagCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashTagCompletionHandler, 0);
  objc_storeStrong((id *)&self->_hashtags, 0);
}

- (void)initWithQueryString:context:.cold.1()
{
  __assert_rtn("-[CSHashtagQuery initWithQueryString:context:]", "CSHashtagQuery.m", 18, "queryString");
}

- (void)initWithQueryString:context:.cold.2()
{
  __assert_rtn("-[CSHashtagQuery initWithQueryString:context:]", "CSHashtagQuery.m", 19, "queryContext");
}

- (void)initWithQueryString:(uint64_t)a3 context:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "initWithQueryString: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithQueryString:(uint64_t)a3 context:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "Error in setting queryContext's live option. This is not supported, resetting to NO.", a5, a6, a7, a8, 0);
}

- (void)initWithQueryString:(uint64_t)a3 context:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "Error in setting queryContext's fetchAttributes or attribute, resetting them.", a5, a6, a7, a8, 0);
}

- (void)initWithQueryString:(uint64_t)a3 bundleIDs:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "queryString: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_18C42F000, log, OS_LOG_TYPE_DEBUG, "Received completion %@ for query: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
