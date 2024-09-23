@implementation HDAttachmentManager

- (id)schemaProviderClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDAttachmentManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDAttachmentManager)initWithProfile:(id)a3
{
  id v4;
  HDAttachmentManager *v5;
  HDAttachmentManager *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *schemaProvidersByIdentifier;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  NSString *filesDirectoryPath;
  id v14;
  void *v15;
  uint64_t v16;
  NSString *unconfirmedFilesDirectoryPath;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDAttachmentManager;
  v5 = -[HDAttachmentManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, 0);

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    schemaProvidersByIdentifier = v6->_schemaProvidersByIdentifier;
    v6->_schemaProvidersByIdentifier = v8;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "directoryPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Files"));
    v12 = objc_claimAutoreleasedReturnValue();
    filesDirectoryPath = v6->_filesDirectoryPath;
    v6->_filesDirectoryPath = (NSString *)v12;

    v14 = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(v14, "directoryPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("UnconfirmedFiles"));
    v16 = objc_claimAutoreleasedReturnValue();
    unconfirmedFilesDirectoryPath = v6->_unconfirmedFilesDirectoryPath;
    v6->_unconfirmedFilesDirectoryPath = (NSString *)v16;

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HDAttachmentManager;
  -[HDAttachmentManager dealloc](&v6, sel_dealloc);
}

- (NSURL)filesDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_filesDirectoryPath, 1);
}

- (NSURL)unconfirmedFilesDirectoryURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_unconfirmedFilesDirectoryPath, 1);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "daemon");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analyticsSubmissionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:queue:", self, 0);

}

- (uint64_t)createFileDirectoriesWithError:(void *)a1
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(a1, "filesDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v6 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v18);
  v7 = v18;

  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "filesDirectoryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Unable to create directory (%@). Error: %{public}@", buf, 0x16u);

    }
    v11 = v7;
    if (!v11)
    {
      v9 = 1;
      goto LABEL_15;
    }
    if (!a2)
      goto LABEL_8;
    goto LABEL_13;
  }
  objc_msgSend(a1, "unconfirmedFilesDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v9 = 1;
  v10 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v17);
  v11 = v17;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "unconfirmedFilesDirectoryURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2114;
      v22 = v11;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Unable to create directory (%@). Error: %{public}@", buf, 0x16u);

    }
    v11 = v11;
    if (!v11)
      goto LABEL_15;
    if (!a2)
    {
LABEL_8:
      _HKLogDroppedError();
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:
    v11 = objc_retainAutorelease(v11);
    v9 = 0;
    *a2 = v11;
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (uint64_t)_validateAttachment:(void *)a3 toObjectWithIdentifier:(uint64_t)a4 schemaIdentifier:(void *)a5 metadata:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  uint64_t v16;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    objc_msgSend(a1, "schemaProviderForIdentifier:error:", a4, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 2);
      v16 = objc_msgSend(v14, "validateAttachment:forObjectWithIdentifier:metadata:profile:error:", v11, v12, v13, WeakRetained, a6);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id WeakRetained;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__101;
  v40 = __Block_byref_object_dispose__101;
  v41 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __105__HDAttachmentManager_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_error___block_invoke;
  v33[3] = &unk_1E6CF9DE8;
  v16 = v12;
  v34 = v16;
  v35 = &v36;
  if (-[HDAttachmentManager attachmentReferencesForObjectIdentifier:schemaIdentifier:error:enumerationHandler:](self, "attachmentReferencesForObjectIdentifier:schemaIdentifier:error:enumerationHandler:", v13, v14, a7, v33))
  {
    if (v37[5])
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 115, CFSTR("The attachment with identifier %@ is already attached to object %@."), v37[5], v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if (a7)
        {
          v18 = objc_retainAutorelease(v17);
          v19 = 0;
          *a7 = v18;
        }
        else
        {
          _HKLogDroppedError();
          v19 = 0;
        }
        v20 = v18;
      }
      else
      {
        v20 = 0;
        v19 = 0;
      }
      goto LABEL_24;
    }
    if ((-[HDAttachmentManager _validateAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:]((id *)&self->super.isa, v16, v13, (uint64_t)v14, v15, (uint64_t)a7) & 1) != 0)
    {
      objc_msgSend(v16, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v32 = 0;
      +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v21, WeakRetained, &v32);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v32;

      if (v18)
      {
        -[HDAttachmentManager _addReferenceWithAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:](self, "_addReferenceWithAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:", v18, v13, v14, v15, a7);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB62E0]);
          objc_msgSend(v23, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "creationDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v24, "_initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:", v31, v13, v16, v25, v26);

LABEL_23:
LABEL_24:

          goto LABEL_25;
        }
LABEL_22:
        v19 = 0;
        goto LABEL_23;
      }
      if (v20)
      {
        v23 = v20;
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v16, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hk_error:format:", 118, CFSTR("The attachment with identifier %@ was not found."), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v29;
        if (!v23)
        {
          v20 = 0;
          goto LABEL_22;
        }
      }
      if (a7)
      {
        v23 = objc_retainAutorelease(v23);
        v19 = 0;
        *a7 = v23;
      }
      else
      {
        _HKLogDroppedError();
        v19 = 0;
      }
      v20 = v23;
      goto LABEL_23;
    }
  }
  v19 = 0;
LABEL_25:

  _Block_object_dispose(&v36, 8);
  return v19;
}

uint64_t __105__HDAttachmentManager_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "attachmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return v5 ^ 1u;
}

