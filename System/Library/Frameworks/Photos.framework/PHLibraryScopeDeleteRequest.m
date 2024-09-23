@implementation PHLibraryScopeDeleteRequest

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHLibraryScopeDeleteRequest;
  v24 = 0;
  v7 = -[PHObjectDeleteRequest validateForDeleteManagedObject:error:](&v23, sel_validateForDeleteManagedObject_error_, v6, &v24);
  v8 = v24;
  if (v7)
  {
    if (!-[PHLibraryScopeDeleteRequest operation](self, "operation")
      && objc_msgSend(v6, "trashedState") == 1)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LibraryScope is already is trash state"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v10;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (void **)v30;
      v13 = &v29;
LABEL_15:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v8 = (id)v21;
      goto LABEL_16;
    }
    if (-[PHLibraryScopeDeleteRequest operation](self, "operation") == 1
      && !objc_msgSend(v6, "trashedState"))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LibraryScope is not is trash state"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v28;
      v13 = &v27;
      goto LABEL_15;
    }
    if (-[PHLibraryScopeDeleteRequest photosctlExpungeOverride](self, "photosctlExpungeOverride")
      || -[PHLibraryScopeDeleteRequest operation](self, "operation") != 2)
    {
      v14 = 1;
      goto LABEL_19;
    }
    v15 = objc_msgSend(v6, "libraryScopeIsActive");
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A LibraryScope that's actively syncing cannot be expunged. Use -[PHLibraryScope startExitFromLibraryScopeWithRetentionPolicy:completion:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v19;
    }
    v14 = v15 ^ 1;
  }
  else
  {
    v14 = 0;
  }
LABEL_16:
  if (a4 && (v14 & 1) == 0)
  {
    v8 = objc_retainAutorelease(v8);
    v14 = 0;
    *a4 = v8;
  }
LABEL_19:

  return v14;
}

- (PHLibraryScopeDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  PHLibraryScopeDeleteRequest *v9;
  objc_super v11;

  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHLibraryScopeDeleteRequest;
  v9 = -[PHObjectDeleteRequest initWithXPCDict:request:clientAuthorization:](&v11, sel_initWithXPCDict_request_clientAuthorization_, v8, a4, a5);
  if (v9)
  {
    v9->_operation = xpc_dictionary_get_int64(v8, "deleteOperation");
    v9->_photosctlExpungeOverride = xpc_dictionary_get_BOOL(v8, "photosctlExpungeOverride");
  }

  return v9;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHLibraryScopeDeleteRequest;
  v4 = a3;
  -[PHObjectDeleteRequest encodeToXPCDict:](&v5, sel_encodeToXPCDict_, v4);
  xpc_dictionary_set_int64(v4, "deleteOperation", self->_operation);
  xpc_dictionary_set_BOOL(v4, "photosctlExpungeOverride", self->_photosctlExpungeOverride);

}

- (void)deleteManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v5;
  int64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[PHLibraryScopeDeleteRequest operation](self, "operation");
  switch(v6)
  {
    case 2:
      v10 = 0;
      v7 = objc_msgSend(v5, "incrementallyDeleteAndSaveWithError:", &v10);
      v8 = v10;
      if ((v7 & 1) == 0)
      {
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v8;
          _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to incrementally delete scope: %@", buf, 0xCu);
        }

      }
      break;
    case 1:
      objc_msgSend(v5, "untrash");
      break;
    case 0:
      objc_msgSend(v5, "trash");
      break;
  }

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (BOOL)photosctlExpungeOverride
{
  return self->_photosctlExpungeOverride;
}

- (void)setPhotosctlExpungeOverride:(BOOL)a3
{
  self->_photosctlExpungeOverride = a3;
}

@end
