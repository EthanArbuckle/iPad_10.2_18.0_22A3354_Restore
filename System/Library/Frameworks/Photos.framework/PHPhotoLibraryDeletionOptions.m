@implementation PHPhotoLibraryDeletionOptions

- (BOOL)deleteCloudSyncLibrary
{
  return self->_deleteCloudSyncLibrary;
}

- (void)setDeleteCloudSyncLibrary:(BOOL)a3
{
  self->_deleteCloudSyncLibrary = a3;
}

@end
