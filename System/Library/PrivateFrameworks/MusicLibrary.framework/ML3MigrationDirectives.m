@implementation ML3MigrationDirectives

- (ML3MigrationDirectives)initWithOriginalUserVersion:(int)a3
{
  ML3MigrationDirectives *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3MigrationDirectives;
  result = -[ML3MigrationDirectives init](&v5, sel_init);
  if (result)
  {
    result->_originalUserVersion = a3;
    result->_currentUserVersion = a3;
  }
  return result;
}

- (int)originalUserVersion
{
  return self->_originalUserVersion;
}

- (int)currentUserVersion
{
  return self->_currentUserVersion;
}

- (void)setCurrentUserVersion:(int)a3
{
  self->_currentUserVersion = a3;
}

- (BOOL)needsToRecreateIndexes
{
  return self->_needsToRecreateIndexes;
}

- (void)setNeedsToRecreateIndexes:(BOOL)a3
{
  self->_needsToRecreateIndexes = a3;
}

- (BOOL)needsToRecreateTriggers
{
  return self->_needsToRecreateTriggers;
}

- (void)setNeedsToRecreateTriggers:(BOOL)a3
{
  self->_needsToRecreateTriggers = a3;
}

- (BOOL)needsToRemoveLocationsForItemsMissingAssets
{
  return self->_needsToRemoveLocationsForItemsMissingAssets;
}

- (void)setNeedsToRemoveLocationsForItemsMissingAssets:(BOOL)a3
{
  self->_needsToRemoveLocationsForItemsMissingAssets = a3;
}

- (BOOL)needsToReloadStoreBookmarkMetadataIdentifiers
{
  return self->_needsToReloadStoreBookmarkMetadataIdentifiers;
}

- (void)setNeedsToReloadStoreBookmarkMetadataIdentifiers:(BOOL)a3
{
  self->_needsToReloadStoreBookmarkMetadataIdentifiers = a3;
}

- (BOOL)needsToReloadContainerMediaTypes
{
  return self->_needsToReloadContainerMediaTypes;
}

- (void)setNeedsToReloadContainerMediaTypes:(BOOL)a3
{
  self->_needsToReloadContainerMediaTypes = a3;
}

- (BOOL)needsToReloadCollectionRepresentativeItems
{
  return self->_needsToReloadCollectionRepresentativeItems;
}

- (void)setNeedsToReloadCollectionRepresentativeItems:(BOOL)a3
{
  self->_needsToReloadCollectionRepresentativeItems = a3;
}

- (BOOL)needsAnalyze
{
  return self->_needsAnalyze;
}

- (void)setNeedsAnalyze:(BOOL)a3
{
  self->_needsAnalyze = a3;
}

- (BOOL)needsToAutogenerateArtworkVariants
{
  return self->_needsToAutogenerateArtworkVariants;
}

- (void)setNeedsToAutogenerateArtworkVariants:(BOOL)a3
{
  self->_needsToAutogenerateArtworkVariants = a3;
}

- (BOOL)needsToUpdateSortMap
{
  return self->_needsToUpdateSortMap;
}

- (void)setNeedsToUpdateSortMap:(BOOL)a3
{
  self->_needsToUpdateSortMap = a3;
}

- (BOOL)forceUpdateOriginals
{
  return self->_forceUpdateOriginals;
}

- (void)setForceUpdateOriginals:(BOOL)a3
{
  self->_forceUpdateOriginals = a3;
}

- (BOOL)needsToMarkArtworkPurgeable
{
  return self->_needsToMarkArtworkPurgeable;
}

- (void)setNeedsToMarkArtworkPurgeable:(BOOL)a3
{
  self->_needsToMarkArtworkPurgeable = a3;
}

@end
