@implementation CKDAssetCacheEvictionResult

- (CKDAssetCacheEvictionResult)initWithBytesCount:(unint64_t)a3 purgedBytesCount:(unint64_t)a4 purgeableByteCount:(unint64_t)a5 filesCount:(unint64_t)a6 purgedFilesCount:(unint64_t)a7 purgeableFilesCount:(unint64_t)a8
{
  CKDAssetCacheEvictionResult *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDAssetCacheEvictionResult;
  result = -[CKDAssetCacheEvictionResult init](&v15, sel_init);
  if (result)
  {
    result->_bytesCount = a3;
    result->_purgedBytesCount = a4;
    result->_purgeableBytesCount = a5;
    result->_filesCount = a6;
    result->_purgedFilesCount = a7;
    result->_purgeableFilesCount = a8;
  }
  return result;
}

- (unint64_t)bytesCount
{
  return self->_bytesCount;
}

- (unint64_t)purgedBytesCount
{
  return self->_purgedBytesCount;
}

- (unint64_t)purgeableBytesCount
{
  return self->_purgeableBytesCount;
}

- (unint64_t)filesCount
{
  return self->_filesCount;
}

- (unint64_t)purgedFilesCount
{
  return self->_purgedFilesCount;
}

- (unint64_t)purgeableFilesCount
{
  return self->_purgeableFilesCount;
}

@end
