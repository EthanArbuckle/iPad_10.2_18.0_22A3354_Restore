@implementation FPDFetchAppLibraryIconOperation

- (FPDFetchAppLibraryIconOperation)initWithAppBundleIDs:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5
{
  double height;
  double width;
  id v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  FPDFetchAppLibraryIconOperation *v17;
  FPDFetchAppLibraryIconOperation *v18;
  FPDFetchAppLibraryIconOperation *v19;
  uint64_t v20;
  NSMutableArray *appBundleIDsNotFound;
  NSProgress *v22;
  NSProgress *progress;
  CGFloat v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;
  NSSize v30;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  if (!objc_msgSend(v11, "count")
    || (width >= 1.0 ? (v12 = width == height) : (v12 = 0), v12 ? (v13 = a5 < 1.0) : (v13 = 1), v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v30.width = width;
    v30.height = height;
    NSStringFromSize(v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDFetchAppLibraryIconOperation.m"), 68, CFSTR("invalid parameter to initialize %@ (appBundleIDs:%@, desiredSize:%@, screenScale:%f)"), v15, v11, v16, *(_QWORD *)&a5);

    v17 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)FPDFetchAppLibraryIconOperation;
    v18 = -[FPOperation init](&v29, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_appBundleIDs, a3);
      v20 = objc_msgSend(v11, "mutableCopy");
      appBundleIDsNotFound = v19->_appBundleIDsNotFound;
      v19->_appBundleIDsNotFound = (NSMutableArray *)v20;

      v22 = (NSProgress *)objc_alloc_init(MEMORY[0x1E0CB38A8]);
      progress = v19->_progress;
      v19->_progress = v22;

      -[NSProgress setTotalUnitCount:](v19->_progress, "setTotalUnitCount:", -[NSArray count](v19->_appBundleIDs, "count"));
      -[NSProgress setCancellable:](v19->_progress, "setCancellable:", 1);
      location = 0;
      objc_initWeak(&location, v19);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __80__FPDFetchAppLibraryIconOperation_initWithAppBundleIDs_desiredSize_screenScale___block_invoke;
      v26[3] = &unk_1E8C75E70;
      objc_copyWeak(&v27, &location);
      -[NSProgress setCancellationHandler:](v19->_progress, "setCancellationHandler:", v26);
      v24 = fmin(width, 144.0);
      v19->_desiredSize.width = v24;
      v19->_desiredSize.height = v24;
      v19->_screenScale = a5;
      v19->_allowLocalLookup = 1;
      v19->_allowAppStoreLookup = 1;
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

void __80__FPDFetchAppLibraryIconOperation_initWithAppBundleIDs_desiredSize_screenScale___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  char v17;

  v7 = (void (**)(_QWORD))a5;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mappedData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("undecorated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "BOOLValue");
  if (v9 && v10)
  {
    -[FPOperation callbackQueue](self, "callbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__FPDFetchAppLibraryIconOperation_operationDidProgressWithInfo_error_completionHandler___block_invoke;
    v14[3] = &unk_1E8C75F38;
    v14[4] = self;
    v15 = v9;
    v16 = v10;
    v17 = v12;
    dispatch_async(v13, v14);

  }
  v7[2](v7);

}

uint64_t __88__FPDFetchAppLibraryIconOperation_operationDidProgressWithInfo_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 56))
    v1 = *MEMORY[0x1E0CAAAD8];
  else
    v1 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_perAppBundleCompletion:iconData:contentType:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v1, 0);
}

- (void)main
{
  int v3;
  int v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (int)*(double *)(a1 + 304);
  v4 = (int)*(double *)(a1 + 312);
  v5 = (int)*(double *)(a1 + 320);
  objc_msgSend(*(id *)(a1 + 344), "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109890;
  v7[1] = v3;
  v8 = 1024;
  v9 = v4;
  v10 = 1024;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching thumbnail %dx%d@%dx for [%@] ", (uint8_t *)v7, 0x1Eu);

}

uint64_t __39__FPDFetchAppLibraryIconOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("can't retrieve icon for app bundleID '%@'"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_perAppBundleCompletion:iconData:contentType:error:", v7, 0, 0, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
}

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1)
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_18);
  return (NSOperationQueue *)(id)sharedOperationQueue_operationQueue;
}

uint64_t __55__FPDFetchAppLibraryIconOperation_sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedOperationQueue_operationQueue;
  sharedOperationQueue_operationQueue = (uint64_t)v0;

  objc_msgSend((id)sharedOperationQueue_operationQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)sharedOperationQueue_operationQueue, "setName:", CFSTR("com.apple.FileProvider.FetchAppIcon"));
}

