@implementation PHObjectDeleteRequest

- (PHObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHObjectDeleteRequest *v9;

  v6 = a4;
  v7 = a3;
  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHObjectDeleteRequest initWithUUID:request:objectID:](self, "initWithUUID:request:objectID:", v7, v8, v6);

  return v9;
}

- (PHObjectDeleteRequest)initWithUUID:(id)a3 request:(id)a4 objectID:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHObjectDeleteRequest *v12;
  PHObjectDeleteRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHObjectDeleteRequest;
  v12 = -[PHChangeRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_objectID, a5);
    objc_msgSend(v10, "recordDeleteRequest:", v13);
  }

  return v13;
}

- (id)initForNewObject
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[PHObjectDeleteRequest initForNewObject] unsupported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PHObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PHObjectDeleteRequest *v15;
  uint64_t v16;
  NSString *clientName;
  uint64_t v18;
  NSString *clientBundleID;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "persistentStoreCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v8, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    PLManagedObjectIDFromXPCValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  PLStringFromXPCDictionary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PHObjectDeleteRequest initWithUUID:request:objectID:](self, "initWithUUID:request:objectID:", v14, v10, v13);

  if (v15)
  {
    v15->_clientEntitled = objc_msgSend(v9, "photoKitEntitled");
    objc_msgSend(v9, "trustedCallerDisplayName");
    v16 = objc_claimAutoreleasedReturnValue();
    clientName = v15->_clientName;
    v15->_clientName = (NSString *)v16;

    objc_msgSend(v9, "trustedCallerBundleID");
    v18 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v15->_clientBundleID;
    v15->_clientBundleID = (NSString *)v18;

  }
  return v15;
}

- (PHObjectDeleteRequest)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[PHObjectDeleteRequest init] unsupported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PHObjectDeleteRequest uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PHObjectDeleteRequest objectID](self, "objectID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetManagedObjectID();

}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  return 1;
}

- (NSString)managedEntityName
{
  void *v2;
  void *v3;

  -[NSManagedObjectID entity](self->_objectID, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)uuid
{
  return self->_uuid;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (BOOL)isClientEntitled
{
  return self->_clientEntitled;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)deleteRequestForObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithUUID:objectID:", v6, v7);
  return v8;
}

+ (id)deleteRequestsForObjects:(id)a3 ofType:(Class)a4 forSelector:(SEL)a5
{
  id v8;
  void *v9;

  v8 = a3;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  +[PHObject assertAllObjects:forSelector:areOfType:](PHObject, "assertAllObjects:forSelector:areOfType:", v8, a2, a4);
  objc_msgSend(a1, "_deleteRequestsForObjects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_deleteRequestsForObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_pl_addNonNilObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
