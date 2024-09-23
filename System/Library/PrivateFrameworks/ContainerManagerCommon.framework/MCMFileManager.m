@implementation MCMFileManager

+ (id)defaultManager
{
  if (containermanager_copy_default_file_manager_onceToken != -1)
    dispatch_once(&containermanager_copy_default_file_manager_onceToken, &__block_literal_global_1115);
  return (id)gMCMDefaultFileManager;
}

- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 fsNode:(id *)a7 error:(id *)a8
{
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  int v15;
  int v16;
  _BOOL4 v17;
  MCMFSNode *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  int v24;
  int *v25;
  char *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  uid_t st_uid;
  __int16 v36;
  gid_t st_gid;
  stat v38;
  uint64_t v39;

  v12 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v14 = v13;
  memset(&v38, 0, sizeof(v38));
  if (v12)
    v15 = stat(v13, &v38);
  else
    v15 = lstat(v13, &v38);
  v16 = v15;
  if (!v15)
  {
    v17 = (v38.st_mode & 0xF000) == 0x4000;
    if (a7)
    {
      v18 = -[MCMFSNode initWithStat:]([MCMFSNode alloc], "initWithStat:", &v38);
LABEL_10:
      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = v14;
        v30 = 1024;
        v31 = v16 == 0;
        v32 = 1024;
        *(_DWORD *)v33 = v17;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v38.st_mode & 0x1FF;
        v34 = 1024;
        st_uid = v38.st_uid;
        v36 = 1024;
        st_gid = v38.st_gid;
        _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "stat [%s]: %d/%d/0%03o/%d/%d", buf, 0x2Au);
      }

      if (a5)
        *a5 = v16 == 0;
      if (a6)
        *a6 = v17;
      if (a7)
      {
        v18 = objc_retainAutorelease(v18);
        v20 = 0;
        *a7 = v18;
      }
      else
      {
        v20 = 0;
      }
      v22 = 1;
      goto LABEL_24;
    }
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  if (*__error() == 2)
  {
    v17 = 0;
    goto LABEL_9;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke;
  v27[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v27[4] = v14;
  __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke((uint64_t)v27);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v24 = *__error();
    v25 = __error();
    v26 = strerror(*v25);
    *(_DWORD *)buf = 136315650;
    v29 = v14;
    v30 = 1024;
    v31 = v24;
    v32 = 2080;
    *(_QWORD *)v33 = v26;
    _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Failed to determine if [%s] exists: (%d) %s", buf, 0x1Cu);
  }

  if (a8)
  {
    v20 = objc_retainAutorelease(v20);
    v22 = 0;
    v18 = 0;
    *a8 = v20;
  }
  else
  {
    v22 = 0;
    v18 = 0;
  }
LABEL_24:

  return v22;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  DIR *v13;
  DIR *v14;
  dirent *v15;
  dirent *v16;
  uint64_t d_type;
  id v18;
  char *d_name;
  int v20;
  int v21;
  id v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  id v27;
  int *v29;
  char *v30;
  _QWORD v31[4];
  id v32;
  int v33;
  _QWORD v34[2];
  uint64_t (*v35)(uint64_t, int, uint64_t);
  void *v36;
  id v37;
  id v38;
  stat v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v9 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke;
  v36 = &unk_1E8CB4EE8;
  v10 = v6;
  v37 = v10;
  v11 = v7;
  v38 = v11;
  v12 = v34;
  v13 = opendir(v8);
  if (v13)
  {
    v14 = v13;
    v15 = readdir(v13);
    if (v15)
    {
      v16 = v15;
      while (1)
      {
        d_type = v16->d_type;
        if (!v16->d_type)
          break;
LABEL_8:
        v20 = v16->d_name[0];
        d_name = v16->d_name;
        if (v20 == 46 || v35((uint64_t)v12, d_type, (uint64_t)d_name))
        {
          v16 = readdir(v14);
          if (v16)
            continue;
        }
        goto LABEL_18;
      }
      memset(&v39, 0, sizeof(v39));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%s"), v8, v16->d_name);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (stat((const char *)objc_msgSend(v18, "fileSystemRepresentation"), &v39))
        goto LABEL_6;
      v21 = v39.st_mode & 0xF000;
      if (v21 == 0x4000)
      {
        d_type = 4;
        goto LABEL_7;
      }
      if (v21 == 0x8000)
      {
        d_type = 8;
        goto LABEL_7;
      }
      if (v21 != 40960)
LABEL_6:
        d_type = 0;
      else
        d_type = 10;
LABEL_7:

      goto LABEL_8;
    }
LABEL_18:
    closedir(v14);

  }
  else
  {
    if (*__error() != 2)
    {
      container_log_handle_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = __error();
        v30 = strerror(*v29);
        v39.st_dev = 136315394;
        *(_QWORD *)&v39.st_mode = v8;
        WORD2(v39.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v39.st_ino + 6) = (__darwin_ino64_t)v30;
        _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "opendir of %s failed: %s", (uint8_t *)&v39, 0x16u);
      }

    }
    v25 = *__error();

    if (v25)
    {
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2;
      v31[3] = &unk_1E8CB4E70;
      v32 = v11;
      v33 = v25;
      __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2((uint64_t)v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      if (!a4)
        goto LABEL_29;
      goto LABEL_27;
    }
  }
  v22 = v10;
  v23 = 0;
  if (!a4)
    goto LABEL_29;
LABEL_27:
  if (!v22)
    *a4 = objc_retainAutorelease(v23);
LABEL_29:
  v26 = v38;
  v27 = v22;

  return v27;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _removefile_state *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  int *v14;
  char *v15;
  int *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v27;
  _QWORD v28[5];
  int v29;
  _QWORD v30[5];
  int v31;
  int value;
  _QWORD v33[3];
  _BYTE buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  value = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "fileSystemRepresentation");
  if (!v5)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil url passed to -removeItemAtURL:error:"));
    v33[0] = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager removeItemAtURL:error:]_block_invoke");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v20;
    *(_QWORD *)&buf[8] = &unk_1E8CD5610;
    v21 = *MEMORY[0x1E0CB2D50];
    v33[1] = CFSTR("SourceFileLine");
    v33[2] = v21;
    *(_QWORD *)&buf[16] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v33, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    goto LABEL_25;
  }
  v7 = (const char *)v6;
  v8 = 100;
  do
  {
    value = 0;
    v9 = removefile_state_alloc();
    if (removefile_state_set(v9, 3u, _removefile_error_callback))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v15;
        _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", buf, 0xCu);
      }

    }
    if (removefile_state_set(v9, 4u, &value))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = __error();
        v17 = strerror(*v16);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v17;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", buf, 0xCu);
      }

    }
    if (removefile(v7, v9, 1u))
      v12 = *__error();
    else
      v12 = 0;
    removefile_state_free(v9);
    v13 = v8 - 1;
    if (value != 35)
      break;
    --v8;
  }
  while (v8);
  if ((v12 & 0xFFFFFFFD) != 0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __40__MCMFileManager_removeItemAtURL_error___block_invoke_8;
    v30[3] = &__block_descriptor_44_e14___NSError_8__0l;
    v30[4] = v7;
    v31 = v12;
    __40__MCMFileManager_removeItemAtURL_error___block_invoke_8((uint64_t)v30);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if ((value & 0xFFFFFFFD) != 0)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__MCMFileManager_removeItemAtURL_error___block_invoke_12;
    v28[3] = &__block_descriptor_44_e14___NSError_8__0l;
    v28[4] = v7;
    v29 = value;
    __40__MCMFileManager_removeItemAtURL_error___block_invoke_12((uint64_t)v28);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v23 = (void *)v18;
    v24 = 0;
    if (v13)
      goto LABEL_25;
    goto LABEL_22;
  }
  container_log_handle_for_category();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "removefile([%s]) succeeded", buf, 0xCu);
  }

  v23 = 0;
  v24 = 1;
  if (!v13)
  {
LABEL_22:
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = value;
      _os_log_fault_impl(&dword_1CF807000, v25, OS_LOG_TYPE_FAULT, "Hit maximum iterations trying to removefile([%s]); removefile error = %{public}d, recovery error = %{public}d",
        buf,
        0x18u);
    }

  }
LABEL_25:
  if (a4 && !v24)
    *a4 = objc_retainAutorelease(v23);

  return v24;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 error:(id *)a8
{
  return -[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:", a3, a4, a5, a6, *(_QWORD *)&a7, 0, a8);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 dataProtectionClass:(int)a7 fsNode:(id *)a8 error:(id *)a9
{
  uint64_t v10;
  int v11;
  gid_t v12;
  id v14;
  const char *v15;
  const char *v16;
  int v17;
  uint64_t v18;
  int v19;
  MCMFSNode *v20;
  DIR *v21;
  uid_t v22;
  gid_t v23;
  id v24;
  _BOOL4 v25;
  DIR *v26;
  int v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  _QWORD v35[4];
  id v36;
  const char *v37;
  _QWORD v38[5];
  int v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  int v44;
  stat v45;
  uint64_t v46;

  v10 = *(_QWORD *)&a7;
  v11 = a5;
  v12 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v16 = v15;
  if (v12)
  {
    v17 = mkpath_np(v15, v11);
    if (v17 != 17)
    {
      if (v17)
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke;
        v43[3] = &__block_descriptor_44_e14___NSError_8__0l;
        v43[4] = v16;
        v44 = v17;
        __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke((uint64_t)v43);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_33:
        v24 = (id)v18;
        LOBYTE(v25) = 0;
        v21 = 0;
        goto LABEL_58;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (!mkdir(v15, v11))
    {
LABEL_8:
      v19 = 1;
      goto LABEL_9;
    }
    if (*__error() != 17)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_19;
      v42[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v42[4] = v16;
      __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_19((uint64_t)v42);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  v19 = 0;
LABEL_9:
  if ((_DWORD)v10 != -1 || a8)
  {
    v26 = opendir(v16);
    v21 = v26;
    if (!v26)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_24;
      v41[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v41[4] = v16;
      __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_24((uint64_t)v41);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) == 0)
      {
        LOBYTE(v25) = 0;
        goto LABEL_58;
      }
      v20 = 0;
      goto LABEL_36;
    }
    v27 = dirfd(v26);
    v28 = v27;
    if (a8)
    {
      memset(&v45, 0, sizeof(v45));
      if (fstat(v27, &v45))
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_29;
        v40[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v40[4] = v16;
        __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_29((uint64_t)v40);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        if ((v19 & 1) != 0)
          goto LABEL_36;
        goto LABEL_48;
      }
      v20 = -[MCMFSNode initWithStat:]([MCMFSNode alloc], "initWithStat:", &v45);
    }
    else
    {
      v20 = 0;
    }
    if ((_DWORD)v10 == -1 || !fcntl(v28, 64, v10) || *__error() == 45)
      goto LABEL_12;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33;
    v38[3] = &__block_descriptor_44_e14___NSError_8__0l;
    v39 = v10;
    v38[4] = v16;
    __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33((uint64_t)v38);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if ((v19 & 1) != 0)
      goto LABEL_36;
LABEL_48:
    v25 = 0;
    goto LABEL_53;
  }
  v20 = 0;
  v21 = 0;
LABEL_12:
  if (!v14
    || (v22 = geteuid(), v22 == objc_msgSend(v14, "UID"))
    && (v23 = getegid(), v23 == objc_msgSend(v14, "primaryGID"))
    || !chown(v16, objc_msgSend(v14, "UID"), objc_msgSend(v14, "primaryGID")))
  {
    if (v19)
    {
      container_log_handle_for_category();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v30)
        {
          v45.st_dev = 136316418;
          *(_QWORD *)&v45.st_mode = v16;
          WORD2(v45.st_ino) = 1024;
          *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
          HIWORD(v45.st_uid) = 1024;
          v45.st_gid = v12;
          LOWORD(v45.st_rdev) = 1024;
          *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
          *((_WORD *)&v45.st_rdev + 3) = 2112;
          v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
          LOWORD(v45.st_atimespec.tv_nsec) = 2112;
          *(uint64_t *)((char *)&v45.st_atimespec.tv_nsec + 2) = (uint64_t)v20;
          v31 = "Created directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@, fsNode: %@";
          v25 = 1;
          v32 = v29;
          v33 = 50;
          goto LABEL_30;
        }
        v24 = 0;
      }
      else
      {
        if (v30)
        {
          v45.st_dev = 136316162;
          *(_QWORD *)&v45.st_mode = v16;
          WORD2(v45.st_ino) = 1024;
          *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
          HIWORD(v45.st_uid) = 1024;
          v45.st_gid = v12;
          LOWORD(v45.st_rdev) = 1024;
          *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
          *((_WORD *)&v45.st_rdev + 3) = 2112;
          v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
          v25 = 1;
          _os_log_impl(&dword_1CF807000, v29, OS_LOG_TYPE_INFO, "Created directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@", (uint8_t *)&v45, 0x28u);
          v24 = 0;
          v20 = 0;
          goto LABEL_52;
        }
        v24 = 0;
        v20 = 0;
      }
      v25 = 1;
      goto LABEL_52;
    }
    container_log_handle_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    v25 = 1;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
LABEL_31:
      v24 = 0;
      goto LABEL_52;
    }
    v45.st_dev = 136316162;
    *(_QWORD *)&v45.st_mode = v16;
    WORD2(v45.st_ino) = 1024;
    *(_DWORD *)((char *)&v45.st_ino + 6) = v11;
    HIWORD(v45.st_uid) = 1024;
    v45.st_gid = v12;
    LOWORD(v45.st_rdev) = 1024;
    *(dev_t *)((char *)&v45.st_rdev + 2) = v10;
    *((_WORD *)&v45.st_rdev + 3) = 2112;
    v45.st_atimespec.tv_sec = (__darwin_time_t)v14;
    v31 = "Set directory [%s] with mode: 0%o, w/intermediates: %d, DP class: %d, owner: %@";
    v32 = v29;
    v33 = 40;
LABEL_30:
    _os_log_impl(&dword_1CF807000, v32, OS_LOG_TYPE_INFO, v31, (uint8_t *)&v45, v33);
    goto LABEL_31;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_37;
  v35[3] = &unk_1E8CB6180;
  v36 = v14;
  v37 = v16;
  __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_37((uint64_t)v35);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if ((v19 & 1) != 0)
  {
LABEL_36:
    container_log_handle_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v45.st_dev = 136315394;
      *(_QWORD *)&v45.st_mode = v16;
      WORD2(v45.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v24;
      _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, "Created directory [%s] but could not complete its setup due to error: %@", (uint8_t *)&v45, 0x16u);
    }
    v25 = 0;
LABEL_52:

    if (!v21)
      goto LABEL_54;
    goto LABEL_53;
  }
  v25 = 0;
  if (v21)
LABEL_53:
    closedir(v21);
LABEL_54:
  if (a8 && v25)
  {
    v21 = objc_retainAutorelease(v20);
    *a8 = v21;
    LOBYTE(v25) = 1;
    goto LABEL_61;
  }
  v21 = (DIR *)v20;
LABEL_58:
  if (a9 && !v25)
  {
    v24 = objc_retainAutorelease(v24);
    LOBYTE(v25) = 0;
    *a9 = v24;
  }
LABEL_61:

  return v25;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 owner:(id)a6 error:(id *)a7
{
  return -[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 dataProtectionClass:(int)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  void *v13;

  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v12, v10, v9, v13, v8, a7);

  return (char)a7;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v10, v8, v7, v11, 0xFFFFFFFFLL, a6);

  return (char)a6;
}

- (BOOL)symbolicallyLinkURL:(id)a3 toSymlinkTarget:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  const char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  id *v19;
  id *v20;
  id *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v11;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_INFO, "Creating symlink [%@] → [%@]", buf, 0x16u);

  }
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = objc_retainAutorelease(v8);
  if (!symlink(v13, (const char *)objc_msgSend(v14, "fileSystemRepresentation")))
    goto LABEL_8;
  if (*__error() == 17)
  {
    v32 = 0;
    -[MCMFileManager targetOfSymbolicLinkAtURL:error:](self, "targetOfSymbolicLinkAtURL:error:", v14, &v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v32;
    if (v15)
    {
      if ((objc_msgSend(v12, "isEqualToString:", v15) & 1) != 0)
      {

LABEL_8:
        v17 = 0;
        v18 = 1;
        goto LABEL_16;
      }
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_49;
      v24[3] = &unk_1E8CB5A50;
      v19 = &v25;
      v25 = v14;
      v20 = &v26;
      v26 = v12;
      v21 = &v27;
      v27 = v15;
      __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_49((uint64_t)v24);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_45;
      v28[3] = &unk_1E8CB5A50;
      v19 = &v29;
      v29 = v14;
      v20 = &v30;
      v30 = v12;
      v21 = &v31;
      v31 = v16;
      __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_45((uint64_t)v28);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (id)v22;

  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke;
    v33[3] = &unk_1E8CB61F8;
    v34 = v14;
    v35 = v12;
    __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke((uint64_t)v33);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v34;
  }

  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a5 = v17;
  }
  else
  {
    v18 = 0;
  }
LABEL_16:

  return v18;
}