- (void)_verifyAppBundleIDsFormat
{
  OUTLINED_FUNCTION_0(&dword_1CF55F000, a1, a3, "[DEBUG] verifying format of provided app bundle IDs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (BOOL)_checkTypeIsValid:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_checkIsNotPrefixedByTeamID:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0
    || (unint64_t)objc_msgSend(v3, "length") < 0xB
    || objc_msgSend(v3, "characterAtIndex:", 10) != 46)
  {
    v5 = 1;
  }
  else
  {
    if (_checkIsNotPrefixedByTeamID__onceToken != -1)
      dispatch_once(&_checkIsNotPrefixedByTeamID__onceToken, &__block_literal_global_26_0);
    objc_msgSend(v3, "substringToIndex:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", _checkIsNotPrefixedByTeamID__teamIDCharacterSet) == 0x7FFFFFFFFFFFFFFFLL;

  }
  return v5;
}

void __63__FPDFetchAppLibraryIconOperation__checkIsNotPrefixedByTeamID___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "capitalizedLetterCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_checkIsNotPrefixedByTeamID__teamIDCharacterSet;
  _checkIsNotPrefixedByTeamID__teamIDCharacterSet = v0;

  v2 = (void *)_checkIsNotPrefixedByTeamID__teamIDCharacterSet;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

}

- (void)_retrieveIconsFromLocalDevice
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] ┏%llx retrieving app icons available locally", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

void __64__FPDFetchAppLibraryIconOperation__retrieveIconsFromLocalDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_retrieveIconsFromAppStore
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] ┏%llx retrieving app icons by asking the App Store", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

uint64_t __61__FPDFetchAppLibraryIconOperation__retrieveIconsFromAppStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_perAppBundleCompletion:(id)a3 iconData:(id)a4 contentType:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int64_t v18;
  int64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  NSObject *v22;
  uint64_t v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FPOperation callbackQueue](self, "callbackQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if ((-[FPDFetchAppLibraryIconOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[FPDFetchAppLibraryIconOperation perAppBundleCompletion](self, "perAppBundleCompletion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v15)
      {
        if ((-[NSMutableArray containsObject:](self->_appBundleIDsNotFound, "containsObject:", v10) & 1) != 0)
        {
          -[NSMutableArray removeObject:](self->_appBundleIDsNotFound, "removeObject:", v10);
          if (objc_msgSend(v11, "length"))
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("found (%lu bytes, ct:%@)"), objc_msgSend(v11, "length"), v12);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not found; %@"), v13, v23);
          v16 = objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:].cold.2((uint64_t)v10, (uint64_t)v16, v17);

          v18 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
          if (v18 >= -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ perAppBundleCompletion was invoked more than once per item"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:].cold.1((uint64_t)v21, v22);

            __assert_rtn("-[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/app-library/FPDFetchAppLibraryIconOperation.m", 304, (const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
          }
          v19 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
          if (v19 < -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"))
            -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress completedUnitCount](self->_progress, "completedUnitCount") + 1);
          -[FPDFetchAppLibraryIconOperation perAppBundleCompletion](self, "perAppBundleCompletion");
          v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, id, id, id))v20)[2](v20, v10, v11, v12, v13);

        }
        else
        {
          fp_current_or_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[FPDFetchAppLibraryIconOperation _perAppBundleCompletion:iconData:contentType:error:].cold.3((uint64_t)v10, v16);
        }

      }
    }
  }

}

- (NSArray)appBundleIDs
{
  return self->_appBundleIDs;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)perAppBundleCompletion
{
  return self->_perAppBundleCompletion;
}

- (void)setPerAppBundleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (BOOL)allowLocalLookup
{
  return self->_allowLocalLookup;
}

- (void)setAllowLocalLookup:(BOOL)a3
{
  self->_allowLocalLookup = a3;
}

- (BOOL)allowAppStoreLookup
{
  return self->_allowAppStoreLookup;
}

- (void)setAllowAppStoreLookup:(BOOL)a3
{
  self->_allowAppStoreLookup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perAppBundleCompletion, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_appBundleIDs, 0);
  objc_storeStrong((id *)&self->_appBundleIDsNotFound, 0);
}

- (void)_perAppBundleCompletion:(uint64_t)a1 iconData:(NSObject *)a2 contentType:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

- (void)_perAppBundleCompletion:(os_log_t)log iconData:contentType:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] icon for %@ %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

- (void)_perAppBundleCompletion:(uint64_t)a1 iconData:(NSObject *)a2 contentType:error:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] perAppBundleCompletion already called for %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8_0();
}

@end
