@implementation ATXCacheReaderGuardedData

- (ATXCacheReaderGuardedData)init
{
  ATXCacheReaderGuardedData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXCacheReaderGuardedData;
  result = -[ATXCacheReaderGuardedData init](&v3, sel_init);
  if (result)
    result->_cacheFileDescriptor = -1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachePath, 0);
}

@end