- (id)addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  off_t st_size;
  void *v24;
  void *v25;
  id WeakRetained;
  uint64_t v27;
  HDAttachment *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDAttachment *v34;
  void *v35;
  HDAttachmentReferenceSchemaIdentifier *v36;
  void *v37;
  HDAttachmentReferenceSchemaIdentifier *v38;
  HDAttachmentReference *v39;
  void *v40;
  void *v41;
  HDAttachmentReference *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int *v47;
  id v48;
  id v49;
  void *v50;
  HDAttachment *v51;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  HDAttachment *v56;
  void *v57;
  off_t v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  stat v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  memset(&v67, 0, sizeof(v67));
  if (fstat(objc_msgSend(v18, "fileDescriptor"), &v67) < 0)
  {
    v64 = v16;
    v45 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *__error();
    v47 = __error();
    objc_msgSend(v45, "hk_error:format:", 102, CFSTR("Cannot determine file size: %d: %s"), v46, strerror(*v47));
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      if (a10)
      {
        v49 = objc_retainAutorelease(v48);
        v44 = 0;
        *a10 = v49;
      }
      else
      {
        _HKLogDroppedError();
        v44 = 0;
      }
      v24 = v49;
    }
    else
    {
      v24 = 0;
      v44 = 0;
    }
    goto LABEL_34;
  }
  st_size = v67.st_size;
  +[HDEncryptedArchiveSymmetricKey randomKeyWithError:](HDEncryptedArchiveSymmetricKey, "randomKeyWithError:", a10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v58 = st_size;
    v64 = v16;
    v66 = 0;
    -[HDAttachmentManager schemaProviderForIdentifier:error:](self, "schemaProviderForIdentifier:error:", v20, &v66);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v66;
    v63 = v25;
    if (v25)
    {
      v57 = v22;
      v60 = v21;
      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      else
        WeakRetained = 0;
      v65 = 0;
      v27 = objc_msgSend(v25, "schemaVersionForObjectIdentifier:profile:error:", v19, WeakRetained, &v65);
      v56 = (HDAttachment *)v65;

      v61 = v17;
      if (v27 > 0)
      {
        v53 = v27;
        v54 = v18;
        v28 = [HDAttachment alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v55 = (uint64_t)v20;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UUIDString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = v19;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[HDAttachment initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:](v28, "initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:", v29, v16, v17, v31, v58, v33, v60, v24);

        v20 = (id)v55;
        -[HDAttachment hkAttachment](v34, "hkAttachment");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v32;
        v22 = v57;
        LODWORD(v32) = -[HDAttachmentManager _validateAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:error:]((id *)&self->super.isa, v35, v32, v55, v57, (uint64_t)a10);

        if ((_DWORD)v32)
        {
          v36 = [HDAttachmentReferenceSchemaIdentifier alloc];
          -[HDAttachment identifier](v34, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v36, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v55, v53, v59, v37);

          v39 = [HDAttachmentReference alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:](v39, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:", v40, v38, v41, 0, v57);

          v68[0] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v54;
          LODWORD(v40) = -[HDAttachmentManager insertAttachmentReferences:attachment:fileHandle:encrypt:error:](self, "insertAttachmentReferences:attachment:fileHandle:encrypt:error:", v43, v34, v54, 1, a10);

          objc_msgSend(v54, "closeFile");
          v44 = 0;
          if ((_DWORD)v40)
          {
            -[HDAttachmentReference hkAttachmentReferenceWithAttachment:](v42, "hkAttachmentReferenceWithAttachment:", v34);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v17 = v61;
          v19 = v59;
          v20 = (id)v55;
        }
        else
        {
          v44 = 0;
          v18 = v54;
          v19 = v59;
        }
        v21 = v60;
        v51 = v56;
        goto LABEL_33;
      }
      if (v27 == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("The object type is not supported"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v57;
      }
      else
      {
        v50 = v56;
        v22 = v57;
      }
      v21 = v60;
      v34 = v50;
      if (!v34)
      {
        v51 = 0;
        v44 = 0;
LABEL_32:
        v17 = v61;
        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("No schema provider found for identifier '%@'"), v20);
      v34 = (HDAttachment *)(id)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        v51 = 0;
        v44 = 0;
LABEL_33:

        v49 = v62;
LABEL_34:

        v16 = v64;
        goto LABEL_35;
      }
      v61 = v17;
    }
    if (a10)
    {
      v34 = objc_retainAutorelease(v34);
      v44 = 0;
      *a10 = v34;
    }
    else
    {
      _HKLogDroppedError();
      v44 = 0;
    }
    v51 = v34;
    goto LABEL_32;
  }
  v44 = 0;
LABEL_35:

  return v44;
}

- (id)_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  HDAttachmentReferenceSchemaIdentifier *v19;
  void *v20;
  HDAttachmentReferenceSchemaIdentifier *v21;
  HDAttachmentReference *v22;
  void *v23;
  void *v24;
  HDAttachmentReference *v25;
  id WeakRetained;
  BOOL v27;
  HDAttachmentReference *v28;
  HDAttachmentReference *v29;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HDAttachmentManager schemaProviderForIdentifier:error:](self, "schemaProviderForIdentifier:error:", v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    && (!self ? (v17 = 0) : (v17 = objc_loadWeakRetained((id *)&self->_profile)),
        v18 = objc_msgSend(v16, "schemaVersionForObjectIdentifier:profile:error:", v13, v17, a7),
        v17,
        v18 >= 1))
  {
    v19 = [HDAttachmentReferenceSchemaIdentifier alloc];
    objc_msgSend(v12, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v19, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v14, v18, v13, v20);

    v22 = [HDAttachmentReference alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:](v22, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:", v23, v21, v24, 0, v15);

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    LODWORD(v24) = +[HDAttachmentReferenceEntity insertReference:profile:error:](HDAttachmentReferenceEntity, "insertReference:profile:error:", v25, WeakRetained, a7);

    v27 = (_DWORD)v24 == 0;
    v12 = v31;
    if (v27)
      v28 = 0;
    else
      v28 = v25;
    v29 = v28;

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HDInsertAttachmentOperation *v10;
  BOOL v11;

  v8 = a4;
  v9 = a3;
  v10 = -[HDInsertAttachmentOperation initWithAttachmentReferences:attachment:fileOnDisk:]([HDInsertAttachmentOperation alloc], "initWithAttachmentReferences:attachment:fileOnDisk:", v9, v8, 0);

  if (self)
    self = (HDAttachmentManager *)objc_loadWeakRetained((id *)&self->_profile);
  v11 = -[HDJournalableOperation performOrJournalWithProfile:error:](v10, "performOrJournalWithProfile:error:", self, a5);

  return v11;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileHandle:(id)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  HDInsertAttachmentOperation *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  id v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int *v33;
  char *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char *v57;
  NSObject *v58;
  void *v59;
  int *v60;
  char *v61;
  NSObject *v62;
  char v63;
  char *v64;
  NSObject *v65;
  char *v66;
  char *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  char *v71;
  id WeakRetained;
  char *v74;
  char *v75;
  _BOOL4 v76;
  id v77;
  id v78;
  id *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  HDInsertAttachmentOperation *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[2];
  _QWORD v93[2];
  uint8_t buf[4];
  HDAttachmentManager *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  char *v99;
  uint64_t v100;

  v8 = a6;
  v100 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a3;
  v15 = -[HDInsertAttachmentOperation initWithAttachmentReferences:attachment:fileOnDisk:]([HDInsertAttachmentOperation alloc], "initWithAttachmentReferences:attachment:fileOnDisk:", v14, v12, 1);

  v87 = 0;
  LOBYTE(a5) = -[HDAttachmentManager createFileDirectoriesWithError:](self, &v87);
  v16 = v87;
  v17 = v16;
  if ((a5 & 1) != 0)
  {
    v85 = v13;
    -[HDAttachmentManager unconfirmedFilesDirectoryURL](self, "unconfirmedFilesDirectoryURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v21, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v22;
    LOBYTE(v22) = objc_msgSend(v22, "createFileAtPath:contents:attributes:", v23, 0, 0);

    v84 = v15;
    if ((v22 & 1) != 0)
    {
      v86 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v21, &v86);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v86;
      if (v24)
      {
        objc_msgSend(v12, "encryptionKey");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (id)v25;
        v13 = v85;
        v79 = a7;
        if (v8 && v25)
        {
          v27 = +[HDEncryptedArchive encryptContentsOfFileHandle:to:key:error:](HDEncryptedArchive, "encryptContentsOfFileHandle:to:key:error:", v85, v24, v25, a7);
          objc_msgSend(v24, "closeFile");
          if (!v27)
            goto LABEL_63;
        }
        else
        {
          objc_msgSend(v21, "path");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v12;
          v41 = v85;
          v42 = v24;
          v78 = v40;
          v80 = v41;
          v81 = v42;
          if (self)
          {
            v43 = (uint64_t *)MEMORY[0x1E0C85AD8];
            v44 = *MEMORY[0x1E0C85AD8];
            v91 = 0;
            objc_msgSend(v41, "readDataUpToLength:error:", v44, &v91);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v91;
            if (v46)
            {
LABEL_28:
              v47 = v45;
              v45 = v46;
              objc_msgSend(v81, "closeFile");
              _HKInitializeLogging();
              v48 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v95 = self;
                v96 = 2114;
                v97 = v78;
                v98 = 2114;
                v99 = (char *)v45;
                _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file from source for URL %{public}@. %{public}@", buf, 0x20u);
              }
              if (v79)
              {
                v76 = 0;
                *v79 = objc_retainAutorelease(v45);
              }
              else
              {
                _HKLogDroppedError();
                v76 = 0;
              }
            }
            else
            {
              while (v45 && objc_msgSend(v45, "length"))
              {
                v49 = v24;
                v50 = v17;
                v90 = 0;
                v51 = objc_msgSend(v42, "writeData:error:", v45, &v90);
                v52 = v90;
                v47 = v52;
                if ((v51 & 1) == 0)
                {
                  objc_msgSend(v81, "closeFile");
                  _HKInitializeLogging();
                  v68 = *MEMORY[0x1E0CB52B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v95 = self;
                    v96 = 2114;
                    v97 = v78;
                    v98 = 2114;
                    v99 = 0;
                    _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to write file to URL %{public}@. %{public}@", buf, 0x20u);
                  }
                  v76 = 1;
                  v17 = v50;
                  v24 = v49;
                  goto LABEL_57;
                }

                v53 = *v43;
                v91 = 0;
                objc_msgSend(v80, "readDataUpToLength:error:", v53, &v91);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v91;
                v42 = v81;
                v17 = v50;
                v24 = v49;
                if (v46)
                  goto LABEL_28;
              }
              objc_msgSend(v42, "closeFile");

              v54 = *MEMORY[0x1E0CB2AB8];
              v55 = *MEMORY[0x1E0CB2AA8];
              v92[0] = *MEMORY[0x1E0CB2AD8];
              v92[1] = v55;
              v93[0] = v54;
              v93[1] = &unk_1E6DFCB60;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_alloc_init(MEMORY[0x1E0CB3620]);
              v89 = 0;
              v56 = objc_msgSend(v47, "setAttributes:ofItemAtPath:error:", v45, v78, &v89);
              v57 = (char *)v89;
              if ((v56 & 1) != 0)
              {
                v76 = 1;
              }
              else
              {
                v75 = v57;
                _HKInitializeLogging();
                v62 = *MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v95 = self;
                  v96 = 2114;
                  v97 = v78;
                  v98 = 2114;
                  v99 = v75;
                  _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set protection class for %{public}@. Reverting storage. %{public}@", buf, 0x20u);
                }
                v88 = 0;
                v63 = objc_msgSend(v47, "removeItemAtPath:error:", v78, &v88);
                v64 = (char *)v88;
                if ((v63 & 1) == 0)
                {
                  _HKInitializeLogging();
                  v65 = *MEMORY[0x1E0CB52B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543874;
                    v95 = self;
                    v96 = 2114;
                    v97 = v78;
                    v98 = 2114;
                    v99 = v64;
                    _os_log_error_impl(&dword_1B7802000, v65, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);
                  }
                }
                v66 = v75;
                v76 = v66 == 0;
                if (v66)
                {
                  if (v79)
                  {
                    v74 = v64;
                    v67 = v66;
                    *v79 = objc_retainAutorelease(v66);
                    v66 = v67;
                    v64 = v74;
                  }
                  else
                  {
                    v71 = v66;
                    _HKLogDroppedError();
                    v66 = v71;
                  }
                }

                v57 = v75;
              }

            }
LABEL_57:

          }
          else
          {
            v76 = 0;
          }

          v13 = v85;
          if (!v76)
          {
            v24 = v81;
LABEL_63:
            v29 = 0;
LABEL_64:
            v35 = v82;
            v37 = v83;
            goto LABEL_65;
          }
        }
        if (self)
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        else
          WeakRetained = 0;
        v29 = -[HDJournalableOperation performOrJournalWithProfile:error:](v84, "performOrJournalWithProfile:error:", WeakRetained, v79);

        goto LABEL_64;
      }
      _HKInitializeLogging();
      v38 = (void *)*MEMORY[0x1E0CB52B0];
      v13 = v85;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v69 = v38;
        objc_msgSend(v21, "path");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = self;
        v96 = 2114;
        v97 = v70;
        v98 = 2114;
        v99 = (char *)v82;
        _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create a file handle for URL %{public}@. %{public}@", buf, 0x20u);

      }
      v39 = v82;
      v26 = v39;
      if (v39)
      {
        v37 = v83;
        if (a7)
        {
          v26 = objc_retainAutorelease(v39);
          v24 = 0;
          v29 = 0;
          *a7 = v26;
        }
        else
        {
          _HKLogDroppedError();
          v24 = 0;
          v29 = 0;
        }
        v35 = v26;
        goto LABEL_65;
      }
      v24 = 0;
      v35 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v58 = v30;
        objc_msgSend(v21, "path");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = __error();
        v61 = strerror(*v60);
        *(_DWORD *)buf = 138543874;
        v95 = self;
        v96 = 2114;
        v97 = v59;
        v98 = 2080;
        v99 = v61;
        _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create file %{public}@ error: %s.", buf, 0x20u);

      }
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *__error();
      v33 = __error();
      v34 = strerror(*v33);
      objc_msgSend(v21, "path");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hk_error:format:", 102, CFSTR("Error %d, %s while creating file at %@ "), v32, v34, v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v36;
      v13 = v85;
      if (v36)
      {
        v37 = v83;
        if (a7)
        {
          v26 = objc_retainAutorelease(v36);
          v29 = 0;
          *a7 = v26;
        }
        else
        {
          _HKLogDroppedError();
          v29 = 0;
        }
        v24 = v26;
        goto LABEL_65;
      }
      v24 = 0;
    }
    v29 = 1;
    v37 = v83;
