@implementation _FBSCDHashCacheInfo

+ (_FBSCDHashCacheInfo)cacheInfoWithData:(id)a3 hashType:(unsigned int)a4
{
  NSData *v5;
  _FBSCDHashCacheInfo *v6;
  NSData *cachedCodeDirectoryHash;

  v5 = (NSData *)a3;
  v6 = objc_alloc_init(_FBSCDHashCacheInfo);
  cachedCodeDirectoryHash = v6->_cachedCodeDirectoryHash;
  v6->_cachedCodeDirectoryHash = v5;

  v6->_cachedCodeDirectoryHashType = a4;
  return v6;
}

- (NSData)cachedCodeDirectoryHash
{
  return self->_cachedCodeDirectoryHash;
}

- (unsigned)cachedCodeDirectoryHashType
{
  return self->_cachedCodeDirectoryHashType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCodeDirectoryHash, 0);
}

@end