- (id)targetOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  char v18[1025];
  stat v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  memset(&v19, 0, sizeof(v19));
  bzero(v18, 0x401uLL);
  v6 = objc_retainAutorelease(v5);
  if (lstat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v19))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke;
    v16[3] = &unk_1E8CB67B8;
    v17 = v6;
    __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke((uint64_t)v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    goto LABEL_9;
  }
  if ((v19.st_mode & 0xF000) != 0xA000)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_56;
    v14[3] = &unk_1E8CB67B8;
    v15 = v6;
    __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_56((uint64_t)v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    goto LABEL_9;
  }
  v9 = objc_retainAutorelease(v6);
  if (readlink((const char *)objc_msgSend(v9, "fileSystemRepresentation"), v18, 0x400uLL) <= 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_60;
    v12[3] = &unk_1E8CB67B8;
    v13 = v9;
    __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_60((uint64_t)v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
LABEL_9:

    v10 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_10:
  if (!v10)
    *a4 = objc_retainAutorelease(v7);
LABEL_12:

  return v10;
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  BOOL v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  stat v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a5
    || (memset(&v24, 0, sizeof(v24)),
        v11 = objc_retainAutorelease(v9),
        !lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v24)))
  {
    v14 = objc_retainAutorelease(v9);
    v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
    v16 = objc_retainAutorelease(v10);
    if (!copyfile(v15, (const char *)objc_msgSend(v16, "fileSystemRepresentation"), 0, 0x10C800Fu))
    {
      v17 = 0;
      v13 = 1;
      goto LABEL_14;
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_67;
    v19[3] = &unk_1E8CB61F8;
    v20 = v14;
    v21 = v16;
    __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_67((uint64_t)v19);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!a6)
      goto LABEL_14;
  }
  else
  {
    v12 = *__error();
    v13 = v12 == 2;
    if (v12 == 2)
    {
      v17 = 0;
      if (!a6)
        goto LABEL_14;
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke;
      v22[3] = &unk_1E8CB67B8;
      v23 = v11;
      __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke((uint64_t)v22);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (!a6)
        goto LABEL_14;
    }
  }
  if (!v13)
  {
    v17 = objc_retainAutorelease(v17);
    v13 = 0;
    *a6 = v17;
  }
LABEL_14:

  return v13;
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const std::__fs::filesystem::path *v13;
  id v14;
  std::error_code *v15;
  const std::__fs::filesystem::path *v16;
  uint64_t v17;
  int v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  BOOL v27;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[6];
  _QWORD v33[5];
  stat v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = objc_retainAutorelease(v10);
  v13 = (const std::__fs::filesystem::path *)objc_msgSend(v12, "fileSystemRepresentation");
  v14 = objc_retainAutorelease(v11);
  v16 = (const std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation");
  if (!a5)
  {
    memset(&v34, 0, sizeof(v34));
    if (lstat((const char *)v13, &v34))
    {
      if (*__error() != 2)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke;
        v33[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v33[4] = v13;
        __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke((uint64_t)v33);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_13;
    }
  }
  rename(v13, v16, v15);
  if (!v18)
  {
LABEL_13:
    v23 = 0;
    v25 = "";
    goto LABEL_14;
  }
  if (*__error() != 18)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_74;
    v32[3] = &__block_descriptor_48_e14___NSError_8__0l;
    v32[4] = v13;
    v32[5] = v16;
    __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_74((uint64_t)v32);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v23 = (id)v17;
    if (a6)
    {
LABEL_19:
      v23 = objc_retainAutorelease(v23);
      v27 = 0;
      *a6 = v23;
      goto LABEL_22;
    }
LABEL_21:
    v27 = 0;
    goto LABEL_22;
  }
  v31 = 0;
  v19 = -[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", v12, v14, 1, &v31);
  v20 = v31;
  v21 = v20;
  if (!v19)
  {
    v23 = v20;
    if (a6)
      goto LABEL_19;
    goto LABEL_21;
  }
  v30 = v20;
  v22 = -[MCMFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v12, &v30);
  v23 = v30;

  if (!v22)
  {
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34.st_dev = 138412546;
      *(_QWORD *)&v34.st_mode = v29;
      WORD2(v34.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v23;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Failed to remove move source after copy at %@ : %@", (uint8_t *)&v34, 0x16u);

    }
  }
  v25 = "(using copy-delete) ";
LABEL_14:
  container_log_handle_for_category();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v34.st_dev = 136315650;
    *(_QWORD *)&v34.st_mode = v25;
    WORD2(v34.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v13;
    HIWORD(v34.st_gid) = 2080;
    *(_QWORD *)&v34.st_rdev = v16;
    _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_INFO, "Moved %s[%s] → [%s].", (uint8_t *)&v34, 0x20u);
  }

  v27 = 1;
LABEL_22:

  return v27;
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 0, a5);
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 0, a5);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 1, a5);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 1, a5);
}

- (BOOL)replaceItemAtDestinationURL:(id)a3 withSourceURL:(id)a4 swapped:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  const char *v17;
  id v18;
  BOOL v19;
  _QWORD v21[6];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = objc_retainAutorelease(a4);
  v10 = a3;
  v11 = objc_msgSend(v9, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "fileSystemRepresentation");

  v14 = MEMORY[0x1E0C835E8];
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0C835E8] + 640))(v11, v13, 2);
  if (v15 < 0
    && (*__error() != 45
     || ((*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v14 + 640))(v11, v13, 0) & 0x80000000) != 0))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke;
    v21[3] = &__block_descriptor_48_e14___NSError_8__0l;
    v21[4] = v13;
    v21[5] = v11;
    __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke((uint64_t)v21);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      v18 = objc_retainAutorelease(v18);
      v19 = 0;
      *a6 = v18;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    if (a5)
      *a5 = v15 >= 0;
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = "Replaced";
      *(_DWORD *)buf = 136315650;
      if (v15 >= 0)
        v17 = "Swapped";
      v23 = v17;
      v24 = 2080;
      v25 = v13;
      v26 = 2080;
      v27 = v11;
      _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_INFO, "%s [%s] <-> [%s].", buf, 0x20u);
    }

    v18 = 0;
    v19 = 1;
  }

  return v19;
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 withNamePrefix:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD __s[2];

  __s[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  __s[0] = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@XXXXXX"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v10, 1);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = strdup((const char *)objc_msgSend(v11, "fileSystemRepresentation"));
    __s[0] = v12;
    if (mkdtemp(v12))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v12, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (!v12)
        goto LABEL_8;
      goto LABEL_7;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_91;
    v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v17[4] = v12;
    __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_91((uint64_t)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (v12)
    {
LABEL_7:
      free(v12);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke;
    v18[3] = &unk_1E8CB67B8;
    v19 = v8;
    __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke((uint64_t)v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v10 = 0;
    v13 = 0;
  }
LABEL_8:
  if (a5 && !v13)
    *a5 = objc_retainAutorelease(v14);
  v15 = v13;

  return v15;
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  return -[MCMFileManager createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:](self, "createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:", a3, CFSTR("temp."), a4);
}

- (BOOL)_traverseDirectory:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, FTSENT *, id *);
  id v9;
  char *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  FTS *v17;
  void *v18;
  uint64_t v19;
  int v20;
  FTSENT *v21;
  int fts_info;
  char v24;
  id v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  char v30;
  os_signpost_id_t spid;
  id *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[6];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  char *v42[5];

  v42[2] = *(char **)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(id, FTSENT *, id *))a5;
  v9 = objc_retainAutorelease(v7);
  v10 = (char *)objc_msgSend(v9, "fileSystemRepresentation");
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v9);

  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    objc_msgSend(v9, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v39 = v16;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "TraversingDirectory", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);

  }
  spid = v12;

  v42[0] = v10;
  v42[1] = 0;
  v17 = fts_open(v42, 84, 0);
  if (v17)
  {
    v33 = a4;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    while (1)
    {
      v21 = fts_read(v17);
      if (!v21)
        break;
      fts_info = v21->fts_info;
      if (fts_info == 10 || fts_info == 7)
      {
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_101;
        v36[3] = &__block_descriptor_48_e14___NSError_8__0l;
        v36[4] = v10;
        v36[5] = v21;
        __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_101((uint64_t)v36);
        v25 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
        v20 = 0;
        goto LABEL_17;
      }
      ++v19;
      v35 = v18;
      v24 = v8[2](v8, v21, &v35);
      v25 = v35;

      v20 = 1;
      v18 = v25;
      if ((v24 & 1) == 0)
        goto LABEL_15;
    }
    v25 = v18;
LABEL_17:
    v26 = fts_close(v17);
    LOBYTE(v17) = v20 != 0;
    if (v26)
    {
      a4 = v33;
      if (!v25)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_105;
        v34[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v34[4] = v10;
        __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_105((uint64_t)v34);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v17) = 0;
    }
    else
    {
      a4 = v33;
    }
  }
  else
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke;
    v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v37[4] = v10;
    __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke((uint64_t)v37);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
  }
  container_log_handle_for_category();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    objc_msgSend(v9, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v39 = v29;
    v40 = 2050;
    v41 = v19;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v28, OS_SIGNPOST_INTERVAL_END, spid, "TraversingDirectory", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu ", buf, 0x16u);

  }
  if (a4)
    v30 = (char)v17;
  else
    v30 = 1;
  if ((v30 & 1) == 0)
    *a4 = objc_retainAutorelease(v25);

  return (char)v17;
}

- (BOOL)_CreateSystemUserACEInACL:(_acl *)a3 withPermissions:(int)a4 andFlags:(int)a5 withError:(id *)a6
{
  void *v9;
  void *v10;
  BOOL v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  id *v14;
  uint64_t v15;
  _QWORD v17[4];
  uint64_t v18;
  _QWORD v19[4];
  uint64_t v20;
  _QWORD v21[4];
  uint64_t v22;
  _QWORD v23[4];
  uint64_t v24;
  int v25;
  _QWORD v26[4];
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  _QWORD v30[4];
  uint64_t v31;
  int v32;
  _QWORD v33[4];
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;
  _QWORD v37[4];
  void *v38;
  _QWORD v39[4];
  void *v40;
  unsigned __int8 *__s;
  acl_flagset_t flagset_p;
  acl_permset_t permset_p;
  acl_entry_t entry_p[2];

  entry_p[1] = *(acl_entry_t *)MEMORY[0x1E0C80C00];
  permset_p = 0;
  entry_p[0] = 0;
  __s = 0;
  flagset_p = 0;
  if (acl_create_entry(a3, entry_p))
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke;
    v39[3] = &unk_1E8CB67B8;
    v40 = 0;
    __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke((uint64_t)v39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;
    goto LABEL_3;
  }
  v12 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  __s = v12;
  if (v12)
  {
    v13 = v12;
    if (mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, v12))
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_117;
      v35[3] = &unk_1E8CB67B8;
      v14 = (id *)&v36;
      v36 = 0;
      __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_117((uint64_t)v35);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        if (acl_get_permset(entry_p[0], &permset_p))
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_121;
          v33[3] = &unk_1E8CB67B8;
          v14 = (id *)&v34;
          v34 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_121((uint64_t)v33);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if (acl_add_perm(permset_p, (acl_perm_t)a4))
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_125;
          v30[3] = &unk_1E8CB4E70;
          v32 = a4;
          v14 = (id *)&v31;
          v31 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_125((uint64_t)v30);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if (acl_set_permset(entry_p[0], permset_p))
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_129;
          v28[3] = &unk_1E8CB67B8;
          v14 = (id *)&v29;
          v29 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_129((uint64_t)v28);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
      }
      if (a5)
      {
        if (acl_get_flagset_np(entry_p[0], &flagset_p))
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_133;
          v26[3] = &unk_1E8CB67B8;
          v14 = (id *)&v27;
          v27 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_133((uint64_t)v26);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if (acl_add_flag_np(flagset_p, (acl_flag_t)a5))
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_137;
          v23[3] = &unk_1E8CB4E70;
          v25 = a5;
          v14 = (id *)&v24;
          v24 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_137((uint64_t)v23);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if (acl_set_flagset_np(entry_p[0], flagset_p))
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_141;
          v21[3] = &unk_1E8CB67B8;
          v14 = (id *)&v22;
          v22 = 0;
          __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_141((uint64_t)v21);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
      }
      if (acl_set_tag_type(entry_p[0], ACL_EXTENDED_ALLOW))
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_145;
        v19[3] = &unk_1E8CB67B8;
        v14 = (id *)&v20;
        v20 = 0;
        __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_145((uint64_t)v19);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!acl_set_qualifier(entry_p[0], v13))
        {
          v9 = 0;
          v11 = 1;
LABEL_9:
          free(v13);
          memset_s(&__s, 8uLL, 0, 8uLL);
          if (!a6)
            goto LABEL_12;
          goto LABEL_10;
        }
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_149;
        v17[3] = &unk_1E8CB67B8;
        v14 = (id *)&v18;
        v18 = 0;
        __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_149((uint64_t)v17);
        v15 = objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_8:
    v9 = (void *)v15;

    v11 = 0;
    goto LABEL_9;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_113;
  v37[3] = &unk_1E8CB67B8;
  v38 = 0;
  __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_113((uint64_t)v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v38;
LABEL_3:

  v11 = 0;
  if (!a6)
    goto LABEL_12;
LABEL_10:
  if (!v11)
    *a6 = objc_retainAutorelease(v9);
LABEL_12:

  return v11;
}

- (_acl)_CopySystemContainerACLWithNumACEs:(int)a3 isDir:(BOOL)a4 inheritOnly:(BOOL)a5 withError:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _acl *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  void *obj_p[2];

  v7 = a5;
  v8 = a4;
  obj_p[1] = *(void **)MEMORY[0x1E0C80C00];
  obj_p[0] = acl_init(a3);
  if (!obj_p[0])
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke;
    v17[3] = &unk_1E8CB67B8;
    v18 = 0;
    __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke((uint64_t)v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (!a6)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (v7)
    v10 = 352;
  else
    v10 = 96;
  if (v8)
    v11 = 16382;
  else
    v11 = 16318;
  if (v8)
    v12 = v10;
  else
    v12 = 16;
  v16 = 0;
  -[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:](self, "_CreateSystemUserACEInACL:withPermissions:andFlags:withError:", obj_p, v11, v12, &v16);
  v13 = v16;
  v14 = (_acl *)obj_p[0];
  if (v13 && obj_p[0])
  {
    acl_free(obj_p[0]);
    v14 = 0;
    obj_p[0] = 0;
  }
  if (a6)
  {
LABEL_17:
    if (!v14)
    {
      *a6 = objc_retainAutorelease(v13);
      v14 = (_acl *)obj_p[0];
    }
  }
LABEL_19:

  return v14;
}

- (_acl)_CopyTopLevelSystemContainerACLWithError:(id *)a3
{
  _acl *v5;
  id v6;
  void *v7;
  id v8;
  _acl *v9;
  id v11;
  id v12;
  void *obj_p[2];

  obj_p[1] = *(void **)MEMORY[0x1E0C80C00];
  v12 = 0;
  v5 = -[MCMFileManager _CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:](self, "_CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:", 2, 1, 1, &v12);
  v6 = v12;
  v7 = v6;
  obj_p[0] = v5;
  if (!v5)
  {
    v9 = 0;
    if (!a3)
      goto LABEL_10;
    goto LABEL_8;
  }
  v11 = v6;
  -[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:](self, "_CreateSystemUserACEInACL:withPermissions:andFlags:withError:", obj_p, 1572, 0, &v11);
  v8 = v11;

  v9 = (_acl *)obj_p[0];
  if (v8 && obj_p[0])
  {
    acl_free(obj_p[0]);
    v9 = 0;
    obj_p[0] = 0;
  }
  v7 = v8;
  if (a3)
  {
LABEL_8:
    if (!v9)
    {
      *a3 = objc_retainAutorelease(v7);
      v9 = (_acl *)obj_p[0];
    }
  }
LABEL_10:

  return v9;
}

