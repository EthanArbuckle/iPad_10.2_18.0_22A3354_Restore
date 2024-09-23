@implementation PHSmartAlbumChangeRequest

- (unsigned)customSortKey
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("customSortKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v5, "intValue");
  return v3;
}

- (void)setCustomSortKey:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("customSortKey"));

}

- (BOOL)customSortAscending
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("customSortAscending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("customSortAscending"));

}

- (id)initForNewObject
{
  PHSmartAlbumChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSmartAlbumChangeRequest;
  v2 = -[PHChangeRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

  }
  return v2;
}

- (PHSmartAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHSmartAlbumChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSmartAlbumChangeRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (PHSmartAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHSmartAlbumChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  const void *data;
  void *v15;
  uint64_t v16;
  PLQuery *userQuery;
  size_t length;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PHSmartAlbumChangeRequest;
  v11 = -[PHChangeRequest init](&v20, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      length = 0;
      data = xpc_dictionary_get_data(v8, "userQuery", &length);
      if (length)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D71A38], "constructQueryFromData:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        userQuery = v11->_userQuery;
        v11->_userQuery = (PLQuery *)v16;

      }
    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  id v5;
  xpc_object_t xdict;

  xdict = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", xdict);

  if (self->_userQuery)
  {
    objc_msgSend(MEMORY[0x1E0D71A38], "dataFromQuery:");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(xdict, "userQuery", (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

  }
}

- (id)managedEntityName
{
  return CFSTR("FetchingAlbum");
}

- (PHObjectPlaceholder)placeholderForCreatedSmartAlbum
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("title"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("title"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("title"));
  }

}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;

  v6 = a3;
  if (self->_userQuery)
  {
    -[PHSmartAlbumChangeRequest title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend((id)objc_opt_class(), "validateSmartAlbumTitle:error:", v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    v10 = v8 != 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Smart Album doesn't allow nil query"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v10)
    *a4 = objc_retainAutorelease(v9);
LABEL_7:

  return v10;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D71778], "insertNewSmartAlbumIntoLibrary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  if (a4 && !v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create asset collection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v8, v9, &v22);
  v12 = v22;

  if (v11)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("title")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("customSortKey")) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", CFSTR("customSortAscending")))
    {
      if ((objc_msgSend(v8, "canPerformEditOperation:", 64) & 1) != 0)
      {
        v13 = 1;
        goto LABEL_13;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on property %@"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = (void **)v26;
      v18 = &v25;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v24;
      v18 = &v23;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v20;
  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;
  PLQuery *userQuery;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isKindOfEntity:", v9);

  if (!v11 || objc_msgSend(v7, "kindValue") != 1507)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid album type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v22);
    v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    if (a5)
    {
      v14 = objc_retainAutorelease(v14);
      v19 = 0;
      *a5 = v14;
      goto LABEL_13;
    }
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  -[PHChangeRequest helper](self, "helper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v13 = objc_msgSend(v12, "applyMutationsToManagedObject:error:", v7, &v24);
  v14 = v24;

  if (!v13)
    goto LABEL_9;
  userQuery = self->_userQuery;
  if (userQuery)
  {
    v16 = (void *)MEMORY[0x1E0D71A38];
    v17 = v7;
    objc_msgSend(v16, "dataFromQuery:", userQuery);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserQueryData:", v18);

  }
  v19 = 1;
LABEL_13:

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSmartAlbumChangeRequest;
  -[PHSmartAlbumChangeRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSmartAlbumChangeRequest title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSmartAlbumChangeRequest userQuery](self, "userQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@ userQuery=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PLQuery)userQuery
{
  return self->_userQuery;
}

- (void)setUserQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQuery, 0);
}

+ (id)_changeRequestForSmartAlbum:(id)a3 userQuery:(id)a4
{
  id v5;
  id v6;
  PHSmartAlbumChangeRequest *v7;
  PHSmartAlbumChangeRequest *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isTransient") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = [PHSmartAlbumChangeRequest alloc];
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHSmartAlbumChangeRequest initWithUUID:objectID:](v8, "initWithUUID:objectID:", v9, v10);

    if (v6)
      -[PHSmartAlbumChangeRequest setUserQuery:](v7, "setUserQuery:", v6);
  }

  return v7;
}

+ (id)changeRequestForSmartAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "userQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_changeRequestForSmartAlbum:userQuery:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)creationRequestForSmartAlbumWithTitle:(id)a3 userQuery:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PHSmartAlbumChangeRequest initForNewObject]([PHSmartAlbumChangeRequest alloc], "initForNewObject");
  objc_msgSend(v7, "setTitle:", v6);

  objc_msgSend(v7, "setUserQuery:", v5);
  return v7;
}

+ (id)creationRequestForSmartAlbumCopyFromSmartAlbum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "assetCollectionType") == 2)
  {
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHSmartAlbumChangeRequest creationRequestForSmartAlbumWithTitle:userQuery:](PHSmartAlbumChangeRequest, "creationRequestForSmartAlbumWithTitle:userQuery:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Asset collection type is not a smart album: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)validateSmartAlbumTitle:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a3;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Empty title unsupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v8)
    *a4 = objc_retainAutorelease(v9);
LABEL_7:

  return v8;
}

+ (void)deleteSmartAlbumsFromAssetCollection:(id)a3
{
  objc_msgSend(a1, "_deleteSmartAlbums:withOperation:topLevelSelector:", a3, 0, a2);
}

+ (void)expungeSmartAlbumsFromAssetCollection:(id)a3
{
  objc_msgSend(a1, "_deleteSmartAlbums:withOperation:topLevelSelector:", a3, 1, a2);
}

+ (void)undeleteSmartAlbumsFromAssetCollection:(id)a3
{
  objc_msgSend(a1, "_deleteSmartAlbums:withOperation:topLevelSelector:", a3, 2, a2);
}

+ (void)_deleteSmartAlbums:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v7, a5, objc_opt_class());
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), a4, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

@end
