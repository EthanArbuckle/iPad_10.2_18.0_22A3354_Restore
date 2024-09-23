@implementation MAAutoAssetSetShortTermLockInMemoryRecord

- (MAAutoAssetSetShortTermLockInMemoryRecord)initWithPathAndSetStatus:(id)a3 setStatus:(id)a4
{
  id v7;
  id v8;
  MAAutoAssetSetShortTermLockInMemoryRecord *v9;
  MAAutoAssetSetShortTermLockInMemoryRecord *v10;
  uint64_t v11;
  NSDate *recordDate;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetShortTermLockInMemoryRecord;
  v9 = -[MAAutoAssetSetShortTermLockInMemoryRecord init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockerFileRealPath, a3);
    objc_storeStrong((id *)&v10->_setStatus, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    recordDate = v10->_recordDate;
    v10->_recordDate = (NSDate *)v11;

  }
  return v10;
}

- (BOOL)isCurrentlyValid
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetShortTermLockInMemoryRecord lockerFileRealPath](self, "lockerFileRealPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetShortTermLockInMemoryRecord isCurrentlyValid].cold.1(self, (uint64_t)v6, v9);
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2A88]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetShortTermLockInMemoryRecord isCurrentlyValid].cold.2(self, v9);
    goto LABEL_11;
  }
  v9 = v10;
  -[MAAutoAssetSetShortTermLockInMemoryRecord recordDate](self, "recordDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject compare:](v9, "compare:", v11) == -1;

LABEL_12:
  return v12;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetShortTermLockInMemoryRecord lockerFileRealPath](self, "lockerFileRealPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetShortTermLockInMemoryRecord recordDate](self, "recordDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("LockerFilePath: %@ RecordCreatedDate: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)lockerFileRealPath
{
  return self->_lockerFileRealPath;
}

- (NSDate)recordDate
{
  return self->_recordDate;
}

- (MAAutoAssetSetStatus)setStatus
{
  return self->_setStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setStatus, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_lockerFileRealPath, 0);
}

- (void)isCurrentlyValid
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AE33B000, a2, OS_LOG_TYPE_ERROR, "[MAAutoAssetSetShortTermLockInMemoryRecord]: Unable to determine modification date for lock file tracked by %@", (uint8_t *)&v4, 0xCu);

}

@end