- (BOOL)setTopLevelSystemContainerACLAtURL:(id)a3 error:(id *)a4
{
  id v6;
  _acl *v7;
  id v8;
  id v9;
  int v10;
  BOOL v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v17[0] = 0;
  v7 = -[MCMFileManager _CopyTopLevelSystemContainerACLWithError:](self, "_CopyTopLevelSystemContainerACLWithError:", v17);
  v8 = v17[0];
  if (!v7)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  objc_msgSend(v6, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = acl_set_file((const char *)objc_msgSend(v9, "UTF8String"), ACL_TYPE_EXTENDED, v7);
  v11 = v10 == 0;

  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke;
    v14[3] = &unk_1E8CB61F8;
    v15 = v6;
    v16 = v8;
    v12 = v8;
    __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke((uint64_t)v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  acl_free(v7);
  if (a4)
  {
LABEL_7:
    if (!v11)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_9:

  return v11;
}

- (BOOL)standardizeACLsAtURL:(id)a3 isSystemContainer:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  int v11;
  _acl *v12;
  id v13;
  id v14;
  _acl *v15;
  id v16;
  _acl *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  _QWORD v25[7];
  int v26;
  int v27;
  BOOL v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  +[MCMPOSIXUser nobody](MCMPOSIXUser, "nobody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "UID");
  v11 = objc_msgSend(v9, "primaryGID");
  v32 = 0;
  v12 = -[MCMFileManager _CopyTopLevelSystemContainerACLWithError:](self, "_CopyTopLevelSystemContainerACLWithError:", &v32);
  v13 = v32;
  v14 = v13;
  v42[3] = (uint64_t)v12;
  if (!v12)
  {
LABEL_5:
    v18 = 0;
    goto LABEL_7;
  }
  v31 = v13;
  v15 = -[MCMFileManager _CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:](self, "_CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:", 1, 1, 0, &v31);
  v16 = v31;

  v38[3] = (uint64_t)v15;
  if (v15)
  {
    v30 = v16;
    v17 = -[MCMFileManager _CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:](self, "_CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:", 1, 0, 0, &v30);
    v14 = v30;

    v34[3] = (uint64_t)v17;
    if (v17)
    {
      v29 = v14;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __63__MCMFileManager_standardizeACLsAtURL_isSystemContainer_error___block_invoke;
      v25[3] = &unk_1E8CB4E98;
      v28 = a4;
      v25[4] = &v41;
      v25[5] = &v37;
      v25[6] = &v33;
      v26 = v10;
      v27 = v11;
      v18 = -[MCMFileManager _traverseDirectory:error:withBlock:](self, "_traverseDirectory:error:withBlock:", v8, &v29, v25);
      v19 = v29;

      v14 = v19;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v18 = 0;
  v14 = v16;
LABEL_7:
  v20 = (void *)v42[3];
  if (v20)
    acl_free(v20);
  v21 = (void *)v38[3];
  if (v21)
    acl_free(v21);
  v22 = (void *)v34[3];
  if (v22)
    acl_free(v22);
  if (a5)
    v23 = v18;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
    *a5 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v18;
}

- (BOOL)standardizeACLsForSystemContainerAtURL:(id)a3 error:(id *)a4
{
  return -[MCMFileManager standardizeACLsAtURL:isSystemContainer:error:](self, "standardizeACLsAtURL:isSystemContainer:error:", a3, 1, a4);
}

- (BOOL)standardizeAllSystemContainerACLsAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v7, "urlsForItemsInDirectoryAtURL:error:", v6, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;

  if (!v8)
  {
    objc_msgSend(v9, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v23 = objc_msgSend(v9, "code");

      if (v23 == 2)
        goto LABEL_19;
    }
    else
    {

    }
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v27;
      v40 = 2112;
      v41 = v9;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Failed to get items at URL%@ : %@", buf, 0x16u);

    }
    v24 = 0;
    if (a4)
      goto LABEL_27;
    goto LABEL_29;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_19:
    v24 = 1;
    goto LABEL_29;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v8;
    _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Potential containers requiring ACL migration: %@", buf, 0xCu);
  }
  v28 = a4;
  v30 = v6;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = v8;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    v15 = 1;
    do
    {
      v16 = 0;
      v17 = v9;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
        v31 = v17;
        v19 = -[MCMFileManager standardizeACLsForSystemContainerAtURL:error:](self, "standardizeACLsForSystemContainerAtURL:error:", v18, &v31);
        v9 = v31;

        if (!v19)
        {
          container_log_handle_for_category();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = v21;
            v40 = 2112;
            v41 = v9;
            _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Failed to set system container ACL at %@: %@", buf, 0x16u);

          }
          v15 = 0;
        }
        ++v16;
        v17 = v9;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 1;
  }

  v24 = v15 & 1;
  v8 = v29;
  v6 = v30;
  a4 = v28;
  if (v28)
  {
LABEL_27:
    if (!v24)
    {
      v9 = objc_retainAutorelease(v9);
      v24 = 0;
      *a4 = v9;
    }
  }
LABEL_29:

  return v24;
}

- (BOOL)standardizeOwnershipAtURL:(id)a3 toPOSIXUser:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  uid_t st_uid;
  NSObject *v15;
  __int16 v16;
  mode_t v17;
  NSObject *v18;
  int *v20;
  char *v21;
  int *v22;
  char *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  char *v30;
  stat v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  memset(&v31, 0, sizeof(v31));
  v9 = objc_retainAutorelease(a3);
  v10 = (char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke;
  v25[3] = &unk_1E8CB4EC0;
  v12 = v8;
  v26 = v12;
  v13 = -[MCMFileManager _traverseDirectory:error:withBlock:](self, "_traverseDirectory:error:withBlock:", v9, a5, v25);

  if (lstat(v10, &v31) == -1)
  {
    if (a5)
    {
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_161;
      v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v24[4] = v10;
      __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_161((uint64_t)v24);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else if (!strstr(v10, ".com.apple.mobile_container_manager.metadata.plist"))
  {
    st_uid = v31.st_uid;
    if (st_uid != objc_msgSend(v12, "UID")
      && lchown(v10, objc_msgSend(v12, "UID"), objc_msgSend(v12, "primaryGID")) == -1)
    {
      container_log_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 136315394;
        v28 = v10;
        v29 = 2080;
        v30 = v23;
        _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", buf, 0x16u);
      }

    }
    if ((v31.st_mode & 0x49) != 0)
      v16 = 493;
    else
      v16 = 420;
    if ((v31.st_mode & 0xF000) == 0x4000)
      v17 = 493;
    else
      v17 = v16;
    if (lchmod(v10, v17) == -1)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = __error();
        v21 = strerror(*v20);
        *(_DWORD *)buf = 136315394;
        v28 = v10;
        v29 = 2080;
        v30 = v21;
        _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", buf, 0x16u);
      }

    }
  }

  return v13;
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return -[MCMFileManager itemExistsAtURL:isDirectory:](self, "itemExistsAtURL:isDirectory:", a3, 0);
}

- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 error:(id *)a5
{
  return -[MCMFileManager itemAtURL:exists:isDirectory:error:](self, "itemAtURL:exists:isDirectory:error:", a3, a4, 0, a5);
}

- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  -[MCMFileManager itemAtURL:exists:isDirectory:error:](self, "itemAtURL:exists:isDirectory:error:", a3, &v5, a4, 0);
  return v5;
}

- (BOOL)itemAtURL:(id)a3 exists:(BOOL *)a4 isDirectory:(BOOL *)a5 error:(id *)a6
{
  return -[MCMFileManager itemAtURL:followSymlinks:exists:isDirectory:error:](self, "itemAtURL:followSymlinks:exists:isDirectory:error:", a3, 0, a4, a5, a6);
}

- (BOOL)itemAtURL:(id)a3 followSymlinks:(BOOL)a4 exists:(BOOL *)a5 isDirectory:(BOOL *)a6 error:(id *)a7
{
  return -[MCMFileManager itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:](self, "itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:", a3, a4, a5, a6, 0, a7);
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  return !-[MCMFileManager itemExistsAtURL:](self, "itemExistsAtURL:", a3);
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 dataProtectionClass:(int *)a4 error:(id *)a5
{
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  char v12;
  id *v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 256);
  v9 = v8;
  if (v8 < 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke;
    v19[3] = &unk_1E8CB67B8;
    v13 = (id *)v20;
    v20[0] = v7;
    __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke((uint64_t)v19);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0 || *__error() == 45)
    {
      v11 = 0;
      *a4 = v10;
      v12 = 1;
LABEL_10:
      close(v9);
      v15 = v12;
      goto LABEL_11;
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_176;
    v17[3] = &unk_1E8CB67B8;
    v13 = &v18;
    v18 = v7;
    __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_176((uint64_t)v17);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v14;

  if (a5)
    *a5 = objc_retainAutorelease(v11);
  v12 = 0;
  v15 = 0;
  if ((v9 & 0x80000000) == 0)
    goto LABEL_10;
LABEL_11:

  return v15;
}

- (void)printDirectoryStructureAtURL:(id)a3
{
  id v3;
  FTS *v4;
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  unsigned int fts_info;
  NSObject *v9;
  char *v10;
  char *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  char *fts_path;
  NSObject *v16;
  int *v17;
  char *v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  char *v22;
  char *v23[3];

  v23[2] = *(char **)MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v23[0] = (char *)objc_msgSend(v3, "fileSystemRepresentation");
  v23[1] = 0;
  v4 = fts_open(v23, 84, 0);
  if (v4)
  {
    v5 = v4;
    while (1)
    {
      do
      {
        v6 = fts_read(v5);
        if (!v6)
        {
          fts_close(v5);
          goto LABEL_17;
        }
        v7 = v6;
        fts_info = v6->fts_info;
        if (fts_info > 0xD)
          break;
        if (((1 << fts_info) & 0x310A) != 0)
        {
          container_log_handle_for_category();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          fts_path = v7->fts_path;
          *(_DWORD *)buf = 136315138;
          v20 = fts_path;
          v12 = v9;
          v13 = "\tOrphaned File: %s";
          v14 = 12;
          goto LABEL_12;
        }
      }
      while (fts_info == 6);
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v10 = v7->fts_path;
      v11 = strerror(v7->fts_errno);
      *(_DWORD *)buf = 136315394;
      v20 = v10;
      v21 = 2080;
      v22 = v11;
      v12 = v9;
      v13 = "FTS returned error for %s : %s";
      v14 = 22;
LABEL_12:
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, v13, buf, v14);
LABEL_7:

    }
  }
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = __error();
    v18 = strerror(*v17);
    *(_DWORD *)buf = 138412546;
    v20 = (char *)v3;
    v21 = 2080;
    v22 = v18;
    _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "fts_open failed for %@ : %s", buf, 0x16u);
  }

LABEL_17:
}

- (BOOL)enableFastDiskUsageForURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  _OWORD __s[17];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  memset(__s, 0, sizeof(__s));
  memset_s(__s, 0x110uLL, 0, 0x110uLL);
  *(_QWORD *)&__s[0] = 0x100000001;
  *((_QWORD *)&__s[0] + 1) = 28;
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _QWORD))(*MEMORY[0x1E0C835E8] + 312))(v5, 3239070321, __s, 0);
  if (v6)
  {
    v7 = *__error();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke;
    v11[3] = &__block_descriptor_44_e14___NSError_8__0l;
    v11[4] = v5;
    v12 = v7;
    __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke((uint64_t)v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }
  else
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446210;
      v14 = v5;
      _os_log_debug_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEBUG, "[%{public}s] Enabled APFSIOC_DIR_STATS_OP", buf, 0xCu);
    }

    v8 = 0;
  }

  return v6 == 0;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fastDiskUsageForURL:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *v39;
  uint32_t v40;
  os_signpost_id_t v41;
  os_signpost_id_t v42;
  id v43;
  uint64_t v44;
  _BYTE v45[22];
  uint8_t buf[64];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
LABEL_42:
    v31 = -[MCMFileManager diskUsageForURL:](self, "diskUsageForURL:", v4, v41, v42);
    v29 = v36;
    goto LABEL_43;
  }
  v44 = 0;
  objc_msgSend(v4, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "fileSystemRepresentation");
  container_log_handle_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v4);

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);
  }

  if (_os_feature_enabled_impl())
  {
    *(_QWORD *)v45 = 0;
    *(_QWORD *)&v45[8] = 0;
    v12 = MEMORY[0x1E0C835E8];
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t))(*MEMORY[0x1E0C835E8] + 184))(v6, 1, v45, 16);
    v14 = *__error();
    if (_os_feature_enabled_impl() && v13 && v14 == 45)
    {
      *(_QWORD *)v45 = 0;
      *(_QWORD *)&v45[8] = 0;
      v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, _QWORD))(*(_QWORD *)v12 + 312))(v6, 2148026882, &v44, 0);
      v16 = *__error();
      container_log_handle_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v16;
          _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, "[%{public}s] Failed to set maintain-dir-stats: %{darwin.errno}d", buf, 0x12u);
        }
        v11 = v8 - 1;
        goto LABEL_32;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_INFO, "[%{public}s] Enabled APFSIOC_MAINTAIN_DIR_STATS", buf, 0xCu);
      }

      v13 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t))(*(_QWORD *)v12 + 184))(v6, 1, v45, 16);
      v14 = *__error();
      v11 = v8 - 1;
    }
    if (v13)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      v25 = "[%{public}s] Failed to get dirstats: %{darwin.errno}d";
      v26 = buf;
LABEL_47:
      v39 = v18;
      v40 = 18;
      goto LABEL_48;
    }
    v31 = *(_QWORD *)v45;
    if ((*(_QWORD *)v45 & 0x8000000000000000) != 0)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = *(_QWORD *)v45;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v14;
      v25 = "[%{public}s] Invalid size (%lld) from dirstats: %{darwin.errno}d";
      v26 = buf;
      v39 = v18;
      v40 = 28;
LABEL_48:
      _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, v25, v26, v40);
      goto LABEL_32;
    }
    v41 = v11;
    v42 = v8;
    v28 = 0;
    v30 = 0;
    v27 = 0;
    v29 = *(_QWORD *)&v45[8];
  }
  else
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    memset(buf, 0, sizeof(buf));
    memset_s(buf, 0x110uLL, 0, 0x110uLL);
    *(_QWORD *)buf = 1;
    *(_QWORD *)&buf[8] = 1;
    v19 = MEMORY[0x1E0C835E8];
    v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *, _QWORD))(*MEMORY[0x1E0C835E8] + 312))(v6, 3239070321, buf, 0);
    v21 = *__error();
    if (_os_feature_enabled_impl() && v20 && v21 == 45)
    {
      v43 = 0;
      v22 = -[MCMFileManager enableFastDiskUsageForURL:error:](self, "enableFastDiskUsageForURL:error:", v4, &v43);
      v18 = v43;
      container_log_handle_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v45 = 136446466;
          *(_QWORD *)&v45[4] = v6;
          *(_WORD *)&v45[12] = 2112;
          *(_QWORD *)&v45[14] = v18;
          _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "[%{public}s] Enabling fast disk sizing failed: %@", v45, 0x16u);
        }

        goto LABEL_32;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v45 = 136446210;
        *(_QWORD *)&v45[4] = v6;
        _os_log_impl(&dword_1CF807000, v24, OS_LOG_TYPE_INFO, "[%{public}s] Enabled APFSIOC_DIR_STATS_OP", v45, 0xCu);
      }

      memset_s(buf, 0x110uLL, 0, 0x110uLL);
      *(_QWORD *)buf = 1;
      *(_QWORD *)&buf[8] = 1;
      v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *, _QWORD))(*(_QWORD *)v19 + 312))(v6, 3239070321, buf, 0);
      v21 = *__error();

    }
    if (v20)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_32:

        v32 = 0;
        v29 = 0;
        v31 = 0;
        goto LABEL_38;
      }
      *(_DWORD *)v45 = 136446466;
      *(_QWORD *)&v45[4] = v6;
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&v45[14] = v21;
      v25 = "[%{public}s] Fast disk sizing failed: %{darwin.errno}d";
      v26 = v45;
      goto LABEL_47;
    }
    v41 = v8 - 1;
    v42 = v8;
    v27 = *((_QWORD *)&v47 + 1);
    v28 = v48;
    v29 = *(_QWORD *)&buf[56];
    v30 = v47;
    v31 = *((_QWORD *)&v47 + 1) + v47 + v48;
  }
  container_log_handle_for_category();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v31;
    *(_WORD *)&buf[32] = 2048;
    *(_QWORD *)&buf[34] = v30;
    *(_WORD *)&buf[42] = 2048;
    *(_QWORD *)&buf[44] = v27;
    *(_WORD *)&buf[52] = 2048;
    *(_QWORD *)&buf[54] = v28;
    _os_log_impl(&dword_1CF807000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}s]: descendants: %llu, total size: %llu [ph%llu; cl%llu; pu%llu]",
      buf,
      0x3Eu);
  }

  v32 = 1;
  v11 = v41;
  v8 = v42;
