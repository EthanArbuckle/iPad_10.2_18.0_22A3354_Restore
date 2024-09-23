@implementation ML3RemoveTracksOperation

- (unint64_t)type
{
  return 3;
}

- (BOOL)_execute:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  int v16;
  _BOOL4 v17;
  double v18;
  double v19;
  NSObject *v20;
  int v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ML3DatabaseOperation transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseOperation attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  -[ML3DatabaseOperation attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109376;
    v23 = v10;
    v24 = 2048;
    v25 = COERCE_DOUBLE(objc_msgSend(v12, "count"));
    _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "[ML3RemoveTracksOperation] Beginning remove tracks operation with source %d (%lu specified tracks)", (uint8_t *)&v22, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v15 = v14;
  if (objc_msgSend(v12, "count"))
    v16 = objc_msgSend(v7, "removeSource:fromPersistentIDS:forImportOperation:usingConnection:postNotifications:", v10, v12, self, v6, 1);
  else
    v16 = objc_msgSend(v7, "removeSource:forImportOperation:usingConnection:postNotifications:", v10, self, v6, 1);
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18;
  v20 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 67109376;
    v23 = v17;
    v24 = 2048;
    v25 = v19 - v15;
    _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "[ML3RemoveTracksOperation] Remove tracks operation success=%d in %.3f seconds", (uint8_t *)&v22, 0x12u);
  }

  if (a3)
    *a3 = 0;

  return v17;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ML3RemoveTracksOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v9, sel__verifyLibraryConnectionAndAttributesProperties_))return 0;
  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MLDatabaseOperationAttributeTrackSourceKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  if (a3 && !v6)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, CFSTR("ML3RemoveTracksOperation requires a track source attribute"));
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
