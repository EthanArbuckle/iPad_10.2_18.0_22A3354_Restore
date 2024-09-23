@implementation APStorageManager

- (BOOL)directoryExistsAtPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  int isDirectory_error;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  unsigned __int8 v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0;
  isDirectory_error = objc_msgSend__fileExistsAtPath_isDirectory_error_(self, v7, (uint64_t)v6, (uint64_t)&v19, a4);
  v11 = v19;
  if (isDirectory_error && a4 && !v19)
  {
    if (*a4)
    {
      v11 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = kSFSErrorDeterminingIfPathIsDirectory;
      v20 = CFSTR("reason");
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("A file exists at path (%@) but it is not a directory!"), v9, v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v21, (uint64_t)&v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v12, v17, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v13, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v19;
    }
  }
  if (!v11)
    LOBYTE(isDirectory_error) = 0;

  return isDirectory_error;
}

- (void)dfsWithStartPath:(id)a3 nodeCallback:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  NSFileManager *fileManager;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  const char *v67;
  uint64_t v68;
  id v69;
  void *v70;
  APStorageManager *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  char v76;
  _BYTE v77[128];
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  objc_msgSend_stringByDeletingLastPathComponent(v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = self;
  objc_msgSend__validatedFullURLForPath_error_(self, v12, (uint64_t)v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_absoluteString(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_length(v17, v18, v19, v20);

    if (v21)
    {
      objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v22, 15, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v6, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = v28;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v78, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v24, v31, (uint64_t)v30, v32);

      v76 = 0;
      if (objc_msgSend_count(v24, v33, v34, v35))
      {
        v69 = v6;
        v70 = v13;
        v39 = 0;
        do
        {
          v40 = v39;
          v76 = 0;
          objc_msgSend_lastObject(v24, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_removeLastObject(v24, v41, v42, v43);
          v7[2](v7, v39, &v76);
          if (!v76)
          {
            objc_msgSend_pathWithComponents_(MEMORY[0x1E0CB3940], v44, (uint64_t)v39, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_URLByAppendingPathComponent_(v13, v48, (uint64_t)v47, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            fileManager = v71->_fileManager;
            objc_msgSend_path(v50, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_contentsOfDirectoryAtPath_error_(fileManager, v56, (uint64_t)v55, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v58 = v57;
            v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v72, (uint64_t)v77, 16);
            if (v60)
            {
              v63 = v60;
              v64 = *(_QWORD *)v73;
              do
              {
                for (i = 0; i != v63; ++i)
                {
                  if (*(_QWORD *)v73 != v64)
                    objc_enumerationMutation(v58);
                  objc_msgSend_arrayByAddingObject_(v39, v61, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i), v62);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v24, v67, (uint64_t)v66, v68);

                }
                v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v72, (uint64_t)v77, 16);
              }
              while (v63);
            }

            v13 = v70;
          }
        }
        while (objc_msgSend_count(v24, v44, v45, v46));

        v6 = v69;
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_pathPrefix, 0);
}

- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  void *v8;

  objc_msgSend__validatedFullPathForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_contentsOfDirectoryAtPath_error_(self->_fileManager, v6, (uint64_t)v7, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (APStorageManager)init
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  APStorageManager *v6;
  const char *v7;
  uint64_t v8;
  APStorageManager *v9;
  objc_super v11;

  objc_msgSend__rootSubdirectory(APStorageManager, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)APStorageManager;
  v6 = -[APStorageManager init](&v11, sel_init);
  v9 = v6;
  if (v6)
    objc_msgSend__initWithSubdirectory_(v6, v7, (uint64_t)v5, v8);

  return v9;
}

- (APStorageManager)initWithPathPrefix:(id)a3 rootPath:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  APStorageManager *v12;
  const char *v13;
  uint64_t v14;
  APStorageManager *v15;
  const char *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend__rootSubdirectory(APStorageManager, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)APStorageManager;
  v12 = -[APStorageManager init](&v18, sel_init);
  v15 = v12;
  if (v12)
  {
    objc_msgSend__initWithSubdirectory_(v12, v13, (uint64_t)v11, v14);
    objc_msgSend__initWithPathPrefix_rootPath_(v15, v16, (uint64_t)v6, (uint64_t)v7);
  }

  return v15;
}

- (void)_initWithSubdirectory:(id)a3
{
  objc_class *v4;
  id v5;
  NSFileManager *v6;
  NSFileManager *fileManager;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  NSString *rootPath;

  v4 = (objc_class *)MEMORY[0x1E0CB3620];
  v5 = a3;
  v6 = (NSFileManager *)objc_alloc_init(v4);
  fileManager = self->_fileManager;
  self->_fileManager = v6;

  objc_msgSend__makeApplicationSupportSubdirectory_(self, v8, (uint64_t)v5, v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  rootPath = self->_rootPath;
  self->_rootPath = v10;

}

- (id)_makeApplicationSupportSubdirectory:(id)a3
{
  uint64_t v3;
  void *v5;
  NSFileManager *fileManager;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend__applicationSupportSubdirectory_(APStorageManager, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fileManager = self->_fileManager;
  v25 = 0;
  v8 = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(fileManager, v7, (uint64_t)v5, 1, 0, &v25);
  v12 = v25;
  if ((v8 & 1) != 0)
  {
    objc_msgSend_path(v5, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APLogForCategory(0x2DuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedFailureReason(v12, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v12, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138740483;
      v27 = v5;
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v22;
      _os_log_impl(&dword_1CF251000, v14, OS_LOG_TYPE_ERROR, "Failed to create Application Support subdirectory: %{sensitive}@ %{public}@ %{public}@", buf, 0x20u);

    }
    objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v23, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 16109);
    v13 = 0;
  }

  return v13;
}

+ (id)_applicationSupportSubdirectory:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  v18[0] = v8;
  v18[1] = CFSTR("com.apple.ap.promotedcontentd");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPathComponents_(v9, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend_URLByAppendingPathComponent_isDirectory_(v14, v15, (uint64_t)v3, 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }

  return v14;
}

+ (id)_rootSubdirectory
{
  return CFSTR("SFS");
}

- (void)_initWithPathPrefix:(id)a3 rootPath:(id)a4
{
  id v7;
  NSFileManager *v8;
  NSFileManager *fileManager;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  NSString *rootPath;
  id v20;

  v20 = a3;
  v7 = a4;
  v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
  fileManager = self->_fileManager;
  self->_fileManager = v8;

  objc_storeStrong((id *)&self->_pathPrefix, a3);
  v13 = objc_msgSend_length(v7, v10, v11, v12);
  v17 = v7;
  if (v13)
    goto LABEL_4;
  if (objc_msgSend_length((void *)qword_1EFB8D410, v14, v15, v16))
  {
    v17 = (void *)qword_1EFB8D410;
LABEL_4:
    v18 = v17;
    rootPath = self->_rootPath;
    self->_rootPath = v18;

  }
}

- (id)fileForReadingAtKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  char v33;
  const __CFString *v34;
  const __CFString *v35;
  uint8_t buf[4];
  void *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend__validatedFullURLForPath_error_(self, v7, (uint64_t)v6, (uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc((Class)objc_msgSend__classForEncryptedFile(self, v8, v9, v10));
    v15 = objc_msgSend_initForReadingAtURL_(v12, v13, (uint64_t)v11, v14);
    v17 = (void *)v15;
    if (a4 && !v15)
    {
      v33 = 0;
      if ((objc_msgSend__fileExistsAtPath_isDirectory_error_(self, v16, (uint64_t)v6, (uint64_t)&v33, 0) & 1) != 0)
      {
        APLogForCategory(0x2DuLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_safePath(v11, v20, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138739971;
          v37 = v23;
          _os_log_impl(&dword_1CF251000, v19, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file: %{sensitive}@", buf, 0xCu);

        }
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = kSFSCouldNotConstructFile;
        v34 = CFSTR("reason");
        v35 = CFSTR("Could not construct StorageFile for reading.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)&v35, (uint64_t)&v34, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v25, v27);
      }
      else
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB28A8];
        v38 = CFSTR("reason");
        v39[0] = CFSTR("Could not construct EncryptedFile for reading because a specified file does not exist.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v39, (uint64_t)&v38, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, v30, 260, v27);
      }
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)fileForAppendingAtKeyPath:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc((Class)objc_msgSend__classForEncryptedFile(self, v6, v7, v8));
    v13 = objc_msgSend_initForAppendingAtURL_(v10, v11, (uint64_t)v9, v12);
    v15 = (void *)v13;
    if (a4 && !v13)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = kSFSCouldNotConstructFile;
      v21 = CFSTR("reason");
      v22[0] = CFSTR("Could not construct StorageFile for appending.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v22, (uint64_t)&v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v17, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_validatedFullPathForPath:(id)a3 error:(id *)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    objc_msgSend_path(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v9, v10, (uint64_t)CFSTR("//localhost"), v11))
    {
      v15 = objc_msgSend_length(CFSTR("//localhost"), v12, v13, v14);
      objc_msgSend_substringFromIndex_(v9, v16, v15, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v18;
    }
    if (objc_msgSend_hasPrefix_(v9, v12, (uint64_t)CFSTR("/localhost"), v14))
    {
      v22 = objc_msgSend_length(CFSTR("/localhost"), v19, v20, v21);
      objc_msgSend_substringFromIndex_(v9, v23, v22, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v25;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fileForWritingAtKeyPath:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc((Class)objc_msgSend__classForEncryptedFile(self, v6, v7, v8));
    v13 = objc_msgSend_initForWritingAtURL_(v10, v11, (uint64_t)v9, v12);
    v15 = (void *)v13;
    if (a4 && !v13)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = kSFSCouldNotConstructFile;
      v21 = CFSTR("reason");
      v22[0] = CFSTR("Could not construct StorageFile for writing.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v22, (uint64_t)&v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v17, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (Class)_classForEncryptedFile
{
  return (Class)objc_opt_class();
}

- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  int isDirectory_error;
  int v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  unsigned __int8 v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0;
  isDirectory_error = objc_msgSend__fileExistsAtPath_isDirectory_error_(self, v7, (uint64_t)v6, (uint64_t)&v18, a4);
  v11 = v18;
  if (isDirectory_error && a4 && v18)
  {
    if (*a4)
    {
      v11 = 1;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v19 = CFSTR("reason");
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("A directory exists at the path (%@)!"), v9, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v20, (uint64_t)&v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), 1025, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v18;
    }
  }
  if (v11)
    LOBYTE(isDirectory_error) = 0;

  return isDirectory_error;
}

- (BOOL)_fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5
{
  const char *v7;
  void *v8;
  char isDirectory;

  objc_msgSend__validatedFullPathForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(self->_fileManager, v7, (uint64_t)v8, (uint64_t)a4);
  else
    isDirectory = 0;

  return isDirectory;
}

- (BOOL)storeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a3;
  objc_msgSend_fileForWritingAtKeyPath_error_(self, v9, (uint64_t)a4, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10)
  {
    v13 = objc_msgSend_addData_error_(v10, v11, (uint64_t)v8, (uint64_t)a5);
    objc_msgSend_close(v12, v14, v15, v16);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_validatedFullURLForPath:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend__validatedPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend__rootURL(self, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v10, v11, (uint64_t)v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v13;
    if (a4 && !v13)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = kSFSCouldNotAppendPathError;
      v21[0] = CFSTR("name");
      v21[1] = CFSTR("reason");
      v22[0] = v9;
      v22[1] = CFSTR("Could not append path");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v22, (uint64_t)v21, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v17, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_rootURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  APSafeFileURL *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *inited;
  NSObject *v15;
  const char *v16;
  uint8_t v17[16];

  objc_msgSend_rootPath(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [APSafeFileURL alloc];
    objc_msgSend_rootPath(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    inited = (void *)objc_msgSend_initFileURLWithPath_(v6, v11, (uint64_t)v10, v12);

    return inited;
  }
  else
  {
    APLogForCategory(0x2DuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "root URL nil", v17, 2u);
    }

    objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v16, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 16101);
    return 0;
  }
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (id)_validatedPath:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend__validatedPath_error_(APStorageManager, v6, (uint64_t)v7, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    if (v8)
    {
      if (self->_pathPrefix)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%@/%@"), v10, self->_pathPrefix, v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = v8;
      }
      v18 = v12;
      objc_msgSend__validatedPath_error_(APStorageManager, v13, (uint64_t)v12, (uint64_t)a4);
      a4 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a4 = 0;
    }

  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = kSFSMissingPathError;
    v20 = CFSTR("reason");
    v21[0] = CFSTR("path was nil.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v21, (uint64_t)&v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v17, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)_validatedPath:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  id v19;
  uint8_t v21[8];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR("/"), v7) & 1) != 0
    || (objc_msgSend_hasPrefix_(v5, v8, (uint64_t)CFSTR(".."), v9) & 1) != 0
    || (objc_msgSend_hasPrefix_(v5, v8, (uint64_t)CFSTR("."), v10) & 1) != 0
    || (objc_msgSend_hasPrefix_(v5, v8, (uint64_t)CFSTR("~"), v11) & 1) != 0
    || (objc_msgSend_containsString_(v5, v8, (uint64_t)CFSTR("/../"), v12) & 1) != 0
    || objc_msgSend_containsString_(v5, v8, (uint64_t)CFSTR("/./"), v13))
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = kSFSInvalidPathError;
      v22 = CFSTR("reason");
      v23[0] = CFSTR("Invalid path for SFS.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v23, (uint64_t)&v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v17, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    APLogForCategory(0x2DuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "Invalid characters in URL.", v21, 2u);
    }

    v19 = 0;
  }
  else
  {
    v19 = v5;
  }

  return v19;
}

- (BOOL)storeObject:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  char v12;

  v8 = a4;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v9, (uint64_t)a3, 1, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = objc_msgSend_storeData_atPath_error_(self, v10, (uint64_t)v11, (uint64_t)v8, a5);
  else
    v12 = 0;

  return v12;
}

- (APStorageManager)initWithPathPrefix:(id)a3
{
  return (APStorageManager *)MEMORY[0x1E0DE7D20](self, sel_initWithPathPrefix_rootPath_, a3, 0);
}

- (BOOL)removeObjectAtPath:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  char v8;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend_removeItemAtURL_error_(self->_fileManager, v6, (uint64_t)v7, (uint64_t)a4);
  else
    v8 = 0;

  return v8;
}

- (id)lastModifiedDateForFileAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v10 = 0;
    objc_msgSend_getResourceValue_forKey_error_(v5, v6, (uint64_t)&v10, *MEMORY[0x1E0C998D8], a4);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)addedToDirectoryDateForFileAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v10 = 0;
    objc_msgSend_getResourceValue_forKey_error_(v5, v6, (uint64_t)&v10, *MEMORY[0x1E0C998B0], a4);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)cleanupOldStorage
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int isDirectory;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  char v17;

  objc_msgSend__applicationSupportSubdirectory_(APStorageManager, a2, (uint64_t)CFSTR("EFS"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v11, v12, (uint64_t)v7, (uint64_t)&v17);

  if (isDirectory)
    v16 = v17 == 0;
  else
    v16 = 1;
  if (!v16)
    objc_msgSend__removeStorageForSubdirectory_(APStorageManager, v14, (uint64_t)CFSTR("EFS"), v15);

}

- (id)objectStoredAtPath:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;

  objc_msgSend_dataStoredAtPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_classes(APSupportedSecureEncodedClass, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v10, (uint64_t)v9, (uint64_t)v8, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dataStoredAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend_fileForReadingAtKeyPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (a4)
  {
    if (*a4)
      v10 = 1;
    else
      v10 = v5 == 0;
    if (!v10)
      goto LABEL_9;
  }
  else if (v5)
  {
LABEL_9:
    objc_msgSend_nextObjectData(v5, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_close(v9, v12, v13, v14);
    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)fileAtKeyPath:(id)a3 forMode:(int64_t)a4 error:(id *)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc((Class)objc_msgSend__classForEncryptedFile(self, v7, v8, v9));
    v13 = (void *)objc_msgSend_initForMode_atURL_(v11, v12, a4, (uint64_t)v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)createdDateForFileAtPath:(id)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    v10 = 0;
    objc_msgSend_getResourceValue_forKey_error_(v5, v6, (uint64_t)&v10, *MEMORY[0x1E0C998E8], a4);
    v8 = v10;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)touchFileAtPath:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  char v11;

  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_now(MEMORY[0x1E0C99D68], v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_setResourceValue_forKey_error_(v8, v10, (uint64_t)v9, *MEMORY[0x1E0C998D8], a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)iterateObjectsIncludingFolders:(BOOL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  BOOL v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)&stru_1E8C4E328, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5
    && (objc_msgSend_absoluteString(v5, v6, v7, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend_length(v10, v11, v12, v13),
        v10,
        v14))
  {
    if (a3)
    {
      v16 = 0;
      objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(self->_fileManager, v15, (uint64_t)v9, 0, 16, &unk_1E8C48070);
    }
    else
    {
      v26[0] = *MEMORY[0x1E0C999D0];
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(self->_fileManager, v18, (uint64_t)v9, (uint64_t)v16, 16, &unk_1E8C48070);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1CF27ED28;
    v23[3] = &unk_1E8C487E8;
    v24 = v19;
    v25 = a3;
    v20 = v19;
    v21 = _Block_copy(v23);
    v17 = _Block_copy(v21);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)getStorageSize:(unint64_t *)a3 allocatedSize:(unint64_t *)a4 files:(unint64_t *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  int ResourceValue_forKey_error;
  id v40;
  const char *v41;
  BOOL v42;
  int v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  unint64_t *v53;
  void *v54;
  unint64_t *v55;
  unint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  id obj;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  if (a3 && a4 && a5)
  {
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
    objc_msgSend__validatedFullURLForPath_error_(self, a2, (uint64_t)&stru_1E8C4E328, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    if (v9)
    {
      objc_msgSend_absoluteString(v9, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_length(v14, v15, v16, v17);

      if (v18)
      {
        v53 = a3;
        v55 = a4;
        v56 = a5;
        v20 = *MEMORY[0x1E0C99A18];
        v21 = *MEMORY[0x1E0C99900];
        v71[0] = *MEMORY[0x1E0C99A18];
        v71[1] = v21;
        v57 = v21;
        v71[2] = *MEMORY[0x1E0C99AC0];
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v19, (uint64_t)v71, 3);
        v54 = v13;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(self->_fileManager, v22, (uint64_t)v13, (uint64_t)v52, 0, &unk_1E8C48808);
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v66, (uint64_t)v70, 16);
        if (v24)
        {
          v25 = v24;
          v59 = 0;
          v60 = 0;
          v58 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = *(_QWORD *)v67;
          v61 = *MEMORY[0x1E0C99998];
          do
          {
            for (i = 0; i != v25; ++i)
            {
              v31 = v26;
              if (*(_QWORD *)v67 != v29)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              v33 = (void *)MEMORY[0x1D17CBC78]();
              v65 = 0;
              objc_msgSend_getResourceValue_forKey_error_(v32, v34, (uint64_t)&v65, v20, 0);
              v26 = v65;

              if (objc_msgSend_BOOLValue(v26, v35, v36, v37))
              {

                v64 = 0;
                ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v32, v38, (uint64_t)&v64, v61, 0);
                v40 = v64;
                v27 = v40;
                if (ResourceValue_forKey_error)
                  v42 = v40 == 0;
                else
                  v42 = 1;
                if (v42)
                {
                  v28 = 0;
                }
                else
                {
                  v63 = 0;
                  v43 = objc_msgSend_getResourceValue_forKey_error_(v32, v41, (uint64_t)&v63, v57, 0);
                  v44 = v63;
                  v28 = v44;
                  if (v43)
                  {
                    if (v44)
                    {
                      ++v58;
                      v60 += objc_msgSend_unsignedLongLongValue(v27, v45, v46, v47);
                      v59 += objc_msgSend_unsignedLongLongValue(v28, v48, v49, v50);
                    }
                  }
                }
              }
              objc_autoreleasePoolPop(v33);
            }
            v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v66, (uint64_t)v70, 16);
          }
          while (v25);
        }
        else
        {
          v59 = 0;
          v60 = 0;
          v58 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
        }

        *v53 = v60;
        *v55 = v59;
        *v56 = v58;

        v13 = v54;
      }
    }

  }
}

- (id)subpathsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  void *v8;

  objc_msgSend__validatedFullPathForPath_error_(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_subpathsOfDirectoryAtPath_error_(self->_fileManager, v6, (uint64_t)v7, (uint64_t)a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  char v15;

  v8 = a4;
  objc_msgSend__validatedFullURLForPath_error_(self, v9, (uint64_t)a3, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend__validatedFullURLForPath_error_(self, v10, (uint64_t)v8, (uint64_t)a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && objc_msgSend__createDirectoriesForURL_error_(self, v12, (uint64_t)v13, (uint64_t)a5))
      v15 = objc_msgSend_moveItemAtURL_toURL_error_(self->_fileManager, v14, (uint64_t)v11, (uint64_t)v13, a5);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)setRootPath:(id)a3
{
  objc_storeStrong((id *)&qword_1EFB8D410, a3);
}

- (BOOL)_createDirectoriesForURL:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error;
  NSObject *v9;
  id v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend_URLByDeletingLastPathComponent(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(self->_fileManager, v7, (uint64_t)v6, 1, 0, a4);
  if ((DirectoryAtURL_withIntermediateDirectories_attributes_error & 1) == 0)
  {
    APLogForCategory(0x2DuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *a4;
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_ERROR, "Failed to create directory, %{public}@", (uint8_t *)&v12, 0xCu);
    }

  }
  return DirectoryAtURL_withIntermediateDirectories_attributes_error;
}

+ (BOOL)areThereStoredItems
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;

  objc_msgSend__rootSubdirectory(APStorageManager, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__applicationSupportSubdirectory_(a1, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_contentsOfDirectoryAtPath_error_(v16, v17, (uint64_t)v12, (uint64_t)&v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v22 = objc_msgSend_count(v18, v19, v20, v21) != 0;
  else
    v22 = 0;

  return v22;
}

+ (BOOL)removeStorage
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend__rootSubdirectory(APStorageManager, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend__removeStorageForSubdirectory_(a1, v6, (uint64_t)v5, v7);

  return (char)a1;
}

+ (BOOL)_removeStorageForSubdirectory:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char isDirectory;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int v32;
  id v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char v42;
  NSObject *v43;
  const char *v44;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend__applicationSupportSubdirectory_(a1, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v12, v13, (uint64_t)v8, 0);

  if ((isDirectory & 1) != 0)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v18, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v23, v24, (uint64_t)v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v32 = objc_msgSend_moveItemAtPath_toPath_error_(v30, v31, (uint64_t)v8, (uint64_t)v26, &v49);
    v33 = v49;

    if (v32)
    {
      dispatch_get_global_queue(9, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1CF27F7E4;
      block[3] = &unk_1E8C48590;
      v48 = v26;
      dispatch_async(v34, block);

    }
    else
    {
      APLogForCategory(0x2DuLL);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v33;
        _os_log_impl(&dword_1CF251000, v36, OS_LOG_TYPE_ERROR, "Failed to move SFS folder: %{public}@", buf, 0xCu);
      }

      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v42 = objc_msgSend_removeItemAtPath_error_(v40, v41, (uint64_t)v8, (uint64_t)&v46);
      v33 = v46;

      if ((v42 & 1) == 0)
      {
        APLogForCategory(0x2DuLL);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v33;
          _os_log_impl(&dword_1CF251000, v43, OS_LOG_TYPE_ERROR, "Failed to remove SFS folder in place: %{public}@", buf, 0xCu);
        }

        objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v44, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 161003);
        v35 = 0;
        goto LABEL_14;
      }
    }
    v35 = 1;
LABEL_14:

    goto LABEL_15;
  }
  APLogForCategory(0x2DuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF251000, v22, OS_LOG_TYPE_DEBUG, "There is no SFS folder.", buf, 2u);
  }
  v35 = 1;
LABEL_15:

  return v35;
}

+ (void)sendAnalyticError:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v24 = CFSTR("code");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  v9 = a3;
  objc_msgSend_numberWithInteger_(v7, v10, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v25, (uint64_t)&v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("%@%@"), v16, v8, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  APLogForCategory(0x2DuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
  }

  objc_msgSend_sendEvent_customPayload_(APAnalytics, v19, (uint64_t)v17, (uint64_t)v14);
}

- (NSString)pathPrefix
{
  return self->_pathPrefix;
}

- (void)setPathPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_pathPrefix, a3);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

@end