LABEL_38:
  container_log_handle_for_category();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_DWORD *)buf = 138478339;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2049;
    *(_QWORD *)&buf[24] = v31;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v35, OS_SIGNPOST_INTERVAL_END, v8, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu  size=%{private, signpost.description:attribute}llu ", buf, 0x20u);
  }

  if ((v32 & 1) == 0)
    goto LABEL_42;
LABEL_43:

  v37 = v31;
  v38 = v29;
  result.var1 = v38;
  result.var0 = v37;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)diskUsageForURL:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int *v12;
  char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int *v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  _BYTE v32[24];
  uint64_t v33;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "fileSystemRepresentation");
  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, v3);

  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138477827;
    v30 = (uint64_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@ ", buf, 0xCu);
  }

  if (!v5)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)v3;
      v14 = "Failed to get path to url %@";
      v15 = v10;
      v16 = 12;
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  v27 = 0;
  v28 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, unint64_t *, uint64_t))(*MEMORY[0x1E0C835E8] + 184))(v5, 2, &v27, 16))
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 136446722;
      v30 = v5;
      v31 = 1024;
      *(_DWORD *)v32 = v11;
      *(_WORD *)&v32[4] = 2080;
      *(_QWORD *)&v32[6] = v13;
      v14 = "Failed to get dirstats on %{public}s using fallback: (err %d) %s";
      v15 = v10;
      v16 = 28;
LABEL_20:
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v18 = v27;
  if ((v27 & 0x8000000000000000) != 0)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v23 = v27;
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 134218754;
      v30 = v23;
      v31 = 2082;
      *(_QWORD *)v32 = v5;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v24;
      *(_WORD *)&v32[14] = 2080;
      *(_QWORD *)&v32[16] = v26;
      v14 = "Invalid size (%lld) from dirstats on %{public}s using fallback: (err %d) %s";
      v15 = v10;
      v16 = 38;
      goto LABEL_20;
    }
LABEL_9:
    v17 = 0;
    v18 = 0;
    goto LABEL_10;
  }
  v17 = v28;
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v30 = v5;
    v31 = 2048;
    *(_QWORD *)v32 = v17;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)&v32[10] = v18;
    _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s]: descendants: %llu, total size: %llu, using fallback", buf, 0x20u);
  }
LABEL_10:

  container_log_handle_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138478339;
    v30 = (uint64_t)v4;
    v31 = 2050;
    *(_QWORD *)v32 = v17;
    *(_WORD *)&v32[8] = 2049;
    *(_QWORD *)&v32[10] = v18;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v20, OS_SIGNPOST_INTERVAL_END, v7, "CalculatingDiskUsage", " path=%{private, signpost.description:attribute}@  numNodes=%{public, signpost.description:attribute}llu  size=%{private, signpost.description:attribute}llu ", buf, 0x20u);
  }

  v21 = v18;
  v22 = v17;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 - 1;
  if (v5 == 1)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, v6 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (-[MCMFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v8))
      {
        -[MCMFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v8, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "subarrayWithRange:", v6 + 1, objc_msgSend(v4, "count") - (v6 + 1));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v17 = v15;
            v18 = 2112;
            v19 = v12;
            _os_log_debug_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEBUG, "Realpathed %@ ; appending non-existing components %@",
              buf,
              0x16u);

          }
          objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }

      }
      if (v9)
        break;
      --v6;
    }
    while (v6);
  }

  return v9;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  -[MCMFileManager realPathForURL:isDirectory:error:](self, "realPathForURL:isDirectory:error:", v6, objc_msgSend(v6, "hasDirectoryPath"), &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v7)
  {
LABEL_10:
    v12 = v7;
    goto LABEL_11;
  }
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) || objc_msgSend(v9, "code") != 2)
  {

    goto LABEL_7;
  }

  if (!v4)
  {
LABEL_7:
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "fileSystemRepresentation");
      *(_DWORD *)buf = 136315394;
      v19 = v16;
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to realpath [%s] : %@", buf, 0x16u);

    }
    goto LABEL_10;
  }
  objc_msgSend(v6, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMFileManager _realPathWhatExistsInPath:](self, "_realPathWhatExistsInPath:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v12;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t v14;
  void *v15;
  int v16;
  BOOL v17;
  unsigned int *v19;
  id v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v19 = a5;
    v20 = v7;
    objc_msgSend(v7, "pathComponents");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      v13 = a4;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("..")) & 1) != 0)
          break;
        if ((objc_msgSend(v15, "isEqualToString:", &stru_1E8CB6A50) & 1) == 0
          && (objc_msgSend(v15, "isEqualToString:", CFSTR(".")) & 1) == 0)
        {
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("/")) ^ 1;
LABEL_12:
          v13 += v16;
          if (v13 < (int)a4)
          {

            v17 = 0;
            goto LABEL_22;
          }
        }
        if (v11 == ++v14)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_19;
        }
      }
      v16 = -1;
      goto LABEL_12;
    }
    v13 = a4;
LABEL_19:

    if (v19)
      *v19 = v13;
    v17 = 1;
LABEL_22:
    v8 = v20;
  }
  else
  {
    v9 = 0;
    v17 = 0;
  }

  return v17;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  char *v6;
  char *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  NSObject *v25;
  char *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  void *v33;
  char *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  ssize_t v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  char *v50;
  char *v51;
  int *v52;
  char *v53;
  NSObject *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  char *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  void *v70;
  char *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char v82;
  void *v83;
  void *v84;
  unsigned int v85;
  uint8_t buf[4];
  char *v87;
  __int16 v88;
  char *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  char v98[1025];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (char *)a4;
  bzero(v98, 0x401uLL);
  if (!v6 || !v7)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412546;
    v87 = v7;
    v88 = 2112;
    v89 = v6;
    v30 = "The base path %@ and/or suspicious path %@ were nil";
    v31 = v25;
    v32 = 22;
    goto LABEL_14;
  }
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/private/"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (char *)v13;
  }
  objc_msgSend(v6, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("/private/"));

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (char *)v19;
  }
  objc_msgSend(v6, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "hasPrefix:", v21);

  if ((v22 & 1) == 0)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v51 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v26;
      v88 = 2112;
      v89 = v51;
      _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "supiscious path %@ does not contain base path %@ as a prefix", buf, 0x16u);

      goto LABEL_40;
    }
    goto LABEL_16;
  }
  objc_msgSend(v6, "pathComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", CFSTR(".."));

  if (v24)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v26;
      v27 = "The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
      v28 = v25;
      v29 = 12;
LABEL_25:
      _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_40:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v6 = objc_retainAutorelease(v6);
  v40 = readlink((const char *)objc_msgSend(v6, "fileSystemRepresentation"), v98, 0x400uLL);
  if (v40 == -1)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      objc_msgSend(v6, "path");
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      goto LABEL_31;
    }
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 136315138;
    v87 = v53;
    v30 = "Readlink failed: %s";
    v31 = v25;
    v32 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_16;
  }
  if (v98[0] == 47)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v26;
      v88 = 2080;
      v89 = v98;
      v27 = "Rejecting %@ -> %s, as absolute symlinks are not allowed";
      v28 = v25;
      v29 = 22;
      goto LABEL_25;
    }
    goto LABEL_16;
  }
  v85 = 0;
  objc_msgSend(v7, "path");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[MCMFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v41, 0, &v85);

  if (v42)
  {
    objc_msgSend(v6, "path");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "substringFromIndex:", objc_msgSend(v44, "length"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "stringByDeletingLastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", v98, v40);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingPathComponent:", v46);
    v34 = (char *)objc_claimAutoreleasedReturnValue();

    if (!-[MCMFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v34, v85, 0))
    {
      container_log_handle_for_category();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "path");
        v50 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v87 = v50;
        v88 = 2112;
        v89 = v34;
        v90 = 2112;
        v91 = v72;
        _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Rejecting %@ -> %@, as it is points outside or to the base %@", buf, 0x20u);

        goto LABEL_65;
      }
LABEL_47:

      goto LABEL_17;
    }
LABEL_31:
    -[MCMFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v7, 0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v35 = (void *)v47;
      -[MCMFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v6, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v48)
      {
        container_log_handle_for_category();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "path");
          v71 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v71;
          _os_log_error_impl(&dword_1CF807000, v54, OS_LOG_TYPE_ERROR, "Failed to retrieve realpath for suspicious path %@", buf, 0xCu);

        }
        goto LABEL_18;
      }
      v36 = v48;
      if (v40 != -1)
      {
LABEL_34:
        v36 = v36;
        v37 = v36;
        goto LABEL_20;
      }
      objc_msgSend(v48, "pathComponents");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pathComponents");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v83, "count");
      v84 = v55;
      v57 = objc_msgSend(v55, "count");
      if (v57 < 2 || v56 <= 1)
      {
        container_log_handle_for_category();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "path");
          v81 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "path");
          v64 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "path");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "path");
          v77 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v87 = v81;
          v88 = 2112;
          v89 = v64;
          v90 = 2112;
          v91 = v65;
          v92 = 2112;
          v93 = v77;
          v67 = (void *)v77;
          v68 = "Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)";
          goto LABEL_69;
        }
      }
      else
      {
        v58 = v57;
        v59 = 1;
        objc_msgSend(v83, "objectAtIndexedSubscript:", 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v60, "isEqualToString:", CFSTR("private")))
          v59 = 2;

        objc_msgSend(v84, "objectAtIndexedSubscript:", 1);
        v79 = v56;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "isEqualToString:", CFSTR("private")))
          v62 = 2;
        else
          v62 = 1;

        if (v79 - v59 <= v58 - v62)
        {
          if (v79 <= v59)
          {
LABEL_63:

            goto LABEL_34;
          }
          while (1)
          {
            objc_msgSend(v83, "objectAtIndexedSubscript:", v59);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectAtIndexedSubscript:", v62);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v69, "isEqualToString:", v70);

            if ((v82 & 1) == 0)
              break;
            ++v59;
            ++v62;
            if (v79 == v59)
              goto LABEL_63;
          }
          v73 = v62;
          container_log_handle_for_category();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "path");
            v81 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "path");
            v80 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "path");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "path");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "objectAtIndexedSubscript:", v59);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectAtIndexedSubscript:", v73);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v87 = v81;
            v88 = 2112;
            v89 = v80;
            v90 = 2112;
            v91 = v78;
            v92 = 2112;
            v93 = (uint64_t)v74;
            v94 = 2112;
            v95 = v75;
            v96 = 2112;
            v97 = v76;
            _os_log_error_impl(&dword_1CF807000, v63, OS_LOG_TYPE_ERROR, "Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
              buf,
              0x3Eu);

LABEL_70:
          }
        }
        else
        {
          container_log_handle_for_category();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "path");
            v81 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "path");
            v64 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "path");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "path");
            v66 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v87 = v81;
            v88 = 2112;
            v89 = v64;
            v90 = 2112;
            v91 = v65;
            v92 = 2112;
            v93 = v66;
            v67 = (void *)v66;
            v68 = "Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)";
LABEL_69:
            _os_log_error_impl(&dword_1CF807000, v63, OS_LOG_TYPE_ERROR, v68, buf, 0x2Au);

            goto LABEL_70;
          }
        }
      }

      goto LABEL_19;
    }
    container_log_handle_for_category();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v50 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v50;
      _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Failed to retrieve realpath for base path %@ ", buf, 0xCu);
LABEL_65:

      goto LABEL_47;
    }
    goto LABEL_47;
  }
  container_log_handle_for_category();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "path");
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v87 = v26;
    v27 = "Failed to retrieve depth of %@";
    goto LABEL_11;
  }
LABEL_16:

  v33 = 0;
  v34 = 0;
LABEL_17:
  v35 = 0;
LABEL_18:
  v36 = 0;
LABEL_19:
  v37 = 0;
LABEL_20:
  v38 = v37;

  return v38;
}

- (id)realPathForURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  _BYTE *v17;
  _BYTE v18[1025];
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  bzero(v18, 0x401uLL);
  v8 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (container_realpath())
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke;
    v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v13[4] = v8;
    __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke((uint64_t)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = v8;
    v16 = 2080;
    v17 = v18;
    _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "container_realpath([%s]) → [%s]", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v18, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (a5)
  {
LABEL_7:
    if (!v10)
      *a5 = objc_retainAutorelease(v9);
  }
LABEL_9:

  return v10;
}

- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return -[MCMFileManager readDataFromURL:options:fsNode:error:](self, "readDataFromURL:options:fsNode:error:", a3, a4, 0, a5);
}

- (id)readDataFromURL:(id)a3 options:(unint64_t)a4 fsNode:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MCMFSNode *v13;
  int v14;
  id v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  size_t v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  char *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  __darwin_ino64_t v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  unint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  char *__s;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  off_t st_size;
  stat v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  __s = 0;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke;
    v50[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v50[4] = a4 & 0xFFFFFFFFFFFFFFFDLL;
    __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke((uint64_t)v50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    v14 = -1;
    goto LABEL_33;
  }
  v15 = objc_retainAutorelease(v9);
  v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 256);
  v14 = v16;
  if (v16 < 0)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_207;
    v48[3] = &unk_1E8CB67B8;
    v49 = v15;
    __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_207((uint64_t)v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v49;
LABEL_18:

    v12 = 0;
    v13 = 0;
    goto LABEL_33;
  }
  if ((a4 & 2) != 0)
    fcntl(v16, 48, 1);
  v17 = (char *)malloc_type_calloc(1uLL, 0x4000uLL, 0xB296B477uLL);
  __s = v17;
  if (!v17)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_211;
    v45[3] = &unk_1E8CB6180;
    v47 = 0x4000;
    v46 = v15;
    __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_211((uint64_t)v45);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v46;
    goto LABEL_18;
  }
  v18 = v17;
  v34 = v15;
  v35 = v10;
  v19 = 0;
  v20 = 0x4000;
  v21 = 0x4000;
  do
  {
    v22 = read(v14, &v18[v19], v21);
    if ((v22 & 0x8000000000000000) != 0)
    {
      __s = v18;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_215;
      v43[3] = &unk_1E8CB67B8;
      v44 = v34;
      __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_215((uint64_t)v43);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v44;
      goto LABEL_21;
    }
    v23 = v22;
    v24 = v21 - v22;
    v19 += v22;
    if (v22 < v21 - v22)
      break;
    if (v20 > 0x9FC000)
    {
      __s = v18;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_219;
      v41[3] = &unk_1E8CB67B8;
      v42 = v34;
      __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_219((uint64_t)v41);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v42;
LABEL_21:

      v13 = 0;
      v10 = v35;
LABEL_32:
      free(v18);
      memset_s(&__s, 8uLL, 0, 8uLL);
      v12 = 0;
      goto LABEL_33;
    }
    v25 = (char *)malloc_type_realloc(v18, v20 + 0x4000, 0x9DCD03D8uLL);
    if (!v25)
    {
      __s = 0;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_223;
      v38[3] = &unk_1E8CB6180;
      v40 = v20 + 0x4000;
      v39 = v34;
      __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_223((uint64_t)v38);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v13 = 0;
      v10 = v35;
      goto LABEL_33;
    }
    v18 = v25;
    v21 = v24 + 0x4000;
    v20 += 0x4000;
  }
  while (v23);
  __s = v18;
  if (a5)
  {
    memset(&v58, 0, sizeof(v58));
    v10 = v35;
    if (fstat(v14, &v58))
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_225;
      v36[3] = &unk_1E8CB67B8;
      v37 = v34;
      __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_225((uint64_t)v36);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      goto LABEL_32;
    }
    if (v19 != v58.st_size)
    {
      container_log_handle_for_category();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v34, "path");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v53 = v19;
        v54 = 2112;
        v55 = v33;
        v56 = 2048;
        st_size = v58.st_size;
        _os_log_error_impl(&dword_1CF807000, v28, OS_LOG_TYPE_ERROR, "Read size (%zd) of file [%@] did not match its length (%llu). Possibly a concurrent write+read.", buf, 0x20u);

        v10 = v35;
      }

    }
    v13 = -[MCMFSNode initWithStat:]([MCMFSNode alloc], "initWithStat:", &v58);
  }
  else
  {
    v13 = 0;
    v10 = v35;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v34, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v12, "length");
    v58.st_dev = 138543874;
    *(_QWORD *)&v58.st_mode = v30;
    WORD2(v58.st_ino) = 2050;
    *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = v31;
    HIWORD(v58.st_gid) = 2050;
    *(_QWORD *)&v58.st_rdev = a4;
    _os_log_impl(&dword_1CF807000, v29, OS_LOG_TYPE_DEFAULT, "Read [%{public}@], length = %{public}lu, options = 0x%{public}lx", (uint8_t *)&v58, 0x20u);

  }
  v11 = 0;
  v18 = __s;
  if (!v12)
    goto LABEL_32;