LABEL_65:

    v15 = v84;
    goto LABEL_66;
  }
  v28 = v16;
  v21 = v28;
  if (v28)
  {
    if (a7)
    {
      v21 = objc_retainAutorelease(v28);
      v29 = 0;
      *a7 = v21;
    }
    else
    {
      _HKLogDroppedError();
      v29 = 0;
    }
  }
  else
  {
    v29 = 1;
  }
LABEL_66:

  return v29;
}

- (BOOL)insertAttachmentReferences:(id)a3 attachment:(id)a4 fileData:(id)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  HDInsertAttachmentOperation *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id WeakRetained;
  char v33;
  BOOL v34;
  id v35;
  id v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  os_log_t *v44;
  void *v45;
  void *v46;
  char v47;
  os_log_t v48;
  id v49;
  os_log_t *v50;
  void *v51;
  void *v52;
  char v53;
  os_log_t v54;
  id v55;
  id v56;
  void *v57;
  char v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  HDAttachmentManager *v64;
  int v65;
  int *v66;
  char *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  HDInsertAttachmentOperation *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[2];
  _QWORD v93[2];
  uint8_t buf[4];
  HDAttachmentManager *v95;
  __int16 v96;
  _BYTE v97[18];
  uint64_t v98;

  v8 = a6;
  v98 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a3;
  v15 = -[HDInsertAttachmentOperation initWithAttachmentReferences:attachment:fileOnDisk:]([HDInsertAttachmentOperation alloc], "initWithAttachmentReferences:attachment:fileOnDisk:", v14, v12, 1);

  v91 = 0;
  v16 = -[HDAttachmentManager createFileDirectoriesWithError:](self, &v91);
  v17 = v91;
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    v84 = v15;
    v85 = v13;
    v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    -[HDAttachmentManager unconfirmedFilesDirectoryURL](self, "unconfirmedFilesDirectoryURL");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v20, "URLByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_msgSend(v19, "createFileAtPath:contents:attributes:", v24, 0, 0);

    if ((v20 & 1) == 0)
    {
      v36 = v12;
      v37 = v18;
      v38 = a7;
      _HKInitializeLogging();
      v39 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v61 = v39;
        objc_msgSend(v23, "path");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = self;
        v96 = 2114;
        *(_QWORD *)v97 = v62;
        _os_log_error_impl(&dword_1B7802000, v61, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to create file %{public}@.", buf, 0x16u);

      }
      v40 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v23, "path");
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "hk_error:format:", 102, CFSTR("Error creating file at %@"), v41);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v85;
      if (v42)
      {
        v15 = v84;
        if (v38)
        {
          v42 = objc_retainAutorelease(v42);
          v34 = 0;
          *v38 = v42;
          v43 = (void *)v41;
          v18 = v37;
          v12 = v36;
          v25 = v42;
        }
        else
        {
          v56 = v42;
          _HKLogDroppedError();
          v42 = v56;
          v34 = 0;
          v57 = v56;
          v43 = (void *)v41;
          v18 = v37;
          v12 = v36;
          v25 = v57;
        }
      }
      else
      {
        v34 = 0;
        v15 = v84;
        v43 = (void *)v41;
        v18 = v37;
        v12 = v36;
        v25 = 0;
      }
      goto LABEL_59;
    }
    v90 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingURL:error:", v23, &v90);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v90;
    if (!v25)
    {
      _HKInitializeLogging();
      v44 = (os_log_t *)MEMORY[0x1E0CB52B0];
      v45 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v68 = v45;
        objc_msgSend(v23, "path");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = self;
        v96 = 2114;
        *(_QWORD *)v97 = v69;
        *(_WORD *)&v97[8] = 2114;
        *(_QWORD *)&v97[10] = v83;
        _os_log_error_impl(&dword_1B7802000, v68, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to retreive fileHandle for %{public}@. Reverting attachment and reference storage. %{public}@", buf, 0x20u);

      }
      objc_msgSend(v23, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = 0;
      v47 = objc_msgSend(v19, "removeItemAtPath:error:", v46, &v89);
      v82 = v89;

      if ((v47 & 1) == 0)
      {
        _HKInitializeLogging();
        v48 = *v44;
        if (os_log_type_enabled(*v44, OS_LOG_TYPE_ERROR))
        {
          v73 = v48;
          objc_msgSend(v23, "path");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = self;
          v96 = 2114;
          *(_QWORD *)v97 = v74;
          *(_WORD *)&v97[8] = 2114;
          *(_QWORD *)&v97[10] = v82;
          _os_log_error_impl(&dword_1B7802000, v73, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);

        }
      }
      v43 = v83;
      v49 = v83;
      if (v49)
      {
        v15 = v84;
        v13 = v85;
        if (a7)
        {
          v49 = objc_retainAutorelease(v49);
          v34 = 0;
          *a7 = v49;
        }
        else
        {
          v59 = v49;
          _HKLogDroppedError();
          v49 = v59;
          v34 = 0;
        }
      }
      else
      {
        v34 = 0;
        v15 = v84;
        v13 = v85;
      }
      goto LABEL_58;
    }
    v79 = v25;
    if (fcntl(objc_msgSend(v25, "fileDescriptor"), 48, 1))
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v63 = v26;
        objc_msgSend(v23, "path");
        v64 = (HDAttachmentManager *)objc_claimAutoreleasedReturnValue();
        v65 = *__error();
        v66 = __error();
        v67 = strerror(*v66);
        *(_DWORD *)buf = 138543874;
        v95 = v64;
        v96 = 1024;
        *(_DWORD *)v97 = v65;
        *(_WORD *)&v97[4] = 2082;
        *(_QWORD *)&v97[6] = v67;
        _os_log_error_impl(&dword_1B7802000, v63, OS_LOG_TYPE_ERROR, "Error setting F_NOCACHE on file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);

      }
    }
    v27 = *MEMORY[0x1E0CB2AB8];
    v28 = *MEMORY[0x1E0CB2AA8];
    v92[0] = *MEMORY[0x1E0CB2AD8];
    v92[1] = v28;
    v93[0] = v27;
    v93[1] = &unk_1E6DFCB60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    v82 = (id)v29;
    LOBYTE(v29) = objc_msgSend(v19, "setAttributes:ofItemAtPath:error:", v29, v30, &v88);
    v81 = v88;

    if ((v29 & 1) != 0)
    {
      objc_msgSend(v12, "encryptionKey");
      v31 = objc_claimAutoreleasedReturnValue();
      v80 = (id)v31;
      if (v8 && v31)
      {
        v25 = v79;
        +[HDEncryptedArchive archiveForEncryptionWithFileHandle:key:error:](HDEncryptedArchive, "archiveForEncryptionWithFileHandle:key:error:", v79, v31, a7);
        WeakRetained = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "closeFile");
        v13 = v85;
        if (!WeakRetained
          || (v33 = objc_msgSend(WeakRetained, "writeData:error:", v85, a7),
              objc_msgSend(WeakRetained, "close"),
              (v33 & 1) == 0))
        {
          v34 = 0;
          v15 = v84;
LABEL_57:

          v43 = v83;
          v49 = v81;
LABEL_58:

          v42 = v82;
LABEL_59:

          goto LABEL_60;
        }
LABEL_42:

        v15 = v84;
        if (self)
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        else
          WeakRetained = 0;
        v34 = -[HDJournalableOperation performOrJournalWithProfile:error:](v84, "performOrJournalWithProfile:error:", WeakRetained, a7);
        goto LABEL_57;
      }
      v86 = 0;
      v25 = v79;
      v13 = v85;
      v58 = objc_msgSend(v79, "writeData:error:", v85, &v86);
      WeakRetained = v86;
      objc_msgSend(v79, "closeFile");
      if ((v58 & 1) != 0)
        goto LABEL_42;
      _HKInitializeLogging();
      v60 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v77 = v60;
        objc_msgSend(v23, "path");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = self;
        v96 = 2114;
        *(_QWORD *)v97 = v78;
        *(_WORD *)&v97[8] = 2114;
        *(_QWORD *)&v97[10] = WeakRetained;
        _os_log_error_impl(&dword_1B7802000, v77, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to write data to file at %{public}@, %{public}@", buf, 0x20u);

        v13 = v85;
      }
      WeakRetained = WeakRetained;
      v15 = v84;
      if (WeakRetained)
      {
        if (a7)
          *a7 = objc_retainAutorelease(WeakRetained);
        else
          _HKLogDroppedError();
      }

    }
    else
    {
      _HKInitializeLogging();
      v50 = (os_log_t *)MEMORY[0x1E0CB52B0];
      v51 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v70 = v51;
        objc_msgSend(v23, "path");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = self;
        v96 = 2114;
        *(_QWORD *)v97 = v71;
        *(_WORD *)&v97[8] = 2114;
        *(_QWORD *)&v97[10] = v81;
        _os_log_error_impl(&dword_1B7802000, v70, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set protection class for %{public}@. Reverting storage. %{public}@", buf, 0x20u);

      }
      objc_msgSend(v23, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      v53 = objc_msgSend(v19, "removeItemAtPath:error:", v52, &v87);
      v80 = v87;

      if ((v53 & 1) == 0)
      {
        _HKInitializeLogging();
        v54 = *v50;
        if (os_log_type_enabled(*v50, OS_LOG_TYPE_ERROR))
        {
          v75 = v54;
          objc_msgSend(v23, "path");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = self;
          v96 = 2114;
          *(_QWORD *)v97 = v76;
          *(_WORD *)&v97[8] = 2114;
          *(_QWORD *)&v97[10] = v80;
          _os_log_error_impl(&dword_1B7802000, v75, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", buf, 0x20u);

        }
      }
      v55 = v81;
      WeakRetained = v55;
      v25 = v79;
      if (!v55)
      {
        v34 = 0;
        v15 = v84;
        v13 = v85;
        goto LABEL_57;
      }
      v15 = v84;
      v13 = v85;
      if (a7)
      {
        WeakRetained = objc_retainAutorelease(v55);
        v34 = 0;
        *a7 = WeakRetained;
        goto LABEL_57;
      }
      _HKLogDroppedError();
    }
    v34 = 0;
    goto LABEL_57;
  }
  v35 = v17;
  v19 = v35;
  if (!v35)
    goto LABEL_22;
  if (!a7)
  {
    _HKLogDroppedError();
LABEL_22:
    v34 = 0;
    goto LABEL_60;
  }
  v19 = objc_retainAutorelease(v35);
  v34 = 0;
  *a7 = v19;
LABEL_60:

  return v34;
}

