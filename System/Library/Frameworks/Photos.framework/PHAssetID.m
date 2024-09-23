@implementation PHAssetID

- (void)loadFromAsset:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *uuid;
  void *v8;
  NSString *v9;
  NSString *directory;
  void *v11;
  NSString *v12;
  NSString *filename;
  void *v14;
  PLPhotoLibraryPathManagerIdentifier *v15;
  PLPhotoLibraryPathManagerIdentifier *libraryID;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  uuid = self->_uuid;
  self->_uuid = v6;

  objc_msgSend(v4, "directory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  directory = self->_directory;
  self->_directory = v9;

  objc_msgSend(v4, "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  filename = self->_filename;
  self->_filename = v12;

  objc_msgSend(v4, "libraryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (PLPhotoLibraryPathManagerIdentifier *)objc_msgSend(v14, "copy");
  libraryID = self->_libraryID;
  self->_libraryID = v15;

  LOWORD(v14) = objc_msgSend(v4, "bundleScope");
  self->_bundleScope = (unsigned __int16)v14;
}

- (void)prepareForReuse
{
  NSString *uuid;
  NSString *directory;
  NSString *filename;
  PLPhotoLibraryPathManagerIdentifier *libraryID;

  uuid = self->_uuid;
  self->_uuid = 0;

  directory = self->_directory;
  self->_directory = 0;

  filename = self->_filename;
  self->_filename = 0;

  libraryID = self->_libraryID;
  self->_libraryID = 0;

  self->_bundleScope = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetID *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PHAssetID);
  -[PHAssetID uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetID setUuid:](v4, "setUuid:", v5);

  -[PHAssetID directory](self, "directory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetID setDirectory:](v4, "setDirectory:", v6);

  -[PHAssetID filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetID setFilename:](v4, "setFilename:", v7);

  -[PHAssetID libraryID](self, "libraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetID setLibraryID:](v4, "setLibraryID:", v8);

  -[PHAssetID setBundleScope:](v4, "setBundleScope:", -[PHAssetID bundleScope](self, "bundleScope"));
  return v4;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
