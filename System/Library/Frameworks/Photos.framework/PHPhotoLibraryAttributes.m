@implementation PHPhotoLibraryAttributes

- (PHPhotoLibraryAttributes)initWithLibraryIdentifier:(id)a3 cplSettings:(id)a4
{
  id v7;
  id v8;
  PHPhotoLibraryAttributes *v9;
  PHPhotoLibraryAttributes *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *userDescription;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHPhotoLibraryAttributes;
  v9 = -[PHPhotoLibraryAttributes init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pl_libraryIdentifier, a3);
    objc_storeStrong((id *)&v10->_cplSettings, a4);
    -[PLPhotoLibraryIdentifier name](v10->_pl_libraryIdentifier, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    -[PLPhotoLibraryIdentifier userDescription](v10->_pl_libraryIdentifier, "userDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    userDescription = v10->_userDescription;
    v10->_userDescription = (NSString *)v13;

  }
  return v10;
}

- (BOOL)isCloudSyncEnabled
{
  void *v2;
  char v3;

  -[PHPhotoLibraryAttributes cplSettings](self, "cplSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isICPLEnabled");

  return v3;
}

- (unsigned)cloudResourcePrefetchMode
{
  void *v2;
  uint64_t v3;

  -[PHPhotoLibraryAttributes cplSettings](self, "cplSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefetchMode");

  if (v3 == 1)
    return 2;
  else
    return v3 == 0;
}

- (PHPhotoLibraryIdentifier)identifier
{
  return (PHPhotoLibraryIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (PLPhotoLibraryIdentifier)pl_libraryIdentifier
{
  return (PLPhotoLibraryIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (PLCPLSettings)cplSettings
{
  return (PLCPLSettings *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cplSettings, 0);
  objc_storeStrong((id *)&self->_pl_libraryIdentifier, 0);
}

@end