- (BOOL)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__HDAttachmentManager_attachmentReferencesForObjectIdentifier_schemaIdentifier_error_enumerationHandler___block_invoke;
  v19[3] = &unk_1E6CEE6A8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAttachmentReferenceEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a5, v19);

  return (char)a5;
}

BOOL __105__HDAttachmentManager_attachmentReferencesForObjectIdentifier_schemaIdentifier_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDAttachmentManager _attachmentReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3, *(void **)(a1 + 56));
}

- (BOOL)_attachmentReferencesForObjectIdentifier:(uint64_t)a3 schemaIdentifier:(uint64_t)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[5];
  id v16;

  v11 = a6;
  v12 = v11;
  if (a1)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __118__HDAttachmentManager__attachmentReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke;
    v15[3] = &unk_1E6CF9F00;
    v15[4] = a1;
    v16 = v11;
    v13 = +[HDAttachmentReferenceEntity enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:", a2, a3, a4, a5, v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)attachmentReferencesForAttachment:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__HDAttachmentManager_attachmentReferencesForAttachment_error_enumerationHandler___block_invoke;
  v15[3] = &unk_1E6CEE458;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAttachmentReferenceEntity, "performReadTransactionWithHealthDatabase:error:block:", v11, a4, v15);

  return (char)a4;
}