LABEL_33:
  close(v14);
  if (a6 && v11)
    *a6 = objc_retainAutorelease(v11);
  if (a5 && v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 mode:(unsigned __int16)a6 error:(id *)a7
{
  int v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  id *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t (*v43)(uint64_t, uint64_t, _QWORD);
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  id v49;
  unsigned int v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  NSObject *v56;
  __int16 v57;
  _QWORD v58[4];
  NSObject *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  int v63;
  _QWORD v64[5];
  _QWORD v65[4];
  id v66;
  _QWORD v67[5];
  char *__s;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v8 = a6;
  v77 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = objc_retainAutorelease(v11);
  v14 = objc_msgSend(v13, "bytes");
  __s = 0;
  container_seam_fs_ensure_lazy_loaded();
  v15 = (uint64_t *)MEMORY[0x1E0C835E8];
  if ((a5 & 0xFFFFFFFF8FFFFFFELL) != 0)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke;
    v67[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v67[4] = a5 & 0xFFFFFFFF8FFFFFFELL;
    __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke((uint64_t)v67);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v17 = (void *)v16;
LABEL_4:
    v18 = 0;
    v19 = 0;
    goto LABEL_5;
  }
  v21 = *MEMORY[0x1E0C835E8];
  v22 = (a5 & 0xF0000000) - 0x10000000;
  if (v22 >> 28 > 4)
    v23 = 0xFFFFFFFFLL;
  else
    v23 = *(unsigned int *)((char *)&unk_1CF8D9C38 + (v22 >> 26));
  v24 = *(_QWORD *)(v21 + 504);
  if ((a5 & 1) == 0)
  {
    v18 = 0;
    v25 = 1793;
    v26 = -1;
    goto LABEL_22;
  }
  v27 = objc_retainAutorelease(v12);
  if (asprintf(&__s, "%s.atomic.XXXXXX", (const char *)objc_msgSend(v27, "fileSystemRepresentation")) < 0)
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_234;
    v65[3] = &unk_1E8CB67B8;
    v66 = v27;
    __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_234((uint64_t)v65);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  v28 = *v15;
  if (!v24)
  {
    v29 = (*(uint64_t (**)(char *))(v28 + 496))(__s);
    if ((v29 & 0x80000000) == 0)
      goto LABEL_21;
LABEL_45:
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_238;
    v64[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v64[4] = __s;
    __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_238((uint64_t)v64);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v29 = (*(uint64_t (**)(char *, uint64_t, _QWORD))(v28 + 504))(__s, v23, 0);
  if (v29 < 0)
    goto LABEL_45;
LABEL_21:
  v49 = v12;
  v30 = v8;
  v31 = a7;
  v32 = v29;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __s, 0, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v32;
  a7 = v31;
  v8 = v30;
  v12 = v49;
  v21 = *v15;
  v25 = 256;
LABEL_22:
  v50 = v26;
  if (v24)
    v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v21 + 520))(objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"), v25, v23, 0);
  else
    v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 512))(objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"), v25);
  v34 = v33;
  v35 = *__error();
  v37 = (a5 & 1) == 0 || v35 != 2;
  if ((v34 & 0x80000000) == 0 || !v37)
  {
    if ((a5 & 1) != 0)
      v38 = v50;
    else
      v38 = v34;
    v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0C835E8] + 704))(v38, v14, objc_msgSend(v13, "length"));
    if (v39 == objc_msgSend(v13, "length"))
    {
      if ((a5 & 1) != 0)
      {
        v15 = (uint64_t *)MEMORY[0x1E0C835E8];
        v40 = (*(uint64_t (**)(uint64_t))(*MEMORY[0x1E0C835E8] + 688))(18);
        (*(void (**)(void))(*v15 + 688))();
        v41 = v8 & ~v40;
        if (((*(uint64_t (**)(_QWORD, uint64_t))(*v15 + 208))(v50, v41) & 0x80000000) != 0)
        {
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_250;
          v55[3] = &unk_1E8CB4F10;
          v56 = v18;
          v57 = v41;
          __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_250((uint64_t)v55);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v42 = v56;
          goto LABEL_54;
        }
        if ((v34 & 0x80000000) != 0)
        {
          v48 = 4;
        }
        else
        {
          (*(void (**)(uint64_t))(*v15 + 152))(v34);
          v48 = 2;
          v34 = 0xFFFFFFFFLL;
        }
        (*(void (**)(_QWORD))(*v15 + 152))(v50);
        v43 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*v15 + 640);
        v51 = objc_retainAutorelease(v18);
        v44 = objc_msgSend(v51, "fileSystemRepresentation");
        v45 = objc_retainAutorelease(v12);
        if ((v43(v44, objc_msgSend(v45, "fileSystemRepresentation"), v48) & 0x80000000) != 0)
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_254;
          v52[3] = &unk_1E8CB61F8;
          v18 = v51;
          v53 = v18;
          v54 = v45;
          __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_254((uint64_t)v52);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = 0;
          v15 = (uint64_t *)MEMORY[0x1E0C835E8];
          goto LABEL_5;
        }
        v50 = -1;
      }
      container_log_handle_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v13, "length");
        *(_DWORD *)buf = 138544130;
        v70 = v46;
        v71 = 2050;
        v72 = v47;
        v73 = 2050;
        v74 = a5;
        v75 = 1026;
        v76 = v8;
        _os_log_impl(&dword_1CF807000, v42, OS_LOG_TYPE_DEFAULT, "Wrote [%{public}@], length = %{public}lu, options = 0x%{public}lx, mode = 0%{public}o", buf, 0x26u);

      }
      v17 = 0;
      v19 = 1;
    }
    else
    {
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_246;
      v58[3] = &unk_1E8CB67B8;
      v59 = v12;
      __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_246((uint64_t)v58);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v42 = v59;
    }
    v15 = (uint64_t *)MEMORY[0x1E0C835E8];
LABEL_54:

    if ((v34 & 0x80000000) == 0)
      (*(void (**)(uint64_t))(*v15 + 152))(v34);
    goto LABEL_56;
  }
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_242;
  v60[3] = &unk_1E8CB5A28;
  v61 = v12;
  v62 = v18;
  v63 = v35;
  __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_242((uint64_t)v60);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v15 = (uint64_t *)MEMORY[0x1E0C835E8];
LABEL_56:
  if ((v50 & 0x80000000) == 0)
    (*(void (**)(void))(*v15 + 152))();
LABEL_5:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  if (v18)
    (*(void (**)(uint64_t))(*v15 + 696))(objc_msgSend(objc_retainAutorelease(v18), "fileSystemRepresentation"));
  if (a7 && v17)
    *a7 = objc_retainAutorelease(v17);

  return v19;
}

- (BOOL)compareVolumeForURL:(id)a3 versusURL:(id)a4 isSameVolume:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  int v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  int v51;
  _OWORD v52[3];
  _BYTE v53[36];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, 36);
  v40 = xmmword_1CF8D9C08;
  v41 = 0;
  v38 = xmmword_1CF8D9C08;
  v39 = 0;
  if (objc_msgSend(v9, "hasDirectoryPath"))
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (objc_msgSend(v10, "hasDirectoryPath"))
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = objc_retainAutorelease(v12);
  if (getattrlist((const char *)objc_msgSend(v15, "fileSystemRepresentation"), &v40, v53, 0x24uLL, 0))
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_267;
    v32[3] = &unk_1E8CB67B8;
    v16 = &v33;
    v33 = v15;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_267((uint64_t)v32);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (*(_DWORD *)v53 != 36)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_263;
    v47[3] = &unk_1E8CB4F38;
    v16 = &v48;
    v48 = v15;
    v49 = *(_OWORD *)v53;
    v50 = *(_OWORD *)&v53[16];
    v51 = *(_DWORD *)&v53[32];
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_263((uint64_t)v47);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((v53[4] & 2) == 0)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke;
    v36[3] = &unk_1E8CB67B8;
    v16 = &v37;
    v37 = v15;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke((uint64_t)v36);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((v53[4] & 4) == 0)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_261;
    v34[3] = &unk_1E8CB67B8;
    v16 = &v35;
    v35 = v15;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_261((uint64_t)v34);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v18 = *(_DWORD *)&v53[24];
  v19 = *(_QWORD *)&v53[28];
  v20 = objc_retainAutorelease(v14);
  if (getattrlist((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v38, v52, 0x24uLL, 0))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_277;
    v26[3] = &unk_1E8CB67B8;
    v16 = &v27;
    v27 = v20;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_277((uint64_t)v26);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (LODWORD(v52[0]) != 36)
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_275;
    v42[3] = &unk_1E8CB4F38;
    v16 = &v43;
    v43 = v20;
    v44 = v52[0];
    v45 = v52[1];
    v46 = v52[2];
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_275((uint64_t)v42);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((BYTE4(v52[0]) & 2) == 0)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_271;
    v30[3] = &unk_1E8CB67B8;
    v16 = &v31;
    v31 = v20;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_271((uint64_t)v30);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((BYTE4(v52[0]) & 4) == 0)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_273;
    v28[3] = &unk_1E8CB67B8;
    v16 = &v29;
    v29 = v20;
    __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_273((uint64_t)v28);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v21 = (id)v17;

    if (a6)
    {
      v21 = objc_retainAutorelease(v21);
      v22 = 0;
      *a6 = v21;
    }
    else
    {
      v22 = 0;
    }
    goto LABEL_26;
  }
  v21 = 0;
  if (a5)
  {
    v25 = v18 == DWORD2(v52[1]) && v19 == *(_QWORD *)((char *)&v52[1] + 12);
    *a5 = v25;
  }
  v22 = 1;
LABEL_26:

  return v22;
}

- (BOOL)checkFileSystemAtURL:(id)a3 isCaseSensitive:(BOOL *)a4 canAtomicSwap:(BOOL *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  v22 = xmmword_1CF8D9C20;
  v23 = 0;
  if (objc_msgSend(v9, "hasDirectoryPath"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_retainAutorelease(v10);
  if (getattrlist((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v22, &v30, 0x38uLL, 0))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_284;
    v18[3] = &unk_1E8CB67B8;
    v12 = &v19;
    v19 = v11;
    __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_284((uint64_t)v18);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((_DWORD)v30 != 56)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_282;
    v24[3] = &unk_1E8CB4F60;
    v12 = &v25;
    v14 = v11;
    v26 = v30;
    v27 = v31;
    v28 = v32;
    v25 = v14;
    v29 = v33;
    __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_282((uint64_t)v24);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v15 = (id)v13;

    if (a6)
    {
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a6 = v15;
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_18;
  }
  if ((BYTE10(v30) & 2) == 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke;
    v20[3] = &unk_1E8CB67B8;
    v12 = &v21;
    v21 = v11;
    __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke((uint64_t)v20);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a4)
    *a4 = ((unsigned __int16)(WORD4(v32) & WORD4(v31)) >> 8) & 1;
  v15 = 0;
  if (a5)
    *a5 = (BYTE14(v32) & BYTE14(v31) & 4) != 0;
  v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)checkFileSystemAtURL:(id)a3 supportsPerFileKeys:(BOOL *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  _QWORD v14[4];
  id v15;
  statfs v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "hasDirectoryPath"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  bzero(&v16, 0x878uLL);
  v10 = objc_retainAutorelease(v9);
  v11 = statfs((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v16);
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke;
    v14[3] = &unk_1E8CB67B8;
    v15 = v10;
    __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke((uint64_t)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      *a5 = v12;
    }
  }
  else
  {
    v12 = 0;
    if (a4)
      *a4 = (v16.f_flags & 0x80) != 0;
  }

  return v11 == 0;
}

- (BOOL)_enumeratePOSIX1eACLEntriesAtURL:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t (**v7)(id, acl_entry_t, _QWORD *, id *);
  const char *v8;
  const char *v9;
  _acl *file;
  _acl *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  _QWORD v22[5];
  id v23;
  acl_entry_t entry_p;
  _QWORD v25[5];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (**)(id, acl_entry_t, _QWORD *, id *))a5;
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (!v8)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("URL is nil"));
    v26[0] = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    v27[1] = &unk_1E8CD5CB8;
    v16 = *MEMORY[0x1E0CB2D50];
    v26[1] = CFSTR("SourceFileLine");
    v26[2] = v16;
    v27[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v9 = v8;
  file = acl_get_file(v8, ACL_TYPE_EXTENDED);
  if (!file)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_295;
    v25[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v25[4] = v9;
    __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_295((uint64_t)v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    LOBYTE(v13) = 0;
    if (!a4)
      goto LABEL_20;
    goto LABEL_18;
  }
  v11 = file;
  entry_p = 0;
  if (acl_get_entry(file, 0, &entry_p))
  {
    v12 = 0;
    LOBYTE(v13) = 1;
  }
  else
  {
    v18 = 0;
    v12 = 0;
    do
    {
      LOBYTE(v27[0]) = 0;
      v23 = v12;
      v13 = v7[2](v7, entry_p, v27, &v23);
      v19 = v23;

      v12 = v19;
      v18 |= LOBYTE(v27[0]) != 0;
      if (!a4)
        v13 = 1;
    }
    while (v13 == 1 && !acl_get_entry(v11, -1, &entry_p));
    if ((v18 & 1) != 0 && acl_set_file(v9, ACL_TYPE_EXTENDED, v11))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_299;
      v22[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v22[4] = v9;
      __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_299((uint64_t)v22);
      v20 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v13) = 0;
      v12 = (void *)v20;
    }
  }
  acl_free(v11);
  if (a4)
  {
LABEL_18:
    if ((v13 & 1) == 0)
      *a4 = objc_retainAutorelease(v12);
  }
LABEL_20:

  return v13;
}

- (BOOL)stripACLFromURL:(id)a3 error:(id *)a4
{
  return -[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:](self, "_enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:", a3, a4, &__block_literal_global_304);
}

- (unint64_t)dataWritingOptionsForFileAtURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  id v15;
  __int16 v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = objc_msgSend(v4, "checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:", v3, 0, (char *)&v16 + 1, &v15);
  v6 = v15;

  if ((v5 & 1) != 0)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v8 = objc_msgSend(v7, "checkFileSystemAtURL:supportsPerFileKeys:error:", v3, &v16, &v14);
    v9 = v14;

    if ((v8 & 1) != 0)
    {
      if ((_BYTE)v16)
        v10 = HIBYTE(v16) | 0x10000000;
      else
        v10 = HIBYTE(v16);
    }
    else
    {
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v3;
        v19 = 2112;
        v20 = v9;
        _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Could not check fs capabilities for data protection at [%@]: %@", buf, 0x16u);
      }

      v10 = 0;
    }
    v6 = v9;
  }
  else
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Could not check fs capabilities for atomic swap at [%@]: %@", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)fixUserPermissionsAtURL:(id)a3 limitToTopLevelURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  id *v14;
  char v15;
  _QWORD v17[4];
  id v18;
  int v19;
  int v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24 = 0;
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasPrefix:", v10);

  if ((v11 & 1) != 0)
  {
    v20 = 0;
    v12 = objc_retainAutorelease(v7);
    if ((_fix_permissions_on_path((const char *)objc_msgSend(v12, "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), &v24, &v20) & 1) != 0)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v24 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_327;
    v17[3] = &unk_1E8CB4E70;
    v14 = &v18;
    v18 = v12;
    v19 = v20;
    __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_327((uint64_t)v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke;
    v21[3] = &unk_1E8CB61F8;
    v14 = &v22;
    v22 = v7;
    v23 = v8;
    __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke((uint64_t)v21);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a5 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a5 = v13;
  }
LABEL_9:
  v15 = v24;

  return v15;
}

- (BOOL)removeExclusionFromBackupFromURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Removing backup exclusion unimplemented"));
    v16 = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager removeExclusionFromBackupFromURL:error:]_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v20 = &unk_1E8CD5DA8;
    v8 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("SourceFileLine");
    v18 = v8;
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v16, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil path when trying to remove backup exclusion"));
    v16 = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager removeExclusionFromBackupFromURL:error:]_block_invoke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v20 = &unk_1E8CD5D90;
    v13 = *MEMORY[0x1E0CB2D50];
    v17 = CFSTR("SourceFileLine");
    v18 = v13;
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }

  return v5 != 0;
}

