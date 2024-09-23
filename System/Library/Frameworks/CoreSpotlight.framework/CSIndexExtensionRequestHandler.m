@implementation CSIndexExtensionRequestHandler

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "dealloc, %@", (uint8_t *)&v2, 0xCu);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CSIndexExtensionRequestHandler beginRequestWithExtensionContext:].cold.1(a2);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setRequestHandler:", self);

}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  CSIndexExtensionRequestHandler *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "%@ called on %@", (uint8_t *)&v9, 0x16u);

  }
  v6[2](v6);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  CSIndexExtensionRequestHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a5;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEFAULT, "%@ called on %@", (uint8_t *)&v10, 0x16u);

  }
  v7[2](v7);

}

- (void)searchableIndexDidThrottle:(id)a3
{
  NSObject *v4;

  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CSIndexExtensionRequestHandler searchableIndexDidThrottle:].cold.1(a2);

}

- (void)searchableIndexDidFinishThrottle:(id)a3
{
  NSObject *v4;

  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CSIndexExtensionRequestHandler searchableIndexDidThrottle:].cold.1(a2);

}

- (void)beginRequestWithExtensionContext:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "%@ called with context:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)searchableIndexDidThrottle:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "%@ called on %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