BOOL __82__HDAttachmentManager_attachmentReferencesForAttachment_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDAttachmentReferencePredicateForAttachmentIdentifier((uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesWithPredicate:transaction:error:enumerationHandler:", v8, v6, a3, *(_QWORD *)(a1 + 40));

  return v9;
}

- (id)fileHandleForAttachment:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *log;
  id *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  HDAttachmentManager *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDAttachmentManager filesDirectoryURL](self, "filesDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v10, &v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v36;
  v13 = v12;
  if (v11)
  {
    v14 = v11;
  }
  else if (objc_msgSend(v12, "hk_isCocoaNoSuchFileError"))
  {
    v34 = a4;
    -[HDAttachmentManager unconfirmedFilesDirectoryURL](self, "unconfirmedFilesDirectoryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v18, &v35);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v35;
    if (v14)
    {
      v20 = v14;
    }
    else
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        log = v25;
        objc_msgSend(v18, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = self;
        v39 = 2114;
        v40 = v32;
        v41 = 2114;
        v42 = v19;
        _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: File not found at %{public}@, %{public}@", buf, 0x20u);

      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v18, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hk_error:format:", 102, CFSTR("File not found at %@, %@"), v27, v19);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        if (v34)
          *v34 = objc_retainAutorelease(v28);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v30 = v21;
      objc_msgSend(v10, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = self;
      v39 = 2114;
      v40 = v31;
      v41 = 2114;
      v42 = v13;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: File not found at %{public}@, %{public}@", buf, 0x20u);

    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v10, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_error:format:", 102, CFSTR("File not found at %@, %@"), v23, v13);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

    v14 = 0;
  }

  return v14;
}

- (id)readerForAttachment:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[HDAttachmentManager fileHandleForAttachment:error:](self, "fileHandleForAttachment:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "encryptionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "encryptionKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDEncryptedArchive archiveForDecryptionWithFileHandle:key:error:](HDEncryptedArchive, "archiveForDecryptionWithFileHandle:key:error:", v7, v9, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "closeFile");
      if (v10)
        v11 = -[HDAttachmentEncryptedReader initAdoptingArchive:]([HDAttachmentEncryptedReader alloc], "initAdoptingArchive:", v10);
      else
        v11 = 0;

    }
    else
    {
      v11 = -[HDAttachmentFileHandleReader initAdoptingFileHandle:]([HDAttachmentFileHandleReader alloc], "initAdoptingFileHandle:", v7);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)replaceReferencesWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HDReplaceObjectIdentifierOperation *v13;
  id WeakRetained;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HDReplaceObjectIdentifierOperation initWithWithObjectIdentifier:replacementIdentifier:schemaIdentifier:]([HDReplaceObjectIdentifierOperation alloc], "initWithWithObjectIdentifier:replacementIdentifier:schemaIdentifier:", v12, v11, v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a6) = -[HDJournalableOperation performOrJournalWithProfile:error:](v13, "performOrJournalWithProfile:error:", WeakRetained, a6);

  return (char)a6;
}

- (BOOL)removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke;
  v19[3] = &unk_1E6CF26F8;
  v19[4] = self;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDAttachmentReferenceEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v14, a6, v19, 0);

  return (char)a6;
}