- (id)copyDescriptionOfURL:(id)a3
{
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  char *v9;
  uint64_t __s;
  stat v11;
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  bzero(&v12, 0x878uLL);
  memset(&v11, 0, sizeof(v11));
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (lstat(v4, &v11))
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("lstat error = %d "), *__error());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (!statfs(v4, &v12))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (statfs(v4, &v12))
  {
LABEL_5:
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("statfs error = %d "), *__error());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v9 = fflagstostr(v11.st_flags);
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%d/0%o/[%s]/[%s]/%08x/%llx/%x-%x/%d"), v11.st_uid, v11.st_mode, v9, v12.f_fstypename, v12.f_flags, v11.st_ino, v12.f_fsid.val[0], v12.f_fsid.val[1], v12.f_owner, v9, *(_QWORD *)&v11.st_dev);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    free(v9);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
LABEL_6:
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)fsNodeOfURL:(id)a3 followSymlinks:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  const char *v8;
  void *v9;
  MCMFSNode *v10;
  _QWORD v12[4];
  id v13;
  stat v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  memset(&v14, 0, sizeof(v14));
  v7 = objc_retainAutorelease(a3);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  if (v6)
  {
    if (stat(v8, &v14))
      goto LABEL_3;
LABEL_6:
    v10 = -[MCMFSNode initWithStat:]([MCMFSNode alloc], "initWithStat:", &v14);
    v9 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!lstat(v8, &v14))
    goto LABEL_6;
LABEL_3:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke;
  v12[3] = &unk_1E8CB67B8;
  v13 = v7;
  __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke((uint64_t)v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (!a5)
    goto LABEL_9;
LABEL_7:
  if (!v10)
    *a5 = objc_retainAutorelease(v9);
LABEL_9:

  return v10;
}

- (id)fsSanitizedStringFromString:(id)a3 allowSpaces:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;

  v4 = a4;
  v5 = a3;
  if (fsSanitizedStringFromString_allowSpaces__onceToken != -1)
    dispatch_once(&fsSanitizedStringFromString_allowSpaces__onceToken, &__block_literal_global_351);
  v6 = (id)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace;
  if (v4)
  {
    v7 = (id)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace;

    v6 = v7;
  }
  objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithData:encoding:", v8, 1);
  v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v6);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v10; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v9, "rangeOfCharacterFromSet:", v6))
      objc_msgSend(v9, "replaceCharactersInRange:withString:", i, 1, CFSTR("-"));
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("..")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR(".")))
  {

    v9 = 0;
  }
  v12 = (void *)objc_msgSend(v9, "copy");

  return v12;
}

- (BOOL)repairPermissionsAtURL:(id)a3 uid:(unsigned int)a4 gid:(unsigned int)a5 options:(unint64_t)a6 error:(id *)a7
{
  __int16 v8;
  id v12;
  _filesec *v13;
  uint64_t v14;
  _filesec *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  void *v27;
  uint8_t *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  int v35;
  NSObject *v36;
  _BOOL4 v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  id v49;
  NSObject *v50;
  int v52;
  void *v53;
  unsigned int v54;
  unsigned int v55;
  id *v56;
  MCMFileManager *v57;
  _filesec *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  void *__s;
  uint8_t buf[4];
  _BYTE v71[14];
  uint8_t v72[4];
  int v73;
  __int16 v74;
  void *v75;
  _OWORD v76[9];
  _QWORD v77[5];

  v8 = a6;
  v77[2] = *MEMORY[0x1E0C80C00];
  v12 = objc_retainAutorelease(a3);
  v13 = 0;
  v77[0] = objc_msgSend(v12, "fileSystemRepresentation");
  v77[1] = 0;
  __s = 0;
  if ((v8 & 1) != 0)
  {
    v13 = -[MCMFileManager _removeACLFilesec](self, "_removeACLFilesec");
    if (!v13)
    {
      v48 = 0;
      v19 = 0;
      goto LABEL_62;
    }
  }
  v14 = MEMORY[0x1E0C835E8];
  if ((v8 & 2) != 0)
  {
    v15 = -[MCMFileManager _denyDeleteACLFilesecWithACLText:](self, "_denyDeleteACLFilesecWithACLText:", &__s);
    if (!v15)
    {
      v19 = 0;
      v48 = 0;
      if (v13)
        goto LABEL_59;
      goto LABEL_62;
    }
  }
  else
  {
    v15 = 0;
  }
  v57 = self;
  v58 = v15;
  v55 = a4;
  v16 = (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD))(*(_QWORD *)v14 + 384))(v77, 84, 0);
  v17 = MEMORY[0x1E0C809B0];
  if (!v16)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke;
    v67[3] = &unk_1E8CB67B8;
    v49 = v12;
    v68 = v49;
    __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke((uint64_t)v67);
    v19 = objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v52 = *__error();
      objc_msgSend(v49, "path");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v72 = 67240450;
      v73 = v52;
      v74 = 2112;
      v75 = v53;
      _os_log_error_impl(&dword_1CF807000, v50, OS_LOG_TYPE_ERROR, "fts_open() failed (%{darwin.errno, public}d) on [%@]", v72, 0x12u);

    }
    v48 = 0;
    goto LABEL_56;
  }
  v18 = v16;
  v54 = a5;
  v56 = a7;
  v19 = 0;
  while (1)
  {
    v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 392))(v18);
    if (!v20)
      break;
    v21 = v20;
    v22 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)v14 + 512))(*(_QWORD *)(v20 + 48), 0x200000);
    if ((v22 & 0x80000000) != 0)
    {
      v66[0] = v17;
      v66[1] = 3221225472;
      v66[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_361;
      v66[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v66[4] = v21;
      __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_361((uint64_t)v66);
      v31 = objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v39 = *__error();
        v40 = *(void **)(v21 + 48);
        *(_DWORD *)v72 = 67240450;
        v73 = v39;
        v74 = 2080;
        v75 = v40;
        _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "open() failed (%{darwin.errno, public}d) on path [%s]", v72, 0x12u);
      }

      v33 = 2;
      v19 = v31;
      goto LABEL_28;
    }
    v23 = v22;
    memset(v76, 0, sizeof(v76));
    if ((*(unsigned int (**)(void))(*(_QWORD *)v14 + 336))())
    {
      v65[0] = v17;
      v65[1] = 3221225472;
      v65[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_365;
      v65[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v65[4] = v21;
      __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_365((uint64_t)v65);
      v24 = objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *__error();
        v27 = *(void **)(v21 + 48);
        *(_DWORD *)v72 = 67240450;
        v73 = v26;
        v74 = 2080;
        v75 = v27;
        v28 = v72;
        v29 = v25;
        v30 = "fstat failed (%{darwin.errno, public}d) on open fd for path [%s]";
        goto LABEL_47;
      }
      goto LABEL_18;
    }
    bzero(v72, 0x878uLL);
    if ((*(unsigned int (**)(uint64_t, uint8_t *))(*(_QWORD *)v14 + 352))(v23, v72))
    {
      v64[0] = v17;
      v64[1] = 3221225472;
      v64[2] = __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_369;
      v64[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v64[4] = v21;
      __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_369((uint64_t)v64);
      v24 = objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v45 = *__error();
        v46 = *(_QWORD *)(v21 + 48);
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v71 = v45;
        *(_WORD *)&v71[4] = 2080;
        *(_QWORD *)&v71[6] = v46;
        v28 = buf;
        v29 = v25;
        v30 = "fstatfs failed (%{darwin.errno, public}d) on open fd for path [%s]";
LABEL_47:
        _os_log_error_impl(&dword_1CF807000, v29, OS_LOG_TYPE_ERROR, v30, v28, 0x12u);
      }
LABEL_18:
      v34 = 0;
LABEL_19:

LABEL_20:
      v19 = v24;
      goto LABEL_21;
    }
    v63 = v19;
    v37 = -[MCMFileManager _fixFlagsOnFD:FTSENT:stat:error:](v57, "_fixFlagsOnFD:FTSENT:stat:error:", v23, v21, v76, &v63);
    v24 = v63;

    if (!v37)
    {
      v34 = 0;
      goto LABEL_20;
    }
    if ((WORD2(v76[0]) & 0xF000) != 0x4000 && WORD3(v76[0]) >= 2u)
    {
      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v47 = *(_QWORD *)(v21 + 48);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v71 = v47;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = WORD3(v76[0]);
        _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "path [%s] is hardlinked [nlink: %d], skipping", buf, 0x12u);
      }
      v34 = 1;
      goto LABEL_19;
    }
    if ((v8 & 3) != 0)
    {
      v41 = *(_QWORD *)(v21 + 48);
      v62 = v24;
      v42 = -[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:](v57, "_fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:", v23, v13, v58, __s, v41, &v62);
      v19 = v62;

      if (!v42)
        goto LABEL_45;
      v24 = v19;
    }
    v61 = v24;
    v43 = -[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:](v57, "_fixPOSIXPermsOnFD:FTSENT:stat:error:", v23, v21, v76, &v61);
    v19 = v61;

    if (!v43)
    {
LABEL_45:
      v34 = 0;
      goto LABEL_21;
    }
    v60 = v19;
    v44 = -[MCMFileManager _fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:](v57, "_fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:", v23, v21, v76, v72, v55, v54, &v60);
    v25 = v60;

    if (v44)
    {
      v59 = v25;
      v34 = -[MCMFileManager _fixPOSIXBitsOnFD:FTSENT:stat:error:](v57, "_fixPOSIXBitsOnFD:FTSENT:stat:error:", v23, v21, v76, &v59);
      v24 = v59;
      goto LABEL_19;
    }
    v34 = 0;
    v19 = v25;
LABEL_21:
    v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 152))(v23);
    v17 = MEMORY[0x1E0C809B0];
    if (v35)
    {
      container_log_handle_for_category();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v38 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v71 = v38;
        _os_log_error_impl(&dword_1CF807000, v36, OS_LOG_TYPE_ERROR, "close() failed (%{darwin.errno}d) on file descriptor.", buf, 8u);
      }

      if ((v34 & 1) == 0)
      {
LABEL_27:
        v33 = 2;
        goto LABEL_28;
      }
    }
    else if (!v34)
    {
      goto LABEL_27;
    }
    v33 = 0;
LABEL_28:
    if ((v8 & 0x100) == 0)
      v33 = 4;
    if (v33)
    {
      if (v33 != 4)
      {
        a7 = v56;
        v48 = 0;
        goto LABEL_55;
      }
      break;
    }
  }
  v48 = 1;
  a7 = v56;
LABEL_55:
  (*(void (**)(uint64_t))(*(_QWORD *)v14 + 376))(v18);
LABEL_56:
  if (v58)
    (*(void (**)(void))(*(_QWORD *)v14 + 272))();
  if (v13)
LABEL_59:
    (*(void (**)(_filesec *))(*(_QWORD *)v14 + 272))(v13);
LABEL_62:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  if (a7)
  {
    v19 = objc_retainAutorelease(v19);
    *a7 = v19;
  }

  return v48 & 1;
}

- (BOOL)setDataProtectionAtURL:(id)a3 toDataProtectionClass:(int)a4 directoriesOnly:(BOOL)a5 recursive:(BOOL)a6 error:(id *)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1030;
  v30 = __Block_byref_object_dispose__1031;
  v31 = 0;
  v25 = 0;
  v10 = objc_retainAutorelease(a3);
  objc_msgSend(v10, "fileSystemRepresentation");
  v11 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke;
  v21 = &unk_1E8CB5008;
  v24 = a5;
  v23 = a4;
  v22 = &v26;
  if ((container_traverse_directory() & 1) == 0)
  {
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_378;
    v16[3] = &__block_descriptor_36_e14___NSError_8__0l;
    v17 = v25;
    __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_378((uint64_t)v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v27[5];
    v27[5] = v12;

  }
  v14 = (void *)v27[5];
  if (a7 && v14)
    *a7 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v26, 8);

  return v14 == 0;
}

- (_filesec)_removeACLFilesec
{
  uint64_t v2;
  uint64_t v3;
  _filesec *v4;

  v2 = MEMORY[0x1E0C835E8];
  v3 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E0C835E8] + 288))(self, a2);
  v4 = (_filesec *)v3;
  if (v3)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v2 + 296))(v3, 5, 1);
  return v4;
}

- (_filesec)_denyDeleteACLFilesecWithACLText:(char *)a3
{
  uint64_t v5;
  _filesec *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E0C835E8] + 288))(self, a2);
  v6 = (_filesec *)v5;
  if (a3 && v5)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__MCMFileManager__denyDeleteACLFilesecWithACLText___block_invoke;
    v8[3] = &unk_1E8CB5030;
    v8[4] = &v9;
    v8[5] = v5;
    -[MCMFileManager _withEveryoneDenyDeleteACLDoBlock:](self, "_withEveryoneDenyDeleteACLDoBlock:", v8);
    *a3 = (char *)v10[3];
    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

- (BOOL)_withEveryoneDenyDeleteACLDoBlock:(id)a3
{
  uint64_t (**v3)(id, uint64_t);
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  char v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  uuid_t uu;
  _QWORD identifier[3];

  identifier[2] = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t (**)(id, uint64_t))a3;
  strcpy((char *)identifier, "everyone");
  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  memset(uu, 0, sizeof(uu));
  v4 = mbr_identifier_to_uuid(5, identifier, 9uLL, uu);
  v5 = MEMORY[0x1E0C835E8];
  if (v4)
  {
    v6 = v4;
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v6;
      v8 = "mbr_identifier_to_uuid(group, everyone) failed (%d)";
LABEL_19:
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, v8, buf, 8u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v15 = (*(uint64_t (**)(uint64_t))(*MEMORY[0x1E0C835E8] + 80))(1);
  if (!v15
    || (*(unsigned int (**)(uint64_t *, uint64_t *))(*(_QWORD *)v5 + 16))(&v15, &v14)
    || (*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)v5 + 64))(v14, &v13)
    || (*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)v5 + 56))(v14, &v12)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 120))(v14, 2)
    || (*(unsigned int (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v5 + 112))(v14, uu)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 8))(v13, 16)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 104))(v14, v13)
    || (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 96))(v14, v12))
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *__error();
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      v8 = "acl creation failed (%{darwin.errno}d)";
      goto LABEL_19;
    }
LABEL_14:

    v9 = 0;
    goto LABEL_15;
  }
  v9 = v3[2](v3, v15);
LABEL_15:
  if (v15)
    (*(void (**)(void))(*(_QWORD *)v5 + 32))();

  return v9;
}

- (BOOL)_fixACLOnFD:(int)a3 removeACLFilesec:(_filesec *)a4 denyDeleteFilesec:(_filesec *)a5 denyDeleteText:(const char *)a6 path:(const char *)a7 error:(id *)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  char v26;
  const char *v28;
  int v29;
  const char *v30;
  int v31;
  const char *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  uint64_t v42;
  _OWORD v43[9];
  _OWORD v44[9];
  _QWORD v45[3];
  _BYTE buf[24];
  uint64_t v47;

  v13 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  memset(v44, 0, sizeof(v44));
  memset(v43, 0, sizeof(v43));
  v14 = MEMORY[0x1E0C835E8];
  v15 = (*(uint64_t (**)(MCMFileManager *, SEL))(*MEMORY[0x1E0C835E8] + 288))(self, a2);
  if (v15)
  {
    v16 = v15;
    if ((*(unsigned int (**)(uint64_t, _OWORD *, uint64_t))(*(_QWORD *)v14 + 360))(v13, v44, v15))
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_387;
      v41[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v41[4] = a7;
      __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_387((uint64_t)v41);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        v19 = 0;
        goto LABEL_5;
      }
      v34 = *__error();
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)&buf[4] = v34;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = a7;
      v32 = "fstatx_np failed (%{darwin.errno, public}d) on path [%s]";
LABEL_40:
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, v32, buf, 0x12u);
      goto LABEL_4;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v14 + 280))(v16, 5, &v42))
    {
      if (*__error() != 2)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_391;
        v40[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v40[4] = a7;
        __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_391((uint64_t)v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_4;
        v31 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&buf[4] = v31;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = a7;
        v32 = "filesec_get_property(..., FILESEC_ACL, ...) failed (%{darwin.errno, public}d) on path [%s]";
        goto LABEL_40;
      }
      v19 = 0;
      a4 = 0;
    }
    else
    {
      v28 = (const char *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 128))(v42, 0);
      v19 = v28;
      if (a5 && a6 && v28 && !strcmp(a6, v28))
      {
        a5 = 0;
        a4 = 0;
      }
    }
    if ((unint64_t)a5 | (unint64_t)a4)
    {
      if ((*(unsigned int (**)(uint64_t, _OWORD *))(*(_QWORD *)v14 + 336))(v13, v43))
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_395;
        v39[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v39[4] = a7;
        __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_395((uint64_t)v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        v29 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&buf[4] = v29;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = a7;
        v30 = "fstat(...) failed (%{darwin.errno, public}d) on [%s]";
        goto LABEL_32;
      }
      if (a4)
      {
        if ((*(unsigned int (**)(uint64_t, _filesec *))(*(_QWORD *)v14 + 216))(v13, a4))
        {
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_399;
          v38[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v38[4] = a7;
          __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_399((uint64_t)v38);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            goto LABEL_5;
          v33 = *__error();
          *(_DWORD *)buf = 67240450;
          *(_DWORD *)&buf[4] = v33;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = a7;
          v30 = "fchmodx_np() failed (%{darwin.errno, public}d) when removing ACLs on path [%s]";
          goto LABEL_32;
        }
        container_log_handle_for_category();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = a7;
          _os_log_impl(&dword_1CF807000, v35, OS_LOG_TYPE_DEFAULT, "REPAIR: removed ACL (%s) from [%s]", buf, 0x16u);
        }

      }
      if (a5)
      {
        if (!(*(unsigned int (**)(uint64_t, _filesec *))(*(_QWORD *)v14 + 216))(v13, a5))
        {
          container_log_handle_for_category();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = a6;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = a7;
            _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: added default ACL (%s) on [%s]", buf, 0x16u);
          }
          v17 = 0;
          v20 = 1;
          goto LABEL_6;
        }
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_403;
        v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v37[4] = a7;
        __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_403((uint64_t)v37);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
LABEL_5:
          v20 = 0;
LABEL_6:

          goto LABEL_7;
        }
        v36 = *__error();
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)&buf[4] = v36;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = a7;
        v30 = "fchmodx_np() failed (%{darwin.errno, public}d) when setting default ACL on path [%s]";
