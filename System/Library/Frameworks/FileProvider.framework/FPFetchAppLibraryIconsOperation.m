@implementation FPFetchAppLibraryIconsOperation

- (FPFetchAppLibraryIconsOperation)initWithAppLibraryItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  FPFetchAppLibraryIconsOperation *v15;
  double *v16;
  FPFetchAppLibraryIconsOperation *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;
  NSSize v23;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  objc_msgSend(v10, "valueForKey:", CFSTR("fp_appContainerBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("itemIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") && (v13 = objc_msgSend(v11, "count"), v13 == objc_msgSend(v12, "count")))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v12, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && width >= 1.0 && width == height && a5 >= 1.0)
    {
      v22.receiver = self;
      v22.super_class = (Class)FPFetchAppLibraryIconsOperation;
      v15 = -[FPOperation init](&v22, sel_init);
      v16 = (double *)v15;
      if (v15)
      {
        objc_storeStrong((id *)&v15->_itemIdentifierByAppBundleID, v14);
        v16[39] = width;
        v16[40] = height;
        v16[41] = a5;
      }
      self = v16;
      v17 = self;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_class();
      v23.width = width;
      v23.height = height;
      NSStringFromSize(v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchThumbnailsOperation.m"), 112, CFSTR("invalid parameter to initialize %@ (appLibraryItems:%@, desiredSize:%@, screenScale:%f)"), v19, v10, v20, *(_QWORD *)&a5);

      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescriptionExpandingAtMost:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] fetching app-library thumbnails for %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6_1();
}

uint64_t __39__FPFetchAppLibraryIconsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_itemIdentifierByAppBundleID, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("identifier"));
      -[FPFetchAppLibraryIconsOperation delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "operation:didReceiveProgressInfo:error:", self, v13, v9);

      v10[2](v10);
    }
    else
    {
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[FPFetchAppLibraryIconsOperation operationDidProgressWithInfo:error:completionHandler:].cold.2((uint64_t)v11, v15, v16);

    }
  }
  else
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPFetchAppLibraryIconsOperation operationDidProgressWithInfo:error:completionHandler:].cold.1(v12);
  }

}

- (FPOperationProgressDelegate)delegate
{
  return (FPOperationProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemIdentifierByAppBundleID, 0);
}

- (void)operationDidProgressWithInfo:(os_log_t)log error:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] missing required key 'appBundleID'", v1, 2u);
}

- (void)operationDidProgressWithInfo:(uint64_t)a1 error:(NSObject *)a2 completionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, a3, "[DEBUG] can't map appBundleID '%@' to item identifier", (uint8_t *)&v3);
}

@end