uint64_t __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke_2;
  v21 = &unk_1E6CF9E10;
  v8 = *(_QWORD *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v9 = v5;
  v23 = v9;
  if (!objc_msgSend(v6, "attachmentReferencesForObjectIdentifier:schemaIdentifier:error:enumerationHandler:", v7, v8, a3, &v18))
  {
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 11, CFSTR("No references found for attachment: %@ and object: %@"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v18, v19, v20, v21, v22);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    goto LABEL_12;
  }
  if (objc_msgSend(v9, "count") != 1)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 40);
      v16 = v10;
      v17 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 138543874;
      v25 = v14;
      v26 = 2114;
      v27 = v15;
      v28 = 2048;
      v29 = v17;
      _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "Expected only a single reference for attachment: %{public}@ and object: %{public}@, found %lu", buf, 0x20u);

    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "removeAttachmentReferences:error:", v9, a3);
LABEL_13:

  return v11;
}

uint64_t __107__HDAttachmentManager_removeAllReferencesWithAttachmentIdentifier_objectIdentifier_schemaIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 1;
}

- (BOOL)removeAttachmentReferences:(id)a3 error:(id *)a4
{
  id v6;
  HDDeleteAttachmentReferenceOperation *v7;
  id WeakRetained;

  v6 = a3;
  v7 = -[HDDeleteAttachmentReferenceOperation initWithReferences:]([HDDeleteAttachmentReferenceOperation alloc], "initWithReferences:", v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = -[HDJournalableOperation performOrJournalWithProfile:error:](v7, "performOrJournalWithProfile:error:", WeakRetained, a4);

  return (char)a4;
}

- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_error___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAttachmentReferenceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

uint64_t __93__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAttachmentReferencesWithObjectIdentifier:schemaIdentifier:transaction:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3);
}

- (BOOL)removeAttachmentReferencesWithObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  HDDeleteAttachmentReferenceOperation *v13;
  HDDeleteAttachmentReferenceOperation *v14;
  id WeakRetained;
  BOOL v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__101;
  v23 = __Block_byref_object_dispose__101;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_transaction_error___block_invoke;
  v18[3] = &unk_1E6CF9E38;
  v18[4] = &v19;
  if (-[HDAttachmentManager _attachmentReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:]((uint64_t)self, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)a6, v18))
  {
    v13 = [HDDeleteAttachmentReferenceOperation alloc];
    v14 = -[HDDeleteAttachmentReferenceOperation initWithReferences:](v13, "initWithReferences:", v20[5]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v16 = -[HDDeleteAttachmentReferenceOperation performWithProfile:transaction:error:](v14, "performWithProfile:transaction:error:", WeakRetained, v12, a6);

  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __105__HDAttachmentManager_removeAttachmentReferencesWithObjectIdentifier_schemaIdentifier_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  char v14;

  v10 = a3;
  v11 = a5;
  -[HDAttachmentManager schemaProviderForIdentifier:error:](self, "schemaProviderForIdentifier:error:", a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v14 = objc_msgSend(v12, "readAuthorizationForObjectIdentifier:client:profile:error:", v10, v11, WeakRetained, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 client:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  char v14;

  v10 = a3;
  v11 = a5;
  -[HDAttachmentManager schemaProviderForIdentifier:error:](self, "schemaProviderForIdentifier:error:", a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v14 = objc_msgSend(v12, "writeAuthorizationForObjectIdentifier:client:profile:error:", v10, v11, WeakRetained, a6);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  NSString *unconfirmedFilesDirectoryPath;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  HDAttachmentAnalytics *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t buf[4];
  HDAttachmentManager *v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v26 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startOfDayForDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 0;
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    objc_msgSend(v26, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
    v29[3] = &unk_1E6CF9ED8;
    v31 = &v78;
    v32 = &v66;
    v13 = v11;
    v30 = v13;
    v33 = &v50;
    v34 = &v62;
    v35 = &v42;
    v36 = &v74;
    v37 = &v54;
    v38 = &v58;
    v39 = &v70;
    v40 = &v46;
    v14 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAttachmentEntity, "performReadTransactionWithHealthDatabase:error:block:", v12, &v41, v29);
    v15 = v41;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      unconfirmedFilesDirectoryPath = self->_unconfirmedFilesDirectoryPath;
      v28 = 0;
      objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", unconfirmedFilesDirectoryPath, &v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v28;

      if (v19)
      {
        _HKInitializeLogging();
        HKLogAnalytics();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v83 = self;
          v84 = 2114;
          v85 = v19;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read directory contents at %{public}@", buf, 0x16u);
        }

        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
      }
      else
      {
        v22 = objc_msgSend(v18, "count");
        v23 = objc_alloc_init(HDAttachmentAnalytics);
        -[HDAttachmentAnalytics setNumberOfAttachments:](v23, "setNumberOfAttachments:", v79[3]);
        -[HDAttachmentAnalytics setNumberOfReferences:](v23, "setNumberOfReferences:", v75[3]);
        -[HDAttachmentAnalytics setNumberOfTombstones:](v23, "setNumberOfTombstones:", v71[3]);
        -[HDAttachmentAnalytics setTotalSizeOfFiles:](v23, "setTotalSizeOfFiles:", v67[3]);
        -[HDAttachmentAnalytics setNumberOfUnconfirmedFiles:](v23, "setNumberOfUnconfirmedFiles:", v22);
        -[HDAttachmentAnalytics setNumberOfOrphanedAttachments:](v23, "setNumberOfOrphanedAttachments:", v63[3]);
        -[HDAttachmentAnalytics setNumberOfOrphanedReferences:](v23, "setNumberOfOrphanedReferences:", v59[3]);
        -[HDAttachmentAnalytics setNumberOfReferencesCreatedLast24Hours:](v23, "setNumberOfReferencesCreatedLast24Hours:", v55[3]);
        -[HDAttachmentAnalytics setNumberOfAttachmentsCreatedLast24Hours:](v23, "setNumberOfAttachmentsCreatedLast24Hours:", v51[3]);
        -[HDAttachmentAnalytics setNumberOfTombstonesCreatedLast24Hours:](v23, "setNumberOfTombstonesCreatedLast24Hours:", v47[3]);
        -[HDAttachmentAnalytics setNumberOfAttachmentsWithMultipleReferences:](v23, "setNumberOfAttachmentsWithMultipleReferences:", v43[3]);
        objc_msgSend(v26, "daemon");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "analyticsSubmissionCoordinator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attachments_reportDailyAnalytics:", v23);

        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
      }

    }
    else
    {
      _HKInitializeLogging();
      HKLogAnalytics();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v83 = self;
        v84 = 2114;
        v85 = v15;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read directory contents at %{public}@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);

    v8 = v26;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  id v17;
  _BOOL8 v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  id v36;

  v5 = a2;
  v36 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
  v30[3] = &unk_1E6CF9E88;
  v33 = *(_OWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v31 = v7;
  v34 = v8;
  v9 = v5;
  v32 = v9;
  v35 = *(_OWORD *)(a1 + 64);
  v10 = +[HDAttachmentEntity enumerateAttachmentsWithPredicate:transaction:error:enumerationHandler:](HDAttachmentEntity, "enumerateAttachmentsWithPredicate:transaction:error:enumerationHandler:", 0, v9, &v36, v30);
  v11 = v36;
  v12 = v11;
  if (v10)
  {
    v29 = 0;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_4;
    v22[3] = &unk_1E6CF9EB0;
    v25 = *(_QWORD *)(a1 + 80);
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 88);
    v23 = v13;
    v26 = v14;
    v24 = v9;
    v27 = *(_OWORD *)(a1 + 96);
    v28 = *(_QWORD *)(a1 + 112);
    v15 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesWithPredicate:transaction:error:enumerationHandler:", 0, v24, &v29, v22);
    v16 = v29;
    v17 = v16;
    if (v15)
    {
      v18 = 1;
    }
    else
    {
      v20 = v16;
      v18 = v20 == 0;
      if (v20)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v19 = v11;
    v17 = v19;
    if (v19)
    {
      if (a3)
      {
        v17 = objc_retainAutorelease(v19);
        v18 = 0;
        *a3 = v17;
      }
      else
      {
        _HKLogDroppedError();
        v18 = 0;
      }
    }
    else
    {
      v18 = 1;
    }
  }

  return v18;
}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v5, "size");
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", a1[4]);

  if (v7)
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDAttachmentReferencePredicateForAttachmentIdentifier((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1[5];
  v20 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_3;
  v19[3] = &unk_1E6CF9E60;
  v19[4] = &v21;
  v11 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesWithPredicate:transaction:error:enumerationHandler:", v9, v10, &v20, v19);
  v12 = v20;

  if (v11)
  {
    v13 = v22;
    v14 = v22[3];
    if (!v14)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
      v14 = v13[3];
    }
    if (v14 >= 2)
      ++*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
    v15 = 1;
  }
  else
  {
    v16 = v12;
    v17 = v16;
    v15 = v16 == 0;
    if (v16)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v21, 8);

  return v15;
}

uint64_t __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_3(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

BOOL __70__HDAttachmentManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_4(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  _BOOL8 v17;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v5 = a2;
  if (objc_msgSend(v5, "type"))
  {
LABEL_8:
    if (objc_msgSend(v5, "type") == 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      objc_msgSend(v5, "creationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hk_isAfterOrEqualToDate:", *(_QWORD *)(a1 + 32));

      if (v16)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    v17 = 1;
    goto LABEL_12;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", *(_QWORD *)(a1 + 32));

  if (v7)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "objectIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "protectedDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v11, v12, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;

    if (!v13)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

    goto LABEL_8;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "objectIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_error:format:", 3, CFSTR("reference objectIdentifier '%@' is not a UUID string"), v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v21 == 0;
  if (v21)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

LABEL_12:
  return v17;
}

- (id)schemaProviderForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id *v19;
  os_unfair_lock_t lock;
  HDAttachmentManager *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_schemaProvidersByIdentifier, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v19 = a4;
    lock = &self->_lock;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HDAttachmentManager schemaProviderClasses](self, "schemaProviderClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v21 = self;
      v8 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF1AAA40))
          {
            objc_msgSend(v14, "schemaIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v6);

            if (v16)
            {
              v17 = objc_alloc_init((Class)v14);

              -[NSMutableDictionary setObject:forKeyedSubscript:](v21->_schemaProvidersByIdentifier, "setObject:forKeyedSubscript:", v17, v6);
              v8 = v17;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    else
    {
      v8 = 0;
    }

    os_unfair_lock_unlock(lock);
    if (!v8)
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v19, 100, CFSTR("No schema provider found for identifier '%@'"), v6);
  }

  return v8;
}

- (int64_t)supportedSchemaVersionForReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  HDAttachmentManager *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "schemaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[HDAttachmentManager schemaProviderForIdentifier:error:](self, "schemaProviderForIdentifier:error:", v5, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;

  if (v6)
  {
    objc_msgSend(v4, "objectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    else
      WeakRetained = 0;
    v21 = 0;
    v10 = objc_msgSend(v6, "schemaVersionForObjectIdentifier:profile:error:", v8, WeakRetained, &v21);
    v11 = v21;

    if (!v10)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v18 = v12;
        objc_msgSend(v4, "schemaIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v24 = self;
        v25 = 2114;
        v26 = v19;
        v27 = 2114;
        v28 = v20;
        v29 = 2114;
        v30 = v11;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get schema version for schema identifier %{public}@ for reference %{public}@, error: %{public}@", buf, 0x2Au);

      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v15 = v13;
      objc_msgSend(v4, "schemaIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = self;
      v25 = 2114;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find attachment schema provider %{public}@ for reference %{public}@: %{public}@", buf, 0x2Au);

    }
    v10 = -1;
  }

  return v10;
}

uint64_t __118__HDAttachmentManager__attachmentReferencesForObjectIdentifier_schemaIdentifier_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v5 = a2;
  objc_msgSend(v5, "attachmentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v15 = 0;
  +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v6, WeakRetained, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (!v8)
  {
    if (v9)
    {
      v9 = v9;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v5, "attachmentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_error:format:", 118, CFSTR("The attachment with identifier %@ was not found."), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v13;
      if (!v9)
      {
LABEL_10:
        v10 = 0;
        goto LABEL_11;
      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError();

    goto LABEL_10;
  }
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_11:

  return v10;
}

- (void)runMaintenanceOperationIfNeeded
{
  HDKeyValueDomain *v3;
  HDProfile **p_profile;
  id WeakRetained;
  HDKeyValueDomain *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  HDAttachmentManager *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = [HDKeyValueDomain alloc];
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v3, "initWithCategory:domainName:profile:", 0, CFSTR("attachment-manager"), WeakRetained);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[HDKeyValueDomain dateForKey:error:](v6, "dateForKey:error:", CFSTR("file-cleanup"), &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    if (!v8 || objc_msgSend(v7, "hk_isAfterDate:", v8))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __54__HDAttachmentManager_runMaintenanceOperationIfNeeded__block_invoke;
      v20[3] = &unk_1E6CE80E8;
      v20[4] = self;
      +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v13, 0, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v15, "daemon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maintenanceWorkCoordinator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enqueueMaintenanceOperation:", v14);

    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup attachment cleanup date with error %{public}@", buf, 0x16u);
    }
  }

}

void __54__HDAttachmentManager_runMaintenanceOperationIfNeeded__block_invoke(uint64_t a1)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_cleanupAttachmentsFolder");
  objc_msgSend(*(id *)(a1 + 32), "unitTestdidCompleteFileCleanup");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)_cleanupAttachmentsFolder
{
  os_log_t *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  id v8;
  HDKeyValueDomain *v9;
  id v10;
  HDKeyValueDomain *v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  HDAttachmentManager *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB52B0];
  v4 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cleaning up attachments folder", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = self;
  v19 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__HDAttachmentManager__cleanupAttachmentsFolder__block_invoke;
  v18[3] = &unk_1E6CEBC00;
  v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAttachmentEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, &v19, v18);
  v8 = v19;

  if (v7)
  {
    v9 = [HDKeyValueDomain alloc];
    v10 = objc_loadWeakRetained((id *)&self->_profile);
    v11 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v9, "initWithCategory:domainName:profile:", 0, CFSTR("attachment-manager"), v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = -[HDKeyValueDomain setDate:forKey:error:](v11, "setDate:forKey:error:", v12, CFSTR("file-cleanup"), &v17);
    v14 = v17;

    if (!v13)
    {
      _HKInitializeLogging();
      v15 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set cleanup date %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Cleanup failed with error %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __48__HDAttachmentManager__cleanupAttachmentsFolder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    return 0;
  v6 = (objc_class *)MEMORY[0x1E0CB3620];
  v7 = a2;
  v8 = objc_alloc_init(v6);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__HDAttachmentManager__moveFilesWithAttachmentsToConfirmedDirectory_errorOut___block_invoke;
  v25[3] = &unk_1E6CF9F28;
  v25[4] = v3;
  v26 = v8;
  v9 = v8;
  LODWORD(v6) = +[HDAttachmentEntity enumerateAttachmentsWithPredicate:transaction:error:enumerationHandler:](HDAttachmentEntity, "enumerateAttachmentsWithPredicate:transaction:error:enumerationHandler:", 0, v7, a3, v25);

  if (!(_DWORD)v6)
    return 0;
  v10 = *(void **)(a1 + 32);
  if (!v10)
    return 0;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v10, "unconfirmedFilesDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, MEMORY[0x1E0C9AA60], 4, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if (!objc_msgSend(v11, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), a3, (_QWORD)v21))
          {
            v19 = 0;
            goto LABEL_16;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v16)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_16:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

BOOL __78__HDAttachmentManager__moveFilesWithAttachmentsToConfirmedDirectory_errorOut___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unconfirmedFilesDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((_DWORD)v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "filesDirectoryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(void **)(a1 + 40);
    v26 = 0;
    LOBYTE(v13) = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v9, v15, &v26);
    v17 = v26;
    if ((v13 & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = v19;
        objc_msgSend(v15, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v22;
        v29 = 2114;
        v30 = v24;
        v31 = 2114;
        v32 = v25;
        v33 = 2114;
        v34 = v17;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory with error %{public}@", buf, 0x2Au);

      }
      v20 = v17;
      v18 = v20 == 0;
      if (v20)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (id)unitTestdidCompleteFileCleanup
{
  return self->_unitTestdidCompleteFileCleanup;
}

- (void)setUnitTestdidCompleteFileCleanup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTestdidCompleteFileCleanup, 0);
  objc_storeStrong((id *)&self->_unconfirmedFilesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_filesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_schemaProvidersByIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
