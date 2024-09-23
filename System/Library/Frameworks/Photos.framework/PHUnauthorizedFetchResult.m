@implementation PHUnauthorizedFetchResult

- (PHUnauthorizedFetchResult)initWithOptions:(id)a3 status:(int64_t)a4 fetchBlock:(id)a5
{
  id v8;
  id v9;
  PHUnauthorizedFetchResult *v10;
  uint64_t v11;
  NSArray *objects;
  uint64_t v13;
  NSOrderedSet *objectIDs;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  PHFetchOptions *options;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSError *fetchError;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  PHFetchOptions *v28;
  uint64_t v29;
  id fetchBlock;
  objc_super v32;

  v8 = a3;
  v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PHUnauthorizedFetchResult;
  v10 = -[PHFetchResult init](&v32, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    objects = v10->_objects;
    v10->_objects = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v13 = objc_claimAutoreleasedReturnValue();
    objectIDs = v10->_objectIDs;
    v10->_objectIDs = (NSOrderedSet *)v13;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v8, "copy");
    options = v10->_options;
    v10->_options = (PHFetchOptions *)v18;

    switch(a4)
    {
      case 0:
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = 5102;
        goto LABEL_6;
      case 1:
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = 3310;
        goto LABEL_9;
      case 2:
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = 3311;
LABEL_9:
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v26, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v22 = 0;
        fetchError = v10->super._fetchError;
        v10->super._fetchError = (NSError *)v27;
        goto LABEL_10;
      case 3:
      case 4:
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = -1;
LABEL_6:
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v21, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        fetchError = v10->super._fetchError;
        v10->super._fetchError = (NSError *)v23;
        v22 = 1;
LABEL_10:

        break;
      default:
        v22 = 0;
        break;
    }
    v28 = v10->_options;
    if (!v28 || -[PHFetchOptions wantsIncrementalChangeDetails](v28, "wantsIncrementalChangeDetails"))
    {
      v29 = objc_msgSend(v9, "copy");
      fetchBlock = v10->_fetchBlock;
      v10->_fetchBlock = (id)v29;

      if (v22)
        -[PHFetchResult setRegisteredForChangeNotificationDeltas:](v10, "setRegisteredForChangeNotificationDeltas:", 1);
    }
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHUnauthorizedFetchResult;
  if (-[PHUnauthorizedFetchResult isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[PHUnauthorizedFetchResult identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[PHUnauthorizedFetchResult identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHUnauthorizedFetchResult;
    v5 = -[PHUnauthorizedFetchResult hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)calculateMediaTypeCounts
{
  return -[PHFetchResultMediaTypeCounts initWithPhotosCount:videosCount:audiosCount:]([PHFetchResultMediaTypeCounts alloc], "initWithPhotosCount:videosCount:audiosCount:", 0, 0, 0);
}

- (BOOL)isFullyBackedByObjectIDs
{
  return 0;
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  return -[PHUnauthorizedFetchResult fetchResultWithChangeHandlingValue:](self, "fetchResultWithChangeHandlingValue:", 0, a4, a5);
}

- (id)photoLibrary
{
  return +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", self->_options, 0);
}

- (id)fetchRequest
{
  return 0;
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (int64_t)collectionFetchType
{
  return 1;
}

- (id)containerIdentifier
{
  return 0;
}

- (id)fetchedObjectIDs
{
  return 0;
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
  -[PHFetchResult setRegisteredForChangeNotificationDeltas:](self, "setRegisteredForChangeNotificationDeltas:", 1);
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  return 15;
}

- (PHUnauthorizedFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  void (**fetchBlock)(id, PHFetchOptions *);
  PHUnauthorizedFetchResult *v5;

  if (+[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:](PHPhotoLibrary, "checkAuthorizationStatusForAPIAccessLevel:", 2)&& (fetchBlock = (void (**)(id, PHFetchOptions *))self->_fetchBlock) != 0)
  {
    fetchBlock[2](fetchBlock, self->_options);
    v5 = (PHUnauthorizedFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHUnauthorizedFetchResult;
  -[PHFetchResult description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (PHFetchOptions)options
{
  return (PHFetchOptions *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (NSOrderedSet)objectIDs
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 176, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_fetchBlock, 0);
}

@end
