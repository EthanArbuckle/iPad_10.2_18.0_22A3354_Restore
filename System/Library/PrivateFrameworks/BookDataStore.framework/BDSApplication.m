@implementation BDSApplication

+ (NSString)applicationDocumentsDirectory
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v12, v13, (uint64_t)v7, 1, 0, 0);

  }
  return (NSString *)v7;
}

+ (NSString)applicationCacheDirectory
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v7;
  if (v12)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v13, v14, (uint64_t)v12, 1, 0, 0);

  }
  return (NSString *)v12;
}

@end
