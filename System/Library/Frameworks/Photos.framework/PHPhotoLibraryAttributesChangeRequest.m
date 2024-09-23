@implementation PHPhotoLibraryAttributesChangeRequest

- (PHPhotoLibraryAttributesChangeRequest)init
{
  PHPhotoLibraryAttributesChangeRequest *v2;
  void *v3;
  void *v4;
  PLPhotoLibraryAttributesChanges *v5;
  void *changes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHPhotoLibraryAttributesChangeRequest;
  v2 = -[PHPhotoLibraryAttributesChangeRequest init](&v8, sel_init);
  if (v2)
  {
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "recordOtherChangeRequest:", v2);
      v5 = (PLPhotoLibraryAttributesChanges *)objc_alloc_init(MEMORY[0x1E0D719B8]);
      changes = v2->_changes;
      v2->_changes = v5;
    }
    else
    {
      changes = v2;
      v2 = 0;
    }

  }
  return v2;
}

- (NSString)changeTypeForSummary
{
  return (NSString *)CFSTR("LibraryAttributes");
}

- (void)setName:(id)a3
{
  -[PLPhotoLibraryAttributesChanges setName:](self->_changes, "setName:", a3);
}

- (NSString)name
{
  return (NSString *)-[PLPhotoLibraryAttributesChanges name](self->_changes, "name");
}

- (void)setUserDescription:(id)a3
{
  -[PLPhotoLibraryAttributesChanges setUserDescription:](self->_changes, "setUserDescription:", a3);
}

- (NSString)userDescription
{
  return (NSString *)-[PLPhotoLibraryAttributesChanges userDescription](self->_changes, "userDescription");
}

- (void)setEnableCloudSync:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryAttributesChanges setEnableCloudSyncValue:](self->_changes, "setEnableCloudSyncValue:", v4);

}

- (BOOL)enableCloudSync
{
  void *v2;
  char v3;

  -[PLPhotoLibraryAttributesChanges enableCloudSyncValue](self->_changes, "enableCloudSyncValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCloudResourcePrefetchMode:(unsigned __int16)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = 1;
  if (a3 != 2)
    v4 = 2;
  if (a3 == 1)
    v5 = 0;
  else
    v5 = v4;
  if (v5 == 2)
  {
    -[PLPhotoLibraryAttributesChanges setCloudResourcePrefetchModeValue:](self->_changes, "setCloudResourcePrefetchModeValue:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryAttributesChanges setCloudResourcePrefetchModeValue:](self->_changes, "setCloudResourcePrefetchModeValue:", v6);

  }
}

- (unsigned)cloudResourcePrefetchMode
{
  void *v2;
  uint64_t v3;

  -[PLPhotoLibraryAttributesChanges cloudResourcePrefetchModeValue](self->_changes, "cloudResourcePrefetchModeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 == 1)
    return 2;
  else
    return v3 == 0;
}

- (PLChangesForServiceHandling)changesForServiceHandler
{
  return self->_changes;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "type");
  v6 = v5;
  if (a4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Change must be performed within the sharedPhotoLibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 0;
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