LABEL_32:
        _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
        goto LABEL_5;
      }
    }
    v17 = 0;
    v20 = 1;
LABEL_7:
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 272))(v16);
    if (v19)
      (*(void (**)(const char *))(*(_QWORD *)v14 + 32))(v19);
    goto LABEL_12;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("filesec_init failed"));
  v45[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v22;
  *(_QWORD *)&buf[8] = &unk_1E8CD5E68;
  v23 = *MEMORY[0x1E0CB2D50];
  v45[1] = CFSTR("SourceFileLine");
  v45[2] = v23;
  *(_QWORD *)&buf[16] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v45, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "filesec_init failed", buf, 2u);
  }

  v20 = 0;
LABEL_12:
  if (v42)
    (*(void (**)(void))(*(_QWORD *)v14 + 32))();
  if (a8)
    v26 = v20;
  else
    v26 = 1;
  if ((v26 & 1) == 0)
    *a8 = objc_retainAutorelease(v17);

  return v20;
}

- (BOOL)_fixPOSIXPermsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  uint64_t v8;
  int st_mode;
  int fts_info;
  id v11;
  NSObject *v12;
  int v13;
  char *fts_path;
  NSObject *v15;
  char *v16;
  BOOL v17;
  NSObject *v18;
  char *v19;
  int v21;
  char *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  _WORD v28[11];

  v8 = *(_QWORD *)&a3;
  *(_QWORD *)&v28[7] = *MEMORY[0x1E0C80C00];
  st_mode = a5->st_mode;
  fts_info = a4->fts_info;
  if (fts_info == 1)
  {
    if ((~st_mode & 0x1C0) == 0)
    {
LABEL_19:
      v11 = 0;
      v17 = 1;
      goto LABEL_20;
    }
    if ((*(unsigned int (**)(_QWORD, _QWORD))(*MEMORY[0x1E0C835E8] + 208))(*(_QWORD *)&a3, st_mode | 0x1C0u))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke;
      v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v24[4] = a4;
      __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v24);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v13 = *__error();
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67240450;
      v26 = v13;
      v27 = 2080;
      *(_QWORD *)v28 = fts_path;
      goto LABEL_22;
    }
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      v26 = st_mode;
      v27 = 1024;
      *(_DWORD *)v28 = st_mode | 0x1C0;
      v28[2] = 2080;
      *(_QWORD *)&v28[3] = v16;
      _os_log_impl(&dword_1CF807000, v15, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod u+rwx (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    fts_info = a4->fts_info;
  }
  if (fts_info != 8 || (~st_mode & 0x180) == 0)
    goto LABEL_19;
  if (!(*(unsigned int (**)(uint64_t, _QWORD))(*MEMORY[0x1E0C835E8] + 208))(v8, st_mode | 0x180u))
  {
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      v26 = st_mode;
      v27 = 1024;
      *(_DWORD *)v28 = st_mode | 0x180;
      v28[2] = 2080;
      *(_QWORD *)&v28[3] = v19;
      _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod u+rw (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    goto LABEL_19;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_410;
  v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v23[4] = a4;
  __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_410((uint64_t)v23);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    goto LABEL_13;
  v21 = *__error();
  v22 = a4->fts_path;
  *(_DWORD *)buf = 67240450;
  v26 = v21;
  v27 = 2080;
  *(_QWORD *)v28 = v22;
LABEL_22:
  _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "fchmod failed (%{darwin.errno, public}d) on path [%s]", buf, 0x12u);
LABEL_13:

  if (a6)
  {
    v11 = objc_retainAutorelease(v11);
    v17 = 0;
    *a6 = v11;
  }
  else
  {
    v17 = 0;
  }
LABEL_20:

  return v17;
}

- (BOOL)_fixPOSIXBitsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  int st_mode;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  char *fts_path;
  int v15;
  char *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  _WORD v21[11];

  *(_QWORD *)&v21[7] = *MEMORY[0x1E0C80C00];
  st_mode = a5->st_mode;
  if ((st_mode & 0xE00) == 0)
  {
LABEL_10:
    v9 = 0;
    v11 = 1;
    goto LABEL_11;
  }
  if (!(*(unsigned int (**)(_QWORD, _QWORD))(*MEMORY[0x1E0C835E8] + 208))(*(_QWORD *)&a3, st_mode & 0xFFFFF1FF))
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      v19 = st_mode;
      v20 = 1024;
      *(_DWORD *)v21 = st_mode & 0xF1FF;
      v21[2] = 2080;
      *(_QWORD *)&v21[3] = fts_path;
      _os_log_impl(&dword_1CF807000, v12, OS_LOG_TYPE_DEFAULT, "REPAIR: fchmod -setuid, -setgid, -sticky (0%o → 0%o) on [%s]", buf, 0x18u);
    }

    goto LABEL_10;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke;
  v17[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v17[4] = a4;
  __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v17);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v15 = *__error();
    v16 = a4->fts_path;
    *(_DWORD *)buf = 67240450;
    v19 = v15;
    v20 = 2080;
    *(_QWORD *)v21 = v16;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "fchmod (un-setuid) failed (%{darwin.errno, public}d) on path [%s]", buf, 0x12u);
  }

  if (a6)
  {
    v9 = objc_retainAutorelease(v9);
    v11 = 0;
    *a6 = v9;
  }
  else
  {
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)_fixFlagsOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 error:(id *)a6
{
  __uint32_t st_flags;
  uint64_t v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  __uint32_t v15;
  char *fts_path;
  int v18;
  char *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  __uint32_t v22;
  __int16 v23;
  _WORD v24[11];

  *(_QWORD *)&v24[7] = *MEMORY[0x1E0C80C00];
  st_flags = a5->st_flags;
  if ((st_flags & 2) == 0)
  {
LABEL_10:
    v11 = 0;
    v13 = 1;
    goto LABEL_11;
  }
  v10 = st_flags & 0xFFFFFFFD;
  if (!(*(unsigned int (**)(_QWORD, uint64_t))(*MEMORY[0x1E0C835E8] + 200))(*(_QWORD *)&a3, v10))
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a5->st_flags;
      fts_path = a4->fts_path;
      *(_DWORD *)buf = 67109634;
      v22 = v15;
      v23 = 1024;
      *(_DWORD *)v24 = v10;
      v24[2] = 2080;
      *(_QWORD *)&v24[3] = fts_path;
      _os_log_impl(&dword_1CF807000, v14, OS_LOG_TYPE_DEFAULT, "REPAIR: fchflags -UF_IMMUTABLE (0x%x → 0x%x) on [%s]", buf, 0x18u);
    }

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke;
  v20[3] = &__block_descriptor_40_e14___NSError_8__0l;
  v20[4] = a4;
  __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke((uint64_t)v20);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v18 = *__error();
    v19 = a4->fts_path;
    *(_DWORD *)buf = 67240450;
    v22 = v18;
    v23 = 2080;
    *(_QWORD *)v24 = v19;
    _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "fchflags failed (%{darwin.errno, public}d) on open fd for path [%s]", buf, 0x12u);
  }

  if (a6)
  {
    v11 = objc_retainAutorelease(v11);
    v13 = 0;
    *a6 = v11;
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (BOOL)_fixOwnershipOnFD:(int)a3 FTSENT:(_ftsent *)a4 stat:(stat *)a5 statfs:(statfs *)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 error:(id *)a9
{
  id v11;
  uid_t st_uid;
  BOOL v13;
  NSObject *v16;
  NSObject *v18;
  uid_t v19;
  gid_t st_gid;
  char *v21;
  int v22;
  char *fts_path;
  _QWORD v24[5];
  unsigned int v25;
  unsigned int v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  _WORD v34[13];

  *(_QWORD *)&v34[9] = *MEMORY[0x1E0C80C00];
  if ((a6->f_flags & 0x200000) != 0)
  {
    v11 = 0;
    v13 = 1;
  }
  else
  {
    v11 = 0;
    st_uid = a5->st_uid;
    v13 = 1;
    if (st_uid != a7 && st_uid != 99)
    {
      if ((*(unsigned int (**)(_QWORD, _QWORD, _QWORD))(*MEMORY[0x1E0C835E8] + 224))(*(_QWORD *)&a3, *(_QWORD *)&a7, *(_QWORD *)&a8))
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke;
        v24[3] = &__block_descriptor_48_e14___NSError_8__0l;
        v25 = a7;
        v26 = a8;
        v24[4] = a4;
        __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke((uint64_t)v24);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v22 = *__error();
          fts_path = a4->fts_path;
          *(_DWORD *)buf = 67109890;
          v28 = a7;
          v29 = 1024;
          v30 = a8;
          v31 = 1026;
          v32 = v22;
          v33 = 2080;
          *(_QWORD *)v34 = fts_path;
          _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "fchown(uid=%u, gid=%u) failed (%{darwin.errno, public}d) on path [%s]", buf, 0x1Eu);
        }

        if (a9)
        {
          v11 = objc_retainAutorelease(v11);
          v13 = 0;
          *a9 = v11;
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = a5->st_uid;
          st_gid = a5->st_gid;
          v21 = a4->fts_path;
          *(_DWORD *)buf = 67110146;
          v28 = v19;
          v29 = 1024;
          v30 = st_gid;
          v31 = 1024;
          v32 = a7;
          v33 = 1024;
          *(_DWORD *)v34 = a8;
          v34[2] = 2080;
          *(_QWORD *)&v34[3] = v21;
          _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "REPAIR: fchown (%d:%d → %d:%d) on [%s]", buf, 0x24u);
        }

        v11 = 0;
      }
    }
  }

  return v13;
}

id __69__MCMFileManager__fixOwnershipOnFD_FTSENT_stat_statfs_uid_gid_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchown(uid=%u, gid=%u) failed on path [%s]"), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixOwnershipOnFD:FTSENT:stat:statfs:uid:gid:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5F58;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__MCMFileManager__fixFlagsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchflags failed on open fd for path [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixFlagsOnFD:FTSENT:stat:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5F40;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__MCMFileManager__fixPOSIXBitsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchmod (un-setuid) failed on path [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixPOSIXBitsOnFD:FTSENT:stat:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5F28;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchmod failed on directory [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5EF8;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__MCMFileManager__fixPOSIXPermsOnFD_FTSENT_stat_error___block_invoke_410(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchmod failed on file [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixPOSIXPermsOnFD:FTSENT:stat:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5F10;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_387(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fstatx_np failed on path [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5E80;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_391(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("filesec_get_property(..., FILESEC_ACL, ...) failed on path [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5E98;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_395(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fstat(...) failed on [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5EB0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_399(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchmodx_np() failed when removing ACLs on path [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5EC8;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __91__MCMFileManager__fixACLOnFD_removeACLFilesec_denyDeleteFilesec_denyDeleteText_path_error___block_invoke_403(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fchmodx_np() failed when setting default ACL on path [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _fixACLOnFD:removeACLFilesec:denyDeleteFilesec:denyDeleteText:path:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5EE0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __51__MCMFileManager__denyDeleteACLFilesecWithACLText___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v8;
  int v9;
  uint64_t v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v3 = MEMORY[0x1E0C835E8];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(uint64_t, _QWORD))(*MEMORY[0x1E0C835E8] + 128))(a2, 0);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = *__error();
      *(_DWORD *)buf = 67240192;
      v12 = v9;
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "acl_to_text() failed (%{darwin.errno, public}d)", buf, 8u);
    }

  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t *))(*(_QWORD *)v3 + 296))(*(_QWORD *)(a1 + 40), 5, &v10);
  if (v5)
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *__error();
      *(_DWORD *)buf = 67240192;
      v12 = v8;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "filesec_set_property() for default ACL failed (%{darwin.errno, public}d)", buf, 8u);
    }

  }
  return v5 == 0;
}

