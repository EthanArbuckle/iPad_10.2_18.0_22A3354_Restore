@implementation PHRelatedFetchOptions

- (NSArray)excludedAssetCollections
{
  return self->_excludedAssetCollections;
}

- (void)setExcludedAssetCollections:(id)a3
{
  objc_storeStrong((id *)&self->_excludedAssetCollections, a3);
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (void)setReferenceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_referenceAsset, a3);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (BOOL)enableDiversity
{
  return self->_enableDiversity;
}

- (void)setEnableDiversity:(BOOL)a3
{
  self->_enableDiversity = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (BOOL)isDebugInfoEnabled
{
  return self->_debugInfoEnabled;
}

- (void)setDebugInfoEnabled:(BOOL)a3
{
  self->_debugInfoEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_excludedAssetCollections, 0);
}

@end
