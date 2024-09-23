@implementation BDSReadingHistoryMigrationInfo

+ (NSString)dataHasBeenMovedUserDefaultsKey
{
  return (NSString *)CFSTR("readingHistoryDataHasBeenMovedDefaultsKey");
}

+ (NSURL)readingHistoryFileURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_documentsURL(BDSAppGroupContainer, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("BCCloudData-AppMigration"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v9;
}

+ (NSString)booksFinishedUserDefaultsKey
{
  return (NSString *)CFSTR("booksFinishedUserDefaultsKey");
}

+ (NSString)streakDayUserDefaultsKey
{
  return (NSString *)CFSTR("streakDatUserDefaultsKey");
}

+ (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryFileURL(BDSReadingHistoryMigrationInfo, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_booksFinishedUserDefaultsKey(BDSReadingHistoryMigrationInfo, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_streakDayUserDefaultsKey(BDSReadingHistoryMigrationInfo, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v20, (uint64_t)CFSTR("<%@ readingHistoryFileURL=%@ booksFinishedUserDefaultsKey=%@ streakDayUserDefaultsKey=%@>"), v21, v22, v4, v9, v14, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
