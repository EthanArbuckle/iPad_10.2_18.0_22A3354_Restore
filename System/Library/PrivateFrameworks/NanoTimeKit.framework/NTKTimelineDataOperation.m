@implementation NTKTimelineDataOperation

+ (id)operationWithLocalDataSource:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

+ (id)operationWithRemoteDataSource:(id)a3 complication:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[2];
  v8[2] = v6;
  v10 = v6;

  v11 = (void *)v8[3];
  v8[3] = v7;

  return v8;
}

- (void)start
{
  NSObject *v3;
  void *localDataSource;
  int v5;
  NTKTimelineDataOperation *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    localDataSource = self->_localDataSource;
    if (!localDataSource)
      localDataSource = self->_remoteDataSource;
    v5 = 138412546;
    v6 = self;
    v7 = 2112;
    v8 = localDataSource;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Starting timeline operation %@ on %@", (uint8_t *)&v5, 0x16u);
  }

  -[NTKTimelineDataOperation _start](self, "_start");
  self->_started = 1;
}

- (void)cancel
{
  NSObject *v3;
  int v4;
  NTKTimelineDataOperation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_canceled)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling timeline operation %@", (uint8_t *)&v4, 0xCu);
    }

    -[NTKTimelineDataOperation _cancel](self, "_cancel");
  }
  self->_canceled = 1;
}

- (BOOL)_validateEntry:(id)a3
{
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend(a3, "validateWithError:", 0);
  if ((v4 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKTimelineDataOperation _validateEntry:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4;
}

- (BOOL)_validateTemplate:(id)a3
{
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend(a3, "validateWithError:", 0);
  if ((v4 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKTimelineDataOperation _validateTemplate:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4;
}

- (id)_finalizedValidEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[NTKTimelineDataOperation _validateEntry:](self, "_validateEntry:", v11, (_QWORD)v14))
        {
          objc_msgSend(v11, "finalizedCopy");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)started
{
  return self->_started;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteComplication, 0);
  objc_storeStrong((id *)&self->_remoteDataSource, 0);
  objc_storeStrong((id *)&self->_localDataSource, 0);
}

- (void)_validateEntry:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "**** Invalid complication timeline entry is being discarded:\n                                ********* Data source = %@", a5, a6, a7, a8, 2u);
}

- (void)_validateTemplate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "**** Invalid complication template is being discarded:\n                                ********* Data source = %@", a5, a6, a7, a8, 2u);
}

@end
