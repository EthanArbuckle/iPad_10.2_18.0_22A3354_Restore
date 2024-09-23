@implementation CKMomentSharePreviewAssetsDataSourceManager

- (CKMomentSharePreviewAssetsDataSourceManager)init
{
  return -[CKMomentSharePreviewAssetsDataSourceManager initWithMomentShareURL:](self, "initWithMomentShareURL:", 0);
}

- (CKMomentSharePreviewAssetsDataSourceManager)initWithMomentShareURL:(id)a3
{
  id v5;
  CKMomentSharePreviewAssetsDataSourceManager *v6;
  CKMomentSharePreviewAssetsDataSourceManager *v7;
  NSURL **p_momentShareURL;
  uint64_t v9;
  IMMomentShareCache *momentShareCache;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKMomentSharePreviewAssetsDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    p_momentShareURL = &v6->_momentShareURL;
    objc_storeStrong((id *)&v6->_momentShareURL, a3);
    if (*p_momentShareURL)
    {
      objc_msgSend(MEMORY[0x1E0D35898], "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      momentShareCache = v7->_momentShareCache;
      v7->_momentShareCache = (IMMomentShareCache *)v9;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__momentShareCacheDidChange_, *MEMORY[0x1E0D355D8], v7->_momentShareCache);

      -[CKMomentSharePreviewAssetsDataSourceManager _fetchMomentShare](v7, "_fetchMomentShare");
    }
  }

  return v7;
}

- (id)createInitialDataSource
{
  PXStaticDisplayAssetsDataSource *currentDataSource;
  NSObject *v4;
  PXStaticDisplayAssetsDataSource *v5;
  PXStaticDisplayAssetsDataSource *v6;

  currentDataSource = self->_currentDataSource;
  if (!currentDataSource)
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CKMomentSharePreviewAssetsDataSourceManager createInitialDataSource].cold.1((uint64_t)self);

    _CreateDataSourceForMomentShare(self->_momentShare);
    v5 = (PXStaticDisplayAssetsDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentDataSource;
    self->_currentDataSource = v5;

    currentDataSource = self->_currentDataSource;
  }
  return currentDataSource;
}

- (void)_fetchMomentShare
{
  IMMomentShareCache *momentShareCache;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  momentShareCache = self->_momentShareCache;
  -[NSURL absoluteString](self->_momentShareURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CKMomentSharePreviewAssetsDataSourceManager__fetchMomentShare__block_invoke;
  v5[3] = &unk_1E27594B8;
  objc_copyWeak(&v6, &location);
  -[IMMomentShareCache momentShareForURLString:completionHandler:](momentShareCache, "momentShareForURLString:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__CKMomentSharePreviewAssetsDataSourceManager__fetchMomentShare__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleFetchedMomentShare:error:", v6, v5);

}

- (void)_handleFetchedMomentShare:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  PXStaticDisplayAssetsDataSource *currentDataSource;
  _BOOL4 v13;
  PXStaticDisplayAssetsDataSource *v14;
  PXStaticDisplayAssetsDataSource *v15;

  v7 = a3;
  v8 = a4;
  IMLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10)
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.6((uint64_t)self, v7);
  }
  else if (v10)
  {
    -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.5();
  }

  if ((CKIsEqual(self->_momentShare, v7) & 1) != 0)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.1((uint64_t)self, v7);
LABEL_15:

    goto LABEL_19;
  }
  objc_storeStrong((id *)&self->_momentShare, a3);
  currentDataSource = self->_currentDataSource;
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!currentDataSource)
  {
    if (v13)
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.2((uint64_t)self, v11);
    goto LABEL_15;
  }
  if (v7)
  {
    if (v13)
      -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.4((uint64_t)self, v7);
  }
  else if (v13)
  {
    -[CKMomentSharePreviewAssetsDataSourceManager _handleFetchedMomentShare:error:].cold.3();
  }

  _CreateDataSourceForMomentShare(self->_momentShare);
  v14 = (PXStaticDisplayAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  v15 = self->_currentDataSource;
  self->_currentDataSource = v14;

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", self->_currentDataSource, 0);
LABEL_19:

}

- (void)_momentShareCacheDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D355E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL absoluteString](self->_momentShareURL, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CKMomentSharePreviewAssetsDataSourceManager _momentShareCacheDidChange:].cold.1();

    -[CKMomentSharePreviewAssetsDataSourceManager _fetchMomentShare](self, "_fetchMomentShare");
  }

}

- (NSURL)momentShareURL
{
  return self->_momentShareURL;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_momentShareCache, 0);
}

- (void)createInitialDataSource
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 192), "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_18DFCD000, v2, v3, "<%p> Create initial data source for moment share: %{public}@, URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_18DFCD000, v3, v4, "<%p> Ignoring redundant update for moment share: %{public}@, URL: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_DEBUG, "<%p> Waiting to create the initial data source", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_handleFetchedMomentShare:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_18DFCD000, v0, v1, "<%p> Provide placeholder for URL: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_18DFCD000, v3, v4, "<%p> Provide preview for moment share: %{public}@, URL: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_handleFetchedMomentShare:error:.cold.5()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_DEBUG, "<%p> Failed to fetch moment share for URL: %@, error: %@", v3, 0x20u);
}

- (void)_handleFetchedMomentShare:(uint64_t)a1 error:(void *)a2 .cold.6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_5(&dword_18DFCD000, v3, v4, "<%p> Fetched moment share: %{public}@ for URL: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_momentShareCacheDidChange:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_18DFCD000, v0, (uint64_t)v0, "<%p> Re-fetch changed moment share for URL: %@", v1);
  OUTLINED_FUNCTION_2();
}

@end
