@implementation _CNFavoritesLogger

- (void)failedToReadFavoritesFromPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNFavoritesLogger _simulateCrashReportWithMessage:](self, "_simulateCrashReportWithMessage:", v10);

  }
  else
  {
    -[_CNFavoritesLogger log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_CNFavoritesLogger failedToReadFavoritesFromPath:error:simulateCrashReport:].cold.1();

  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)finishedReadingFavoritesFromPath:(id)a3 entriesCount:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a4;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Read favorites file %{public}@, count = %ld", (uint8_t *)&v8, 0x16u);
  }

}

- (void)readingFavorites:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "ReadingFavorites", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNFavoritesLogger_readingFavorites___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __39___CNFavoritesLogger_readingFavorites___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (_CNFavoritesLogger)init
{
  _CNFavoritesLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  _CNFavoritesLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNFavoritesLogger;
  v2 = -[_CNFavoritesLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts", "Favorites");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)failedToReadFavoritesFromPath:error:simulateCrashReport:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Failed to read favorites file %{public}@, error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)writingFavorites:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "WritingFavorites", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNFavoritesLogger_writingFavorites___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __39___CNFavoritesLogger_writingFavorites___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)rematchingFavorites:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "rematchingFavorites", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___CNFavoritesLogger_rematchingFavorites___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __42___CNFavoritesLogger_rematchingFavorites___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)finishedReadingRemoteFavorites
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNFavoritesLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_DEFAULT, "Read favorites with contactsd", v3, 2u);
  }

}

- (void)finishedWritingRemoteFavorites
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNFavoritesLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_DEFAULT, "Saved favorites with contactsd", v3, 2u);
  }

}

- (void)finishedWritingFavoritesToPath:(id)a3 entriesCount:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a4;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "Saved favorites to file %{public}@, count = %ld", (uint8_t *)&v8, 0x16u);
  }

}

- (void)failedToReadRemoteFavorites:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNFavoritesLogger failedToReadRemoteFavorites:].cold.1();

}

- (void)failedToConvertFavoritesToPropertyList:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNFavoritesLogger failedToConvertFavoritesToPropertyList:].cold.1();

}

- (void)failedToVerifyFavorites:(id)a3 withPropertyListFavorites:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_CNFavoritesLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_error_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_ERROR, "Error converting favorites entries:\n%@\nconvertedEntries:\n%@,\n%@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error converting favorites entries to property list, not converted correctly. Please open a radar to PEP Contacts (New Bugs).\n\n%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNFavoritesLogger _simulateCrashReportWithMessage:](self, "_simulateCrashReportWithMessage:", v12);

}

- (void)failedToWriteRemoteFavorites:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNFavoritesLogger failedToWriteRemoteFavorites:].cold.1();

}

- (void)failedToVerifyWrittenFavoritesExistsAtPath:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error saving favorites file\x10. File does not exist after saving. Please open a radar to PEP Contacts (New Bugs).\n\nexpected file: %@"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNFavoritesLogger _simulateCrashReportWithMessage:](self, "_simulateCrashReportWithMessage:", v4);

}

- (void)failedToWriteFavoritesToPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error saving favorites file. Please open a radar to PEP Contacts (New Bugs).\n\n%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNFavoritesLogger _simulateCrashReportWithMessage:](self, "_simulateCrashReportWithMessage:", v10);

  }
  else
  {
    -[_CNFavoritesLogger log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_CNFavoritesLogger failedToWriteFavoritesToPath:error:simulateCrashReport:].cold.1();

  }
}

- (void)_simulateCrashReportWithMessage:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNFavoritesLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNFavoritesLogger _simulateCrashReportWithMessage:].cold.1();

  ABLogSimulateCrashReport();
  ABLogDisplayInternalAlert();

}

- (void)reportFavoritesAccessedBeforeFirstUnlock
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_FAULT, "%@ (or something it links) is using contacts favorites before device first unlock.", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (OS_os_log)summaryLog
{
  return self->_summaryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)failedToReadRemoteFavorites:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to read favorites with contactsd, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToConvertFavoritesToPropertyList:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to convert favorites entries to property list, cannot save favorites, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToWriteRemoteFavorites:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Failed to save favorites with contactsd, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)failedToWriteFavoritesToPath:error:simulateCrashReport:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "Failed to save favorites file %{public}@, error: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_simulateCrashReportWithMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