uint64_t __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke(uint64_t a1)
{
  int is_directory;
  BOOL v3;
  int v4;
  unsigned int v5;
  unsigned int optional_dp_class;
  uint64_t name;
  int v8;
  int optional_parent_fd;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t path;
  uint64_t result;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  int v21;
  unsigned int v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  is_directory = container_traverse_node_is_directory();
  if (*(_BYTE *)(a1 + 44))
    v3 = is_directory == 0;
  else
    v3 = 0;
  if (v3)
    return 1;
  v4 = is_directory;
  v5 = *(_DWORD *)(a1 + 40);
  optional_dp_class = container_traverse_node_get_optional_dp_class();
  name = container_traverse_node_get_name();
  if (v4)
    v8 = 0;
  else
    v8 = 3;
  if (!v5)
    v5 = v8;
  if (v4)
  {
    optional_parent_fd = container_traverse_node_get_optional_parent_fd();
  }
  else
  {
    if ((optional_dp_class | v5) > 7
      || v5 - 5 < 2
      || ((v12 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[v5], optional_dp_class - 5 >= 2)
        ? (v13 = MCMCompareDataProtectionClassTarget_kDataProtectionClassPrecedence[optional_dp_class])
        : (v13 = 2),
          v12 < v13))
    {
      container_traverse_node_get_optional_parent_fd();
      return 1;
    }
    optional_parent_fd = container_traverse_node_get_optional_parent_fd();
    if (v12 <= v13)
      return 1;
  }
  if (optional_parent_fd < 0)
  {
    path = container_traverse_node_get_path();
    v23 = xmmword_1CF8D9C90;
    v24 = 0;
    v22 = v5;
    if (!path)
    {
      result = _os_crash();
      __break(1u);
      return result;
    }
    v11 = (*(uint64_t (**)(uint64_t, __int128 *, unsigned int *, uint64_t, uint64_t))(*MEMORY[0x1E0C835E8] + 648))(path, &v23, &v22, 4, 2048);
  }
  else
  {
    v24 = 0;
    v23 = xmmword_1CF8D9C90;
    v22 = v5;
    v10 = *MEMORY[0x1E0C835E8];
    if (name)
      v11 = (*(uint64_t (**)(void))(v10 + 656))();
    else
      v11 = (*(uint64_t (**)(void))(v10 + 320))();
  }
  if (v11 == -1)
  {
    v16 = *__error();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2;
    v20[3] = &__block_descriptor_36_e14___NSError_8__0l;
    v21 = v16;
    __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2((uint64_t)v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    return 0;
  }
  return 1;
}

id __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_378(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("container_traverse_directory() failed"));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager setDataProtectionAtURL:toDataProtectionClass:directoriesOnly:recursive:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5E50;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 32), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __95__MCMFileManager_setDataProtectionAtURL_toDataProtectionClass_directoriesOnly_recursive_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("MCMSetDataProtectionClass() failed"));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager setDataProtectionAtURL:toDataProtectionClass:directoriesOnly:recursive:error:]_block_invoke_2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5E38;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 32), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fts_open() failed on [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5DD8;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_361(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("open() failed on path [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5DF0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_365(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fstat() failed on path [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5E08;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__MCMFileManager_repairPermissionsAtURL_uid_gid_options_error___block_invoke_369(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("fstatfs() failed on path [%s]"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager repairPermissionsAtURL:uid:gid:options:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5E20;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__MCMFileManager_fsSanitizedStringFromString_allowSpaces___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace;
  fsSanitizedStringFromString_allowSpaces__forbiddenCharactersDisallowingSpace = v1;

  objc_msgSend(CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"), "stringByAppendingString:", CFSTR(" "));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invertedSet");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace;
  fsSanitizedStringFromString_allowSpaces__forbiddenCharactersAllowingSpace = v4;

}

id __51__MCMFileManager_fsNodeOfURL_followSymlinks_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not determine fsNode of path [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager fsNodeOfURL:followSymlinks:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5DC0;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("provided path [%@] not beneath limit path [%@]"), v3, v4);

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager fixUserPermissionsAtURL:limitToTopLevelURL:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5D60;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __67__MCMFileManager_fixUserPermissionsAtURL_limitToTopLevelURL_error___block_invoke_327(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("could not fix permissions at [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager fixUserPermissionsAtURL:limitToTopLevelURL:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5D78;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __40__MCMFileManager_stripACLFromURL_error___block_invoke(int a1, acl_entry_t entry_d, _BYTE *a3, _QWORD *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  acl_permset_t permset_p;
  acl_tag_t tag_type_p;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  tag_type_p = ACL_UNDEFINED_TAG;
  permset_p = 0;
  if (acl_get_tag_type(entry_d, &tag_type_p))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not get ACL tag type."));
    v17[0] = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager stripACLFromURL:error:]_block_invoke_2");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E8CD5D00;
LABEL_5:
    v18[0] = v8;
    v18[1] = v10;
    v11 = *MEMORY[0x1E0CB2D50];
    v17[1] = CFSTR("SourceFileLine");
    v17[2] = v11;
    v18[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (acl_get_permset(entry_d, &permset_p))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not get ACL permset."));
    v17[0] = CFSTR("FunctionName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager stripACLFromURL:error:]_block_invoke");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E8CD5D18;
    goto LABEL_5;
  }
  if (tag_type_p == ACL_EXTENDED_DENY)
  {
    if (acl_delete_perm(permset_p, ACL_DELETE))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not delete ACL_DELETE permission from permset."));
      v17[0] = CFSTR("FunctionName");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager stripACLFromURL:error:]_block_invoke");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = &unk_1E8CD5D30;
      goto LABEL_5;
    }
    if (acl_set_permset(entry_d, permset_p))
    {
      __40__MCMFileManager_stripACLFromURL_error___block_invoke_319();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
      *a3 = 1;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_6:
  if (a4)
    *a4 = objc_retainAutorelease(v13);

  return 0;
}

id __40__MCMFileManager_stripACLFromURL_error___block_invoke_319()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not set new permset on ACL entry."));
  v6[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager stripACLFromURL:error:]_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  v7[1] = &unk_1E8CD5D48;
  v2 = *MEMORY[0x1E0CB2D50];
  v6[1] = CFSTR("SourceFileLine");
  v6[2] = v2;
  v7[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_295(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not get ACL for [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5CD0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __68__MCMFileManager__enumeratePOSIX1eACLEntriesAtURL_error_usingBlock___block_invoke_299(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not set ACL for [%s]"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _enumeratePOSIX1eACLEntriesAtURL:error:usingBlock:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5CE8;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__MCMFileManager_checkFileSystemAtURL_supportsPerFileKeys_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not get statfs at [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager checkFileSystemAtURL:supportsPerFileKeys:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5CA0;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return volume capabilities for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C58;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_282(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d"), v3, 56, *(unsigned int *)(a1 + 40));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C70;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __75__MCMFileManager_checkFileSystemAtURL_isCaseSensitive_canAtomicSwap_error___block_invoke_284(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not get volume capabilities for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C88;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return device ID for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5B98;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_261(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return device ID for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5BB0;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_263(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d"), v3, 36, *(unsigned int *)(a1 + 40));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5BC8;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_267(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not get attributes for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5BE0;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_271(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return device ID for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5BF8;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_273(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return device ID for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C10;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_275(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("getattrlist did not return correctly sized attributes buffer for [%@]: expected = %lu, got = %d"), v3, 36, *(unsigned int *)(a1 + 40));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C28;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__MCMFileManager_compareVolumeForURL_versusURL_isSameVolume_error___block_invoke_277(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not get attributes for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager compareVolumeForURL:versusURL:isSameVolume:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5C40;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported data writing options: 0x%lx"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5AF0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_234(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not allocate memory for temporary filename for [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5B08;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_238(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not open temp [%s] for create+writing"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5B20;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_242(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not open [%@] -> [%@] for create+writing"), v3, v4);

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5B38;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 48), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_246(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not write to [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5B50;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_250(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not chmod temp file [%@] to 0%o"), v3, *(unsigned __int16 *)(a1 + 40));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5B68;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__MCMFileManager_writeData_toURL_options_mode_error___block_invoke_254(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not swap temp file [%@] with destination file [%@]"), v3, v4);

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager writeData:toURL:options:mode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5B80;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported data reading options: 0x%lx"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5A48;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_207(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not open [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5A60;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_211(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not allocate %zu bytes for [%@]"), v3, v4);

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5A78;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_215(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not read [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5A90;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_219(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("File [%@] is too large: >%llu"), v3, 10485760);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5AA8;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_223(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not allocate %zu bytes for [%@]"), v3, v4);

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5AC0;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__MCMFileManager_readDataFromURL_options_fsNode_error___block_invoke_225(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not stat [%@]"), v3);

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager readDataFromURL:options:fsNode:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5AD8;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __51__MCMFileManager_realPathForURL_isDirectory_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("container_realpath([%s]) failed"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager realPathForURL:isDirectory:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD5A30;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__MCMFileManager_enableFastDiskUsageForURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%s] APFSIOC_DIR_STATS_OP: DIR_STATS_OP_SET failed: (%d) %s"), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager enableFastDiskUsageForURL:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5A18;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to open %s : %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager dataProtectionClassOfItemAtURL:dataProtectionClass:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD59E8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __75__MCMFileManager_dataProtectionClassOfItemAtURL_dataProtectionClass_error___block_invoke_176(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to getclass of file %s: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager dataProtectionClassOfItemAtURL:dataProtectionClass:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5A00;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __75__MCMFileManager_itemAtURL_followSymlinks_exists_isDirectory_fsNode_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to determine if [%s] exists."), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD59D0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, a2 == 4, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  return 1;
}

id __53__MCMFileManager_urlsForItemsInDirectoryAtURL_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("_IterateDirectory for %@ returned %s"), v3, strerror(*v4));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager urlsForItemsInDirectoryAtURL:error:]_block_invoke_2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD59B8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  NSObject *v6;
  __int16 v7;
  mode_t v8;
  NSObject *v9;
  uint64_t v11;
  int *v12;
  char *v13;
  uint64_t v14;
  int *v15;
  char *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!strstr(*(char **)(a2 + 48), ".com.apple.mobile_container_manager.metadata.plist"))
  {
    v4 = *(_DWORD *)(*(_QWORD *)(a2 + 96) + 16);
    if (v4 != objc_msgSend(*(id *)(a1 + 32), "UID")
      || (v5 = *(_DWORD *)(*(_QWORD *)(a2 + 96) + 20), v5 != objc_msgSend(*(id *)(a1 + 32), "primaryGID")))
    {
      if (lchown(*(const char **)(a2 + 48), objc_msgSend(*(id *)(a1 + 32), "UID"), objc_msgSend(*(id *)(a1 + 32), "primaryGID")) == -1)
      {
        container_log_handle_for_category();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v14 = *(_QWORD *)(a2 + 48);
          v15 = __error();
          v16 = strerror(*v15);
          v17 = 136315394;
          v18 = v14;
          v19 = 2080;
          v20 = v16;
          _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", (uint8_t *)&v17, 0x16u);
        }

      }
    }
    if ((*(_WORD *)(*(_QWORD *)(a2 + 96) + 4) & 0x49) != 0)
      v7 = 493;
    else
      v7 = 420;
    if ((*(_WORD *)(*(_QWORD *)(a2 + 96) + 4) & 0xF000) == 0x4000)
      v8 = 493;
    else
      v8 = v7;
    if (lchmod(*(const char **)(a2 + 48), v8) == -1)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a2 + 48);
        v12 = __error();
        v13 = strerror(*v12);
        v17 = 136315394;
        v18 = v11;
        v19 = 2080;
        v20 = v13;
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", (uint8_t *)&v17, 0x16u);
      }

    }
  }
  return 1;
}

id __62__MCMFileManager_standardizeOwnershipAtURL_toPOSIXUser_error___block_invoke_161(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Could not stat %s: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager standardizeOwnershipAtURL:toPOSIXUser:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD59A0;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __63__MCMFileManager_standardizeACLsAtURL_isSystemContainer_error___block_invoke(uint64_t a1, uint64_t a2)
{
  char *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v9;
  int *v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  int *v14;
  char *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  uint64_t v19;
  int *v20;
  char *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(char **)(a2 + 48);
  if (strstr(v4, ".com.apple.mobile_container_manager.metadata.plist"))
    return 1;
  if ((*(_WORD *)(*(_QWORD *)(a2 + 96) + 4) & 0xF000) == 0x4000)
  {
    if (*(_BYTE *)(a1 + 64) && !*(_WORD *)(a2 + 86))
    {
      if (!acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
        goto LABEL_11;
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v9 = *(_QWORD *)(a2 + 48);
      v10 = __error();
      v11 = strerror(*v10);
      v22 = 136315394;
      v23 = v9;
      v24 = 2080;
      v25 = v11;
      v12 = "Failed to set top level ACL on dir %s: %s";
      goto LABEL_26;
    }
    if (acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
    {
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      goto LABEL_10;
    }
  }
  else if (acl_set_file(v4, ACL_TYPE_EXTENDED, *(acl_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_25:
      v13 = *(_QWORD *)(a2 + 48);
      v14 = __error();
      v15 = strerror(*v14);
      v22 = 136315394;
      v23 = v13;
      v24 = 2080;
      v25 = v15;
      v12 = "Failed to set ACL on dir %s: %s";
LABEL_26:
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v22, 0x16u);
    }
LABEL_10:

  }
LABEL_11:
  if (!*(_BYTE *)(a1 + 64) || *(_WORD *)(a2 + 86))
  {
    if (lchmod(*(const char **)(a2 + 48), 0) == -1)
    {
      container_log_handle_for_category();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a2 + 48);
        v17 = __error();
        v18 = strerror(*v17);
        v22 = 136315394;
        v23 = v16;
        v24 = 2080;
        v25 = v18;
        _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Could not chmod %s: %s", (uint8_t *)&v22, 0x16u);
      }

    }
    if (lchown(*(const char **)(a2 + 48), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60)) == -1)
    {
      container_log_handle_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a2 + 48);
        v20 = __error();
        v21 = strerror(*v20);
        v22 = 136315394;
        v23 = v19;
        v24 = 2080;
        v25 = v21;
        _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Could not chown %s: %s", (uint8_t *)&v22, 0x16u);
      }

    }
  }
  return 1;
}

id __59__MCMFileManager_setTopLevelSystemContainerACLAtURL_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to set ACL on %@: %s"), v3, strerror(*v4));

  v22[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager setTopLevelSystemContainerACLAtURL:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = &unk_1E8CD5988;
  v7 = *MEMORY[0x1E0CB2D50];
  v22[1] = CFSTR("SourceFileLine");
  v22[2] = v7;
  v23[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_msgSend(v9, "copy");

    if (*(_QWORD *)(a1 + 40))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        v20 = 2114;
        v21 = v12;
        v13 = "%{public}@ (%{public}@)";
        v14 = v11;
        v15 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v10 = v8;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    v13 = "%{public}@";
    v14 = v11;
    v15 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __81__MCMFileManager__CopySystemContainerACLWithNumACEs_isDir_inheritOnly_withError___block_invoke(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_init() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CopySystemContainerACLWithNumACEs:isDir:inheritOnly:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5970;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_create_entry() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5868;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_113(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("failed to calloc nameUUID: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5880;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_117(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("mbr_identifier_to_uuid() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5898;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_121(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_get_permset() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD58B0;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_125(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(unsigned int *)(a1 + 40);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_add_perm() failed to set perms %x: %s"), v3, strerror(*v4));
  v22[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = &unk_1E8CD58C8;
  v7 = *MEMORY[0x1E0CB2D50];
  v22[1] = CFSTR("SourceFileLine");
  v22[2] = v7;
  v23[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_msgSend(v9, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        v20 = 2114;
        v21 = v12;
        v13 = "%{public}@ (%{public}@)";
        v14 = v11;
        v15 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v10 = v8;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    v13 = "%{public}@";
    v14 = v11;
    v15 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_129(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_set_permset() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD58E0;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_133(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_get_flagset_np() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD58F8;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_137(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(unsigned int *)(a1 + 40);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_add_flag_np() failed to set flags %x: %s"), v3, strerror(*v4));
  v22[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = &unk_1E8CD5910;
  v7 = *MEMORY[0x1E0CB2D50];
  v22[1] = CFSTR("SourceFileLine");
  v22[2] = v7;
  v23[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_msgSend(v9, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v19 = v5;
        v20 = 2114;
        v21 = v12;
        v13 = "%{public}@ (%{public}@)";
        v14 = v11;
        v15 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v10 = v8;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    v13 = "%{public}@";
    v14 = v11;
    v15 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_141(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_set_flagset_np() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5928;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_145(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_set_tag_type() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5940;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __79__MCMFileManager__CreateSystemUserACEInACL_withPermissions_andFlags_withError___block_invoke_149(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = __error();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("acl_set_qualifier() failed: %s"), strerror(*v3));
  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _CreateSystemUserACEInACL:withPermissions:andFlags:withError:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD5958;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 63, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fts_open failed for %s with error %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5820;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_101(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error for path %s: %s"), *(_QWORD *)(a1 + 32), strerror(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 56)));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5838;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(*(_QWORD *)(a1 + 40) + 56), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__MCMFileManager__traverseDirectory_error_withBlock___block_invoke_105(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fts_close failed for %s with error %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _traverseDirectory:error:withBlock:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5850;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("nil base directory when trying to create temporary directory for %@"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD57F0;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__MCMFileManager_createTemporaryDirectoryInDirectoryURL_withNamePrefix_error___block_invoke_91(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to create temp dir at path %s : %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5808;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __74__MCMFileManager_replaceItemAtDestinationURL_withSourceURL_swapped_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not replace [%s] with file [%s]"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager replaceItemAtDestinationURL:withSourceURL:swapped:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD57D8;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke_74(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("rename of [%s] to [%s] failed: %s"), v4, v3, strerror(*v5));
  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD57C0;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__MCMFileManager__moveItemAtURL_toURL_failIfSrcMissing_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("stat of [%s] failed: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD57A8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("stat of %@ failed: %s"), v3, strerror(*v4));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5778;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __62__MCMFileManager__copyItemAtURL_toURL_failIfSrcMissing_error___block_invoke_67(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("copyfile of %@ to %@ failed: %s"), v3, v4, strerror(*v5));

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD5790;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fetching target of symlink from [%@] failed: file exists and lstat on it failed: %s"), v3, strerror(*v4));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5730;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_56(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fetching target of symlink from [%@] failed: file exists and is not a symlink: %s"), v3, strerror(17));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5748;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 17, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __50__MCMFileManager_targetOfSymbolicLinkAtURL_error___block_invoke_60(uint64_t a1)
{
  id v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("fetching target of symlink from [%@] failed: file exists, is a symlink, but its target could not be read: %s"), v3, strerror(*v4));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager targetOfSymbolicLinkAtURL:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5760;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("symlink from [%@] → [%@] failed: %s"), v3, v4, strerror(*v5));

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD56E8;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_45(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("symlink from [%@] → [%@] failed: %@"), v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = &unk_1E8CD5700;
  v6 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v6;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 17, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__MCMFileManager_symbolicallyLinkURL_toSymlinkTarget_error___block_invoke_49(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = __error();
  v7 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("symlink from [%@] → [%@] failed: file exists, is a symlink, but its target is different [%@]: %s"), v3, v5, v4, strerror(*v6));

  v13[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager symbolicallyLinkURL:toSymlinkTarget:error:]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = &unk_1E8CD5718;
  v9 = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("SourceFileLine");
  v13[2] = v9;
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 17, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_19(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("mkdir of %s failed: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5670;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_24(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("opendir of %s failed: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD5688;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_29(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = __error();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to fstat() on directory %s: %s"), v3, strerror(*v4));
  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD56A0;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_33(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 40);
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to setclass(%d) on directory %s: %s"), v4, v3, strerror(*v5));
  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD56B8;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke_37(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = __error();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Failed to chown(%@) %s: %s"), v4, v3, strerror(*v5));
  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD56D0;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __111__MCMFileManager_createDirectoryAtURL_withIntermediateDirectories_mode_owner_dataProtectionClass_fsNode_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("mkpath_np of %s failed: %s"), *(_QWORD *)(a1 + 32), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:fsNode:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5658;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__MCMFileManager_removeItemAtURL_error___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("removefile of [%s] failed: (%d) %s"), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), strerror(*(_DWORD *)(a1 + 40)));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager removeItemAtURL:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5628;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __40__MCMFileManager_removeItemAtURL_error___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("removefile of [%s] failed"), *(_QWORD *)(a1 + 32));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMFileManager removeItemAtURL:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD5640;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
