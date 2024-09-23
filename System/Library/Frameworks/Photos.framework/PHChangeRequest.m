@implementation PHChangeRequest

- (PHChangeRequest)init
{
  PHChangeRequest *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHChangeRequest;
  v2 = -[PHChangeRequest init](&v5, sel_init);
  if (v2 && (PLIsAssetsd() & 1) == 0)
  {
    +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
    objc_msgSend((id)objc_opt_class(), "photoLibraryForCurrentTransaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_photoLibrary, v3);

  }
  return v2;
}

- (NSManagedObjectID)objectID
{
  return -[PHChangeRequestHelper objectID](self->_helper, "objectID");
}

- (BOOL)isClientEntitled
{
  return -[PHChangeRequestHelper isClientEntitled](self->_helper, "isClientEntitled");
}

- (NSString)clientName
{
  return -[PHChangeRequestHelper clientDisplayName](self->_helper, "clientDisplayName");
}

- (NSString)clientBundleID
{
  return -[PHChangeRequestHelper clientBundleIdentifier](self->_helper, "clientBundleIdentifier");
}

- (NSString)managedEntityName
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (PHChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ must implement %@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v11, "initWithName:reason:userInfo:", v12, v17, 0);

  objc_exception_throw(objc_retainAutorelease(v18));
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ must implement %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithName:reason:userInfo:", v6, v11, 0);

  PLPhotoKitGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v12, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[PHChangeRequest createManagedObjectForInsertIntoPhotoLibrary:error:]";
    v18 = 2114;
    v19 = v14;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_FAULT, "Exception in %s: %{public}@", buf, 0x16u);

  }
  return 0;
}

- (void)performConcurrentWork
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  return -[PHChangeRequestHelper applyMutationsToManagedObject:error:](self->_helper, "applyMutationsToManagedObject:error:", a3, a5);
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  return -[PHChangeRequestHelper validateMutationsToManagedObject:error:](self->_helper, "validateMutationsToManagedObject:error:", a3, a4);
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  return -[PHChangeRequestHelper allowMutationToManagedObject:propertyKey:error:](self->_helper, "allowMutationToManagedObject:propertyKey:error:", a3, a4, a5);
}

- (BOOL)isNewRequest
{
  void *v2;
  char v3;

  -[PHChangeRequest helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNewRequest");

  return v3;
}

- (id)initForNewObject
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (BOOL)isMutated
{
  void *v2;
  char v3;

  -[PHChangeRequest helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMutated");

  return v3;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PHChangeRequest helper](self, "helper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PHChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ must implement %@"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v8, "initWithName:reason:userInfo:", v9, v14, 0);

  objc_exception_throw(objc_retainAutorelease(v15));
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ must implement %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithName:reason:userInfo:", v6, v11, 0);

  objc_exception_throw(objc_retainAutorelease(v12));
}

- (PLChangesForServiceHandling)changesForServiceHandler
{
  return 0;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (NSString)changeTypeForSummary
{
  void *v2;

  -[PHChangeRequest managedEntityName](self, "managedEntityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "prepareForPhotoLibraryCheck:error:", v6, a4);
  else
    v9 = 1;

  return v9;
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "prepareForServicePreflightCheck:", a3);
  else
    v6 = 1;

  return v6;
}

- (void)didMutate
{
  -[PHChangeRequestHelper didMutate](self->_helper, "didMutate");
}

- (BOOL)shouldPerformConcurrentWork
{
  return self->_shouldPerformConcurrentWork;
}

- (void)setShouldPerformConcurrentWork:(BOOL)a3
{
  self->_shouldPerformConcurrentWork = a3;
}

- (PHChangeRequestHelper)helper
{
  return self->_helper;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_helper, 0);
}

+ (id)sanitizedFailureWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D74498]);

    v7 = v4;
    if (v6)
    {
      PHErrorFromPLError(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D72460]);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithUnderlyingError:localizedDescription:", v4, CFSTR("Shared Album change failed"));
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(v7, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PHPhotosErrorDomain"));

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLPhotoKitGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Failed to santize unexpected error from change processing: %@", buf, 0xCu);
      }

      v21 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ph_genericErrorWithLocalizedDescription:", CFSTR("Changes failed with error %@"), v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Unexpected failure with nil error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_FAULT, "Unexpected failure with nil error", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
